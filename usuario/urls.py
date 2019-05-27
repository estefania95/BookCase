from django.urls import path, include
from . import views

app_name = 'usuario'

urlpatterns = [
    path('', views.bienvenida, name="bienvenida"),
    path('registro/', views.registro, name="api"),
    path(r'^accounts/login', views.inicioSesion, name='inicioSesion'),
    path('accounts/logout', views.salir, name="logout"),
    path('home/', views.home, name="home"),
    path('libro/<int:id_libro>', views.libro, name="libro"),
    path('eliminarLibro/<int:id_libro>', views.eliminarLibro, name="eliminarLibro"),
    path('genero/<int:id_genero>', views.genero, name="genero"),
    path('registro', views.registro, name="registro"),
    path('perfil/', views.miPerfil, name="perfil"),
    path('libros/', views.librosGenero, name="libros"),
    path('apiLibros/', views.apiLibrosGenero, name="apiLibros"),
    path('buscador/', views.buscador, name="buscador"),
    path('explorador/', views.explorador, name="explorador"),
    path('apiFavoritos/', views.librosGenerosUsuario, name='favoritos'),
    path('autores/<str:caracter>/', views.autores, name="autores"),
    path('autor/<int:id_autor>', views.autor, name="autor"),
    path('autoresApi/', views.autoresApi, name="autoresApi"),
    path('librerias/', views.libreria, name="librerias"),
    path('libreria/<int:id_libreria>', views.libreriaIndividual, name="libreria"),
    path('añadirLibro/<int:id_libro>/', views.añadirLibro, name="añadir"),
    path('borrar/<int:id_libreria>', views.borrar, name="borrar"),
    path('add/', views.add, name="add"),
    path('addBook/', views.addBook, name="addBook"),
    path('addAutor/', views.addAutor, name="addAutor"),
    path('addGenero/', views.addGenero, name="addGenero"),
    path('editLibro/', views.editLibro, name="editLibro"),
    path('editAutor/', views.editAutor, name="editAutor"),
    path('editGenero/', views.editGenero, name="editGenero"),
    path('politica/', views.politica, name="politica")
]