from django.urls import path

from . import views

app_name = 'ruta'
urlpatterns = [
    path('', views.rutas, name='rutas'),
]
