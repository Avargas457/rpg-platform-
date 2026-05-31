from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.views.generic import ListView, CreateView, UpdateView, DeleteView, DetailView, View
from django.urls import reverse_lazy
from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import JsonResponse
from .models import TiradaDado
from .forms import TiradaDadoForm
import random


class TiradaDadoListView(LoginRequiredMixin, ListView):
    model = TiradaDado
    template_name = 'tirada/tirada_list.html'
    context_object_name = 'tiradas'
    paginate_by = 15

    def get_queryset(self):
        return TiradaDado.objects.select_related('user_id').order_by('-fecha')


class TiradaDadoDetailView(LoginRequiredMixin, DetailView):
    model = TiradaDado
    template_name = 'tirada/tirada_detail.html'
    context_object_name = 'tirada'
    pk_url_kwarg = 'pk'


class TiradaDadoCreateView(LoginRequiredMixin, View):
    """Vista para lanzar dados con interfaz interactiva"""
    
    def get(self, request):
        return render(request, 'tirada/tirada_form.html')


class TiradaDadoUpdateView(LoginRequiredMixin, UpdateView):
    model = TiradaDado
    template_name = 'tirada/tirada_form.html'
    form_class = TiradaDadoForm
    pk_url_kwarg = 'pk'
    success_url = reverse_lazy('tirada:list')

    def form_valid(self, form):
        messages.success(self.request, '✓ Tirada actualizada exitosamente')
        return super().form_valid(form)


class TiradaDadoDeleteView(LoginRequiredMixin, DeleteView):
    model = TiradaDado
    template_name = 'tirada/tirada_confirm_delete.html'
    pk_url_kwarg = 'pk'
    success_url = reverse_lazy('tirada:list')

    def delete(self, request, *args, **kwargs):
        messages.success(request, '✓ Tirada eliminada exitosamente')
        return super().delete(request, *args, **kwargs)


class RollDiceAjax(LoginRequiredMixin, View):
    """API AJAX para lanzar dados - genera y guarda los resultados"""
    
    def post(self, request):
        dice_type = request.POST.get('dice_type')
        quantity = int(request.POST.get('quantity', 1))
        
        dice_faces = {
            'd4': 4,
            'd6': 6,
            'd8': 8,
            'd10': 10,
            'd12': 12,
            'd20': 20,
        }
        
        if dice_type not in dice_faces or quantity < 1 or quantity > 100:
            return JsonResponse({'error': 'Parámetros inválidos'}, status=400)
        
        results = [random.randint(1, dice_faces[dice_type]) for _ in range(quantity)]
        total = sum(results)
        
        # Guardar cada tirada en la base de datos
        for result in results:
            TiradaDado.objects.create(
                tipo_dado=dice_type,
                resultado=result,
                user_id=request.user
            )
        
        return JsonResponse({
            'results': results,
            'total': total,
            'success': True
        })
