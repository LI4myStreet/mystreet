package com.mystreet.mobile;

public class Ocorrencia {
    private int id;
    private int utilizadorID;
    private int localidadeID;
    private String descricao;
    private String estado;
    private String morada;
    private String coordenadas;
    private String tags;
	
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
	
	public int getLocalidadeID() {
		return localidadeID;
	}

	public void setLocalidadeID(int localidadeID) {
		this.localidadeID = localidadeID;
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

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}
}
