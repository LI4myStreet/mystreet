package com.mystreet.mobile;

import android.app.Application;

public class MyStreeApplication extends Application {
	private Utilizador utilizador;

	@Override
	public void onCreate() {
		this.utilizador = null;
	}
	
	public boolean isLogged() {
		return this.utilizador != null;
	}
	
	public Utilizador getUtilizador() {
		return this.utilizador;
	}

	public void setUtilizador(Utilizador utilizador) {
		this.utilizador = utilizador;
	}
	
}
