package com.mystreet.mobile;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Locale;

import org.json.JSONException;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.Menu;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ListView;

public class MainActivity extends Activity {
	private RestClient rest;
	private AlertDialog.Builder alertBuilder;
	private Collection<Ocorrencia> ocorrencias;
	private String filter;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		
		this.ocorrencias  = new ArrayList<Ocorrencia>();
		this.alertBuilder = new AlertDialog.Builder(this);
		
		final ImageButton btnSearch = (ImageButton) findViewById(R.id.btnImgSearch);
        btnSearch.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
            	EditText searchFilter = (EditText)findViewById(R.id.etSearch);
            	filter = searchFilter.getText().toString();
            	updateOcorrencias();
            }
        });
		
        final ImageButton btnLogin = (ImageButton) findViewById(R.id.imgBtnLogin);
        btnLogin.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
            	Intent i = new Intent(getApplicationContext(), LoginActivity.class);
            	startActivity(i);
            }
        });
        
		this.rest = new RestClient("http://10.0.2.2:2000/api");
		new RestAsyncTask().execute();
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}
	
	void updateOcorrencias() {
		ListView lv = (ListView)findViewById(R.id.lvOcorrencias);
		
		ArrayList<String> descricoes = new ArrayList<String>();
		
		for(Ocorrencia o : ocorrencias) {
			if(this.filter == null 
					|| this.filter.equals("") 
					|| o.getDescricao().toLowerCase(Locale.getDefault()).contains(this.filter.toLowerCase(Locale.getDefault()))) { 
				descricoes.add(o.getDescricao());
			}
		}
		
		ArrayAdapter<String> adapter = new ArrayAdapter<String>(getApplicationContext(), R.layout.listview_row, descricoes);
	    lv.setAdapter(adapter);
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

			MainActivity.this.ocorrencias = ocorrencias;
			updateOcorrencias();
		}
	}
}
