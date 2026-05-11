from django import forms
from .models import TiradaDado


class TiradaDadoForm(forms.ModelForm):
    class Meta:
        model = TiradaDado
        fields = ['tipo_dado']
        widgets = {
            'tipo_dado': forms.Select(attrs={
                'class': 'form-select',
            }),
        }
