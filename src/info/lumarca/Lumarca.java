package info.lumarca;
import processing.core.*;
import processing.data.*;

public class Lumarca {
	public int marginSize;
	public float xRealUnits;
	public float zRealUnits;
	public float furthestProjection;
	public float[] stringXLocations;
	
	public Lumarca(JSONObject json) {
		marginSize = json.getInt("margin size");
		xRealUnits = json.getFloat("x real units");
		zRealUnits = json.getFloat("z real units");
		furthestProjection = json.getFloat("furthest projection");
		JSONArray floatList = json.getJSONArray("string x locations");
		stringXLocations = floatList.getFloatArray();
	}

}