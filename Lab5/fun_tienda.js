// variables
var cantidad_it = 0;
var cantidad_marciano = 0;
var cantidad_fundacion = 0;
var costo_fundacion = 250;
var costo_marciano = 310;
var costo_it = 680;
var porcentaje_iva = 0.16;
var subtotal = 0;
var total = 0;

// ids
var btn_mas_fundacion = document.getElementById("mas_fundacion");
var btn_menos_fundacion = document.getElementById("menos_fundacion");
var btn_mas_marciano = document.getElementById("mas_marciano");
var btn_menos_marcaino = document.getElementById("menos_marciano");
var btn_mas_it = document.getElementById("mas_it");
var btn_menos_it = document.getElementById("menos_it");
var txt_fundacion = document.getElementById("cant_fundacion");
var txt_marciano = document.getElementById("cant_marciano");
var txt_it = document.getElementById("cant_it");
var txt_cantidad = document.getElementById("cantidad_elementos");
var txt_subtotal = document.getElementById("sub_total");
var txt_iva = document.getElementById("iva");
var txt_total = document.getElementById("total");

// FUNCIONES
function update() {
    subtotal = costo_fundacion*cantidad_fundacion;
    subtotal += costo_marciano*cantidad_marciano;
    subtotal += costo_it*cantidad_it;
    var iva = subtotal*porcentaje_iva;
    total = subtotal+iva;

    txt_cantidad.innerHTML = "Elementos en el carrito: " + cantidad_fundacion+cantidad_marciano+cantidad_it;
    txt_subtotal.innerHTML = "Subtotal: $" + subtotal;
    txt_iva.innerHTML = "IVA: $" + iva;
    txt_total.innerHTML = "Total: $" + total;
}

function mas_fundacion() {
    cantidad_fundacion++;
    txt_fundacion.innerHTML = "Cantidad: " + cantidad_fundacion;
    update();
}
function menos_fundacion() {
    if (cantidad_fundacion > 0) {
        cantidad_fundacion--;
    }
    txt_fundacion.innerHTML = "Cantidad: " + cantidad_fundacion;
    update();
}

function mas_marciano() {
    cantidad_marciano++;
    txt_marciano.innerHTML = "Cantidad: " + cantidad_marciano;
    update();
}
function menos_marciano() {
    if (cantidad_marciano > 0) {
        cantidad_marciano--;
    }
    txt_marciano.innerHTML = "Cantidad: " + cantidad_marciano;
    update();
}

function mas_it() {
    cantidad_it++;
    txt_it.innerHTML = "Cantidad: " + cantidad_it;
    update();
}
function menos_it() {
    if (cantidad_it > 0) {
        cantidad_it--;
    }
    txt_it.innerHTML = "Cantidad: " + cantidad_it;
    update();
}

// CLICK LISTENERS
btn_mas_fundacion.onclick = mas_fundacion;
btn_menos_fundacion.onclick = menos_fundacion;
btn_mas_marciano.onclick = mas_marciano;
btn_menos_marcaino.onclick = menos_marciano;
btn_mas_it.onclick = mas_it;
btn_menos_it.onclick = menos_it;