from django import forms
from .models import Combate


class CombateForm(forms.ModelForm):
    class Meta:
        model = Combate
        fields = ['estado', 'id_campania']
        widgets = {
            'estado': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'Ej: Activo, Finalizado, Pausado',
                'maxlength': '50'
            }),
            'id_campania': forms.Select(attrs={
                'class': 'form-select',
            })
        }
