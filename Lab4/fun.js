function tablas() {
    var input = prompt("introduce un número", "1");
    input = parseInt(input);
    
    var output = "table: <br>";
    
    for(i=0; i< input; i++) {
        output += "number: " + i + ", square: " + i*i + ", cube: " + i*i*i + "<br>";
    }
    
    document.write(output);
}

