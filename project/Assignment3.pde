DrawGraph d = new DrawGraph();
static int V;
static float r;
static float s;
//static float x_pos[];    // x position of division in ellipse
//static float y_pos[];    // y position of division in ellipse
//static int matrix [][];  // matrix for storing cliques , it is a jagged array
static float xv_pos[];   // position of x Vertex
static float yv_pos[];   // position of y Vertex
int test =0;

// Variables for analytical calculations
static float sum=0;
static float variance=0;
static float sum_clique_edge=0;
static float sum_rem_edge=0;
static float var_clique_edge=0;
static float var_rem_edge=0;
static float var;
static float mean=0;
static int count1=0;
static int edge_count=0;

static float d_px= 120;
static int len;
static float x = 0;
static float y = 0;
static float wid = 1368;
static float hei = 768;
static int matrix[][];
static int rem_matrix[][];
static String Cliques[];
static String Non_Cliques[];
static String rem_Graph[];
static String str[];
static String tokens[];
//Force f= new Force();

void setup()
{
  size(1368,768);
  
}
 
void draw()
{ //frameRate(1);
  smooth();
  strokeWeight(2);
  r=139;
  s=110;
  background(254,254,253);
  //ellipseMode(CENTER);
  //ellipse(width/2,height/2,width-350,height-300);
  if(test ==0)
  {
   Cliques = loadStrings("list_cliques3.txt");
   Non_Cliques = loadStrings("list_Non_cliques3.txt");
   rem_Graph = loadStrings("rem_Graph3.txt");
   str = loadStrings("full_graph3.txt");
  
  V=len=str.length;
  print("V = "+V);
  print("Cliques ="+Cliques.length);
  xv_pos=new float[str.length];
  yv_pos=new float[str.length];
  matrix=new int[str.length][str.length];
  rem_matrix=new int[str.length][str.length];
  // To calculate the no of non clique vertex..
   tokens = Non_Cliques[0].split(",");
  test = test +1 ;
  }
  d.assignPoints(Cliques.length,width/2,height/2,width-400,height-300);
  d.drawCliques( Cliques.length, Cliques);
  d.remainingGraph(rem_Graph,Non_Cliques,tokens.length);
  
  if(count1==1)
  {var = (var_rem_edge + var_clique_edge)/ edge_count;
  print(" Variance is = "+var);
  }
  count1=1;
  sum = sum_rem_edge + sum_clique_edge ;
  mean = sum / edge_count;
 
   print(" Total "+sum);
   print(" Mean = "+mean);
   
   sum_clique_edge=0;
   
   sum_rem_edge=0;
   var_clique_edge=0;
   
   var_rem_edge=0;
  
  //print("Number of Non clique vertex: " + (tokens.length - 1));
  //print("total vertex "+ str.length);
  //print("Non cliques vertex "+int(((Non_Cliques[0].length())/3)+1));
  for(int i=0;i<str.length;i++)
       rem_matrix[i] = int(split(str[i]," "));
  
  
  //f.drawGraph(rem_matrix);
  
  
}
  
