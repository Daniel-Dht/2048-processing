int countUp = 0;

void shiftUp() {

    for (int j=0; j<n; j++) {
       for(int h = 1 ; h <= n-1 ; h++) {
         int i = h ;
         if( grid[i][j] != 0) {
           while( i!=0 && grid[i-1][j] ==0  ) {
             countUp +=1 ;
             grid[i-1][j] = grid[i][j] ;
             grid[i][j] = 0;
             i -- ;
           }
         }        
       }
    }   
}

void fusionUp() {

  for (int j=0; j<n; j++) {
    for(int h = 1 ; h <= n-1 ; h++) {

      int i = h;
      if(grid[i-1][j] == grid[i][j] && grid[i][j] !=0  ) {
       countUp +=1 ;  // on compte le nombre de fusion
       grid[i-1][j]  = 2*grid[i][j];
       grid[i][j] = 0 ;
      } 
    }
  }
  
  shiftUp();
  if (countUp !=0) initRandomSpot(); // si 0 fusion, on ne fait pas appraraitre de spot
}