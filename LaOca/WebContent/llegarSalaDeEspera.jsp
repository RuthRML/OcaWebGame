<%@page import="edu.uclm.esi.tysweb.laoca.dominio.Manager"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String param = request.getParameter("parametro");
	JSONObject jsonobj = new JSONObject(param);
	String jugador = jsonobj.getString("nombre");
	session.setAttribute("nombreDeUsuario", jugador);
	JSONObject res = new JSONObject();
	
	try{
		Manager.get().addJugador(jugador);
		res.put("result", "OK");
		
	}catch(Exception e){
		res.put("result", "ERROR");
		res.put("mensaje", e.getMessage());
	}
	
	out.println(res.toString());

%>