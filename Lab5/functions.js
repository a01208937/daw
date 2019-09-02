function send() {
	var pass = document.getElementById("pass").value;
	var confirm_pass = document.getElementById("confirm_pass").value;

	if (pass == "" || confirm_pass == "") {
		alert("Por favor introduzca los datos solicitados");
	} else if (pass == confirm_pass) {
		location.href = 'tienda.html';
	} else {
		alert("Las contraseñas no coinciden");
	}
}

document.getElementById("send_btn").onclick = send;