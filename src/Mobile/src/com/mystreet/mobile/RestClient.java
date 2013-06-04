package com.mystreet.mobile;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.StatusLine;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

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
	
	public void criaUtilizador(Utilizador utilizador) {
		ArrayList<NameValuePair> data = new ArrayList<NameValuePair>();
		data.add(new BasicNameValuePair("Nome", utilizador.getNome()));
		data.add(new BasicNameValuePair("Morada", utilizador.getMorada()));
		data.add(new BasicNameValuePair("Username", utilizador.getUsername()));
		data.add(new BasicNameValuePair("Password", utilizador.getPassword()));
		data.add(new BasicNameValuePair("Tipo", ""));
		
		post("/utilizadores/", data);
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
		    // Pulling items from the array
		    Localidade localidade = new Localidade();
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
	
	private String post(String request, List<NameValuePair> data) {
		HttpPost httpPost = new HttpPost(this.url+request);
		
		try {
		  httpPost.setEntity(new UrlEncodedFormEntity(data));
		  HttpResponse response = this.client.execute(httpPost);
		  
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
}
