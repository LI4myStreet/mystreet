package com.mystreet.mobile;

import java.util.ArrayList;
import java.util.Collection;

import org.json.JSONException;

import android.app.Activity;
import android.app.AlertDialog;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.Menu;
import android.widget.ArrayAdapter;
import android.widget.ListView;

public class MainActivity extends Activity {
	private RestClient rest;
	private AlertDialog.Builder alertBuilder;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		
		this.alertBuilder = new AlertDialog.Builder(this);
		
		this.rest = new RestClient("http://10.0.2.2:2000/api");
		new RestAsyncTask().execute();
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}
	
	class RestAsyncTask extends AsyncTask<Void, Void, Collection<Ocorrencia>> {
		private String error;
		
		@Override
		protected Collection<Ocorrencia> doInBackground(Void... params) {
			 try {
				return rest.getOcorrencias();
			} catch (JSONException e) {
				error = e.getLocalizedMessage();
				e.printStackTrace();
			}
			return null;
		}
		
		protected void onPostExecute(Collection<Ocorrencia> ocorrencias) {
			if(ocorrencias == null) {
				alertBuilder.setMessage("Erro ao receber ocorrências: \n" + error);
				alertBuilder.setPositiveButton("OK", null);
				alertBuilder.show();
				return;
			}

			ArrayList<String> descricoes = new ArrayList<String>();
			for(Ocorrencia o : ocorrencias) {
				descricoes.add(o.getDescricao());
			}
			
			ListView lv = (ListView)findViewById(R.id.lvOcorrencias);
			
			ArrayAdapter<String> adapter = new ArrayAdapter<String>(getApplicationContext(), R.layout.listview_row, descricoes);
		    lv.setAdapter(adapter);
		}
	}
}
