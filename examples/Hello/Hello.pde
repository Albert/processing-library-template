// upon second thought, would like this to be... but would also like a second opinion on:
// import lumarca.*;
import info.lumarca.*;

void setup() {
  // Eventually would love for this to be:
  // Lumarca thisLumarca = new Lumarca("lumarcaConfig.json"); 
  JSONObject json = loadJSONObject("lumarcaConfig.json");
  Lumarca thisLumarca = new Lumarca(json);
  
  size(400, 400, thisLumarca.RENDERER);
}

void draw() {
  background(0);
  fill(255);
  sphere(1.0);
}
