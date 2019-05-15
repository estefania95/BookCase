from django.contrib.auth.models import User
from django.db import models

from libro.models import Libro, Genero

# Create your models here.

class Usuario(models.Model):
    usuario = models.OneToOneField(User, on_delete=models.CASCADE)
    genero = models.ManyToManyField(Genero, null=True, blank=True)
    libro = models.ManyToManyField(Libro, through='LibroUsuario', null=True, blank=True)

    def __str__(self):
        return self.usuario.username


class Ranking(models.Model):
    usuario = models.ForeignKey(Usuario, on_delete=models.CASCADE)
    tiempo = (
        ('Semanal', 'Semanal'),
        ('Mensual', 'Mensual'),
        ('Anual', 'Anual'),
    )
    cantidad  = models.IntegerField()

    def __str__(self):
        return '%s %s' % (self.usuario, self.tiempo)

class LibroUsuario(models.Model):
    libro = models.ForeignKey(Libro, on_delete=models.CASCADE)
    usuario = models.ForeignKey(Usuario, on_delete=models.CASCADE)
    estado = (
        ('Leído', 'Leído'),
        ('Leer', 'Leer'),
        ('Comprar', 'Comprar'),
        ('Abandonado', 'Abandonado')
    )
    dia = models.DateField()

    def __str__(self):
        return '%s %s' % (self.libro, self.usuario)

class Libreria(models.Model):
    nombre = models.CharField(max_length=100)
    descripcion = models.TextField()
    estantes = models.IntegerField()
    usuario = models.ForeignKey(Usuario, on_delete=models.CASCADE)
    libro = models.ManyToManyField(Libro)

    def __str__(self):
        return '%s %s' % (self.nombre, self.usuario)

