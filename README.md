# RPG Platform - Tirada CRUD

## Descripción
Plataforma RPG Django que implementa un sistema de tirada de dados (CRUD completo).

## Estado Actual
✅ **Operativo** - Sistema de tirada de dados completamente funcional
- Solo contiene la app `tirada` (combate fue eliminado)
- Servidor ejecutándose en http://127.0.0.1:8000/tiradas/

## Estructura del Proyecto

```
manage.py
RPG/                      # Configuración principal Django
  __init__.py
  settings.py             # Instancias apps + base de datos
  urls.py                 # Rutas principales
  asgi.py / wsgi.py       # Servidores
  templates/
    base.html             # Template base (sin referencias a combate)
    registration/         # Login/logout
    tirada/               # Templates CRUD tiradas
tirada/                   # App de tirada de dados
  models.py               # TiradaDado model
  views.py                # CRUD views (Create/Read/Update/Delete)
  forms.py                # TiradaDadoForm
  urls.py                 # URL routing
  admin.py
  apps.py
.venv/                    # Virtual environment Python 3.13
```

## Base de Datos
- **Tipo**: MySQL (PyMySQL)
- **Host**: 127.0.0.1:3306
- **BD**: rpg_platform
- **Usuario**: root (sin contraseña)
- **Tabla**: tirada_tiradadadο (id_tirada, tipo_dado, resultado, fecha, user_id)

## Funcionalidades - Tirada CRUD

### Create (POST /tiradas/crear/)
- Usuario selecciona tipo de dado (d4, d6, d8, d10, d12, d20)
- Resultado se genera automáticamente: `random.randint(1, max_valor)`
- Usuario asignado automáticamente: `request.user` o primer usuario disponible
- Mensaje de éxito: "✓ Tirada registrada exitosamente: {dado} = {resultado}"

### Read (GET /tiradas/)
- Lista paginada de todas las tiradas (10 por página)
- Muestra: tipo_dado, resultado, fecha, usuario
- Botones: Ver detalles, Editar, Eliminar

### Update (POST /tiradas/{id}/editar/)
- Permite cambiar tipo_dado
- Resultado se recalcula automáticamente
- Misma lógica que Create

### Delete (GET/POST /tiradas/{id}/eliminar/)
- Confirmación antes de eliminar
- Redirect a lista después de eliminar

## Tecnologías
- **Backend**: Django 6.0.3
- **Python**: 3.13
- **Frontend**: Bootstrap 5 (tema oscuro)
- **BD**: MySQL con PyMySQL
- **Auth**: Django auth (User model)

## Comandos Útiles

```bash
# Activar venv
.\.venv\Scripts\Activate.ps1

# Migraciones
python manage.py migrate

# Crear superuser
python manage.py createsuperuser

# Servidor
python manage.py runserver

# Shell Django
python manage.py shell
```

## Historial de Cambios

### Último: Limpieza de Combate
- Eliminada app `combate` completamente
- Eliminadas templates de combate
- Eliminadas rutas de combate de urls.py
- Actualizado base.html (removido link a combates)
- Removido duplicado de rutas en urls.py (root path)

### Anterior: Sistema de Combate D&D
- Se agregó app `combate` con turno, personaje, acción
- Se implementó lógica de combate similar a D&D
- **Se eliminó completo por request del usuario**

## Próximos Pasos (Sugerencias)
- [ ] Agregar filtrado/búsqueda de tiradas
- [ ] Vistas específicas por usuario
- [ ] Estadísticas de tiradas (promedio, frecuencia)
- [ ] Export de datos (CSV/Excel)
- [ ] Tests unitarios

## Estado del Servidor
- ✅ Django runserver activo
- ✅ No hay errores de configuración
- ✅ Todas las rutas funcionan sin errores de importación

---
**Última actualización**: Mayo 4, 2026
**Versión**: 2.0 (Post-cleanup combate)
