from django.contrib import admin
from .models import TiradaDado


@admin.register(TiradaDado)
class TiradaDadoAdmin(admin.ModelAdmin):
    list_display = ('id_tirada', 'tipo_dado', 'resultado', 'user_id', 'fecha')
    list_filter = ('tipo_dado', 'fecha')
    search_fields = ('id_tirada', 'user_id__username')
    readonly_fields = ('fecha',)
