from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.views.generic import ListView, CreateView, UpdateView, DeleteView, DetailView
from django.urls import reverse_lazy
from django.contrib.auth.mixins import LoginRequiredMixin
from .models import TiradaDado
from .forms import TiradaDadoForm


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


class TiradaDadoCreateView(LoginRequiredMixin, CreateView):
    model = TiradaDado
    template_name = 'tirada/tirada_form.html'
    form_class = TiradaDadoForm
    success_url = reverse_lazy('tirada:list')

    def form_valid(self, form):
        messages.success(self.request, '✓ Tirada registrada exitosamente')
        return super().form_valid(form)


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
