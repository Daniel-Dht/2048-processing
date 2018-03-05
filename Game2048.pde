
int n =4;
int[][] grid = new int[n][n];  
PFont Font1;
void setup(){ 
  size(400,400);
  background(220);
  Font1 = createFont("Arial Bold", 18);
  for (int i=0; i<n; i++) {
    for (int j=0; j<n; j++) {
      grid[j][i] = 0;   
    }
  }  
  initValue();
  
    //grid[1][3] = 256 ;
    //grid[2][0] = 512 ;
    //grid[3][2] = 1024 ;
    //grid[3][1] = 2048 ;

  displayGrid();
}


boolean go = true ;
  
  
void draw() {
  countRight = 0;
  countLeft = 0;
  countDown = 0;
  countUp = 0;
  

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
  displayGrid();

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
      
      strokeWeight(8);
      stroke(#BBADA0);
     
      String str ="";
      if(grid[j][i] !=0) str += grid[j][i];
      textFont(Font1);
      fillSpot(i,j,str);
    }
  }  
}

void fillSpot(int i, int j, String str) {
  float pas = width/n;
  textSize(32);
  if( grid[j][i] == 0  ){
    fill(#CDC1B4);
    rect( pas*i,pas*j,pas,pas,pas/8);
    fill(0);
    strokeWeight(12);
    text(str, pas*(i+0.43),pas*(j+0.6));
  }
  if( grid[j][i] == 2  ){
    fill(#EEE4DA);
    rect( pas*i,pas*j,pas,pas,pas/8);
    fill(#776E65);
    text(str, pas*(i+0.43),pas*(j+0.6));
  }
  if( grid[j][i] == 4  ){
    fill(#EDE0C8);
    rect( pas*i,pas*j,pas,pas,pas/8);
    fill(#776E65);
    text(str, pas*(i+0.43),pas*(j+0.6));
  }
  if( grid[j][i] == 8  ){
    fill(#F2B179);
    rect( pas*i,pas*j,pas,pas,pas/8);
    fill(255);
    text(str, pas*(i+0.43),pas*(j+0.6));
  }
  if( grid[j][i] == 16  ){
    fill(#F59563);
    rect( pas*i,pas*j,pas,pas,pas/8);
    fill(255);
    text(str, pas*(i+0.33),pas*(j+0.6));
  }
  if( grid[j][i] == 32 ){
    fill(#F67C5F);
    rect( pas*i,pas*j,pas,pas,pas/8);
    fill(255);
    text(str, pas*(i+0.33),pas*(j+0.6));
  }
  if( grid[j][i] == 64 ){
    fill(#F65E3B);
    rect( pas*i,pas*j,pas,pas,pas/8);
    fill(255);
    text(str, pas*(i+0.33),pas*(j+0.6));
  }
  if( grid[j][i] == 128  ){
    fill(#EDCF72);
    rect( pas*i,pas*j,pas,pas,pas/8);
    fill(255);
    text(str, pas*(i+0.27),pas*(j+0.6));
  }
  if( grid[j][i] == 256  ){
    fill(#EDCC61);
    rect( pas*i,pas*j,pas,pas,pas/8);
    fill(255);
    text(str, pas*(i+0.27),pas*(j+0.6));
  }
  if( grid[j][i] == 512  ){
    fill(#EDC850);
    rect( pas*i,pas*j,pas,pas,pas/8);
    fill(255);
    text(str, pas*(i+0.27),pas*(j+0.6));
  }
  if( grid[j][i] == 1024  ){
    fill(#EDC53F);
    rect( pas*i,pas*j,pas,pas,pas/8);
    fill(255);
    text(str, pas*(i+0.15),pas*(j+0.6));
  }
  if( grid[j][i] >= 2048  ){
    fill(#ECC954,150);
    rect( pas*i,pas*j,pas,pas,pas/8);
    
    noStroke();
    fill(#EDC22E);
    rect( pas*i+10,pas*j+10,pas-18,pas-18);
    
    fill(255);  
    text(str, pas*(i+0.15),pas*(j+0.6));
  }
  
  
  
}