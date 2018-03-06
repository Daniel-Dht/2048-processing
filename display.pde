void displayGrid(int[][] grid){ // affiche un des éléments de la population
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
    
    fill(255);  
    text(str, pas*(i+0.15),pas*(j+0.6));
  }
}