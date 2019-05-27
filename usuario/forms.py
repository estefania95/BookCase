from django import forms
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from .models import Usuario, LibroUsuario, Libreria
from libro.models import Libro, Autor, Genero


# Creación del usuario
class ExtendedUserCreationForm(UserCreationForm):
  email = forms.EmailField(required=True)

  class Meta:
    model = User
    fields = ('username', 'email', 'password1', 'password2')

  def save(self, commit=True):
    user = super(ExtendedUserCreationForm, self).save(commit=True)
    user.email = self.cleaned_data['email']

    if commit:
      user.save()
    return user


class UsuarioForm(forms.ModelForm):
    class Meta:
        model = Usuario
        fields = ('genero',)


# Añadir libro a lista predefinida del usuario (Leer, Leído, ...)
class EstadoForm(forms.ModelForm):
    estado = LibroUsuario.estado
    class Meta:
        model = LibroUsuario
        fields = ('estado',)


# Crear libreria
class LibreriaForm(forms.ModelForm):
    class Meta:
        model = Libreria
        fields = ('nombre', 'descripcion', 'estantes')


# Añadir libros
class AddBook(forms.ModelForm):
    class Meta:
        model = Libro
        fields = '__all__'


# Añadir autor
class AddAutor(forms.ModelForm):
    class Meta:
        model = Autor
        fields = '__all__'


# Añadir genero
class AddGenero(forms.ModelForm):
    class Meta:
        model = Genero
        fields = '__all__'
