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
import org.apache.http.impl.client.DefaultHttpClient;
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
	
	public boolean isValidLogin(String username, String password) {
		String response = get("/utilizadores/?username="+username+"&password="+password);
		if(response == null) return false;
		
		return true;
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
}
