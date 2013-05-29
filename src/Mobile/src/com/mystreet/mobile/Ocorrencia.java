package com.mystreet.mobile;

public class Ocorrencia {
    public int id;
    public int utilizadorID;
    public String descricao;
    public String estado;
    public String morada;
    public String coordenadas;
	
    public int getId() {
		return id;
	}
	
    public void setId(int id) {
		this.id = id;
	}
	
	public int getUtilizadorID() {
		return utilizadorID;
	}
	
	public void setUtilizadorID(int utilizadorID) {
		this.utilizadorID = utilizadorID;
	}
	
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	
	public String getMorada() {
		return morada;
	}
	public void setMorada(String morada) {
		this.morada = morada;
	}
	
	public String getCoordenadas() {
		return coordenadas;
	}
	public void setCoordenadas(String coordenadas) {
		this.coordenadas = coordenadas;
	}    
}
