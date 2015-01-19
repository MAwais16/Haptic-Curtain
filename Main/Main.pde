import SimpleOpenNI.*;

SimpleOpenNI  context;

void setup()
{
  context = new SimpleOpenNI(this);
   
  // enable depthMap generation 
  context.enableDepth();
  //context.enableIR(); 
  // enable camera image generation
  context.enableRGB();
 
  background(200,0,0);
  size(context.rgbWidth() + context.rgbWidth() + 10, context.rgbHeight()); 
}

void draw()
{
  // update the cam
  context.update();
  //image(context.irImage(),0,0);
  // draw depthImageMap
  image(context.depthImage(),0,0);
  
  // draw camera
  image(context.rgbImage(),context.depthWidth() + 10,0);
}
