int countDown = 0;
boolean gameOverDown = true ;

void shiftDown(int[][] grid) {

    for (int j=0; j<n; j++) {
       for(int h = n-2 ; h >= 0 ; h--) {
         int i = h ;
         if( grid[i][j] != 0) {
           while( i!=n-1 && grid[i+1][j] ==0  ) {
             countDown +=1 ;
             gameOverDown = false ;
             
             grid[i+1][j] = grid[i][j] ;
             grid[i][j] = 0;
             i ++ ;
           }
         }        
       }
    }   
}

void fusionDown(int[][] grid, boolean testDeath) {
  shiftDown( grid);
  for (int j=0; j<n; j++) {
    for(int h = n-2 ; h >= 0 ; h--) {

      int i = h;
      if(grid[i+1][j] == grid[i][j] && grid[i][j] !=0 ) {  // && grid[i][j] !=0 pour éviter de rentrer dans le if, bouger un 0 ne sert à rien et augmente le count
       if(!testDeath) countDown +=1 ;  // on compte le nombre de fusion
       gameOverDown = false ;
       
       grid[i+1][j]  = 2*grid[i][j];
       grid[i][j] = 0 ;
      } 
    }
  }
  
  shiftDown(grid);
  if (countDown !=0 && !testDeath) initRandomSpot(grid); // si 0 fusion, on ne fait pas appraraitre de spot
}