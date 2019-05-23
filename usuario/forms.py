from django import forms
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from .models import Usuario, LibroUsuario, Libreria


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

