<%@page import="edu.uclm.esi.tysweb.laoca.dominio.Manager"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String param = request.getParameter("parametro");
	JSONObject jsonobj = new JSONObject(param);
	String jugador = jsonobj.getString("nombre");
	int numeroJugadores = jsonobj.getInt("numerojugadores");
	JSONObject respuesta = new JSONObject();
	
	try{
		int idPartida = Manager.get().crearPartida(jugador, numeroJugadores);
		session.setAttribute("nombreDeUsuario", jugador);		
		
		respuesta.put("result", "OK");
		respuesta.put("mensaje", idPartida);
		
		Cookie cookie = new Cookie("Cookie1", "" + numeroJugadores);
		cookie.setMaxAge(30); // Dura 30 segundos
		response.addCookie(cookie);
	}catch(Exception e){
		respuesta.put("result", "ERROR");
		respuesta.put("mesnaje", e.getMessage());
	}
	
	out.println(respuesta.toString());

%>