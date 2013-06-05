package com.mystreet.mobile;

import java.io.ByteArrayOutputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.json.JSONException;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.annotation.TargetApi;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.Service;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Bitmap;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;
import android.os.IBinder;
import android.provider.MediaStore;
import android.provider.Settings;
import android.util.Log;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.View;
import android.view.inputmethod.EditorInfo;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.Spinner;
import android.widget.TextView;

/**
 * Activity which displays a login screen to the user, offering registration as
 * well.
 */
public class NovaOcorrenciaActivity extends Activity {
	private static final int CAMERA_REQUEST = 1888;
	
	/**
	 * Keep track of the login task to ensure we can cancel it if requested.
	 */
	private UserLoginTask mAuthTask = null;
	private ImageLinkAsyncTask mImageLinkTask = null;

	// Values for email and password at the time of the login attempt.
	private String mDescricao;
	private String mMorada;
	private int mLocalidadeID;
	private String mCoordenadas;
	private Collection<Localidade> mLocalidades;
	private byte[] mImage;
	private int mImageId;
	private int mOcorrenciaId;
	
	// UI references.
	private EditText mDescricaoView;
	private EditText mMoradaView;
	private View mLoginFormView;
	private View mLoginStatusView;
	private TextView mLoginStatusMessageView;
	private Spinner mSpLocalidades;
	private EditText mCoordenadasView;
	
	// Alter window
	private AlertDialog.Builder alertBuilder;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);

		setContentView(R.layout.activity_nova_ocorrencia);
		
		this.mSpLocalidades = (Spinner) findViewById(R.id.spLocalidades);
		new LoadAsyncTask().execute();
		
		this.alertBuilder = new AlertDialog.Builder(this);

		// Set up the login form.
		mDescricaoView = (EditText) findViewById(R.id.etDescricao);
		mDescricaoView.setText(mDescricao);

		mMoradaView = (EditText) findViewById(R.id.etMorada);
		mMoradaView
				.setOnEditorActionListener(new TextView.OnEditorActionListener() {
					@Override
					public boolean onEditorAction(TextView textView, int id,
							KeyEvent keyEvent) {
						if (id == R.id.login || id == EditorInfo.IME_NULL) {
							attemptLogin();
							return true;
						}
						return false;
					}
				});

		mLoginFormView = findViewById(R.id.login_form);
		mLoginStatusView = findViewById(R.id.login_status);
		mLoginStatusMessageView = (TextView) findViewById(R.id.login_status_message);

		mCoordenadasView = (EditText) findViewById(R.id.etCoordenadas);
		
		findViewById(R.id.btnAdicionar).setOnClickListener(
				new View.OnClickListener() {
					@Override
					public void onClick(View view) {
						attemptLogin();
					}
				});
		
		findViewById(R.id.ibGps).setOnClickListener(
				new View.OnClickListener() {
					@Override
					public void onClick(View view) {
						GPSTracker gps = new GPSTracker(NovaOcorrenciaActivity.this);

				        // check if GPS enabled      
				        if(gps.canGetLocation()){
				        	double latitude = gps.getLatitude();
				            double longitude = gps.getLongitude();
				            EditText etCoordenadas = (EditText)findViewById(R.id.etCoordenadas);
				            etCoordenadas.setText(Double.toString(latitude)+ "," + Double.toString(longitude));
				        } else {
				        	alertBuilder.setMessage("Erro ao obter as coordenadas");
							alertBuilder.setPositiveButton("OK", null);
							alertBuilder.show();
				        }
					}
				});
		
		findViewById(R.id.ibAddImagem).setOnClickListener(
				new View.OnClickListener() {
					@Override
					public void onClick(View view) {
						Intent takePictureIntent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
					    startActivityForResult(takePictureIntent, CAMERA_REQUEST);
					}
				});
		
		mImageId = -1;
	}
	
	protected void onActivityResult(int requestCode, int resultCode, Intent data) {  
        if (requestCode == CAMERA_REQUEST && resultCode == RESULT_OK) {  
            Bitmap photo = (Bitmap) data.getExtras().get("data"); 
            ImageView imageView = (ImageView)findViewById(R.id.ivPreview);
            imageView.setImageBitmap(photo);
            ByteArrayOutputStream stream = new ByteArrayOutputStream();
            photo.compress(Bitmap.CompressFormat.JPEG, 60, stream);
            mImage = stream.toByteArray();
        }  
    } 

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		super.onCreateOptionsMenu(menu);
		getMenuInflater().inflate(R.menu.nova_ocorrencia, menu);
		return true;
	}

	 public void addItemsOnSpinner() {		 
		List<String> list = new ArrayList<String>();
		for(Localidade l : this.mLocalidades) {
			list.add(l.getNome());
		}
		ArrayAdapter<String> dataAdapter = new ArrayAdapter<String>(this,
			android.R.layout.simple_spinner_item, list);
		dataAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
		this.mSpLocalidades.setAdapter(dataAdapter);
	  }
	/**
	 * Attempts to sign in or register the account specified by the login form.
	 * If there are form errors (invalid email, missing fields, etc.), the
	 * errors are presented and no actual login attempt is made.
	 */
	public void attemptLogin() {
		if (mAuthTask != null) {
			return;
		}

		// Reset errors.
		mDescricaoView.setError(null);
		mMoradaView.setError(null);

		// Store values at the time of the login attempt.
		mDescricao = mDescricaoView.getText().toString();
		mMorada = mMoradaView.getText().toString();
		String localidade = (String)mSpLocalidades.getSelectedItem();
		
		for(Localidade l : mLocalidades) {
			if(l.getNome().equals(localidade)) {
				mLocalidadeID = l.getId();
				break;
			}
		}
		
		mCoordenadas = mCoordenadasView.getText().toString();
		
		// Show a progress spinner, and kick off a background task to
		// perform the user login attempt.
		mLoginStatusMessageView.setText(R.string.a_enviar);
		showProgress(true);
		mAuthTask = new UserLoginTask();
		mAuthTask.execute((Void) null);
		
	}

	/**
	 * Shows the progress UI and hides the login form.
	 */
	@TargetApi(Build.VERSION_CODES.HONEYCOMB_MR2)
	private void showProgress(final boolean show) {
		// On Honeycomb MR2 we have the ViewPropertyAnimator APIs, which allow
		// for very easy animations. If available, use these APIs to fade-in
		// the progress spinner.
		if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.HONEYCOMB_MR2) {
			int shortAnimTime = getResources().getInteger(
					android.R.integer.config_shortAnimTime);

			mLoginStatusView.setVisibility(View.VISIBLE);
			mLoginStatusView.animate().setDuration(shortAnimTime)
					.alpha(show ? 1 : 0)
					.setListener(new AnimatorListenerAdapter() {
						@Override
						public void onAnimationEnd(Animator animation) {
							mLoginStatusView.setVisibility(show ? View.VISIBLE
									: View.GONE);
						}
					});

			mLoginFormView.setVisibility(View.VISIBLE);
			mLoginFormView.animate().setDuration(shortAnimTime)
					.alpha(show ? 0 : 1)
					.setListener(new AnimatorListenerAdapter() {
						@Override
						public void onAnimationEnd(Animator animation) {
							mLoginFormView.setVisibility(show ? View.GONE
									: View.VISIBLE);
						}
					});
		} else {
			// The ViewPropertyAnimator APIs are not available, so simply show
			// and hide the relevant UI components.
			mLoginStatusView.setVisibility(show ? View.VISIBLE : View.GONE);
			mLoginFormView.setVisibility(show ? View.GONE : View.VISIBLE);
		}
	}

	public void createImageLink() {
		showProgress(true);
		mImageLinkTask = new ImageLinkAsyncTask();
		mImageLinkTask.execute();
	}
	/**
	 * Represents an asynchronous login/registration task used to authenticate
	 * the user.
	 */
	public class UserLoginTask extends AsyncTask<Void, Void, Boolean> {
		private String error = null;
		
		@Override
		protected Boolean doInBackground(Void... params) {
			Ocorrencia ocorrencia = new Ocorrencia();
			ocorrencia.setCoordenadas(mCoordenadas);
			ocorrencia.setDescricao(mDescricao);
			ocorrencia.setLocalidadeID(mLocalidadeID);
			ocorrencia.setMorada(mMorada);
			ocorrencia.setUtilizadorID(MyStreeApplication.getUtilizador().getId());
			mOcorrenciaId = MainActivity.restClient.criaOcorrencia(ocorrencia);
			if(mOcorrenciaId > 0) {
				if(mImage != null) mImageId = MainActivity.restClient.criaImagem(mImage);
				return true;
			} else {
				return false;
			}
		}

		@Override
		protected void onPostExecute(final Boolean success) {
			mAuthTask = null;
			showProgress(false);

			if (success) {
				if(mImage != null) createImageLink();
				else finish();
			} else if(error != null) {
				alertBuilder.setMessage("Erro ao criar ocorrência: \n" + error);
				alertBuilder.setPositiveButton("OK", null);
				alertBuilder.show();
			} else {
				alertBuilder.setMessage("Erro desconhecido ao criar ocorrência");
				alertBuilder.setPositiveButton("OK", null);
				alertBuilder.show();
			}
		}

		@Override
		protected void onCancelled() {
			mAuthTask = null;
			showProgress(false);
		}
	}
	
	public class ImageLinkAsyncTask extends AsyncTask<Void, Void, Boolean> {
		private String error = null;
		
		@Override
		protected Boolean doInBackground(Void... params) {
			return MainActivity.restClient.criaImagemOcorrencia(mImageId, mOcorrenciaId);
		}

		@Override
		protected void onPostExecute(final Boolean success) {
			mImageLinkTask = null;
			showProgress(false);

			if (success) {
				finish();
			} else if(error != null) {
				alertBuilder.setMessage("Erro ao criar ocorrência: \n" + error);
				alertBuilder.setPositiveButton("OK", null);
				alertBuilder.show();
			} else {
				alertBuilder.setMessage("Erro desconhecido ao criar ocorrência");
				alertBuilder.setPositiveButton("OK", null);
				alertBuilder.show();
			}
		}

		@Override
		protected void onCancelled() {
			mImageLinkTask = null;
			showProgress(false);
		}
	}
	
	class LoadAsyncTask extends AsyncTask<Void, Void, Collection<Localidade>> {
		private String error;
		
		@Override
		protected Collection<Localidade> doInBackground(Void... params) {
			 try {
				return MainActivity.restClient.getLocalidades();
			} catch (JSONException e) {
				error = e.getLocalizedMessage();
				e.printStackTrace();
			}
			return null;
		}
		
		protected void onPostExecute(Collection<Localidade> localidades) {
			if(localidades == null) {
				alertBuilder.setMessage("Erro ao receber ocorrências: \n" + error);
				alertBuilder.setPositiveButton("OK", null);
				alertBuilder.show();
				return;
			}
			
			NovaOcorrenciaActivity.this.mLocalidades = localidades;
			addItemsOnSpinner();
		}
	}
	
	public class GPSTracker extends Service implements LocationListener {

	    private final Context mContext;

	    // flag for GPS status
	    boolean isGPSEnabled = false;

	    // flag for network status
	    boolean isNetworkEnabled = false;

	    // flag for GPS status
	    boolean canGetLocation = false;

	    Location location; // location
	    double latitude; // latitude
	    double longitude; // longitude

	    // The minimum distance to change Updates in meters
	    private static final long MIN_DISTANCE_CHANGE_FOR_UPDATES = 10; // 10 meters

	    // The minimum time between updates in milliseconds
	    private static final long MIN_TIME_BW_UPDATES = 1000 * 60 * 1; // 1 minute

	    // Declaring a Location Manager
	    protected LocationManager locationManager;

	    public GPSTracker(Context context) {
	        this.mContext = context;
	        getLocation();
	    }

	    public Location getLocation() {
	        try {
	            locationManager = (LocationManager) mContext
	                    .getSystemService(LOCATION_SERVICE);

	            // getting GPS status
	            isGPSEnabled = locationManager
	                    .isProviderEnabled(LocationManager.GPS_PROVIDER);

	            // getting network status
	            isNetworkEnabled = locationManager
	                    .isProviderEnabled(LocationManager.NETWORK_PROVIDER);

	            if (!isGPSEnabled && !isNetworkEnabled) {
	                // no network provider is enabled
	            } else {
	                this.canGetLocation = true;
	                if (isNetworkEnabled) {
	                    locationManager.requestLocationUpdates(
	                            LocationManager.NETWORK_PROVIDER,
	                            MIN_TIME_BW_UPDATES,
	                            MIN_DISTANCE_CHANGE_FOR_UPDATES, this);
	                    Log.d("Network", "Network");
	                    if (locationManager != null) {
	                        location = locationManager
	                                .getLastKnownLocation(LocationManager.NETWORK_PROVIDER);
	                        if (location != null) {
	                            latitude = location.getLatitude();
	                            longitude = location.getLongitude();
	                        }
	                    }
	                }
	                // if GPS Enabled get lat/long using GPS Services
	                if (isGPSEnabled) {
	                    if (location == null) {
	                        locationManager.requestLocationUpdates(
	                                LocationManager.GPS_PROVIDER,
	                                MIN_TIME_BW_UPDATES,
	                                MIN_DISTANCE_CHANGE_FOR_UPDATES, this);
	                        Log.d("GPS Enabled", "GPS Enabled");
	                        if (locationManager != null) {
	                            location = locationManager
	                                    .getLastKnownLocation(LocationManager.GPS_PROVIDER);
	                            if (location != null) {
	                                latitude = location.getLatitude();
	                                longitude = location.getLongitude();
	                            }
	                        }
	                    }
	                }
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return location;
	    }
	  
	    /**
	     * Stop using GPS listener
	     * Calling this function will stop using GPS in your app
	     * */
	    public void stopUsingGPS(){
	        if(locationManager != null){
	            locationManager.removeUpdates(GPSTracker.this);
	        }      
	    }
	  
	    /**
	     * Function to get latitude
	     * */
	    public double getLatitude(){
	        if(location != null){
	            latitude = location.getLatitude();
	        }
	      
	        // return latitude
	        return latitude;
	    }
	  
	    /**
	     * Function to get longitude
	     * */
	    public double getLongitude(){
	        if(location != null){
	            longitude = location.getLongitude();
	        }
	      
	        // return longitude
	        return longitude;
	    }
	  
	    /**
	     * Function to check GPS/wifi enabled
	     * @return boolean
	     * */
	    public boolean canGetLocation() {
	        return this.canGetLocation;
	    }
	  
	    /**
	     * Function to show settings alert dialog
	     * On pressing Settings button will lauch Settings Options
	     * */
	    public void showSettingsAlert(){
	        AlertDialog.Builder alertDialog = new AlertDialog.Builder(mContext);
	       
	        // Setting Dialog Title
	        alertDialog.setTitle("GPS is settings");

	        // Setting Dialog Message
	        alertDialog.setMessage("GPS is not enabled. Do you want to go to settings menu?");

	        // On pressing Settings button
	        alertDialog.setPositiveButton("Settings", new DialogInterface.OnClickListener() {
	            public void onClick(DialogInterface dialog,int which) {
	                Intent intent = new Intent(Settings.ACTION_LOCATION_SOURCE_SETTINGS);
	                mContext.startActivity(intent);
	            }
	        });

	        // on pressing cancel button
	        alertDialog.setNegativeButton("Cancel", new DialogInterface.OnClickListener() {
	            public void onClick(DialogInterface dialog, int which) {
	            dialog.cancel();
	            }
	        });

	        // Showing Alert Message
	        alertDialog.show();
	    }

	    @Override
	    public void onLocationChanged(Location location) {
	    }

	    @Override
	    public void onProviderDisabled(String provider) {
	    }

	    @Override
	    public void onProviderEnabled(String provider) {
	    }

	    @Override
	    public void onStatusChanged(String provider, int status, Bundle extras) {
	    }

	    @Override
	    public IBinder onBind(Intent arg0) {
	        return null;
	    }

	}
}
