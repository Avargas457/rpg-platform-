from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.views.generic import ListView, CreateView, UpdateView, DeleteView, DetailView
from django.urls import reverse_lazy
from django.contrib.auth.mixins import LoginRequiredMixin
from django.db import connection
from .models import Combate
from .forms import CombateForm, TiradaCombateForm
from tirada.models import TiradaDado
import random


class CombateListView(LoginRequiredMixin, ListView):
    model = Combate
    template_name = 'combate/combate_list.html'
    context_object_name = 'combates'
    paginate_by = 10

    def get_queryset(self):
        return Combate.objects.select_related('id_campania').order_by('-fecha_inicio')


class CombateDetailView(LoginRequiredMixin, DetailView):
    model = Combate
    template_name = 'combate/combate_detail.html'
    context_object_name = 'combate'
    pk_url_kwarg = 'pk'


class CombateCreateView(LoginRequiredMixin, CreateView):
    model = Combate
    template_name = 'combate/combate_form.html'
    form_class = CombateForm
    success_url = reverse_lazy('combate:list')

    def form_valid(self, form):
        messages.success(self.request, '✓ Combate creado exitosamente')
        return super().form_valid(form)


class CombateUpdateView(LoginRequiredMixin, UpdateView):
    model = Combate
    template_name = 'combate/combate_form.html'
    form_class = CombateForm
    pk_url_kwarg = 'pk'
    success_url = reverse_lazy('combate:list')

    def form_valid(self, form):
        messages.success(self.request, '✓ Combate actualizado exitosamente')
        return super().form_valid(form)


class CombateDeleteView(LoginRequiredMixin, DeleteView):
    model = Combate
    template_name = 'combate/combate_confirm_delete.html'
    pk_url_kwarg = 'pk'
    success_url = reverse_lazy('combate:list')

    def delete(self, request, *args, **kwargs):
        messages.success(request, '✓ Combate eliminado exitosamente')
        return super().delete(request, *args, **kwargs)


@login_required
def tirada_combate(request, combate_id):
    """Vista para realizar una tirada durante un combate"""
    combate = get_object_or_404(Combate, id_combate=combate_id)
    
    if request.method == 'POST':
        form = TiradaCombateForm(request.POST)
        if form.is_valid():
            # Obtener los datos del formulario
            tipo_dado = form.cleaned_data['tipo_dado']
            tipo_accion = form.cleaned_data['tipo_accion']
            descripcion = form.cleaned_data.get('descripcion', '')
            
            # Generar resultado aleatorio según el tipo de dado
            dado_max = {
                'd4': 4,
                'd6': 6,
                'd8': 8,
                'd10': 10,
                'd12': 12,
                'd20': 20,
            }
            
            resultado = random.randint(1, dado_max[tipo_dado])
            
            # Guardar en TiradaDado
            tirada = TiradaDado.objects.create(
                tipo_dado=tipo_dado,
                resultado=resultado,
                user_id=request.user
            )
            
            # Guardar en tirada_combate usando SQL directo
            with connection.cursor() as cursor:
                cursor.execute(
                    """INSERT INTO tirada_combate 
                       (id_combate, id_tirada, tipo_accion, descripcion, fecha) 
                       VALUES (%s, %s, %s, %s, NOW())""",
                    [combate_id, tirada.id_tirada, tipo_accion, descripcion]
                )
            
            # Guardar en accion_combate usando SQL directo
            with connection.cursor() as cursor:
                cursor.execute(
                    """INSERT INTO accion_combate 
                       (id_combate, id_tirada, tipo_accion, resultado, dano, descripcion, usuario_id, fecha) 
                       VALUES (%s, %s, %s, %s, %s, %s, %s, NOW())""",
                    [combate_id, tirada.id_tirada, tipo_accion, resultado, 0, descripcion, request.user.id]
                )
            
            # Mensajes de éxito
            messages.success(
                request,
                f'✓ {tipo_accion.upper()}: {tipo_dado} = {resultado}'
            )
            
            return redirect('combate:detail', pk=combate_id)
    else:
        form = TiradaCombateForm()
    
    return render(request, 'combate/tirada_combate.html', {
        'form': form,
        'combate': combate,
    })


@login_required
def tirada_combate_nueva(request):
    """Vista nueva para realizar tirada y combate separadamente"""
    combates = Combate.objects.all()
    
    if request.method == 'POST':
        combate_id = request.POST.get('id_combate')
        tipo_dado = request.POST.get('tipo_dado')
        tipo_accion = request.POST.get('tipo_accion')
        descripcion = request.POST.get('descripcion', '')
        
        if combate_id and tipo_dado and tipo_accion:
            combate_id = int(combate_id)
            combate = get_object_or_404(Combate, id_combate=combate_id)
            
            # Generar resultado del dado
            dado_max = {
                'd4': 4,
                'd6': 6,
                'd8': 8,
                'd10': 10,
                'd12': 12,
                'd20': 20,
            }
            
            resultado = random.randint(1, dado_max[tipo_dado])
            
            # Guardar en tirada_dado
            tirada = TiradaDado.objects.create(
                tipo_dado=tipo_dado,
                resultado=resultado,
                user_id=request.user
            )
            
            # Guardar en tirada_combate
            with connection.cursor() as cursor:
                cursor.execute(
                    """INSERT INTO tirada_combate 
                       (id_combate, id_tirada, tipo_accion, descripcion) 
                       VALUES (%s, %s, %s, %s)""",
                    [combate_id, tirada.id_tirada, tipo_accion, descripcion]
                )
            
            messages.success(
                request,
                f'✓ ¡{tipo_accion.upper()}! Resultado del {tipo_dado}: {resultado}'
            )
            
            return redirect('combate:tirada_combate_nueva')
        else:
            messages.error(request, '❌ Por favor completa todos los campos requeridos')
    
    return render(request, 'combate/tirada_combate_nueva.html', {
        'combates': combates,
    })
