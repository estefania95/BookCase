from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User
from django.db.models import Q
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect, get_object_or_404

from .forms import ExtendedUserCreationForm, UsuarioForm, EstadoForm, LibreriaForm, AddBook, AddAutor, AddGenero
from .models import Usuario, LibroUsuario, Libreria
from libro.models import Genero, Libro, Autor
import random, json
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


# Buscador
def buscador(request):
    libro = request.GET.get('libro', '')
    titulo = (Q(titulo__contains=libro))
    libros = Libro.objects.filter(titulo)

    context = {'libros': libros}

    return render(request, 'buscador/buscador.html', context)

# Apartado Home
def home(request):
    user = request.user
    usuario = Usuario.objects.get(usuario=user)
    admin = usuario.usuario.is_superuser
    # Todos los generos para mostrarlos en la home
    generosTodos = Genero.objects.all()
    mitad = len(generosTodos)/2

    primerosGeneros = []
    segundosGeneros = []

    cont = 0
    for genero in generosTodos:
        if cont < mitad:
            primerosGeneros.append(genero)

        else:
            segundosGeneros.append(genero)
        cont += 1

    if len(primerosGeneros) != len(segundosGeneros):
        segundosGeneros.append("")

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

    context = {'generos1': primerosGeneros,
               'generos2': segundosGeneros,
               'librosNuevos': librosNuevos,
               'librosRecomendados': librosRecomendados,
               'admin': admin}
    return render(request, 'web/home.html', context)


# Libros individuales
def libro(request, id_libro):
    libro = get_object_or_404(Libro, pk=id_libro)
    user = request.user
    usuario=Usuario.objects.get(usuario=user)
    librerias = Libreria.objects.filter(usuario=usuario)

    form = EstadoForm()
    try:
        # Si ya tiene el libro en la lista mostrará lo siguiente en el boton
        lista = LibroUsuario.objects.get(usuario=usuario, libro=libro)
        estado = ''
        if lista:
            if lista.estado == 'LD':
                estado = "Leído"
            elif lista.estado == 'LR':
                estado = "Leer"
            elif lista.estado == 'CM':
                estado = "Comprar"
            else:
                estado = "Abandonado"
    except:
        lista = None
        estado = None
    if request.method == 'POST':
        form = EstadoForm(request.POST)

        if form.is_valid():
            valor = form.cleaned_data['estado']
            try:
                libroUsuario = LibroUsuario.objects.get(usuario=usuario, libro=libro)

                if libroUsuario:
                    libroUsuario.estado = valor
                    libroUsuario.save()
            except:
                libroUsuario = LibroUsuario.objects.create(usuario=usuario, libro=libro, estado=valor)

            return redirect('usuario:libro', libro.id)

    context = {'libro': libro, 'form': form, 'librerias': librerias, 'lista': lista, 'estado': estado}

    return render(request, 'web/libro.html', context)


# Eliminar libro lista
def eliminarLibro(request, id_libro):
    libro = get_object_or_404(Libro, pk=id_libro)
    user = request.user
    usuario = Usuario.objects.get(usuario=user)
    libroUser = LibroUsuario.objects.get(libro=libro, usuario=usuario).delete()

    return redirect('usuario:libro', libro.id)


# Genero: Todos los libros
def genero(request, id_genero):
    genero = get_object_or_404(Genero, pk=id_genero)

    user = request.user
    usuario = Usuario.objects.get(usuario=user)
    libros = Libro.objects.filter(genero=genero)


    context = {'libros': libros, 'genero': genero}

    return render(request, 'web/genero.html', context)


# Apartado Libros
def librosGenero(request):
    generos = Genero.objects.all()

    context = {'generos': generos}

    return render(request, 'web/libros.html', context)


# Api Libros Generos
def apiLibrosGenero(request):
    generos = Genero.objects.all()
    contadorGen = 0
    generosLibros = {}
    for genero in generos:
        contadorGen += 1
        libros = Libro.objects.filter(genero=genero).order_by('?')[:4]

        nombreGenero = genero.nombre
        descripcionGenero = genero.descripcion
        imagenGenero = genero.nombreImagen

        librosGenero = {}
        contador = 0
        for libro in libros:
            contador += 1
            idLibro = libro.id
            tituloLibro = libro.titulo
            sinopsisLibro = libro.sinopsis
            imagenLibro = libro.imagen
            libroGen = {'idLibro': idLibro,
                        'tituloLibro': tituloLibro,
                        'sinopsisLibro': sinopsisLibro,
                        'imagenLibro': imagenLibro}
            librosGenero['libro'+str(contador)] = libroGen

        infoGenero = {'nombreGenero': nombreGenero,
                      'descripcionGenero': descripcionGenero,
                      'imagenGenero': imagenGenero,
                      'libros': librosGenero}

        generosLibros['genero'+str(contadorGen)] = infoGenero

    return JsonResponse(generosLibros)


# Explorador
def explorador(request):
    user = request.user
    usuario = Usuario.objects.get(usuario=user)

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

    # Seleccionar libros de los generos favoritos (API!!!)
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
    contador = 0
    for libro in librosUser:
        libroRecom = Libro.objects.get(titulo=libro)
        contador = contador + 1
        librosRecomendados.append(libroRecom)

    # Generos favoritos
    try:
        generosFav = usuario.genero.all()
    except:
        generosFav = None

    context = {'librosRecomendados': librosRecomendados, 'loop': range(1, generosFav.count()+1,)}

    return render(request, 'web/explorador.html', context)


# Api libros explorador (Generos favoritos del usuario
def librosGenerosUsuario(request):
    user = request.user
    usuario = Usuario.objects.get(usuario=user)

    generosUser = usuario.genero.all()
    generos = {}
    contadorGenero = 0

    for genero in generosUser:
        contadorGenero += 1
        libros = {}
        contadorLibros = 0
        nombregenero = genero.nombre
        librosGenero = Libro.objects.filter(genero=genero).order_by('?')[:5]
        for libro in librosGenero:
            contadorLibros += 1
            titulo = libro.titulo
            idLibro = libro.id
            imagenLibro = libro.imagen
            libros['libro'+str(contadorLibros)] = {'idLibro': idLibro, 'titulo': titulo, 'imagenLibro': imagenLibro}

        generos['genero'+str(contadorGenero)] = {'nombreGenero': nombregenero, 'libros': libros}

    return JsonResponse(generos)


# Autores
def autores(request, caracter):
    inicial = caracter.upper()
    context = {'inicial': caracter}
    return render(request, 'web/autores.html', context)

def autor(request, id_autor):
    autor = get_object_or_404(Autor, pk=id_autor)
    librosAutor = autor.libro.all()

    context = {'autor': autor, 'librosAutor': librosAutor}

    return render(request, 'web/autor.html', context)

# Api autores
def autoresApi(request):
    autoresTodos = Autor.objects.all()

    autores = {}
    contador = 0

    for autor in autoresTodos:
        contador += 1
        id = autor.id
        nombre = autor.nombre
        apellidos = autor.apellidos
        anoNacimiento = autor.anoNacimiento
        descripcion = autor.descripcion
        librosAutor = autor.libro.all()
        libros = {}
        contadorLibros = 0
        for libro in librosAutor:
            contadorLibros += 1
            idLibro = libro.id
            tituloLibro = libro.titulo
            isbn = libro.isbn
            numPaginas = libro.numeroPaginas
            anoEdicion = libro.anoEdicion
            imagenLibros = libro.imagen
            sinopsis = libro.sinopsis

            libros['libro'+str(contadorLibros)] = {'idLibro': idLibro,
                                                   'titulo': tituloLibro,
                                                   'isbn': isbn,
                                                   'numPaginas': numPaginas,
                                                   'anoEdicion': anoEdicion,
                                                   'imagenLibro': imagenLibros,
                                                   'sinopsis': sinopsis}
            autores['autor'+str(contador)] = {'idAutor': id,
                                              'nombre': nombre,
                                              'apellidos': apellidos,
                                              'descripcionAutor': descripcion,
                                              'anoNacimiento': anoNacimiento,
                                              'libros': libros}

    return JsonResponse(autores)


# Mis librerias
def libreria(request):
    user = request.user
    usuario = Usuario.objects.get(usuario=user)

    form = LibreriaForm()
    librerias = Libreria.objects.filter(usuario=usuario)

    if request.method == 'POST':
        form = LibreriaForm(request.POST)

        if form.is_valid():
            nombreLibreria = form.cleaned_data['nombre']
            descripcionLibreria = form.cleaned_data['descripcion']
            estantes = form.cleaned_data['estantes']
            maxLibros = estantes*20

            if estantes > 0 and estantes <= 3:
                libreria = Libreria.objects.create(nombre=nombreLibreria,
                                               descripcion=descripcionLibreria,
                                               estantes=estantes, usuario=usuario,
                                               maxLibros=maxLibros)

            return redirect('usuario:librerias')

    librerias = Libreria.objects.filter(usuario=usuario)

    context = {'librerias': librerias, 'form': form}

    return render(request, 'web/librerias.html', context)


# Libreria individual
def libreriaIndividual(request, id_libreria):
    user = request.user
    usuario = Usuario.objects.get(usuario=user)

    libreria = get_object_or_404(Libreria, pk=id_libreria)
    estantes = libreria.estantes

    librosLibreria = libreria.libro.all()

    estante1=[]
    estante2=[]
    estante3=[]

    for libro in librosLibreria:
        if len(estante1) < 20:
            estante1.append(libro)
        elif len(estante2) < 40:
            estante2.append(libro)
        else:
            estante3.append(libro)

    context = {'libreria': libreria,
               'loop': range(1, libreria.estantes+1,),
               'libros': librosLibreria,
               'estante1': estante1,
               'estante2': estante2,
               'estante3': estante3}

    return render(request, 'web/libreria.html', context)


# Añadir libro a la libreria
def añadirLibro(request, id_libro):
    libro = get_object_or_404(Libro, pk=id_libro)
    maxLibros = 0

    if request.method == "POST":
        idLibreria = request.POST['librerias']
        libreria = Libreria.objects.get(id=idLibreria)
        maxLibros = libreria.estantes*20
        librosLibreria = libreria.libro.count()

        if librosLibreria < maxLibros:
            libreria.libro.add(libro)

    return redirect('usuario:libro', libro.id)


# Borrar libreria
def borrar(request, id_libreria):
    libreria = get_object_or_404(Libreria, pk=id_libreria).delete()
    return redirect('usuario:librerias')


# Registrar usuario
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


# Iniciar sesion
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


# Mi Perfil

# Añadir generos
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

        return redirect('usuario:perfil')

    generos = Genero.objects.all()

    # Libros leídos del usuario
    leidos = LibroUsuario.objects.filter(usuario=usuario, estado="LD")

    # Libros leer del usuario
    leer = LibroUsuario.objects.filter(usuario=usuario, estado="LR")

    # Libros comprar del usuario
    comprar = LibroUsuario.objects.filter(usuario=usuario, estado="CM")

    # Libros abandonados del usuario
    abandonados = LibroUsuario.objects.filter(usuario=usuario, estado="AB")

    context = {'generos': generos, 'generoUser': generosUser, 'usuario': usuario, 'leidos': leidos, 'leer': leer, 'comprar': comprar, 'abandonados': abandonados}
    return render(request, 'web/perfil.html', context)


# Formularios de libros, autor y genero
def add(request):
    libro = AddBook()
    autor = AddAutor()
    genero = AddGenero()

    libros = Libro.objects.all()
    autores = Autor.objects.all()
    generos = Genero.objects.all()

    context = {'libro': libro,
               'autor': autor,
               'genero': genero,
               'libros': libros,
               'autores': autores,
               'generos': generos}
    return render(request, 'web/admin/librosNuevos.html', context)


# Añadir libros
def addBook(request):
    if request.method == 'POST':
        titulo = request.POST['titulo']
        isbn = request.POST['isbn']
        editorial = request.POST['editorial']
        numPaginas = request.POST['numPaginas']
        anoEdicion = request.POST['edicion']
        sinopsis = request.POST['sinopsis']
        imagen = request.POST['imagen']
        generos = request.POST.getlist('generos')
        libro = Libro.objects.create(titulo=titulo,
                                     isbn=isbn,
                                     editorial=editorial,
                                     numeroPaginas=numPaginas,
                                     anoEdicion=anoEdicion,
                                     sinopsis=sinopsis,
                                     imagen=imagen)
        for genero in generos:
            gen = Genero.objects.get(id=genero)
            libro.genero.add(gen)

    return redirect('usuario:add')


# Añadir autor
def addAutor(request):
    if request.method == 'POST':
        nombreAutor = request.POST['nombreAutor']
        apellidos = request.POST['apellidos']
        anoNacimiento = request.POST['nacimiento']
        descripcionAutor = request.POST['descripcionAutor']
        libros = request.POST.getlist('libros')

        autor = Autor.objects.create(nombre=nombreAutor,
                                     apellidos=apellidos,
                                     anoNacimiento=anoNacimiento,
                                     descripcion=descripcionAutor)

        for libro in libros:
            autor.libro.add(libro)

    return redirect('usuario:add')


# Añadir genero
def addGenero(request):
    if request.method == 'POST':
        nombreGenero = request.POST['nombreGenero']
        nombreImgGen = request.POST['nombreImgGen']
        descripcionGenero = request.POST['descripcionGenero']

        genero = Genero.objects.create(nombre=nombreGenero, nombreImagen=nombreImgGen, descripcion=descripcionGenero)

    return redirect('usuario:add')


# Editar libro
def editLibro(request):
    if request.method == 'POST':
        libroReq = request.POST['libros']
        libro = Libro.objects.get(id=libroReq)

        titulo = request.POST['titulo']
        isbn = request.POST['isbn']
        editorial = request.POST['editorial']
        numPaginas = request.POST['numPaginas']
        anoEdicion = request.POST['edicion']
        sinopsis = request.POST['sinopsis']
        imagen = request.POST['imagen']
        generos = request.POST.getlist('generos')

        if titulo:
            libro.titulo = titulo
        if isbn:
            libro.isbn = isbn
        if editorial:
            libro.editorial = editorial
        if numPaginas:
            libro.numeroPaginas = numPaginas
        if anoEdicion:
            libro.anoEdicion = anoEdicion
        if sinopsis:
            libro.sinopsis = sinopsis
        if imagen:
            libro.imagen = imagen
        if generos:
            for genero in generos:
                genLib = Genero.objects.get(id=genero)
                # Si el genero ya existe lo elimina
                try:
                    libroGen = Libro.objects.get(id=libroReq, genero=genLib)
                    libroGen.genero.remove(genLib)
                except:
                    libro.genero.add(genLib)

        libro.save()

    return redirect('usuario:add')


# Editar autor
def editAutor(request):
    if request.method == 'POST':
        idAutor = request.POST['autor']
        autor = Autor.objects.get(id=idAutor)

        nombreAutor = request.POST['nombreAutor']
        apellidos = request.POST['apellidos']
        anoNacimiento = request.POST['nacimiento']
        descripcionAutor = request.POST['descripcionAutor']
        libros = request.POST.getlist('libros')

        if nombreAutor:
            autor.nombre = nombreAutor
        if apellidos:
            autor.apellidos = apellidos
        if anoNacimiento:
            autor.anoNacimiento = anoNacimiento
        if descripcionAutor:
            autor.descripcion = descripcionAutor

        if libros:
            for libro in libros:
                try:
                    autorLibro = Autor.objects.get(id=idAutor, libro=libro)
                    autorLibro.libro.remove(libro)
                except:
                    autor.libro.add(libro)
        autor.save()

    return redirect('usuario:add')


# Editar genero
def editGenero(request):
    if request.method == 'POST':
        idgenero = request.POST['genero']
        genero = Genero.objects.get(id=idgenero)

        nombreGenero = request.POST['nombreGenero']
        nombreImgGen = request.POST['nombreImgGen']
        descripcionGenero = request.POST['descripcionGenero']

        if nombreGenero:
            genero.nombre = nombreGenero
        if nombreImgGen:
            genero.nombreImagen =nombreImgGen
        if genero.descripcion:
            genero.descripcion = descripcionGenero

        genero.save()

    return redirect('usuario:add')


# Politica de privacidad
def politica(request):
    return render(request, 'web/politica.html')