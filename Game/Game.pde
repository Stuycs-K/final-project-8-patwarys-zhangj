int[][] board;
int ROWS;
int COLS;
int SQUARESIZE;
int Mode;

void setup(){
  size(600, 500);
  ROWS = 10;
  COLS = 10;
  SQUARESIZE = 10;
}

void draw(){
  background(0);
}

public void makeBoard(){
 if(Mode == 0){
   for(int i = 0; i<11; i++){
    for(int j = 0; j<11; j++){
      board[i][j] = 0;
    }
   }
  }
}
