package com.mystreet.mobile;

public class Utilizador {
	public int Id;
	public String nome;
	public String morada;
	public String username;
	public String password;
	public int tipo;
	
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getMorada() {
		return morada;
	}
	public void setMorada(String morada) {
		this.morada = morada;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getTipo() {
		return tipo;
	}
	public void setTipo(int tipo) {
		this.tipo = tipo;
	}	
}
