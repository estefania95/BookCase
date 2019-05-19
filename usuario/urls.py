from django.urls import path, include
from . import views

app_name = 'usuario'

urlpatterns = [
    path('', views.bienvenida, name="bienvenida"),
    path('registro/', views.registro, name="api"),
    path(r'^accounts/login', views.inicioSesion, name='inicioSesion'),
    path('accounts/logout', views.salir, name="logout"),
    path('home/', include([
        path('', views.home, name="home"),
        path('<int:id_libro>', views.libro, name="libro"),
    ])),
    path('registro', views.registro, name="registro"),
    path('perfil/', views.miPerfil, name="perfil"),
]