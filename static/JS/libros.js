function exerciciDos(){

    //Faig la petició ajax al JSON
    $.ajax({
        url: 'http://127.0.0.1:8000/apiLibros/',
        success: function(response){
            //Mostro el resultat
            var p = $("#exercici2").html(response.current.condition.text);
        },
        error: function(){
            //Mostro un error si no troba la ruta
            var div = $("#exercici2").html("Error");
        }
    })
}