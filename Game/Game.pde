TILE[][] board = new TILE[10][10];
int SQUARE_SIZE = 50;
int Mode;
int ROWS;
int COLS;
int MINES;
int FLAGS = 0;
int click = 0;
int score = 0;
boolean lose = false;
boolean retry = false;
boolean win = false ;

void setup(){
  size(600, 600);
  ROWS = 12;
  COLS = 12;
  MINES = 25 ;
  board = new TILE[ROWS][COLS] ;
  makeBoard() ;
}

void draw(){
  
  display();
  if(lose == true){
    for(int x = 0; x <= width - SQUARE_SIZE; x += SQUARE_SIZE) {
    for(int y = 100; y <= height - SQUARE_SIZE; y += SQUARE_SIZE) {
        fill(255,0,0);
        stroke(0);
        square(x, y, 100);  
      
        fill(0);
        textSize(25) ;
        text("GAME   OVER", width-365, height-300) ;
        
        fill(144,238,144);
        stroke(0);
        square(width-350, height - 250, 50);
                
        fill(144,238,144);
        stroke(0);
        square(width-300, height - 250, 50);
        
        fill(144,238,144);
        stroke(0);
        square(width-250, height - 250, 50);
        
        fill(144,238,144);
        stroke(0);
        square(width-400, height - 250, 50);
        
        fill(0);
        textSize(25) ;
        text("TRY   AGAIN", width-340, height-215) ;
        
        fill(255);
        stroke(0);
        circle(width-370, height - 225, 25);
        
        fill(0);
        stroke(0);
        triangle(width-355,height-215,width-358,height-227,width-368,height-218);
        }
      }
  }
  
  /* for(int x = 0; x <= width - SQUARE_SIZE; x += SQUARE_SIZE) {
    for(int y = 100; y <= height - SQUARE_SIZE; y += SQUARE_SIZE) {
      if(board[x/50][y/50].getRevealed() == true && board[x/50][y/50].getFlagged() == true){
        board[x/50][y/50].setFlag(false);
        FLAGS++;
      }
    }
   } */
  
}

public void makeBoard(){
  int mines = MINES ;
  
 if(Mode == 0){
   /*
   for(int i = 0; i<10; i++){
    for(int j = 0; j<10; j++){
      board[i][j] = new TILE(false);
    }
   }
   */
   /*
   for(int i = 0; i<ROWS; i++){
    for(int j = 0; j<COLS; j++){
      if(random(100) < 25 && mines != 0){
        board[i][j] = new TILE(true) ;
        mines-- ;
        FLAGS++ ;
      }else{
        board[i][j] = new TILE(false);
      }  
  }
  }
  */
  while(mines > 0){
    for(int i = 0; i<ROWS; i++){
      for(int j = 0; j<COLS; j++){
        if(board[i][j] == null){
          if(random(100) < 25 && mines != 0){
            board[i][j] = new TILE(true) ;
            mines-- ;
            FLAGS++;
          }else{
            board[i][j] = new TILE(false);
          }
        }else{
          if(random(100) < 25 && mines != 0 && !board[i][j].getBomb()){
            board[i][j] = new TILE(true) ;
            mines-- ;
            FLAGS++ ;
          }
      }
    }
  }
  
  for(int i = 0; i < ROWS; i++){
    for(int j = 0; j < COLS; j++){
      board[i][j].setNumBomb(0) ;
      calculateAdjacentMines(i, j) ;
    }
  }
  
  }
}
}


void display(){
   /* int SQUARESIZE = 50 ;
  for(int i = 0 ; i < ROWS; i++){
    for(int j = 0 ; j < COLS; j++){
      board[i][j].display(i * SQUARESIZE, (j * SQUARESIZE) + (height - width), SQUARESIZE) ;
    }
  } */
  
  int row = 0;
  int col = 0;
      fill(34,139,34);
      stroke(0);
      rect(0.0,0.0,600.0,100.0);
      
        
      fill(0);
      textSize(25) ;
      text("Mode: Easy", 20, 60) ;
      
      fill(255,0,0);
      stroke(0);
      line(250,30,250,70);
      triangle(250, 30, 250, 50, 280, 40);
      
      fill(0);
      textSize(25) ;
      text(FLAGS+" ", 290, 60) ;
      
      fill(0);
      textSize(25) ;
      text("Score : " + score, 450, 60) ;
      
  for(int x = 0; x <= width - SQUARE_SIZE; x += SQUARE_SIZE) {
    for(int y = 100; y <= height - SQUARE_SIZE; y += SQUARE_SIZE) {
      
        fill(144,238,144);
        stroke(0);
        square(x, y, 100);
      /* if(board[row][col].getNumBomb() > 0){
        fill(0,255,0);
        stroke(0);
        square(x, y, 100);
      } 
      if(board[row][col].getNumBomb() == -1){
        fill(255,0,0);
        stroke(0);
        square(x, y, 100);
      } */
      row++;
    }
    row = 0;
    col++;
  }
  
   int SQUARESIZE = 50 ;
  for(int i = 0 ; i < ROWS; i++){
    for(int j = 0 ; j < COLS; j++){
      board[i][j].display(i * SQUARESIZE, (j * SQUARESIZE) + (100), SQUARESIZE) ;
    }
  }
}


void mouseClicked() {
  //firstClick not done
  if(mouseButton == RIGHT  && board[mouseX/50][mouseY/50].getFlagged() == false){
    
    if (click == 0){
     click++;
     if(mouseY < 250 && mouseX < width-100){
       reveal(mouseX/50,mouseY/50);
       reveal(mouseX/50,(mouseY+50)/50);
       reveal(mouseX/50,(mouseY+100)/50);
       reveal(mouseX/50,(mouseY+150)/50);
       reveal(mouseX/50,(mouseY+200)/50);
       reveal((mouseX+50)/50,(mouseY+50)/50);
       reveal((mouseX+50)/50,(mouseY+100)/50);
       reveal((mouseX+50)/50,(mouseY+150)/50);
       reveal((mouseX+50)/50,(mouseY+200)/50);
       reveal((mouseX+100)/50,(mouseY+100)/50);
       reveal((mouseX+100)/50,(mouseY+150)/50);
       reveal((mouseX+100)/50,(mouseY+250)/50);
       reveal((mouseX+100)/50,(mouseY+200)/50);
     }
     if(mouseY > 250 && mouseY <= 400 && mouseX < width-100){
       reveal(mouseX/50,mouseY/50);
       reveal(mouseX/50,(mouseY+50)/50);
       reveal(mouseX/50,(mouseY+100)/50);
       reveal(mouseX/50,(mouseY+150)/50);
       reveal(mouseX/50,(mouseY+200)/50);
       reveal((mouseX+50)/50,(mouseY+50)/50);
       reveal((mouseX+50)/50,(mouseY+100)/50);
       reveal((mouseX+50)/50,(mouseY+150)/50);
       reveal((mouseX+50)/50,(mouseY+200)/50);
       reveal((mouseX+100)/50,(mouseY+100)/50);
       reveal((mouseX+100)/50,(mouseY+150)/50);
       reveal((mouseX+100)/50,(mouseY+200)/50);
     } 
     if(mouseY >= 450 && mouseX > 100){
       reveal(mouseX/50,mouseY/50);
       reveal(mouseX/50,(mouseY-50)/50);
       reveal(mouseX/50,(mouseY-100)/50);
       reveal(mouseX/50,(mouseY-150)/50);
       reveal(mouseX/50,(mouseY-200)/50);
       reveal((mouseX-50)/50,(mouseY-50)/50);
       reveal((mouseX-50)/50,(mouseY-100)/50);
       reveal((mouseX-50)/50,(mouseY-150)/50);
       reveal((mouseX-50)/50,(mouseY-200)/50);
       reveal((mouseX-100)/50,(mouseY-100)/50);
       reveal((mouseX-100)/50,(mouseY-150)/50);
       reveal((mouseX-100)/50,(mouseY-250)/50);
       reveal((mouseX-100)/50,(mouseY-200)/50);
     } 
     if(mouseY > 400 && mouseY < 450 && mouseX < width - 100){
       reveal(mouseX/50,mouseY/50);
       reveal(mouseX/50,(mouseY-50)/50);
       reveal(mouseX/50,(mouseY-100)/50);
       reveal(mouseX/50,(mouseY-150)/50);
       reveal(mouseX/50,(mouseY-200)/50);
       reveal((mouseX-50)/50,(mouseY-50)/50);
       reveal((mouseX-50)/50,(mouseY-100)/50);
       reveal((mouseX-50)/50,(mouseY-150)/50);
       reveal((mouseX-50)/50,(mouseY-200)/50);
       reveal((mouseX-100)/50,(mouseY-100)/50);
       reveal((mouseX-100)/50,(mouseY-150)/50);
       reveal((mouseX-100)/50,(mouseY-250)/50);
       reveal((mouseX-100)/50,(mouseY-200)/50);
     } 
    } 
    
  /* if(click == 0){
    int row = mouseX/50;
    int col = mouseY/50;
    if(board[row][col].getBomb() == true){
      board[row][col].setNumBomb(1);
      for(int x = mouseX; x <= 400; x += SQUARE_SIZE) {
        for(int y = mouseY; y <= 250; y += SQUARE_SIZE) {
         reveal(x/50, y/50);    
        }
      }
      click++;
    }
    else{
      click++;
      for(int x = mouseX; x <= 400; x += SQUARE_SIZE) {
        for(int y = mouseY; y <= 250; y += SQUARE_SIZE) {
         reveal(x/50,y/50) ;  
        }
      }
    }
    click++;
  } */
  
  //else{
  int col = mouseX/50;
  int row = (mouseY - 100)/50;
  if(lose == false){
    if(board[col][row].getBomb() == false){ 
      reveal(col, row);
    }
    else{
      //board[col][row].reveal();
      lose = true;
    }
  }
  else{
   int x = mouseX;
   int y = mouseY;
   if(x > width - 400 && x < width - 200 && y > 350 && y < 400){
     retry = true; 
     lose = false;
     score = 0;
     //click = 0;
     //MINES = 25;
   }
  }
}

if(mouseButton == LEFT){
  if(board[mouseX/50][mouseY/50].getFlagged() == false && FLAGS > 0){
    if(mouseY > 100){
      color a = get(mouseX, mouseY);
      color b = color(0,255,0);
      color c = color(0,0,255);
      color d = color(0);
      color e = color(255);
      color f = color(144,238,144);
      if(a != b && a != c && a != d && a != e && a == f){
      board[mouseX/50][mouseY/50].setFlag(true);
      FLAGS--;
      }
    }
  }
  else if(board[mouseX/50][mouseY/50].getFlagged() == true){
    board[mouseX/50][mouseY/50].setFlag(false);
    FLAGS++;
  }
}

}

void calculateAdjacentMines(int x, int y){
        if(x != 0){
        if(board[x-1][y].getBomb()){
          board[x][y].setNumBomb(board[x][y].getNumBomb() + 1) ;
        }
         if(y != 0){
          if(board[x-1][y-1].getBomb()){
            board[x][y].setNumBomb(board[x][y].getNumBomb() + 1) ;
          }
          }
          if(y != COLS - 1){
            if(board[x -1][y+1].getBomb()){
              board[x][y].setNumBomb(board[x][y].getNumBomb() + 1) ;
            }
          }
      
      }
      if(x != ROWS - 1){
        if(board[x+1][y].getBomb()){
          board[x][y].setNumBomb(board[x][y].getNumBomb() + 1) ;
        }
        if(y != 0){
          if(board[x+1][y-1].getBomb()){
            board[x][y].setNumBomb(board[x][y].getNumBomb() + 1) ;
          }
        }
        if(y != COLS - 1){
          if(board[x+1][y+1].getBomb()){
            board[x][y].setNumBomb(board[x][y].getNumBomb() + 1) ;
          }
        }
       }
      if(y != 0){
        if(board[x][y-1].getBomb()){
          board[x][y].setNumBomb(board[x][y].getNumBomb() + 1) ;
        }
      }
      if(y != COLS - 1){
        if(board[x][y+1].getBomb()){
          board[x][y].setNumBomb(board[x][y].getNumBomb() + 1) ;
        }
      }
}

void reveal(int x, int y){
  board[x][y].reveals();
  score++ ;
  if(board[x][y].getNumBomb() == 0){
          if(x != 0 && !board[x-1][y].getRevealed()){
          reveal(x-1, y) ;
          //board[x-1][y].setRevealed(true);
          }
      if(x != ROWS - 1 && !board[x+1][y].getRevealed()){
          reveal(x + 1, y) ;
          //board[x+1][y].setRevealed(true);
       }
      if(y != 0 && !board[x][y-1].getRevealed()){
          reveal(x, y - 1);
          //board[x][y-1].setRevealed(true);
      }
      if(y != COLS - 1 && !board[x][y+1].getRevealed()){
          reveal(x, y + 1) ;
          //board[x][y+1].setRevealed(true);                    
      }
  } 
  //board[x][y].setFlag(false);
}

/* void reset(){
   if(retry == true){
     for(int x = 0; x <= width - SQUARE_SIZE; x += SQUARE_SIZE) {
       for(int y = 100; y <= height - SQUARE_SIZE; y += SQUARE_SIZE) {
        fill(144,238,144);
        stroke(0);
        square(x, y, 100);
      }
    }
    
   int SQUARESIZE = 50 ;
     for(int i = 0 ; i < ROWS; i++){
      for(int j = 0 ; j < COLS; j++){
        board[i][j].display(i * SQUARESIZE, (j * SQUARESIZE) + (100), SQUARESIZE) ;
    }
  }
    
    for(int x = 0; x <= width - SQUARE_SIZE; x += SQUARE_SIZE) {
      for(int y = 100; y <= height - SQUARE_SIZE; y += SQUARE_SIZE) {
        board[x/50][y/50].setRevealed(false);
      }
    }
    //makeBoard
    int mines = MINES ;
  
 if(Mode == 0){
  while(mines > 0){
    for(int i = 0; i<ROWS; i++){
      for(int j = 0; j<COLS; j++){
        if(board[i][j] == null){
          if(random(100) < 25 && mines != 0){
            board[i][j] = new TILE(true) ;
            mines-- ;
            FLAGS++;
          }else{
            board[i][j] = new TILE(false);
          }
        }else{
          if(random(100) < 25 && mines != 0 && !board[i][j].getBomb()){
            board[i][j] = new TILE(true) ;
            mines-- ;
            FLAGS++ ;
          }
        }
      }
     }  
    }
   }
  } 
} */

void keyPressed(){
  if(key == 'w' || key == 'W'){
    lose = false ;
    win = false ;
    score = 0 ;
    for(int i = 0; i < board.length; i++){
      for(int j = 0; j < board[i].length; j++){
        board[i][j] = new TILE(false) ;
      }
    }
    board[0][0] = new TILE(true) ;
    board[1][1] = new TILE(true) ;
  }
  if(key == 'p' || key == 'P'){
    for(int i = 0; i < board.length; i++){
      for(int j = 0; j < board[i].length; j++){
        if(board[i][j].getBomb()){
          fill(255, 0, 0) ;
          ellipseMode(CORNER) ;
          circle(i * width/ROWS , (j * width/ROWS) + 100, width/ROWS) ;
        }
      }
    }
  }
  if(key == 'r' || key == 'R'){
    for(int i = 0; i < board.length; i++){
      for(int j = 0; j < board[i].length; j++){
        if(board[i][j].getRevealed()){
          fill(0, 0, 255) ;
          ellipseMode(CORNER) ;
          circle(i * width/ROWS , (j * width/ROWS) + 100, width/ROWS) ;
        }
      }
    }
  }
}
