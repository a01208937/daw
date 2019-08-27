function tablas() {
    var input = prompt("introduce un número", "1");
    input = parseInt(input);
    
    var output = "table: <br>";
    
    for(i=0; i< input; i++) {
        output += "number: " + i + ", square: " + i*i + ", cube: " + i*i*i + "<br>";
    }
    
    document.write(output);
}

function pedir_suma() {
    var num1 = Math.random() * 10;
    var num2 = Math.random() * 10;
    num1 = parseInt(num1);
    num2 = parseInt(num2);
    
    //set initial time
    var today = new Date();
    var initMinutes = today.getMinutes();
    var initSeconds = today.getSeconds();
    
    var pregunta = "cual es la suma de: " + num1 + " + " + num2;
    var suma = prompt(pregunta);
    
    today = new Date();
    var finalMinutes = today.getMinutes();
    var finalSeconds = today.getSeconds();
    
    var tMinutes = finalMinutes - initMinutes;
    var tSeconds = finalSeconds - initSeconds;
    var total = (tMinutes*60) + tSeconds;
    var output = "Your timing was: " + total + "\n";
    output += "Your answer was: ";
    if (suma == (num1 + num2)) {
        output += "Correct";
    } else {
        output += "Incorrect";
    }
    
    alert(output);
}

function contador() {
    var input = prompt("Ingresa los números que quieras");
    var ceros = 0;
    var menores = 0;
    var mayores = 0;
    var inputLength = input.length;
    for (i=0; i<inputLength; i++) {
        var num = parseInt(input[i]);
        if (num == 0) {ceros++;}
        else if (num > 0) {mayores++;}
        else if (input[i] == "-") {
            menores++;
            do {
                i++;
            } while (parseInt(input[i]) >= 0);
        }
    }
    
    var output = "Ceros: " + ceros + ", menores: " + menores + ", mayores: " + mayores;
    alert(output);
}

function promedios() {
    var input, pregunta = false, cnt = 0, promedio, output = "";
    do {
        
        if (pregunta) {
            cnt++;
            input = prompt("Ingresa el arreglo de números (todos juntos, solo positivos)");
            promedio = 0;
            var inputLength = input.length;
            for (i=0; i<inputLength; i++) {
                promedio += parseInt(input[i]);
            }
            promedio /= (inputLength);
            output += "promedio " + cnt + ": " + promedio + "\n";
        }
        pregunta = confirm("¿Quiere ingresar un(otro) arreglo?");
        if (!pregunta) {
            alert(output);
        }
    } while(pregunta);
}

function inverso() {
    var input = prompt("ingresa un número");
    var output = "El inverso es: ";
    for (i=input.length-1; i>=0; i--) {
        output += input[i];
    }
    alert(output);
}

function figura() {
    var h = prompt("Height");
    var w = prompt("Width");
    h = parseInt(h);
    w = parseInt(w);
    var rect = new Rectangle(h, v);
    alert(rect.area);
}

class Rectangle {
    
    constructor(height, width) {
    this.height = height;
    this.width = width;
    }
    
    get area() {
        return this.calcular_area();
    }
    
    calcular_area() {
        return this.height*this.width;
    }
}

