int countUp = 0;
boolean gameOverUp = true ;
void shiftUp(int[][] grid) {

    for (int j=0; j<n; j++) {
       for(int h = 1 ; h <= n-1 ; h++) {
         int i = h ;
         if( grid[i][j] != 0) {
           while( i!=0 && grid[i-1][j] ==0  ) {
             countUp +=1 ;
             gameOverUp = false ;
             
             grid[i-1][j] = grid[i][j] ;
             grid[i][j] = 0;
             i -- ;
           }
         }        
       }
    }   
}

void fusionUp(int[][] grid, boolean testDeath) {
  shiftUp(grid);
  for (int j=0; j<n; j++) {
    for(int h = 1 ; h <= n-1 ; h++) {

      int i = h;
      if(grid[i-1][j] == grid[i][j] && grid[i][j] !=0  ) {
       if(!testDeath) countUp +=1 ;  // on compte le nombre de fusion
       gameOverUp = false ;
       
       grid[i-1][j]  = 2*grid[i][j];
       grid[i][j] = 0 ;
      } 
    }
  }
  
  shiftUp(grid);
  if (countUp !=0 && !testDeath) initRandomSpot(grid); // si 0 fusion, on ne fait pas appraraitre de spot
}