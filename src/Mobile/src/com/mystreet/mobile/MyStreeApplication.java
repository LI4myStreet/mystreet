package com.mystreet.mobile;

import android.app.Application;

public class MyStreeApplication extends Application {
	private static Utilizador utilizador = null;

	public static boolean isLogged() {
		return utilizador != null;
	}
	
	public static void logout() {
		utilizador = null;
	}
	
	public static Utilizador getUtilizador() {
		return utilizador;
	}

	public static void setUtilizador(Utilizador utilizador) {
		MyStreeApplication.utilizador = utilizador;
	}
	
}
