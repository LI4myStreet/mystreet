package com.mystreet.mobile;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Collection;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.util.Base64;
import android.util.Log;

public class RestClient {
	private String url;
	private HttpClient client;
	
	public RestClient(String url) {
		this.url = url;
		this.client = new DefaultHttpClient();
	}
	
	public Utilizador isValidLogin(String username, String password) throws JSONException {
		String response = get("/utilizadores/?username="+username+"&password="+password);
		if(response == null) return null;
		
		JSONObject jsonUtilizador = new JSONObject(response);
		Utilizador utilizador = new Utilizador();
		
		utilizador.setId(jsonUtilizador.getInt("Id"));
		utilizador.setUsername(jsonUtilizador.getString("Username"));
		utilizador.setPassword(jsonUtilizador.getString("Password"));
		utilizador.setNome(jsonUtilizador.getString("Nome"));
		utilizador.setMorada(jsonUtilizador.getString("Morada"));
		
		return utilizador;
	}
	
	public boolean criaUtilizador(Utilizador utilizador) {
		JSONObject jsonUtilizador = new JSONObject();
		try {
			jsonUtilizador.put("Nome", utilizador.getNome());		
			jsonUtilizador.put("Morada", utilizador.getMorada());
			jsonUtilizador.put("Username", utilizador.getUsername());
			jsonUtilizador.put("Password", utilizador.getPassword());
			
			post("/utilizadores/", jsonUtilizador);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	public int criaOcorrencia(Ocorrencia ocorrencia) {
		JSONObject jsonOcorrencia = new JSONObject();
		try {
			jsonOcorrencia.put("Descricao", ocorrencia.getDescricao());
			jsonOcorrencia.put("Morada", ocorrencia.getMorada());
			jsonOcorrencia.put("Coordenadas", ocorrencia.getCoordenadas());
			jsonOcorrencia.put("LocalidadeID", ocorrencia.getLocalidadeID());
			jsonOcorrencia.put("UtilizadorID", ocorrencia.getUtilizadorID());
			
			String result = post("/ocorrencias/", jsonOcorrencia);
			JSONObject jsonResult = new JSONObject(result);
			Log.d("Post ocorrencias", "clean");
			return jsonResult.getInt("Id");
		} catch (Exception e) {
			return 0;
		}
	}
	
	public int criaImagem(byte[] imagem) {
		JSONObject jsonImagem = new JSONObject();
		try {
			jsonImagem.put("Bytes", Base64.encodeToString(imagem, Base64.DEFAULT));
			
			String result = post("/imagens/", jsonImagem);
			JSONObject jsonResult = new JSONObject(result);
			Log.d("Post imagens", "clean");
			return jsonResult.getInt("Id");
		} catch (Exception e) {
			return 0;
		}
	}
	
	public boolean criaImagemOcorrencia(int imagemId, int ocorrenciaId) {
		JSONObject jsonImagemOcorrencia = new JSONObject();
		try {
			jsonImagemOcorrencia.put("ImagemId", imagemId);
			jsonImagemOcorrencia.put("OcorrenciaId", ocorrenciaId);
			
			post("/imagensocorrencias/", jsonImagemOcorrencia);
			Log.d("Post ocorrencias", "clean");
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	public void getImagens() {
		String response = get("/imagens/");
		if(response == null) return;
		
		JSONArray jsonImagens;
		try {
			jsonImagens = new JSONArray(response);
			Log.d("GetImagens out", jsonImagens.toString());
		} catch (JSONException e) {
			Log.e("GetImages error", e.getLocalizedMessage());
		}
		
	}
	
	public Collection<Ocorrencia> getOcorrencias() throws JSONException {
		String response = get("/ocorrencias/");
		if(response == null) return new ArrayList<Ocorrencia>();
		
		JSONArray jsonOcorrencias = new JSONArray(response);		
		ArrayList<Ocorrencia> ret = new ArrayList<Ocorrencia>();
		for (int i=0; i < jsonOcorrencias.length(); i++)
		{
		    JSONObject o = jsonOcorrencias.getJSONObject(i);
		    // Pulling items from the array
		    Ocorrencia ocorrencia = new Ocorrencia();
		    ocorrencia.setId(o.getInt("Id"));
		    ocorrencia.setUtilizadorID(o.getInt("UtilizadorID"));
		    ocorrencia.setUtilizadorID(o.getInt("LocalidadeID"));
		    ocorrencia.setDescricao(o.getString("Descricao"));
		    ocorrencia.setEstado(o.getString("Estado"));
		    ocorrencia.setMorada(o.getString("Morada"));
		    ocorrencia.setCoordenadas(o.getString("Coordenadas"));
		    
		    ret.add(ocorrencia);
		}
		
		return ret;
	}
	
	public Collection<Localidade> getLocalidades() throws JSONException {
		String response = get("/localidades/");
		if(response == null) return new ArrayList<Localidade>();
		
		JSONArray jsonLocalidades = new JSONArray(response);		
		ArrayList<Localidade> ret = new ArrayList<Localidade>();
		for (int i=0; i < jsonLocalidades.length(); i++)
		{
		    JSONObject o = jsonLocalidades.getJSONObject(i);
		    Localidade localidade = new Localidade();
		    localidade.setId(o.getInt("ID"));
		    localidade.setNome(o.getString("Nome"));
		    
		    ret.add(localidade);
		}
		
		return ret;
	}
	
	private String get(String request) {
		HttpGet httpGet = new HttpGet(this.url+request);
		
		try {
		  HttpResponse response = this.client.execute(httpGet);
		  
		  StatusLine statusLine = response.getStatusLine();
		  int statusCode = statusLine.getStatusCode();
		  
		  if (statusCode == 200) {
			  HttpEntity entity = response.getEntity();
			  InputStream content = entity.getContent();
			  BufferedReader reader = new BufferedReader(new InputStreamReader(content));
		    
			  String line;
			  StringBuilder result = new StringBuilder();
			  while ((line = reader.readLine()) != null) {
				  result.append(line);
			  }	        
			  
			  return result.toString();		     
		  }
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	
		return null;
	}
	
	private String post(String request, JSONObject object) throws PostException {
		HttpPost httpPost = new HttpPost(this.url+request);
		
		Log.d("Post object", object.toString());
		
		try {
		  httpPost.setEntity(new StringEntity(object.toString(), "UTF8"));
		  httpPost.setHeader("Content-type", "application/json");
		  HttpResponse response = this.client.execute(httpPost);
		  
		  StatusLine statusLine = response.getStatusLine();
		  int statusCode = statusLine.getStatusCode();
		  
		  HttpEntity entity = response.getEntity();
		  InputStream content = entity.getContent();
		  BufferedReader reader = new BufferedReader(new InputStreamReader(content));
	    
		  String line;
		  StringBuilder result = new StringBuilder();
		  while ((line = reader.readLine()) != null) {
			  result.append(line);
		  }	        
		 
		  Log.d("Post status", Integer.toString(statusCode));
		  Log.d(RestClient.class.getName(), result.toString());
		  
		  if (statusCode != 201) throw new PostException();
		  
		  return result.toString();
		} catch (ClientProtocolException e) {
			Log.e(RestClient.class.getName(), e.getLocalizedMessage());
			throw new PostException();
		} catch (IOException e) {
			Log.e(RestClient.class.getName(), e.getLocalizedMessage());
			throw new PostException();
		}
	}
	
	class PostException extends Exception {

		/**
		 * 
		 */
		private static final long serialVersionUID = 1L;
	
	}
}
