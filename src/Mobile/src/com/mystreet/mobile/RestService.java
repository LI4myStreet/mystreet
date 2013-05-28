package com.mystreet.mobile;

import java.io.IOException;
import java.io.InputStream;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.protocol.BasicHttpContext;
import org.apache.http.protocol.HttpContext;

import android.util.Log;

public class RestService {
	protected static String getASCIIContentFromEntity(HttpEntity entity) throws IllegalStateException, IOException {
		InputStream in = entity.getContent();
		StringBuffer out = new StringBuffer();
		int n = 1;
		while (n>0) {
			byte[] b = new byte[4096];
			n =  in.read(b);
			if (n>0) out.append(new String(b, 0, n));
		}
		return out.toString();
	}
	
	public static String GetSomething() {
		HttpClient httpClient = new DefaultHttpClient();
		HttpContext localContext = new BasicHttpContext();
		HttpGet httpGet = new HttpGet("http://10.0.2.2:2000/api/utilizador");
		String text = null;
		Log.d("Cenas", "trying");
		try {
			HttpResponse response = httpClient.execute(httpGet, localContext);
			Log.d("Cenas", "has response");
			HttpEntity entity = response.getEntity();
			Log.d("Cenas", "has entiity");
			text = getASCIIContentFromEntity(entity);
			Log.d("Cenas", "has entiity");
		} catch (Exception e) {
			return e.getLocalizedMessage();
		}
		return text;
	}
		
}
