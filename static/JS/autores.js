const app = new Vue({
    delimiters: ['[[', ']]'],
    el: '#app',
    data: {
        titulo: 'Autores',
        json: '',
        autores: [],
        autoresInicial: [],
    },
    created: function () {
        var _this = this;
        $.getJSON('/autoresApi/', function (json) {
            _this.json = json;
            var count = Object.keys(_this.json).length;

            for (let i = 1; i <= count; i++) {
               _this.autores.push(_this.json['autor'+i])
            }

        });
    },
    filters: {
        capitalize: function (value, inicial){
        if (!value) return '';
            inicial = inicial.toString();
            value = value.toString();
            if(value.startsWith(inicial)){
                return value;
            }
            else{
                return null;
            }
        }
    }
});