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
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ListView;

public class MainActivity extends Activity {
	public static RestClient restClient = new RestClient("http://10.0.2.2:2000/api");;
	private AlertDialog.Builder alertBuilder;
	private ArrayList<Ocorrencia> ocorrencias;
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
        
        final ListView lv = (ListView)findViewById(R.id.lvOcorrencias);
        lv.setOnItemClickListener(new AdapterView.OnItemClickListener() {
			@Override
			public void onItemClick(AdapterView<?> arg0, View arg1, int pos, long arg3) {
				Intent i = new Intent(getApplicationContext(), DetalheOcorrenciaActivity.class);
				i.putExtra("id", ((Ocorrencia)lv.getAdapter().getItem(pos)).getId());
            	startActivity(i);
			}});
        
		new RestAsyncTask().execute();
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		Log.i("MainActivity", "Creating menu");
		return true;
	}
	
	@Override
	public boolean onPrepareOptionsMenu(Menu menu) {
		menu.clear(); 
		if(MyStreeApplication.isLogged()) {
			getMenuInflater().inflate(R.menu.main_logged, menu);
		} else {
			getMenuInflater().inflate(R.menu.main, menu);
		}
		return super.onPrepareOptionsMenu(menu);
	}
	
	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		// Handle item selection
	    switch (item.getItemId()) {
	        case R.id.action_nova_ocorrencia:
	        	Intent i = new Intent(getApplicationContext(), NovaOcorrenciaActivity.class);
            	startActivity(i);
            	
	            return true;
	        case R.id.action_logout:
	        	logout();
	        default:
	            return super.onOptionsItemSelected(item);
	    }
	}
	
	private void logout() {
		MyStreeApplication.logout();
    	finish();
    	startActivity(getIntent());
	}
	
	@Override
	public void onResume() {
		new RestAsyncTask().execute();
		if(MyStreeApplication.isLogged()) {
			String nome = MyStreeApplication.getUtilizador().getNome(); 
			setTitle(getString(R.string.app_name) + " : " + nome);
			final ImageButton btnLogin = (ImageButton) findViewById(R.id.imgBtnLogin);
			btnLogin.setImageDrawable(getResources().getDrawable(R.drawable.ic_stat_logout));
			btnLogin.setOnClickListener(new View.OnClickListener() {
	            public void onClick(View v) {
	            	logout();
	            }
	        });
		} else {
			final ImageButton btnLogin = (ImageButton) findViewById(R.id.imgBtnLogin);
			btnLogin.setOnClickListener(new View.OnClickListener() {
	            public void onClick(View v) {
	            	Intent i = new Intent(getApplicationContext(), LoginActivity.class);
	            	startActivity(i);
	            }
	        });
		}
		super.onResume();
	}
	
	void updateOcorrencias() {
		ListView lv = (ListView)findViewById(R.id.lvOcorrencias);
		
		ArrayList<Ocorrencia> filtered = new ArrayList<Ocorrencia>();
		
		for(Ocorrencia o : ocorrencias) {
			if(this.filter == null 
					|| this.filter.equals("") 
					|| o.getDescricao().toLowerCase(Locale.getDefault()).contains(this.filter.toLowerCase(Locale.getDefault()))) { 
				filtered.add(o);
			}
		}
		
		ArrayAdapter<Ocorrencia> adapter = new ArrayAdapter<Ocorrencia>(this, R.layout.listview_row, filtered);
	    lv.setAdapter(adapter);
	}
	
	class RestAsyncTask extends AsyncTask<Void, Void, Collection<Ocorrencia>> {
		private String error;
		
		@Override
		protected Collection<Ocorrencia> doInBackground(Void... params) {
			 try {
				return restClient.getOcorrencias();
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

			MainActivity.this.ocorrencias = new ArrayList<Ocorrencia>(ocorrencias);
			updateOcorrencias();
		}
	}
}
