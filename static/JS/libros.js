$.ajax({
    url: 'http://127.0.0.1:8000/apiLibros/',
    contentType: "application/json; charset=utf-8",
    type: "GET",
    success: function(response) {
        generos(response);
    }
});

function generos(response){
    var jsonObject = JSON.stringify(response);
    var x = JSON.parse(jsonObject);
    var count = Object.keys(x).length;
    console.log(count);
    for(var i=1;i<=count; i++){

        var element = document.getElementById("genero"+i);


        /* Generos */
        var divGen = document.createElement("div");
        divGen.setAttribute("class", 'divGen');
        var h2element = document.createElement("h2");
        var icon = document.createElement("i");
        icon.setAttribute("class","fas fa-angle-right icono");
        var genero = x['genero'+i].nombreGenero;
        var nombreGenero = document.createTextNode(genero);
        h2element.appendChild(nombreGenero);
        divGen.appendChild(icon);
        divGen.appendChild(h2element);

        var pGenero = document.createElement("p");
        var textoGenero = document.createTextNode(x['genero'+i].descripcionGenero);
        pGenero.appendChild(textoGenero);

        element.appendChild(divGen);
        element.appendChild(pGenero);

        var divLibros = document.createElement("div");
        divLibros.setAttribute("class", "libros row");

        /* Libros */
        var contador = Object.keys(x['genero'+i].libros).length;
        if(contador == 0){
            var texto = document.createTextNode("Este genero todavia no tiene libros");
            divLibros.appendChild(texto);
            element.appendChild(divLibros);
        }
        for(var j=1; j<=contador;j++){
            var divLibro = document.createElement("div");
            divLibro.setAttribute("class", "libro col-lg-3 col-md-4 col-sm-6 col-xs-12 p-0");

            var libro = x['genero'+i].libros['libro'+j].tituloLibro;
            var imagen = x['genero'+i].libros['libro'+j].imagenLibro;
            var idLibro = x['genero'+i].libros['libro'+j].idLibro;

            var imagenLibro = document.createElement("img");
            imagenLibro.setAttribute("src", imagen);
            imagenLibro.setAttribute("height","320px");
            divLibro.appendChild(imagenLibro);


            var aelement = document.createElement("a");
            var tituloLibro = document.createTextNode(libro);
            aelement.setAttribute("href", "/libro/"+idLibro);
            aelement.appendChild(tituloLibro);
            divLibro.appendChild(aelement);

            divLibros.appendChild(divLibro);

            element.appendChild(divLibros);

        }
    }
}