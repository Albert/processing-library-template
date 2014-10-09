package info.lumarca;

import processing.core.*;
import processing.opengl.*;

public class LGraphics extends PGraphicsOpenGL {

//	static protected URL maskShaderFragURL =
//		PGraphicsOpenGL.class.getResource("MaskFrag.glsl");

	public LGraphics() {
	}

	public static void main(String[] args) {
	}
//
//	@Override
//	public void pushMatrix() {
//	}
//
//	@Override
//	public void resetMatrix() {
//	}
//
//	@Override
//	public void popMatrix() {
//	}
//
//	@Override
//	public void blendMode(int mode) {
//	}
//	
//	@Override
//	public void background(int rgb) {
//	}
	
	@Override
	public void sphere(float r) {

//		PShader sphereShader = LGraphics.class.getResource("ColorFrag.glsl");
//
//		PImage destImage = parent.loadImage("noise.png");
//		sphereShader.set("iResolution", width, height);
//		
//		sphereShader.set("iChannel0", destImage);

		rect(0, 0, width, height);
	}

	@Override
	public void box(float r) {
		rect(0, 0, 100, 100);
	}

}
