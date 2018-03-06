
int n =4;

int[][] grid = new int[n][n];  
int[][] gridCopie = new int[n][n];
boolean gameOver = false;

PFont Font1;


void setup(){ 
  size(400,400);
  background(220);
  Font1 = createFont("Arial Bold", 18);
  
  initValue();
  
    //grid[1][3] = 256 ;
    //grid[2][0] = 512 ;
    //grid[3][2] = 1024 ;
    //grid[3][1] = 2048 ;

  displayGrid(grid);
}


void draw() {
  //gameOver =true;
  if(gameOver) {
    background(#BBADA0);
    
    fill(#F65E3B);
    rect( 30,70,width-60,100,20);
    fill(255);
    textSize(50);
    text("Game Over", 70,135);
    
    fill(#EDC53F);
    if(200< mouseY && mouseY <300 && 60 <mouseX && mouseX < width-120 ){
      fill(#EDC53F,200);

    }
    rect( 60,200,width-120,100,20);
    fill(255);
    textSize(20);
    text("Tap ENTER to replay", 116,265);      

    if(keyCode == ENTER) {
      gameOver = false;
      initValue();    
    }
   
  }
}


void keyPressed() {
  setCountToZero();
  if(keyCode == RIGHT) {
    fusionRight(grid, false);
    deathManager();
  }
  if(keyCode == LEFT ) {
    fusionLeft(grid, false);
    deathManager();
  }  
  
  if(keyCode == DOWN ) {
    fusionDown(grid, false);
    deathManager();
  }    
  if(keyCode == UP ) {
    fusionUp(grid, false);
    deathManager();
  } 
  displayGrid(grid);
  score();
}

void initRandomSpot(int[][] grid){
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
  for (int i=0; i<n; i++) {
    for (int j=0; j<n; j++) {
      grid[j][i] = 0;  
      gridCopie[j][i] = 0;  
    }
  }
  initRandomSpot(grid);
  initRandomSpot(grid);
}

int fourOrTwo() {
  if(random(1)<0.7) return 2 ;
  return 4;
}


void copyGrid() {
  for (int i=0; i<n; i++) {
    for (int j=0; j<n; j++) { 
      gridCopie[i][j] = grid[i][j];  
    }
  }     
}

void setCountToZero(){
  countRight = 0;
  countLeft = 0;
  countDown = 0;
  countUp = 0; 
}

Boolean gameOver() { // coup dans le vide dans les 4 directions pour voir si on est bloqué
  fusionRight(gridCopie, true);
  fusionLeft(gridCopie, true);
  fusionUp(gridCopie, true);
  fusionDown(gridCopie, true);
  if(gameOverDown && gameOverLeft && gameOverRight && gameOverUp) return true;
  return false ;
}

void deathManager() {
  gameOverDown = true ;
  gameOverLeft = true ;
  gameOverUp = true ;
  gameOverRight = true ;
  copyGrid();
  if(gameOver()) gameOver = true; 
}

void score()  {
  int score = 0;
  int scoreCopie = 0;
  
  for (int i=0; i<n; i++) {
    for (int j=0; j<n; j++) { 
      scoreCopie += gridCopie[j][i] ;
      score += grid[j][i];  
    }
  }    
  print("score : ",score,"  score de la copie :", scoreCopie,"\n");
}