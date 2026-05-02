from django import forms
from .models import TiradaDado


class TiradaDadoForm(forms.ModelForm):
    class Meta:
        model = TiradaDado
        fields = ['tipo_dado', 'resultado', 'user_id']
        widgets = {
            'tipo_dado': forms.Select(attrs={
                'class': 'form-select',
            }),
            'resultado': forms.NumberInput(attrs={
                'class': 'form-control',
                'min': '1',
                'placeholder': 'Resultado del dado'
            }),
            'user_id': forms.Select(attrs={
                'class': 'form-select',
            })
        }
