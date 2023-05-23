TILE[][] board;
int ROWS;
int COLS;
int MINES ;
int SQUARESIZE;
int Mode;

void setup(){
  size(500, 600);
  ROWS = 10;
  COLS = 10;
  SQUARESIZE = (width / COLS) - 1 ;
  MINES = 15 ;
  board = new TILE[ROWS][COLS] ;
  makeBoard() ;
}

void draw(){
  background(0);
  display() ;
}

public void makeBoard(){
  int mines = MINES ;
 if(Mode == 0){
   for(int i = 0; i<ROWS; i++){
    for(int j = 0; j<COLS; j++){
      if(random(100) < 25 && mines != 0){
        board[i][j] = new TILE(true) ;
        mines-- ;
      }else{
        board[i][j] = new TILE(false);
      }  
  }
  }
  }
}

public void display(){
  for(int i = 0 ; i < ROWS; i++){
    for(int j = 0 ; j < COLS; j++){
      board[i][j].display(i * SQUARESIZE, (j * SQUARESIZE) + (height - width), SQUARESIZE) ;
    }
  }
}
