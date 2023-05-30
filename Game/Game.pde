TILE[][] board = new TILE[10][10];
int SQUARE_SIZE = 50;
int Mode;
int ROWS;
int COLS;
int MINES;
int FLAGS;
int click = 0;
int score = 0;
int time = 0 ;
boolean lose = false;
boolean win = false ;


void setup(){
  size(600, 600);
  ROWS = 12;
  COLS = 10;
  MINES = 25 ;
  FLAGS = 0;
  board = new TILE[ROWS][COLS] ;
  makeBoard() ;
}

void draw(){
  display();
  fill(0) ;
  textSize(25) ;
  text("Time: " + time, 450, 25) ;
  frameRate(20) ;
  if(frameCount%20 == 0 && !lose){
    time++ ;
  }  
  if(lose == true){
    for(int x = 0; x <= width - SQUARE_SIZE; x += SQUARE_SIZE) {
    for(int y = 100; y <= height - SQUARE_SIZE; y += SQUARE_SIZE) {
      fill(255,0,0);
        stroke(0);
        square(x, y, 100);
        
        fill(0,0,255);
        textSize(25) ;
        text("GAME   OVER", width-350, height-250) ;
        }
      }
  }else if(win == true){
    for(int x = 0; x <= width - SQUARE_SIZE; x += SQUARE_SIZE) {
    for(int y = 100; y <= height - SQUARE_SIZE; y += SQUARE_SIZE) {
      fill(0,255,0);
        stroke(0);
        square(x, y, 100);
        
        fill(0,255,255);
        textSize(25) ;
        text("MINES  CLEARED", width-350, height-250) ;
        }
      }
  }
  
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
      text("15", 290, 60) ;
      
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
    }
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
  
  if(click == 0){
    int row = mouseX/50;
    int col = mouseY/50;
    if(board[row][col].getBomb() == true){
      board[row][col].setNumBomb(1);
      for(int x = mouseX; x <= 350; x += SQUARE_SIZE) {
        for(int y = mouseY; y <= 250; y += SQUARE_SIZE) {
         reveal(x/50, y/50) ; 
         if(checkFinished()){
          win = true ;
        }
        }
      }
      click++;
    }
    else{
      click++;
      for(int x = mouseX; x <= 350; x += SQUARE_SIZE) {
        for(int y = mouseY; y <= 250; y += SQUARE_SIZE) {
         reveal(x/50,y/50) ;  
         if(checkFinished()){
          win = true ;
        }
        }
      }
    }
    click++;
  } 
  
  //else{
  int col = mouseX/50;
  int row = (mouseY - 100)/50;
  if(lose == false){
    if(board[col][row].getBomb() == false){ 
      reveal(col, row) ;
      if(checkFinished()){
        win = true ;
      }
    }
    else{
      //board[col][row].reveal();
      lose = true;
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
  board[x][y].reveals() ;
  score++ ;
  if(board[x][y].getNumBomb() == 0){
          if(x != 0 && !board[x-1][y].getRevealed()){
          reveal(x-1, y) ;
          }
      if(x != ROWS - 1 && !board[x+1][y].getRevealed()){
          reveal(x + 1, y) ;
       }
      if(y != 0 && !board[x][y-1].getRevealed()){
          reveal(x, y - 1);

      }
      if(y != COLS - 1 && !board[x][y+1].getRevealed()){
          reveal(x, y + 1) ;
      }
  }
}

boolean checkFinished(){
  for(int i = 0; i < board.length ; i++){
    for(int j = 0; j < board[i].length; j++){
      if(!board[i][j].getBomb() && !board[i][j].getRevealed()){
        return false ;
      }
    }
  }
  return true ;
}
