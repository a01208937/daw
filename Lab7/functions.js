function clickToast() {
    var txt = "Descripción de Material design:\n";
    txt += "Son unas pautas enfocadas en establecer normas de diseño en web, android, etc. (cualquier ";
    txt += "plataforma que requiera una interfaz)";
    alert(txt);
}

document.getElementById("tstBtn").onclick = clickToast;