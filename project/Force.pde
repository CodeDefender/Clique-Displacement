class Force
{ 
  float d;
  float x1, y1 ,x2 , y2 ;
 /* void intialize_points(String str[] , float a, float b, float c, float d)
  
  {
    len = str.length;
     x1 = a ;y1 = b ; x2 = c ;y2 = d;
 
    // Initialising the array i.e. defining size
    matrix= new int[str.length][str.length];
    
    xv_pos= new float[len];
    yv_pos= new float[len];
    
    for(int i=0;i<str.length;i++)
       matrix[i]=int(split(str[i]," "));
   
    frameRate(1500);
    
    // Randomly choosing the points
      for(int i=0;i<len;i++)               
    {
      xv_pos[i]=random(x + 30,x + wid-30);
      yv_pos[i]=random(y + 30,y + hei-30);
      print("x["+i+"] = "+xv_pos[i]+"   y["+i+"] = "+xv_pos[i]+"\n");
    }
  } */
    
  void drawGraph(int Arr [][] )
  { // Arr = matrix;
     fill(0);
     rect(x,y,wid,hei);
     smooth();
     strokeWeight(11);
     
    
    for(int i=0;i<len;i++)
       point(xv_pos[i],yv_pos[i]);
   
    strokeWeight(1.5);
   // boundary_rep();
    for(int i=0;i<len;i++)
      for(int j=0;j<len;j++)
        { 
          if(Arr[i][j]==1)
          {
           stroke(200,200,40);
          // print("x1= " + xv_pos[i]+ "y1 = " +yv_pos[i] + "x2= " + xv_pos[j]+ "yj = " +yv_pos[j] );
           cal_force(i,j);         
           line(xv_pos[i],yv_pos[i],xv_pos[j],yv_pos[j]);
          }
          else if(i!=j)
          {
          cal_rep(i,j);
          }
        }
  }
      
    
  void cal_force(int i,int j)
  {
      d=sqrt(abs( (xv_pos[i]-xv_pos[j])*(xv_pos[i]-xv_pos[j]) + (yv_pos[i]-yv_pos[j])*(yv_pos[i]-yv_pos[j]) )) ;
      float r;
      float force= 0.9*(d-d_px);
      float cos_theta = (xv_pos[j]-xv_pos[i]) / d;
      float sin_theta = (yv_pos[j]-yv_pos[i]) / d;
      
      if(force > 0)
       { r= map((d-d_px)*(d-d_px),0,160000,0,30);
        xv_pos[j]= xv_pos[j] - r*cos_theta;
        yv_pos[j]= yv_pos[j] - r*sin_theta;
        xv_pos[i]= xv_pos[i] + r*cos_theta;
        yv_pos[i]= yv_pos[i] + r*sin_theta;
       }
       if(force < 0)
       { r= map((d_px-d)*(d_px-d),0,160000,0,30);
        xv_pos[j]= xv_pos[j] + r*cos_theta;
        yv_pos[j]= yv_pos[j] + r*sin_theta;
        xv_pos[i]= xv_pos[i] - r*cos_theta;
        yv_pos[i]= yv_pos[i] - r*sin_theta;
       }
     
   }
   
    void cal_rep(int i ,int j)
    {
      d=sqrt(abs( (xv_pos[i]-xv_pos[j])*(xv_pos[i]-xv_pos[j]) + (yv_pos[i]-yv_pos[j])*(yv_pos[i]-yv_pos[j]) )) ;
      float force=  160000/(d+1);
     // print("  force   = +"+force+"\n");
      //print("  d   = +"+d+"\n");
      float r = map(force,0,160000,0,30);
     // print("  r   = +"+r+"\n");
      
      float cos_theta = (xv_pos[j]-xv_pos[i]) / d;
      float sin_theta = (yv_pos[j]-yv_pos[i]) / d;
    
      xv_pos[j]= xv_pos[j] + r*cos_theta;
      yv_pos[j]= yv_pos[j] + r*sin_theta;
      xv_pos[i]= xv_pos[i] - r*cos_theta;
      yv_pos[i]= yv_pos[i] - r*sin_theta;
    }
     
     void boundary_rep()
      {
        for(int i=0;i<len;i++)
        {
       // float force1 = (width*width)/(xv_pos[i] * xv_pos[i]) - (width*width)/((width-xv_pos[i])*(width-xv_pos[i]));
        float force1 = (wid)/(xv_pos[i] - x) - (wid)/(( wid-xv_pos[i] +x));
        float r1 ;
        if(force1 > 0)
        {
          r1 = map(force1,0,wid,0,wid/8);
          r1=r1*r1;
          xv_pos[i] = xv_pos[i] + r1;
        }
       
        if(force1 < 0)
        {
          r1 = map(-force1,0,wid,0,wid/8);
          r1=r1*r1;
          xv_pos[i] = xv_pos[i] - r1;
        }
       // float force2 = (height*height)/(yv_pos[i] * yv_pos[i]) - (height*height)/((height-yv_pos[i])*(height-yv_pos[i]));
        float force2 = (hei)/(yv_pos[i] - y ) - (hei)/((hei-yv_pos[i] + y));
        float r2 ;
        
        if(force2 > 0)
        {
           r2 = map(force2,0,hei,0,hei/8);
           r2=r2*r2;
           yv_pos[i] = yv_pos[i] + r2;
        }
       
        if(force2 < 0)
        {
           r2 = map(-force2,0,hei,0,hei/8);
           r2=r2*r2;
           yv_pos[i] = yv_pos[i] - r2;
        }
        print("\n force1 [ "+i+"] = " + xv_pos[i] + "  force2 [ "+i+"] = " +yv_pos[i] );
        }
      }
}    
      
  
  
  
