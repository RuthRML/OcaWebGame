function crearPartida(){
			var request = new XMLHttpRequest();
			request.open("post", "crearPartida.jsp");
			request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			request.onreadystatechange=function(){
				if(request.readyState==4){
					var respuesta = request.responseText;
					alert(respuesta);
					conectarWebSocket();
					localStorage.nombre = document.getElementById("nombre").value;
					}
			};
			
			// Creamos objeto parámetro
			var parametro = {
					nombre : document.getElementById("nombre").value,
					numerojugadores: document.getElementById("numero").value
			};
			
			request.send("parametro=" + JSON.stringify(parametro));
			
			
		}

function unirse(){
	var request = new XMLHttpRequest();
	request.open("post", "llegarSalaDeEspera.jsp");
	request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	request.onreadystatechange=function(){
		if(request.readyState==4){
			var respuesta = request.responseText;
			alert(respuesta);
			conectarWebSocket();
			localStorage.nombre = document.getElementById("nombre").value;
			}
	};
	
	// Creamos objeto parámetro
	var parametro = {
			nombre : document.getElementById("nombre").value
	};
	
	request.send("parametro=" + JSON.stringify(parametro));
	
}

var ws;

function conectarWebSocket() {
	ws = new WebSocket("ws://localhost:8080/LaOca/servidorDePartidas");
	
	ws.onopen = function(){
		alert("Conectado!");
	}
	
	ws.onmessage = function(datos){
		var mensaje = datos.data;
		mensaje = JSON.parse(mensaje);
		if(mensaje.tipo == "DIFUSION"){
			console.log(mensaje.mensaje);
		}
	}
	
}