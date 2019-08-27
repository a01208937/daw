function send() {
	var pass = document.getElementById("pass").value;
	var confirm_pass = document.getElementById("confirm_pass").value;

	if (pass == confirm_pass) {
		alert("Contraseña verificada correctamente");
	} else {
		alert("Las contraseñas no coinciden");
	}
}

document.getElementById("send_btn").onclick = send;