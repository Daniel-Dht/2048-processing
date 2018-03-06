int countRight = 0;
boolean gameOverRight = true ;
void shiftRight(int[][] grid) {          // /supprime tous les 0 de la lignes et colle tout à droite

    for (int i=0; i<n; i++) {
       for(int h = n-2 ; h >= 0 ; h--) { // processus pour une ligne :
         int j = h ;
         if( grid[i][j] != 0) { // si on est sur un 0 ça ne sert à rien de le décaler vers les autres 0...
           while( j!=n-1 && grid[i][j+1] == 0  ) { // la condition j!=n-1 doit etre placée avant la suivante care dans ce cas la grid[i][j+1] n'est pas définie (grid[i][n])              
             countRight +=1 ; //print(countRight,"\n");
             gameOverRight = false ;
             
             grid[i][j+1] = grid[i][j] ;   // on fait avancer les blocs vers la droite
             grid[i][j] = 0;
             j ++ ;
             
           }
         }        
       }
    }   
}

void fusionRight(int[][] grid, boolean testDeath) {           // effectue un shift, fusionne les couples les plus à droite 2 par 2, et refait un shift. On rajoute un 2 ou un 4 si on a pas été bloqué, 
/// cad si fusion ou shift il y a eu
  shiftRight(grid) ;
   
  for (int i=0; i<n; i++) {
    for(int h = n-2 ; h >= 0 ; h--) {

      int j = h;
      if(grid[i][j+1] == grid[i][j] && grid[i][j] !=0 ) {   // tout simple
      
       if(!testDeath) countRight +=1 ;  // on compte le nombre de fusion
       else gameOverRight = false ;
       
       grid[i][j+1]  = 2*grid[i][j];
       grid[i][j] = 0 ;
      } 
    }
  }
  shiftRight(grid);
  
  if (countRight !=0 && !testDeath ) initRandomSpot(grid);   // si ni shift ni fusion , on ne fait pas appraraitre de spot
    
}