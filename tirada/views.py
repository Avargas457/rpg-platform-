from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from django.contrib.auth.models import User
from django.views.generic import ListView, CreateView, UpdateView, DeleteView, DetailView
from django.urls import reverse_lazy
from .models import TiradaDado
from .forms import TiradaDadoForm
import random


class TiradaDadoListView(ListView):
    model = TiradaDado
    template_name = 'tirada/tirada_list.html'
    context_object_name = 'tiradas'
    paginate_by = 15

    def get_queryset(self):
        return TiradaDado.objects.select_related('user_id').order_by('-fecha')


class TiradaDadoDetailView(DetailView):
    model = TiradaDado
    template_name = 'tirada/tirada_detail.html'
    context_object_name = 'tirada'
    pk_url_kwarg = 'pk'


class TiradaDadoCreateView(CreateView):
    model = TiradaDado
    template_name = 'tirada/tirada_form.html'
    form_class = TiradaDadoForm
    success_url = reverse_lazy('tirada:list')

    def form_valid(self, form):
        # Calcular automáticamente el resultado basado en el tipo de dado
        tipo_dado = form.cleaned_data['tipo_dado']
        dados_rangos = {
            'd4': 4,
            'd6': 6,
            'd8': 8,
            'd10': 10,
            'd12': 12,
            'd20': 20,
        }
        resultado = random.randint(1, dados_rangos[tipo_dado])
        form.instance.resultado = resultado
        
        # Asignar usuario: autenticado si existe, si no obtener el primero (admin)
        if self.request.user.is_authenticated:
            form.instance.user_id = self.request.user
        else:
            # Obtener el primer usuario (generalmente el admin)
            user = User.objects.first()
            if user:
                form.instance.user_id = user
        
        messages.success(self.request, f'✓ Tirada registrada exitosamente: {tipo_dado} = {resultado}')
        return super().form_valid(form)


class TiradaDadoUpdateView(UpdateView):
    model = TiradaDado
    template_name = 'tirada/tirada_form.html'
    form_class = TiradaDadoForm
    pk_url_kwarg = 'pk'
    success_url = reverse_lazy('tirada:list')

    def form_valid(self, form):
        # Recalcular automáticamente el resultado si cambió el tipo de dado
        tipo_dado = form.cleaned_data['tipo_dado']
        dados_rangos = {
            'd4': 4,
            'd6': 6,
            'd8': 8,
            'd10': 10,
            'd12': 12,
            'd20': 20,
        }
        resultado = random.randint(1, dados_rangos[tipo_dado])
        form.instance.resultado = resultado
        
        # Asignar usuario: autenticado si existe, si no obtener el primero (admin)
        if self.request.user.is_authenticated:
            form.instance.user_id = self.request.user
        else:
            # Obtener el primer usuario (generalmente el admin)
            user = User.objects.first()
            if user:
                form.instance.user_id = user
        
        messages.success(self.request, f'✓ Tirada actualizada exitosamente: {tipo_dado} = {resultado}')
        return super().form_valid(form)


class TiradaDadoDeleteView(DeleteView):
    model = TiradaDado
    template_name = 'tirada/tirada_confirm_delete.html'
    pk_url_kwarg = 'pk'
    success_url = reverse_lazy('tirada:list')

    def delete(self, request, *args, **kwargs):
        messages.success(request, '✓ Tirada eliminada exitosamente')
        return super().delete(request, *args, **kwargs)
