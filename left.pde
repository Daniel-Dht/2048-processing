int countLeft = 0;
boolean gameOverLeft = true ;

void shiftLeft(int[][] grid) {

    for (int i=0; i<n; i++) {
       for(int h = 1 ; h <= n-1 ; h++) {
         int j = h ;
         if( grid[i][j] != 0) {
           while( j!=0 && grid[i][j-1] ==0  ) {
             countLeft +=1 ;  // on compte le nombre de fusion
             gameOverLeft = false ;
             
             grid[i][j-1] = grid[i][j] ;
             grid[i][j] = 0;
             j -- ;
           }
         }        
       }
    }   
}

void fusionLeft(int[][] grid, boolean testDeath) {
  shiftLeft(grid);
  for (int i=0; i<n; i++) {
    for(int h = 1 ; h <= n-1 ; h++) {

      int j = h;
      if(grid[i][j-1] == grid[i][j] && grid[i][j] !=0  ) {
       if(!testDeath) countLeft +=1 ;  // on compte le nombre de fusion
       gameOverLeft = false ;
       
       grid[i][j-1]  = 2*grid[i][j];
       grid[i][j] = 0 ;
      } 
    }
  }
  
  shiftLeft(grid);
  if (countLeft !=0 && !testDeath ) initRandomSpot(grid); // si 0 fusion, on ne fait pas appraraitre de spot
}