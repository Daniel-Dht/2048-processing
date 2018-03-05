
int n =4;
int[][] grid = new int[n][n];  

void setup(){ 
  size(400,400);
  background(220);
  for (int i=0; i<n; i++) {
    for (int j=0; j<n; j++) {
      grid[j][i] = 0;   
    }
  }  
  initValue();
  //for (int i=0; i<n; i++) {
  // // int i =1;
  //  grid[i][3] = 2 ;
  //  grid[i][0] = 2 ;
  //  grid[i][2] = 32 ;
  //  grid[i][1] = 32 ;
  //}
  displayGrid();
}


boolean go = true ;
  
  
void draw() {
  countRight = 0;
  countLeft = 0;
  countDown = 0;
  countUp = 0;
  
  displayGrid();
}


void keyPressed() {

  if(keyCode == RIGHT) {
    shiftRight();
    fusionRight();
  }
  if(keyCode == LEFT ) {
    shiftLeft();
    fusionLeft();
  }  
  
  if(keyCode == DOWN ) {
    shiftDown();
    fusionDown();
  }    
  if(keyCode == UP ) {
    shiftUp();
    fusionUp();
  }  

}


void initRandomSpot(){
  boolean go =true ;
  while(go) {
    int i = int(random(4));
    int j = int(random(4));
    if(grid[j][i] == 0 ) {
      grid[j][i] = fourOrTwo();
      go = false ;
    }
  }
}

void initValue(){
  initRandomSpot();
  initRandomSpot();
}

int fourOrTwo() {
  if(random(1)<0.7) return 2 ;
  return 4;
}

void displayGrid(){ // affiche un des éléments de la population
  for (int i=0; i<n; i++) {
    for (int j=0; j<n; j++) {
      
      float pas = width/n;
      fill(255);
      strokeWeight(8);
      stroke(#BBADA0);
      
      float colg = map(grid[j][i],0,256,0,255);
      float colb = map(grid[j][i],0,256,0,255);
      float colr = map(grid[j][i],0,256,255,0);
      
      if( grid[j][i] == 0  ) fill(#CDC1B4);
      if( 0< grid[j][i] && grid[j][i] <5) fill(#EEE4DA);
      if( 5< grid[j][i] && grid[j][i] <17) fill(#F59563);
      
      //if(grid[j][i] !=0) fill(colr,colg,colb);  
      rect( pas*i,pas*j,pas,pas,pas/8);
      
      String str ="";
      if(grid[j][i] !=0) str += grid[j][i];
      textSize(32);
      fill(0);
      text(str, pas*(i+0.43),pas*(j+0.6)); 
      
    }
  }  
}