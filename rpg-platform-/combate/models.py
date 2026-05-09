from django.db import models


class Campania(models.Model):
    id_campania = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=100)
    descripcion = models.TextField(blank=True, null=True)
    fecha_creacion = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'campania'
        managed = False

    def __str__(self):
        return self.nombre


class Combate(models.Model):
    id_combate = models.AutoField(primary_key=True)
    fecha_inicio = models.DateTimeField(auto_now_add=True)
    estado = models.CharField(max_length=50, default='Activo')
    id_campania = models.ForeignKey(Campania, on_delete=models.CASCADE, db_column='id_campania')

    class Meta:
        db_table = 'combate'
        managed = False

    def __str__(self):
        return f"Combate #{self.id_combate} - {self.estado}"
