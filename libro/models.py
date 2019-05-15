from django.db import models

# Create your models here.

class Genero(models.Model):
    nombre = models.CharField(max_length=100)
    descripcion = models.TextField()
    nombreImagen = models.CharField(max_length=50, null=True, blank=True)

    def __str__(self):
        return self.nombre


class Libro(models.Model):
    titulo = models.CharField(max_length=100)
    isbn = models.CharField(max_length=50)
    editorial = models.CharField(max_length=100)
    numeroPaginas = models.IntegerField()
    anoEdicion = models.IntegerField()
    sinopsis = models.TextField()
    imagen = models.CharField(max_length=200, null=True, blank=True)
    genero = models.ManyToManyField(Genero)

    def __str__(self):
        return self.titulo


class Autor(models.Model):
    nombre = models.CharField(max_length=100, null=True, blank=True)
    apellidos = models.CharField(max_length=100, null=True, blank=True)
    anoNacimiento = models.IntegerField(null=True, blank=True)
    descripcion = models.TextField(null=True, blank=True)
    libro = models.ManyToManyField(Libro, null=True, blank=True)

    def __str__(self):
        return self.nombre
