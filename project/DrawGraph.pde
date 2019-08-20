class DrawGraph
{ 
 float x_pos[];    // x position of division in ellipse
 float y_pos[];    // y position of division in ellipse
  //int matrix [][];  // matrix for storing cliques , it is a jagged array
 // float xv_pos[] = new float[V];   // position of x Vertex
 // float yv_pos[] = new float[V];   // position of y Vertex
  float a;              // ellipse width
  float b;              // ellipse height
  
  void assignPoints(int cliqueFound , float c_x,float c_y, float w, float h )
  { 
    a= w/2 -20;
    b= h/2-5;
    int theta = 0;
    int d_theta = 344 / cliqueFound ;
     x_pos = new float[cliqueFound];
     y_pos = new float[cliqueFound];
    for(int i = 0; i < cliqueFound ; i++ )
     {
      x_pos[i] = c_x + ( a ) * cos(PI*(theta)/180);
      y_pos[i] = c_y - ( b ) * sin(PI*(theta)/180);
      stroke(251);
      strokeWeight(10);
    //  point(x_pos[i],y_pos[i]);
      
      theta = theta + d_theta;
       print("x_pos[i] = " + x_pos[i]+"y_pos[i] = " + y_pos[i]);
      
     }
     strokeWeight(2);
  }
 
void drawCliques(int cliquesFound , String Cliques[])
  {  
    int matrix [][] = new int [cliquesFound][];
 
   // Copying cliues in matrix [][]
    for(int i = 0; i < cliquesFound ; i++)        
     { 
       int k = int(((Cliques[i].length())/3)+1);
       matrix [i] = new int [k];
       matrix [i] = int(split(Cliques[i],", "));
     }
    
   // Assigning position to all vertex of each cliques  
    for(int i = 0; i < cliquesFound ; i++)
    {
      int theta = 0;
      int d_theta = 359 / matrix[i].length ;
      
      for (int j = 0; j < matrix[i].length ; j++)
          {  print(" i = " + i + " j = " + j);
             print("x_pos[i] = " + x_pos[i]);
            xv_pos[matrix[i][j]] = x_pos[i]+r*cos(PI*(theta)/180);
            yv_pos[matrix[i][j]] = y_pos[i]-r*sin(PI*(theta)/180);
      
          strokeWeight(30);
          stroke(6,2,92);
          point(xv_pos[matrix[i][j]],yv_pos[matrix[i][j]]);
      
          theta = theta + d_theta;
      
          }
          strokeWeight(1);
       // Drawing edges between each vertex pair of each clique
       for (int m = 0; m < matrix[i].length ; m++)
            for (int n = 0; n < matrix[i].length ; n++)
             { stroke(4,2,87);
               if(m != n)
              {if(count1==0)
               edge_count = edge_count +1;
               line( xv_pos[matrix[i][m]] , yv_pos[matrix[i][m]],xv_pos[matrix[i][n]] , yv_pos[matrix[i][n]] ) ;
               sum_clique_edge = sum_clique_edge +  sqrt((xv_pos[matrix[i][m]] - xv_pos[matrix[i][n]])*(xv_pos[matrix[i][m]] - xv_pos[matrix[i][n]]) + (yv_pos[matrix[i][m]] - yv_pos[matrix[i][n]])*(yv_pos[matrix[i][m]] - yv_pos[matrix[i][n]]) );
            
               if(count1==1)
               var_clique_edge = var_clique_edge +  (sqrt((xv_pos[matrix[i][m]] - xv_pos[matrix[i][n]])*(xv_pos[matrix[i][m]] - xv_pos[matrix[i][n]]) + (yv_pos[matrix[i][m]] - yv_pos[matrix[i][n]])*(yv_pos[matrix[i][m]] - yv_pos[matrix[i][n]]) ) - mean) *(sqrt((xv_pos[matrix[i][m]] - xv_pos[matrix[i][n]])*(xv_pos[matrix[i][m]] - xv_pos[matrix[i][n]]) + (yv_pos[matrix[i][m]] - yv_pos[matrix[i][n]])*(yv_pos[matrix[i][m]] - yv_pos[matrix[i][n]]) ) - mean);

           }
             }
    }
      strokeWeight(2);
  }
     
 
   
   
   void remainingGraph(String rem_Graph[], String Non_clique[] , int v)  // v is remaining vertices
   {
     int matrix [][] = new int [V][V];
 
   // Copying remaining Graph in matrix [][]
    for(int i = 0; i < rem_Graph.length ; i++)        
     {
       matrix [i] = int(split(rem_Graph[i]," "));
     }
     
    // Positioning Non_ clique points 
     int Arr[] = new int[v];
     int theta = 0;
    int d_theta = 360 / v ;
     
     Arr = int(split(Non_clique[0],", "));
     
     for(int i = 0; i < v; i++)
       {
         xv_pos[Arr[i]] = width/2 + s * cos(PI *(90+theta)/180);
         yv_pos[Arr[i]] = height/2 - s * sin(PI *(90+theta)/180);
         strokeWeight(28);
         stroke(87,2,2);
         point(xv_pos[Arr[i]],yv_pos[Arr[i]]);      
         theta = theta + d_theta;
      
        }
    strokeWeight(1);
    // Drawing edges between each vertex pair of remaining Graph
       for (int m = 0; m < V ; m++)
            for (int n = 0; n < V ; n++)
            { stroke(89,25,3);
              if(matrix[m][n] != 0 )
              {
               if(count1==0)
               edge_count = edge_count +1;
              line( xv_pos[m],yv_pos[m],xv_pos[n],yv_pos[n] );
              sum_rem_edge = sum_rem_edge + sqrt((xv_pos[m]-xv_pos[n])*(xv_pos[m]-xv_pos[n]) + (yv_pos[m]-yv_pos[n])*(yv_pos[m]-yv_pos[n]));
              
              if(count1==1)
              var_rem_edge = sum_rem_edge + (sqrt((xv_pos[m]-xv_pos[n])*(xv_pos[m]-xv_pos[n]) + (yv_pos[m]-yv_pos[n])*(yv_pos[m]-yv_pos[n])) - mean) * (sqrt((xv_pos[m]-xv_pos[n])*(xv_pos[m]-xv_pos[n]) + (yv_pos[m]-yv_pos[n])*(yv_pos[m]-yv_pos[n])) - mean);
              }
            }
   }
  
            
}
