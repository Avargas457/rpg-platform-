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


class TiradaCombateForm(forms.Form):
    TIPO_DADO_CHOICES = [
        ('d4', 'd4 (1-4)'),
        ('d6', 'd6 (1-6)'),
        ('d8', 'd8 (1-8)'),
        ('d10', 'd10 (1-10)'),
        ('d12', 'd12 (1-12)'),
        ('d20', 'd20 (1-20)'),
    ]
    
    TIPO_ACCION_CHOICES = [
        ('ataque', 'Ataque'),
        ('esquivar', 'Esquivar'),
        ('proteger', 'Proteger'),
        ('encantar', 'Encantar'),
        ('sanar', 'Sanar'),
        ('habilidad_especial', 'Habilidad Especial'),
    ]
    
    tipo_dado = forms.ChoiceField(
        choices=TIPO_DADO_CHOICES,
        widget=forms.Select(attrs={
            'class': 'form-select',
        }),
        label='Tipo de Dado'
    )
    
    tipo_accion = forms.ChoiceField(
        choices=TIPO_ACCION_CHOICES,
        widget=forms.Select(attrs={
            'class': 'form-select',
        }),
        label='Acción'
    )
    
    descripcion = forms.CharField(
        required=False,
        widget=forms.Textarea(attrs={
            'class': 'form-control',
            'rows': 3,
            'placeholder': 'Descripción adicional de la acción (opcional)'
        }),
        label='Descripción'
    )
