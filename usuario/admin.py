from django.contrib import admin
from .models import Usuario, LibroUsuario, Libreria, Ranking

# Register your models here.
admin.site.register(Usuario)
admin.site.register(LibroUsuario)
admin.site.register(Libreria)
admin.site.register(Ranking)