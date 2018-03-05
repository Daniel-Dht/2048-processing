int countRight = 0;

void shiftRight() {

    for (int i=0; i<n; i++) {
       for(int h = n-2 ; h >= 0 ; h--) {
         int j = h ;
         if( grid[i][j] != 0) {
           while( j!=n-1 && grid[i][j+1] ==0  ) {
             countRight +=1 ; print(countRight,"\n");
             grid[i][j+1] = grid[i][j] ;
             grid[i][j] = 0;
             j ++ ;
           }
         }        
       }
    }   
}

void fusionRight() {

  for (int i=0; i<n; i++) {
    for(int h = n-2 ; h >= 0 ; h--) {

      int j = h;
      if(grid[i][j+1] == grid[i][j] && grid[i][j] !=0 ) {
       countRight +=1 ;  // on compte le nombre de fusion
       grid[i][j+1]  = 2*grid[i][j];
       grid[i][j] = 0 ;
      } 
    }
  }
  
  shiftRight();
  if (countRight !=0) initRandomSpot(); // si 0 fusion, on ne fait pas appraraitre de spot
}