from django.contrib import admin
from .models import Combate, Campania


@admin.register(Combate)
class CombateAdmin(admin.ModelAdmin):
    list_display = ('id_combate', 'estado', 'id_campania', 'fecha_inicio')
    list_filter = ('estado', 'fecha_inicio')
    search_fields = ('id_combate', 'estado')
    readonly_fields = ('fecha_inicio',)


@admin.register(Campania)
class CampaniaAdmin(admin.ModelAdmin):
    list_display = ('id_campania', 'nombre', 'fecha_inicio')
    search_fields = ('nombre',)
    readonly_fields = ('fecha_inicio',)
