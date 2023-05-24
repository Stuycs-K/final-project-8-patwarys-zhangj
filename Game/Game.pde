TILE[][] board = new TILE[10][10];
int SQUARE_SIZE = 50;
int Mode;

void setup(){
  size(500, 500);
  makeBoard();
}

void draw(){
  grid();
}

public void makeBoard(){
 if(Mode == 0){
   for(int i = 0; i<10; i++){
    for(int j = 0; j<10; j++){
      board[i][j] = new TILE(false);
    }
   }
  }
}

/* public void display(){
  for(int i = 0 ; i < ROWS; i++){
    for(int j = 0 ; j < COLS; j++){
      board[i][j].display(i * SQUARESIZE, (j * SQUARESIZE) + (height - width), SQUARESIZE) ;
    }
  }
} */

void grid() {
  int row = 0;
  int col = 0;
  for(int x = 0; x <= width - SQUARE_SIZE; x += SQUARE_SIZE) {
    for(int y = 0; y <= height - SQUARE_SIZE; y += SQUARE_SIZE) {
      if(board[row][col].getNumBomb() == 0){
        fill(144,238,144);
        stroke(0);
        square(x, y, 100);
      }
      if(board[row][col].getNumBomb() == 1){
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

void mouseClicked() {
  int col = mouseX/50;
  int row = mouseY/50;
    if(board[row][col].getNumBomb() == 0){
      board[row][col].setNumBomb(1);
    }
    else{
      board[row][col].setNumBomb(-1);
    }
}
