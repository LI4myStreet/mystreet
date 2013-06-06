package com.mystreet.mobile;

import org.json.JSONException;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;

public class DetalheOcorrenciaActivity extends Activity {
	private Ocorrencia ocorrencia;
	private AlertDialog.Builder alertBuilder;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_detalhe_ocorrencia);
		
		this.alertBuilder = new AlertDialog.Builder(this);
		
		this.ocorrencia = new Ocorrencia();
		this.ocorrencia.setId(getIntent().getExtras().getInt("id"));
		new OcorrenciaAsyncTask().execute();
		
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.detalhe_ocorrencia, menu);
		return true;
	}
	
	private void updateView() {
		final ImageView iv = (ImageView)findViewById(R.id.ivPicture);
		byte[] data = this.ocorrencia.getImage();
		if(data != null) {
			Bitmap bmp = BitmapFactory.decodeByteArray(data, 0, data.length);
			iv.setImageBitmap(bmp);
		} else {
			iv.setVisibility(View.GONE);
		}
		
		final ListView lv = (ListView)findViewById(R.id.lvDetails);
		lv.setAdapter(new MyAdapter(getApplicationContext(), ocorrencia));
	}

	private class OcorrenciaAsyncTask extends AsyncTask<Void, Void, Ocorrencia> {
		private String error = null;
		
		@Override
		protected Ocorrencia doInBackground(Void... params) {
			try {
				return MainActivity.restClient.getOcorrencia(ocorrencia.getId());
			} catch (JSONException e) {
				error = e.getLocalizedMessage();
				return null;
			}
		}
		
		protected void onPostExecute(Ocorrencia ocorrencia) {
			if(ocorrencia == null && error != null) {
				alertBuilder.setMessage("Erro ao receber detalhes da ocorrência: " + error);
				alertBuilder.setPositiveButton("OK", null);
				alertBuilder.show();
				finish();
			} else if(ocorrencia == null) {
				alertBuilder.setMessage("Erro ao receber detalhes da ocorrência.");
				alertBuilder.setPositiveButton("OK", null);
				alertBuilder.show();
				finish();
			} else {
				DetalheOcorrenciaActivity.this.ocorrencia = ocorrencia;
				updateView();
			}
		}
	}
	
	class MyAdapter extends BaseAdapter {
	    private LayoutInflater mInflater;
	 
	    private String[] keys;
	    private String[] values;
	    
	    public MyAdapter(Context context, Ocorrencia ocorrencia) {
	        mInflater = LayoutInflater.from(context);
	        this.keys = new String[] { 
	        		getString(R.string.descricao), 
	        		getString(R.string.morada), 
	        		getString(R.string.coordenadas),
	        		getString(R.string.estado),
	        		getString(R.string.utilizador),
	        		getString(R.string.localidade),
	        		getString(R.string.comentarios),
	        		getString(R.string.tags)
	        };
	        this.values = new String[] { 
	        		ocorrencia.getDescricao(), 
	        		ocorrencia.getMorada(), 
	        		ocorrencia.getCoordenadas(),
        			ocorrencia.getEstado(),
        			ocorrencia.getUtilizador().getNome(),
        			ocorrencia.getLocalidade(),
        			Integer.toString(ocorrencia.getComentarios().size()),
        			ocorrencia.getTags()
	        };
	    }
	 
	    public View getView(int position, View convertView, ViewGroup parent) {
	        if (convertView == null) {
	            convertView = mInflater.inflate(R.layout.two_line_list_item, parent, false);
	        }
	        TextView title = (TextView) convertView.findViewById(R.id.rowTitle);
	        TextView sub = (TextView) convertView.findViewById(R.id.rowSubTitle);
	        
	        title.setText(keys[position]);
	        sub.setText(values[position]);
	        
	        return convertView;
	    }

		@Override
		public int getCount() {
			return this.keys.length;
		}

		@Override
		public Object getItem(int position) {
			return values[position];
		}

		@Override
		public long getItemId(int position) {
			// TODO Auto-generated method stub
			return 0;
		}
	}
}
