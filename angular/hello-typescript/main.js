var minhaVar = "minha variável";
function minhaFuncao(x, y) {
    return x + y;
}
// ES6 - 2015
var num = 2;
var PI = 3.14;
var numeros = [1, 2, 3];
numeros.map(function (v) { return v * 2; });
var Matematica = /** @class */ (function () {
    function Matematica() {
        this.soma = function (x, y) { return x + y; };
    }
    return Matematica;
}());
var str = 'string';
var n1 = 'qualquer tipo de variável';
