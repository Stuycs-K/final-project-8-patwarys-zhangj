TILE[][] board;
int ROWS;
int COLS;
int SQUARESIZE;
int Mode;

void setup(){
  size(600, 500);
  ROWS = 10;
  COLS = 10;
  SQUARESIZE = 10;
  makeBoard() ;
}

void draw(){
  background(0);
  display() ;
}

public void makeBoard(){
 if(Mode == 0){
   for(int i = 0; i<ROWS; i++){
    for(int j = 0; j<COLS; j++){
      board[i][j] = new TILE(false);
    }
   }
  }
}

public void display(){
  for(int i = 0 ; i < ROWS; i++){
    for(int j = 0 ; j < COLS; j++){
      board[i][j].display(i * SQUARESIZE, j * SQUARESIZE, SQUARESIZE) ;
    }
  }
}
