from django.urls import path
from . import views

app_name = 'tirada'

urlpatterns = [
    path('', views.TiradaDadoListView.as_view(), name='list'),
    path('<int:pk>/', views.TiradaDadoDetailView.as_view(), name='detail'),
    path('crear/', views.TiradaDadoCreateView.as_view(), name='create'),
    path('<int:pk>/editar/', views.TiradaDadoUpdateView.as_view(), name='update'),
    path('<int:pk>/eliminar/', views.TiradaDadoDeleteView.as_view(), name='delete'),
]
