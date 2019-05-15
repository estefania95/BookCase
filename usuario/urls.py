from django.urls import path, include
from . import views

app_name = 'usuario'

urlpatterns = [
    path('', views.bienvenida, name="bienvenida"),
    path('registro/', views.registro, name="api"),
    path(r'^accounts/login', views.inicioSesion, name='inicioSesion'),
    path('home/', views.home, name="home"),
    path('registro', views.registro, name="registro"),
    path('perfil/', views.miPerfil, name="perfil")
]