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
        path('libro/<int:id_libro>', views.libro, name="libro"),
        path('genero/<int:id_genero>', views.genero, name="genero"),
    ])),
    path('registro', views.registro, name="registro"),
    path('perfil/', views.miPerfil, name="perfil"),
    path('libros/', views.librosGenero, name="libros"),
    path('apiLibros/', views.apiLibrosGenero, name="apiLibros"),
    path('buscador/', views.buscador, name="buscador"),
    path('explorador/', views.explorador, name="explorador"),
    path('autores/', views.autores, name="autores"),
    path('autoresApi/', views.autoresApi, name="autoresApi"),
    path('librerias/', views.libreria, name="librerias")
]