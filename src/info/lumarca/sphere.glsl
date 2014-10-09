/*

I guess what's interesting here is that there is no transformation matrices.

In other words, the shader builds things in the following:

x: 0, resX
y: 0, resY
z: 0, resZ (prolly something equivalent to resY)
x, right
y, up
z, forward

birds eye:


     _______
\   |       |   /          z = however far back it goes
 \  |       |  /
  \ |       | /
   \|_______|/             z = 0
x = 0       x = width res


radius: defined in pixel units

*/

uniform vec2 iResolution;
uniform sampler2D iChannel0;

#define IRESZ 360.0
#define CAMERAZ -1920.0
#define STRINGCOUNT 80.0
#define GUTTERSIZE 2.0

#define RADIUS 150.0
#define CENTER vec3(200.0, 200.0, 200.0)

void main(void) {

    // If this is in a gutter, do not display & return out of main()
    float pxPerString = iResolution.x / STRINGCOUNT;
    if (mod(gl_FragCoord.x - GUTTERSIZE/2.0, pxPerString) >= pxPerString - GUTTERSIZE) {
        gl_FragColor = vec4(0, 0, 0, 1);
        return;
    }

    // determine depth of current string as per iChannel0
    float currString = floor(gl_FragCoord.x / pxPerString);
    float depthFactor = texture2D(iChannel0, vec2(currString*1.0/STRINGCOUNT, 0.0)).r;
    float depth = depthFactor * IRESZ;

    // vec3 pixelLocation = gl_FragCoord.xy
    vec2 halfWidth = vec2(iResolution.x/2.0, 0.0);
    vec2 zeroedFragCoord = gl_FragCoord.xy - halfWidth;
    vec3 angleToPx = normalize(vec3(zeroedFragCoord, -CAMERAZ));
    float proportionDifference = (depth - CAMERAZ) / - CAMERAZ;
    vec3 pxLocation = vec3(zeroedFragCoord * proportionDifference + halfWidth, depth);

    float distFromCenter = distance(CENTER.xyz, pxLocation);
    if (distFromCenter < RADIUS) {
        float grade = 1.0 - distFromCenter / RADIUS;
        gl_FragColor = vec4(grade, grade, grade, 1);
    } else {
      gl_FragColor = vec4(0, 0, 0, 0);
    }
}
