from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User
from django.http import HttpResponse
from django.shortcuts import render, redirect, get_object_or_404

from .forms import ExtendedUserCreationForm, UsuarioForm, EstadoForm
from .models import Usuario, LibroUsuario
from libro.models import Genero, Libro
import random
# Create your views here.


# Bienvenida
def bienvenida(request):
    if request.user.is_authenticated:
        user = request.user
        try:
            usuario = Usuario.objects.get(usuario=user)
            return redirect('usuario:home')
        except Usuario.DoesNotExist:
            usuario = None

    return render(request, 'bienvenida/bienvenida.html', {})


# Logout
def salir(request):
    logout(request)
    return render(request, 'bienvenida/bienvenida.html')


#home
def home(request):
    user = request.user
    usuario = Usuario.objects.get(usuario=user)
    # Todos los generos para mostrarlos en la home
    generosTodos = Genero.objects.all()
    # Todos los libros ordenados por mas nuevos
    librosNuevos = Libro.objects.all().order_by('-anoEdicion')[:5]

# Libros recomendados
    # Array para generos de libros recomendados
    generosLibrosUsuario = []
    contador = 0

    # Seleccion generos
    while contador < 5:
        # Seleccionar generos de los libros que el usuario ha guardado como leído.
        try:
            # Seleccionar los generos que el usuario ha guardado como favoritos
            if contador <= 5:
                generos = usuario.genero.all()
                for genero in generos:
                    if contador >= 5:
                        break
                    generosLibrosUsuario.append(genero.nombre)
                    contador = contador + 1

            leidos = LibroUsuario.objects.filter(usuario=usuario, estado="LD")

            for libroU in leidos:
                if contador >= 5:
                    break
                libroUser = libroU.libro
                generos = libroUser.genero.all()
                for genero in generos:
                    generosLibrosUsuario.append(genero.nombre)
                    contador = contador + 1

            # Si no tiene ningun libro ni genero añadido en favoritos seleccionará 5 generos
            if contador == 0:
                # Generos aleatorios
                generos = Genero.objects.order_by('?')[:5]
                for genero in generos:
                    if contador >= 5:
                        break
                    generosLibrosUsuario.append(genero.nombre)
                    contador = contador + 1
        except:
            libroUsuario = None



    # Seleccionar libros de los generos favoritos
    librosUser = []
    for genero in generosLibrosUsuario:
        generoLibro = Genero.objects.get(nombre=genero)
        libroU = Libro.objects.filter(genero=generoLibro)
        try:
            libroAleatorio = random.choice(libroU)
            if libroAleatorio not in librosUser:
                librosUser.append(libroAleatorio)
        except:
            libroAleatorio = None


    librosRecomendados = []
    contador=0
    for libro in librosUser:
        libroRecom = Libro.objects.get(titulo=libro)
        contador = contador + 1
        librosRecomendados.append(libroRecom)

    context = {'generos': generosTodos, 'librosNuevos': librosNuevos, 'librosRecomendados': librosRecomendados}
    return render(request, 'web/home.html', context)


def libro(request, id_libro):
    libro = get_object_or_404(Libro, pk=id_libro)
    user = request.user
    usuario=Usuario.objects.get(usuario=user)
    form = EstadoForm()
    if request.method == 'POST':
        form = EstadoForm(request.POST)

        if form.is_valid():
            valor = form.cleaned_data['estado']

            libroUsuario = LibroUsuario.objects.create(usuario=usuario, libro=libro, estado=valor)

    context = {'libro': libro, 'form': form}

    return render(request, 'web/libro.html', context)


#Registrar usuario
def registro(request):
    if request.method == 'POST':
        form = ExtendedUserCreationForm(request.POST)
        usuario_form = UsuarioForm(request.POST)

        if form.is_valid() and usuario_form.is_valid():
            usuario = form.save()

            profile = usuario_form.save(commit=False)
            profile.usuario = usuario
            profile.save()

            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password1')

            usuario = authenticate(username=username, password=password)
            login(request, usuario)

            return redirect('usuario:home')
    else:
        form = ExtendedUserCreationForm()

    context = {'form': form}

    return render(request, 'registro/registro.html', context)


#Iniciar sesion
def inicioSesion(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(username=username, password=password)
        if user:
            if user.is_active:
                login(request, user)
                return redirect('usuario:home')
            else:
                return HttpResponse("Your account was inactive.")
        else:
            print("Someone tried to login and failed.")
            print("They used username: {} and password: {}".format(username, password))
            return HttpResponse("Invalid login details given")
    else:
        return render(request, 'login/login.html', {})


#Mi Perfil


#Añadir generos
def miPerfil(request):
    user = request.user
    usuario = Usuario.objects.get(usuario=user)
    generosUser = usuario.genero.all()
    # Añadir generos al usuaio
    if request.method == 'POST':
        generos = request.POST.getlist('genero')
        usuario.genero.clear()
        for genero in generos:
            generoUsuario = Genero.objects.get(nombre=str(genero))
            usuario.genero.add(generoUsuario)

        context = {'generos': generos}
        return render(request, 'prueba.html', context)

    generos = Genero.objects.all()

    # Libros leídos del usuario
    leidos = LibroUsuario.objects.filter(usuario=usuario, estado="LD")

    # Libros leer del usuario
    leer = LibroUsuario.objects.filter(usuario=usuario, estado="LR")
    print(leer)

    # Libros comprar del usuario
    comprar = LibroUsuario.objects.filter(usuario=usuario, estado="CM")

    # Libros abandonados del usuario
    abandonados = LibroUsuario.objects.filter(usuario=usuario, estado="AB")

    context = {'generos': generos, 'generoUser': generosUser, 'usuario': usuario, 'leidos': leidos, 'leer': leer, 'comprar': comprar, 'abandonados': abandonados}
    return render(request, 'web/perfil.html', context)
