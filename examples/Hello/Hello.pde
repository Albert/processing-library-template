import info.lumarca.*;

void setup() {
  JSONObject json = loadJSONObject("lumarcaConfig.json");
  Lumarca thisLumarca = new Lumarca(json);
  size(400, 400);
}

void draw() {
  background(0);
  fill(255);
  sphere(1.0);
}
