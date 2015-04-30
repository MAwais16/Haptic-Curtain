# Haptic-Curtain
To push start project for creating haptic touch by using framed fabric to project and grab input using depth camera (e.g kinect) initially with processing and then using PCL, so different recognition functionality can be used to detect location or gesture.


/Main/
    contains processingjs code for getting depth data from kinect using simpleOpenNI

/PCL/
    aquisition of depth data using PCL library. Better use PCL_Visualizer for visualizing for more control.
    
    in PCL
    >mkdir build
    >cd build
    >cmake ..
    >make
    
    