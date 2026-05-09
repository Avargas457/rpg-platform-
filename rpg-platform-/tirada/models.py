from django.db import models
from django.contrib.auth.models import User


class TiradaDado(models.Model):
    TIPO_DADO_CHOICES = [
        ('d4', 'd4'),
        ('d6', 'd6'),
        ('d8', 'd8'),
        ('d10', 'd10'),
        ('d12', 'd12'),
        ('d20', 'd20'),
    ]

    id_tirada = models.AutoField(primary_key=True)
    tipo_dado = models.CharField(max_length=10, choices=TIPO_DADO_CHOICES)
    resultado = models.IntegerField()
    fecha = models.DateTimeField(auto_now_add=True)
    user_id = models.ForeignKey(User, on_delete=models.CASCADE, db_column='user_id')

    class Meta:
        db_table = 'tirada_dado'
        managed = False

    def __str__(self):
        return f"{self.tipo_dado} = {self.resultado}"
