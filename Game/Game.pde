TILE[][] board = new TILE[10][10];
int SQUARE_SIZE = 50;
int Mode;
int ROWS;
int COLS;
int MINES ;
int FLAGS ;

void setup(){
  size(500, 500);
  ROWS = 10;
  COLS = 10;
  MINES = 15 ;
  FLAGS = 0 ;
  board = new TILE[ROWS][COLS] ;
  makeBoard() ;
}

void draw(){
  display();
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
  }
  
  for(int i = 0; i < ROWS; i++){
    for(int j = 0; j < COLS; j++){
      if(i != 0){
        if(board[i-1][j].getBomb()){
          board[i][j].setNumBomb(board[i][j].getNumBomb() + 1) ;
        }
         if(j != 0){
          if(board[i-1][j-1].getBomb()){
            board[i][j].setNumBomb(board[i][j].getNumBomb() + 1) ;
          }
          }
          if(j != COLS - 1){
            if(board[i -1][j+1].getBomb()){
              board[i][j].setNumBomb(board[i][j].getNumBomb() + 1) ;
            }
          }
      
      }
      if(i != ROWS - 1){
        if(board[i+1][j].getBomb()){
          board[i][j].setNumBomb(board[i][j].getNumBomb() + 1) ;
        }
        if(j != 0){
          if(board[i+1][j-1].getBomb()){
            board[i][j].setNumBomb(board[i][j].getNumBomb() + 1) ;
          }
        }
        if(j != COLS - 1){
          if(board[i+1][j+1].getBomb()){
            board[i][j].setNumBomb(board[i][j].getNumBomb() + 1) ;
          }
        }
       }
      if(j != 0){
        if(board[i][j-1].getBomb()){
          board[i][j].setNumBomb(board[i][j].getNumBomb() + 1) ;
        }
      }
      if(j != COLS - 1){
        if(board[i][j+1].getBomb()){
          board[i][j].setNumBomb(board[i][j].getNumBomb() + 1) ;
        }
      }
    }
  }
  
  }
}

 public void display(){
   int SQUARESIZE = 50 ;
  for(int i = 0 ; i < ROWS; i++){
    for(int j = 0 ; j < COLS; j++){
      board[i][j].display(i * SQUARESIZE, (j * SQUARESIZE) + (height - width), SQUARESIZE) ;
    }
  }
} 
/*
void display() {
  int row = 0;
  int col = 0;
  for(int x = 0; x <= width - SQUARE_SIZE; x += SQUARE_SIZE) {
    for(int y = 0; y <= height - SQUARE_SIZE; y += SQUARE_SIZE) {
      if(board[row][col].getNumBomb() == 0){
        fill(144,238,144);
        stroke(0);
        square(x, y, 100);
      }
      if(board[row][col].getNumBomb() > 0){
        fill(0,255,0);
        stroke(0);
        square(x, y, 100);
      }
      if(board[row][col].getNumBomb() == -1){
        fill(255,0,0);
        stroke(0);
        square(x, y, 100);
      }
      row++;
    }
    row = 0;
    col++;
  }
} 
*/
void mouseClicked() {
  int col = mouseY/50;
  int row = mouseX/50;
    if(board[row][col].getBomb() == false){ 
      board[row][col].reveal();
    }
    else{
      board[row][col].setNumBomb(-1);
    }
}
