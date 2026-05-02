from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.views.generic import ListView, CreateView, UpdateView, DeleteView, DetailView
from django.urls import reverse_lazy
from django.contrib.auth.mixins import LoginRequiredMixin
from .models import Combate
from .forms import CombateForm


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
