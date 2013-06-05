package com.mystreet.mobile;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.json.JSONException;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Service;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.IBinder;
import android.provider.Settings;
import android.util.Log;
import android.view.Menu;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.Spinner;

public class NovaOcorrenciaActivity extends Activity {
	private Spinner spinner;
	private AlertDialog.Builder alertBuilder;
	private Collection<Localidade> localidades;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_nova_ocorrencia);
		this.alertBuilder = new AlertDialog.Builder(this);
		new RestAsyncTask().execute();
		
		GPSTracker gps = new GPSTracker(NovaOcorrenciaActivity.this);

        // check if GPS enabled      
        if(gps.canGetLocation()){
        	double latitude = gps.getLatitude();
            double longitude = gps.getLongitude();
            EditText te = (EditText)findViewById(R.id.editText3);
            te.setText(Double.toString(latitude)+ "," + Double.toString(longitude));
        }
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.nova_ocorrencia, menu);
		return true;
	}
	
	// add items into spinner dynamically
	  public void addItemsOnSpinner() {
	 
		this.spinner = (Spinner) findViewById(R.id.spinner1);
		List<String> list = new ArrayList<String>();
		for(Localidade l : this.localidades) {
			list.add(l.getNome());
		}
		ArrayAdapter<String> dataAdapter = new ArrayAdapter<String>(this,
			android.R.layout.simple_spinner_item, list);
		dataAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
		spinner.setAdapter(dataAdapter);
	  }
	  
	  class RestAsyncTask extends AsyncTask<Void, Void, Collection<Localidade>> {
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
				
				NovaOcorrenciaActivity.this.localidades = localidades;
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
