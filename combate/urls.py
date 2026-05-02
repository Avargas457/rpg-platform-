from django.urls import path
from . import views

app_name = 'combate'

urlpatterns = [
    path('', views.CombateListView.as_view(), name='list'),
    path('<int:pk>/', views.CombateDetailView.as_view(), name='detail'),
    path('crear/', views.CombateCreateView.as_view(), name='create'),
    path('<int:pk>/editar/', views.CombateUpdateView.as_view(), name='update'),
    path('<int:pk>/eliminar/', views.CombateDeleteView.as_view(), name='delete'),
]
