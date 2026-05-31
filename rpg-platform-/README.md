# RPG Platform (Django)

Aplicación web (Django) para **gestionar tiradas de dados** y **combates** asociados a **campañas**, con autenticación (login/logout), panel de administración y UI basada en Bootstrap.

---

## 1) Stack tecnológico

- **Backend:** Django **6.0.4** (proyecto `RPG`)
- **Lenguaje:** Python (en este entorno existe un venv con **Python 3.13.13** en `c:\django\Proyecto\.venv`)
- **Base de datos (configurada):** **MySQL** (`django.db.backends.mysql`)
- **Frontend/UI:** Plantillas Django + **Bootstrap 5.3 (CDN)**
- **Autenticación:** `django.contrib.auth` (LoginView/LogoutView + `LoginRequiredMixin`)

> Nota: el archivo `db.sqlite3` existe en el repo pero está **vacío (0 bytes)** y **NO** es la base usada por `settings.py` (la configuración apunta a MySQL).

---

## 2) Estructura del proyecto

```
(rpg-platform-/)
├─ manage.py
├─ db.sqlite3               # presente pero vacío / no usado por settings
├─ RPG/                      # proyecto Django
│  ├─ settings.py
│  ├─ urls.py
│  ├─ views.py
│  ├─ asgi.py
│  ├─ wsgi.py
│  └─ templates/
│     ├─ base.html
│     ├─ home.html
│     ├─ registration/login.html
│     ├─ tirada/...
│     └─ combate/...
├─ tirada/                   # app: tiradas de dado
│  ├─ models.py
│  ├─ views.py
│  ├─ urls.py
│  ├─ forms.py
│  ├─ admin.py
│  └─ migrations/...
└─ combate/                  # app: combates y campañas
   ├─ models.py
   ├─ views.py
   ├─ urls.py
   ├─ forms.py
   ├─ admin.py
   └─ migrations/...
```

### 2.1) Archivos clave (qué hace cada uno)

- `manage.py`: entrypoint de comandos Django (`runserver`, `migrate`, etc.).
- `RPG/settings.py`: configuración global (apps instaladas, DB MySQL, templates, auth redirects).
- `RPG/urls.py`: ruteo principal (home, admin, login/logout, include de apps).
- `RPG/views.py`: vistas `HomeView`, `CustomLoginView`, `CustomLogoutView`.
- `tirada/*`: CRUD completo de tiradas.
- `combate/*`: CRUD de combates + flujos para “tirada en combate”.

---

## 3) Configuración (settings)

Archivo: `RPG/settings.py`

### 3.1) Apps instaladas

Incluye Django core + apps locales:
- `combate`
- `tirada`

### 3.2) Templates

- `DIRS = [BASE_DIR / 'RPG' / 'templates']`
- `APP_DIRS = True` (Django busca templates también dentro de cada app si existieran)

### 3.3) Autenticación

- `LOGIN_URL = 'login'`
- `LOGIN_REDIRECT_URL = 'home'`
- `LOGOUT_REDIRECT_URL = 'login'`

La mayoría de vistas usan `LoginRequiredMixin` o `@login_required`, por lo que requieren sesión iniciada.

### 3.4) Variables de entorno soportadas

- `DJANGO_SECRET_KEY`: reemplaza el `SECRET_KEY` hardcodeado.
- `DJANGO_ALLOWED_HOSTS`: lista separada por comas. Ejemplo:
  - `DJANGO_ALLOWED_HOSTS=localhost,127.0.0.1,mi-dominio.com`

### 3.5) Base de datos (MySQL)

Configuración actual:

```py
DATABASES = {
  'default': {
    'ENGINE': 'django.db.backends.mysql',
    'NAME': 'rpg_platform',
    'USER': 'root',
    'PASSWORD': '',
    'HOST': 'localhost',
    'PORT': '3306',
  }
}
```

---

## 4) Modelo de datos (tablas / entidades)

**Importante:** Los modelos `Campania`, `Combate` y `TiradaDado` están declarados con:

- `Meta.managed = False`

Eso significa:
- Django **NO** creará ni alterará esas tablas con migraciones.
- Las tablas deben existir previamente en la base de datos.

Aun así, el código **sí usa el ORM** para leer y también para crear registros (`objects.create`), por lo que el esquema debe ser compatible.

### 4.1) `tirada.TiradaDado`

Archivo: `tirada/models.py`

Campos:
- `id_tirada` (AutoField, PK)
- `tipo_dado` (CharField, choices: d4/d6/d8/d10/d12/d20)
- `resultado` (IntegerField)
- `fecha` (DateTimeField, `auto_now_add=True`)
- `user_id` (FK a `django.contrib.auth.models.User`, `db_column='user_id'`)

Tabla esperada: `tirada_dado`

### 4.2) `combate.Campania`

Archivo: `combate/models.py`

Campos en código:
- `id_campania` (AutoField, PK)
- `nombre` (CharField(100))
- `descripcion` (TextField, nullable)
- `fecha_inicio` (DateField, `auto_now_add=True`)

Tabla esperada: `campania`

> Nota de consistencia: la migración `combate/migrations/0001_initial.py` menciona `fecha_creacion` (DateTimeField), pero **el modelo actual** usa `fecha_inicio` (DateField). Como `managed=False`, la migración no manda sobre el esquema real; el esquema debe alinearse con lo que use tu BD y con lo que el código espera.

### 4.3) `combate.Combate`

Archivo: `combate/models.py`

Campos:
- `id_combate` (AutoField, PK)
- `fecha_inicio` (DateTimeField, `auto_now_add=True`)
- `estado` (CharField(50), default `Activo`)
- `id_campania` (FK a `Campania`, `db_column='id_campania'`)

Tabla esperada: `combate`

### 4.4) Tablas usadas por SQL directo (sin modelo Django)

Archivo: `combate/views.py`

Durante una tirada en combate se insertan filas con SQL directo en:

- `tirada_combate`
  - inserta: `(id_combate, id_tirada, tipo_accion, descripcion, fecha)` en una ruta
  - inserta: `(id_combate, id_tirada, tipo_accion, descripcion)` en otra ruta
  - Requisito: si `fecha` existe y no se provee, debe ser **nullable** o tener **DEFAULT**.

- `accion_combate`
  - inserta: `(id_combate, id_tirada, tipo_accion, resultado, dano, descripcion, usuario_id, fecha)`

Estas tablas **deben existir** en MySQL, con columnas compatibles con esos nombres.

---

## 5) Rutas (URL map) y navegación

Archivo: `RPG/urls.py`

### 5.1) Rutas base

- `/` → `HomeView` (requiere login)
- `/admin/` → Django admin
- `/login/` → `CustomLoginView`
- `/logout/` → `CustomLogoutView`

### 5.2) App `tirada`

Base: `/tiradas/` (include de `tirada/urls.py`)

- `GET /tiradas/` → lista paginada (`paginate_by = 15`)
- `GET /tiradas/<pk>/` → detalle
- `GET|POST /tiradas/crear/` → crear
- `GET|POST /tiradas/<pk>/editar/` → editar
- `GET|POST /tiradas/<pk>/eliminar/` → confirmar/eliminar

Todas requieren login (`LoginRequiredMixin`).

### 5.3) App `combate`

Base: `/combates/` (include de `combate/urls.py`)

CRUD de combates (paginación 10):
- `GET /combates/` → lista
- `GET /combates/<pk>/` → detalle
- `GET|POST /combates/crear/` → crear
- `GET|POST /combates/<pk>/editar/` → editar
- `GET|POST /combates/<pk>/eliminar/` → confirmar/eliminar

Flujos de tiradas durante combate:
- `GET|POST /combates/<combate_id>/tirada/` → “tirada en combate” (form Django `TiradaCombateForm`)
- `GET|POST /combates/tirada-combate/nueva/` → pantalla alternativa con radios (no usa `TiradaCombateForm`)

---

## 6) Vistas y comportamiento (lógica)

### 6.1) Home y Auth

Archivo: `RPG/views.py`

- `HomeView`: `TemplateView` con `LoginRequiredMixin` → renderiza `templates/home.html`.
- `CustomLoginView`: `LoginView`, template `registration/login.html`, `redirect_authenticated_user = True`.
- `CustomLogoutView`: `LogoutView`, redirige a `login`.

### 6.2) Tiradas (CRUD)

Archivo: `tirada/views.py`

- `TiradaDadoListView`: lista, orden `-fecha`, `select_related('user_id')`.
- `TiradaDadoDetailView`: detalle.
- `TiradaDadoCreateView`: crea con `TiradaDadoForm`.
- `TiradaDadoUpdateView`: edita con `TiradaDadoForm`.
- `TiradaDadoDeleteView`: elimina.

Mensajería (`django.contrib.messages`): se emiten mensajes de éxito en create/update/delete.

### 6.3) Combates (CRUD) + Tiradas en combate

Archivo: `combate/views.py`

- `CombateListView`: lista `select_related('id_campania')`, orden `-fecha_inicio`.
- `CombateDetailView`: detalle.
- `CombateCreateView` / `CombateUpdateView` / `CombateDeleteView`: CRUD con mensajes.

#### Tirada en combate: `/combates/<id>/tirada/`

Flujo:
1. Carga `Combate` por `id_combate`.
2. Valida `TiradaCombateForm`.
3. Genera un resultado aleatorio según el dado (`random.randint(1, max)`), con mapa:
   - d4=4, d6=6, d8=8, d10=10, d12=12, d20=20.
4. Crea un registro en `tirada_dado` vía ORM:
   - `TiradaDado.objects.create(tipo_dado=..., resultado=..., user_id=request.user)`
5. Inserta con SQL directo en `tirada_combate`.
6. Inserta con SQL directo en `accion_combate`.
7. Muestra mensaje de éxito y redirige al detalle del combate.

#### Tirada+Combate “nueva”: `/combates/tirada-combate/nueva/`

Flujo similar pero:
- La UI usa inputs radio y select de combate.
- Inserta en `tirada_combate` (sin `fecha` explícita).
- Redirige a la misma página.

---

## 7) Formularios

### 7.1) `tirada/forms.py` → `TiradaDadoForm`

Campos:
- `tipo_dado` (select)
- `resultado` (number)
- `user_id` (select)

### 7.2) `combate/forms.py`

- `CombateForm` (ModelForm):
  - `estado` (TextInput)
  - `id_campania` (Select)

- `TiradaCombateForm` (Form):
  - `tipo_dado` (ChoiceField)
  - `tipo_accion` (ChoiceField: ataque, esquivar, proteger, encantar, sanar, habilidad_especial)
  - `descripcion` (TextArea, opcional)

---

## 8) Templates (pantallas)

Ubicación: `RPG/templates/`

### 8.1) Layout base

- `base.html`:
  - Tema oscuro (`data-bs-theme="dark"`)
  - Bootstrap 5.3 por CDN
  - Navbar con links a Combates/Tiradas
  - Dropdown de usuario cuando está autenticado
  - Render de `messages`

### 8.2) Auth

- `registration/login.html`: formulario de login (username/password) con manejo de errores.

### 8.3) Home

- `home.html`: cards de navegación:
  - Tiradas
  - Combates
  - Tirada y Combate (flujo alternativo)

### 8.4) Tirada

- `tirada/tirada_list.html`: tabla + paginación.
- `tirada/tirada_form.html`: crear/editar.
- `tirada/tirada_detail.html`: detalle + link a eliminar.
- `tirada/tirada_confirm_delete.html`: confirmación de borrado.

### 8.5) Combate

- `combate/combate_list.html`: tabla + paginación.
- `combate/combate_form.html`: crear/editar.
- `combate/combate_detail.html`: detalle + botón "Realizar Tirada".
- `combate/combate_confirm_delete.html`: confirmación.
- `combate/tirada_combate.html`: form clásico de tirada en combate.
- `combate/tirada_combate_nueva.html`: UI alternativa (radios) para tirar y guardar.

---

## 9) Django Admin

- `tirada/admin.py`: registra `TiradaDado` con list_display, filtros, búsqueda.
- `combate/admin.py`: registra `Combate` y `Campania`.

Ruta:
- `/admin/`

Para usarlo necesitas:
- Tablas de auth creadas (`migrate`).
- Un superusuario (`createsuperuser`).

---

## 10) Cómo ejecutar en local (guía práctica)

> Este repo no incluye `requirements.txt`/`pyproject.toml`, así que las dependencias exactas no están fijadas.

### 10.1) Preparar entorno Python

1. Crear/activar un virtualenv.
2. Instalar Django y el driver de MySQL.

Ejemplo (conceptual):

```bash
pip install Django==6.0.4
pip install mysqlclient
```

> En Windows, `mysqlclient` puede requerir toolchain/headers. Alternativa común: usar `PyMySQL` y ajustar `ENGINE`, pero eso implica cambios de código/configuración.

### 10.2) Preparar MySQL

1. Crear la base `rpg_platform`.
2. Crear tablas de Django (auth/admin/sessions):

```bash
python manage.py migrate
```

3. Crear manualmente (o importar) las tablas **no gestionadas**:
- `campania`
- `combate`
- `tirada_dado`
- `tirada_combate`
- `accion_combate`

4. Crear campañas (`campania`) para que el formulario de Combate tenga opciones.

### 10.3) Crear usuario admin

```bash
python manage.py createsuperuser
```

### 10.4) Levantar el servidor

```bash
python manage.py runserver
```

Luego abrir:
- `http://127.0.0.1:8000/login/`

---

## 11) Consideraciones/limitaciones actuales (importantes)

1. **Modelos `managed=False`:**
   - Django no crea esas tablas.
   - Si faltan o no coinciden columnas, verás errores al listar/crear.

2. **SQL directo para historial de combate:**
   - Las tablas `tirada_combate` y `accion_combate` son requisito.
   - No hay modelos Django para consultarlas; por eso el detalle del combate hoy solo muestra un texto (“Las tiradas… aparecerán aquí”).

3. **Inconsistencia Campania (migración vs modelo):**
   - Define claramente tu esquema real (y ajusta modelo o DB) para evitar confusión.

4. **Internacionalización:**
   - `LANGUAGE_CODE = 'en-us'`, pero las pantallas están en español.

5. **Seguridad:**
   - `DEBUG = True` y hay un `SECRET_KEY` por defecto: para producción, usar env vars y endurecer settings.

---

## 12) Roadmap sugerido (si quieres cerrar el círculo)

- Agregar archivo de dependencias (`requirements.txt` o `pyproject.toml`) para reproducibilidad.
- Modelar `tirada_combate` y `accion_combate` con Django ORM y mostrar historial real en `combate_detail.html`.
- Unificar el flujo de tirada en combate (mantener una sola UI).
- Configurar `LANGUAGE_CODE='es'` y `TIME_ZONE` según el país.

---

## 13) Licencia

No especificada en el repositorio.
