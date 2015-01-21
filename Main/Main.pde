import SimpleOpenNI.*;

//from SimpleOpenNI DepthMap3d

SimpleOpenNI  context;

float        zoomF =0.3f;
float        rotX = radians(180);  // by default rotate the hole scene 180deg around the x-axis, 
                                   // the data from openni comes upside down
float        rotY = radians(0);


void setup()
{
  size(1024,768,P3D);
  
  context = new SimpleOpenNI(this);
  if(context.isInit() == false)
  {
     println("Can't init SimpleOpenNI, maybe the camera is not connected!"); 
     exit();
     return;  
  }
  
  // disable mirror
  context.setMirror(false);
  
  context.enableDepth(); //we enabled depth
  
  
  
}

void draw()
{
  context.update();

  background(0,0,0);

  translate(width/2, height/2, 0);
  rotateX(rotX);
  rotateY(rotY);
  scale(zoomF);

  int[]   depthMap = context.depthMap();
  int     steps   = 7;  // to speed up the drawing, draw every third point
  int     index;
  PVector realWorldPoint;
 
  translate(0,0,-1000);  // set the rotation center of the scene 1000 infront of the camera

  stroke(255);
  //rotY += 0.05f;

  PVector[] realWorldMap = context.depthMapRealWorld();
  
  // draw pointcloud
  //beginShape(POINTS);
  for(int y=0;y < context.depthHeight();y+=steps)
  {
    for(int x=0;x < context.depthWidth();x+=steps)
    {
      index = x + y * context.depthWidth();
      if(depthMap[index] > 0)
      { 
        // draw the projected point
        //realWorldPoint = context.depthMapRealWorld()[index];
        realWorldPoint = realWorldMap[index];
        //vertex(realWorldPoint.x,realWorldPoint.y,realWorldPoint.z);  // make realworld z negative, in the 3d drawing coordsystem +z points in the direction of the eye
        
        if(realWorldPoint.z>600 && realWorldPoint.z<1000){
          point(realWorldPoint.x,realWorldPoint.y,realWorldPoint.z);
        }
        
        
      }
      //println("x: " + x + " y: " + y);
    }
  } 
 // endShape();
  
  // draw the kinect cam
  //context.drawCamFrustum();
   
}
