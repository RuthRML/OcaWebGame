package edu.uclm.esi.tysweb.laoca.dominio;

import java.util.Random;
import java.util.concurrent.ConcurrentHashMap;

public class Partida {

	private ConcurrentHashMap<String, Usuario> jugadores;
	private int numeroJugadores;
	private int id;

	public Partida(Usuario user, int numeroJugadores) {
		this.jugadores = new ConcurrentHashMap<>();
		this.jugadores.put(user.getLogin(), user);
		this.numeroJugadores = numeroJugadores;
		this.id = new Random().nextInt();
	}

	public Integer getId() {
		return this.id;
	}

	public void add(Usuario usuario) {
		this.jugadores.put(usuario.getLogin(), usuario);
		
	}

	public boolean isReady() {
		return this.jugadores.size()==this.numeroJugadores;
	}

}
