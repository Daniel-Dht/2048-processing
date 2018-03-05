int countDown = 0;

void shiftDown() {

    for (int j=0; j<n; j++) {
       for(int h = n-2 ; h >= 0 ; h--) {
         int i = h ;
         if( grid[i][j] != 0) {
           while( i!=n-1 && grid[i+1][j] ==0  ) {
             countDown +=1 ;
             grid[i+1][j] = grid[i][j] ;
             grid[i][j] = 0;
             i ++ ;
           }
         }        
       }
    }   
}

void fusionDown() {

  for (int j=0; j<n; j++) {
    for(int h = n-2 ; h >= 0 ; h--) {

      int i = h;
      if(grid[i+1][j] == grid[i][j] && grid[i][j] !=0 ) {  // && grid[i][j] !=0 pour éviter de rentrer dans le if, bouger un 0 ne sert à rien et augmente le count
       countDown +=1 ;  // on compte le nombre de fusion
       grid[i+1][j]  = 2*grid[i][j];
       grid[i][j] = 0 ;
      } 
    }
  }
  
  shiftDown();
  if (countDown !=0) initRandomSpot(); // si 0 fusion, on ne fait pas appraraitre de spot
}