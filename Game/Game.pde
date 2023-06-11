TILE[][] board;;
int SQUARE_SIZE = 50;
int Mode;
int ROWS;
int COLS;
int MINES;
int FLAGS = 0;
int click = 0;
int score = 0;
int time = 0 ;
boolean lose = false;
boolean retry = false;
boolean win = false ;
int Level = 1;
float sec = 0;
boolean choose = false;
int lvl = 0;
String m = "Mode";
float t = 0;

void setup(){
  size(600, 600);
  
  if(Level == 2){
    SQUARE_SIZE = 50;
    ROWS = 12;
    COLS = 10;
    MINES = 25 ;
    board = new TILE[ROWS][COLS] ;
    makeBoard() ;
  } 
  
   if(Level == 1){
    SQUARE_SIZE = 100;
    ROWS = 6;
    COLS = 5;
    MINES = 5;
    board = new TILE[ROWS][COLS] ;
    makeBoard() ;
  } 
  
  if(Level == 3){
    SQUARE_SIZE = 25;
    ROWS = 24;
    COLS = 20;
    MINES = 99;
    board = new TILE[ROWS][COLS] ;
    makeBoard() ;
  }
  
}

void draw(){
 
   if(Level == 2 && choose == true){
     SQUARE_SIZE = 50;
    ROWS = 12;
    COLS = 10;
    MINES = 25 ;
    board = new TILE[ROWS][COLS] ;
    makeBoard() ;
  }
  
   if(Level == 1 && choose == true){
    SQUARE_SIZE = 100;
    ROWS = 6;
    COLS = 5;
    MINES = 5;
    board = new TILE[ROWS][COLS] ;
    makeBoard() ;
  } 
  
  if(Level == 3 && choose == true){
    SQUARE_SIZE = 25;
    ROWS = 24;
    COLS = 20;
    MINES = 99;
    board = new TILE[ROWS][COLS] ;
    makeBoard() ;
  }
  
  display();
  fill(0) ;
  textSize(25) ;
  text(time, 380, 60) ;
  frameRate(20) ;
  if(frameCount%20 == 0 && !lose && !win){
    time++ ;
  }  
  if(lose == true){
    for(int x = 0; x <= width - SQUARE_SIZE; x += SQUARE_SIZE) {
    for(int y = 100; y <= height - SQUARE_SIZE; y += SQUARE_SIZE) {
        fill(255,0,0);
        stroke(0);
        square(x, y, 100);  
      
        fill(0);
        textSize(25) ;
        text("GAME   OVER", width-365, height-270) ;
        
        fill(144,238,144);
        stroke(0);
        rect(width-390, height - 260, 180, 50);
        
        fill(0);
        textSize(25) ;
        text("TRY   AGAIN", width-340, height-225) ;
        
        ellipseMode(CORNER) ;
        fill(255);
        stroke(0);
        circle(width-383, height - 245, 25);
        
        fill(0);
        stroke(0);
        triangle(width-355,height-225,width-358,height-237,width-368,height-228);
        
        fill(144,238,144);
        stroke(0);
        rect(width-390, height - 205, 180, 50);
        
        fill(0);
        textSize(25) ;
        text("NEW   GAME", width-340, height-170) ;
        
        ellipseMode(CORNER) ;
        fill(255);
        stroke(0);
        circle(width-383, height - 190, 25);
        
        fill(0);
        stroke(0);
        triangle(width-355,height-170,width-358,height-182,width-368,height-173);
        }
      }
  }else if(win == true){
    for(int x = 0; x <= width - SQUARE_SIZE; x += SQUARE_SIZE) {
    for(int y = 100; y <= height - SQUARE_SIZE; y += SQUARE_SIZE) {
      fill(100,255,0);
        stroke(0);
        square(x, y, 100);
        
        fill(0);
        textSize(25) ;
        text("MINES  CLEARED", width/3 + 15, height-270) ;
        }
      }
      fill(144,238,144);
      stroke(0);
      rect(width-390, height - 260, 180, 50);
        
      fill(0);
      textSize(25) ;
      text("PLAY   AGAIN", width-350, height-225) ;
        
      ellipseMode(CORNER) ;
      fill(255);
      stroke(0);
      circle(width-383, height - 245, 25);
        
        fill(0);
        stroke(0);
        triangle(width-355,height-225,width-358,height-237,width-368,height-228);
  }else{ 
     sec = map(time, 0, 60, 0, 6.28) - 1.57;
  }

  
   ellipseMode(CENTER);
   stroke(0);
   fill(255);
   ellipse(width/2+45, height/2 - 250, 40, 40);
  
   stroke(0);
   line(width/2+45, height/2 - 250, width/2+45 + cos(sec) * 20 * .95, height/2 - 250 + sin(sec) * 20 * .95);
   
   line(width/2+45-19, height/2 - 250, width/2+45- 10, height/2-250);
   line(width/2+45+10, height/2 - 250, width/2+45+19, height/2-250);
   line(width/2+45, height/2 - 240, width/2+45, height/2-230);
   line(width/2+45, height/2 - 270, width/2+45, height/2-260);
   
   if(choose == true){
     fill(255);
     textSize(25) ;
     text("Mode", 25, 28) ;
     
    fill(0);
    triangle(90, 18, 100, 18, 95, 24);
     
     fill(255);
     rect(20,31,90,20);
     fill(0);
     textSize(20) ;
     text("Easy", 45, 46) ;
     
     fill(255);
     rect(20,51,90,20);
     fill(0);
     textSize(20) ;
     text("Medium", 32, 66) ;
     
     fill(255);
     rect(20,71,90,20);
     fill(0);
     textSize(20) ;
     text("Hard", 45, 86) ;
   }
  
}

public void makeBoard(){
  int mines = MINES ;
  FLAGS = 0 ;
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
      fill(34,139,34);
      stroke(0);
      rect(0.0,0.0,600.0,100.0);
      
      fill(255);
      rect(20,35,90,30);  
        
      fill(0);
      textSize(25) ;
      if(m.compareTo("Medium") == 0){
        textSize(20) ;
      }
      text(m, 20, 60) ;
      
      fill(0);
      triangle(87, 48, 97, 48, 92, 53);
      
      fill(255,0,0);
      stroke(0);
      line(210,30,210,70);
      triangle(210, 30, 210, 50, 235, 40);
      
      fill(0);
      textSize(25) ;
      text(FLAGS+" ", 240, 60) ;
      
      fill(0);
      textSize(25) ;
      text("Score : " + score, 450, 60) ;
      
      if(Level == 1 || Level == 2 || Level == 3){
      
  for(int x = 0; x <= width - SQUARE_SIZE; x += SQUARE_SIZE) {
    for(int y = 100; y <= height - SQUARE_SIZE; y += SQUARE_SIZE) {
      
        fill(144,238,144);
        stroke(0);
        square(x, y, 100);
    }
  }
 }
  
   int SQUARESIZE = width/ROWS ;
  for(int i = 0 ; i < ROWS; i++){
    for(int j = 0 ; j < COLS; j++){
      board[i][j].display(i * SQUARESIZE, (j * SQUARESIZE) + (100), SQUARESIZE) ;
    }
  }
}


void mouseClicked() {

 if(mouseX > 20 && mouseX < 100 && mouseY > 40 && mouseY < 60 && mouseButton == LEFT && choose == false && lose == false && win == false){
  choose = true;
  t = time + 0.1;
}

  if(mouseX > 20 && mouseX < 110 && mouseY > 31 && mouseY < 51  && choose == true && mouseButton == LEFT && time >= t){
    Level = 1;
    m = "Easy";
    SQUARE_SIZE = 100;
    ROWS = 6;
    COLS = 5;
    MINES = 5;
    board = new TILE[ROWS][COLS] ;
    makeBoard() ;
    score = 0;
    time = 0;
    click = 0;
    choose = false;
  }
  
  if(mouseX > 20 && mouseX < 110 && mouseY > 51 && mouseY < 71  && choose == true && mouseButton == LEFT && time >= t){
    Level = 2;
    m = "Medium";
    SQUARE_SIZE = 50;
    ROWS = 12;
    COLS = 10;
    MINES = 25 ;
    board = new TILE[ROWS][COLS] ;
    makeBoard() ;
    score = 0;
    time = 0;
    click = 0;
    choose = false;
  }
  
  if(mouseX > 20 && mouseX < 110 && mouseY > 71 && mouseY < 91  && choose == true && mouseButton == LEFT){
    Level = 3;
    m = "Hard";
    SQUARE_SIZE = 25;
    ROWS = 24;
    COLS = 20;
    MINES = 99;
    board = new TILE[ROWS][COLS] ;
    makeBoard() ;
    score = 0;
    time = 0;
    click = 0;
    choose = false;
  } 
  
  if(mouseX > width-400 && mouseY > height - 250 && mouseX <= width - 200 && mouseY <= height - 200 && win){
    score = 0;
    click = 0 ;
    time = 0 ;
    win = false ;
    board = new TILE[ROWS][COLS] ;
    makeBoard() ;
  }
  else if(Level == 2){
  if(mouseY > 100 && mouseButton == RIGHT  && board[mouseX/50][mouseY/50 - 2].getFlagged() == false){
      
    if (click == 0){
      
     if(board[mouseX/50][mouseY/50 - 2].getBomb() == true){
        board[mouseX/50][mouseY/50 - 2].setBomb(false);
        FLAGS--;
      }
      
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
       reveal(mouseX/50,mouseY/50 - 2);
       reveal(mouseX/50,(mouseY+50)/50 - 2);
       reveal(mouseX/50,(mouseY+100)/50 - 2);
       reveal(mouseX/50,(mouseY+150)/50 - 2);
       reveal(mouseX/50,(mouseY+200)/50 - 2);
       reveal((mouseX+50)/50,(mouseY+50)/50 - 2);
       reveal((mouseX+50)/50,(mouseY+100)/50 - 2);
       reveal((mouseX+50)/50,(mouseY+150)/50 - 2);
       reveal((mouseX+50)/50,(mouseY+200)/50 - 2);
       reveal((mouseX+100)/50,(mouseY+100)/50 - 2);
       reveal((mouseX+100)/50,(mouseY+150)/50 - 2);
       reveal((mouseX+100)/50,(mouseY+200)/50 - 2);
     } 
     if(mouseY >= 450 && mouseX > 100){
       reveal(mouseX/50,mouseY/50 - 2);
       reveal(mouseX/50,(mouseY-50)/50 - 2);
       reveal(mouseX/50,(mouseY-100)/50 - 2);
       reveal(mouseX/50,(mouseY-150)/50 - 2);
       reveal(mouseX/50,(mouseY-200)/50 - 2);
       reveal((mouseX-50)/50,(mouseY-50)/50 - 2);
       reveal((mouseX-50)/50,(mouseY-100)/50 - 2);
       reveal((mouseX-50)/50,(mouseY-150)/50 - 2);
       reveal((mouseX-50)/50,(mouseY-200)/50 - 2);
       reveal((mouseX-100)/50,(mouseY-100)/50 - 2);
       reveal((mouseX-100)/50,(mouseY-150)/50 - 2);
       reveal((mouseX-100)/50,(mouseY-250)/50 - 2);
       reveal((mouseX-100)/50,(mouseY-200)/50 - 2);
     } 
     if(mouseY > 400 && mouseY < 450 && mouseX > 100){
       reveal(mouseX/50,mouseY/50 - 2);
       reveal(mouseX/50,(mouseY-50)/50 - 2);
       reveal(mouseX/50,(mouseY-100)/50 - 2);
       reveal(mouseX/50,(mouseY-150)/50 - 2);
       reveal(mouseX/50,(mouseY-200)/50 - 2);
       reveal((mouseX-50)/50,(mouseY-50)/50 - 2);
       reveal((mouseX-50)/50,(mouseY-100)/50 - 2);
       reveal((mouseX-50)/50,(mouseY-150)/50 - 2);
       reveal((mouseX-50)/50,(mouseY-200)/50 - 2);
       reveal((mouseX-100)/50,(mouseY-100)/50 - 2);
       reveal((mouseX-100)/50,(mouseY-150)/50 - 2);
       reveal((mouseX-100)/50,(mouseY-250)/50 - 2);
       reveal((mouseX-100)/50,(mouseY-200)/50 - 2);
     }  
    } 
  int col = mouseX/50;
  int row = (mouseY - 100)/50;
  if(lose == false){
    if(board[col][row].getBomb() == false){ 
      reveal(col, row);
      reveal(col, row) ;
      if(checkFinished()){
        win = true ;
      }
    }
    else{
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
   }else if (x > width - 400 && x < width - 200 && y > 405 && y < 455){
     retry = false ;
     lose = false ;
     score = 0 ;
     time = 0 ;
     board = new TILE[ROWS][COLS] ;
     makeBoard() ;
   }
  }
} else if(mouseButton == LEFT){
  if(mouseY > 100 && board[mouseX/50][mouseY/50-2].getFlagged() == false){
    if(FLAGS > 0){
      color a = get(mouseX, mouseY);
      color b = color(0,255,0);
      color c = color(0,0,255);
      color d = color(0);
      color e = color(255);
      color f = color(144,238,144);
      if(a != b && a != c && a == f){
      board[mouseX/50][mouseY/50 - 2].setFlag(true);
      FLAGS--;
      }
    }
  }
  else{
    if(mouseY > 100){
    board[mouseX/50][mouseY/50 - 2].setFlag(false);
    FLAGS++;
    }
  }
 }
}else if(Level == 1){
  
    if(mouseY > 100){
      board[mouseX/100][mouseY/100 - 1].setDiff(1); 
    }
    
    if(mouseY > 100 && mouseButton == RIGHT  && board[mouseX/100][mouseY/100 - 1].getFlagged() == false){
      
    if (click == 0){
      
     if(board[mouseX/100][mouseY/100 - 1].getBomb() == true){
        board[mouseX/100][mouseY/100 - 1].setBomb(false);
        FLAGS--;
        
      }
      
     click++;
    }
   }
    
    if(mouseY > 100 && mouseButton == RIGHT  && board[mouseX/100][mouseY/100 - 1].getFlagged() == false){
    int col = mouseX/100;
    int row = (mouseY - 100)/100;
    if(lose == false){
      if(board[col][row].getBomb() == false){ 
        reveal(col, row);
        if(checkFinished()){
          win = true ;
        }
       }
      else{
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
   }else if (x > width - 400 && x < width - 200 && y > 405 && y < 455){
     retry = false ;
     lose = false ;
     score = 0 ;
     time = 0 ;
     board = new TILE[ROWS][COLS] ;
     makeBoard() ;
   }
  }
    }
    
    if(mouseButton == LEFT){
  if(mouseY > 100 && board[mouseX/100][mouseY/100-1].getFlagged() == false){
    if(FLAGS > 0){
      color a = get(mouseX, mouseY);
      color b = color(0,255,0);
      color c = color(0,0,255);
      color d = color(0);
      color e = color(255);
      color f = color(144,238,144);
      if(a != b && a != c && a == f){
      board[mouseX/100][mouseY/100 - 1].setFlag(true);
      FLAGS--;
      }
    }
  }
  else{
    if(mouseY > 100){
    board[mouseX/100][mouseY/100 - 1].setFlag(false);
    FLAGS++;
    }
  }
 }
}  
  
  if(Level == 3){
    if(mouseY > 100){
      board[mouseX/25][mouseY/25 - 4].setDiff(3); 
    }
    
    if(mouseY > 100 && mouseButton == RIGHT  && board[mouseX/25][mouseY/25 - 4].getFlagged() == false){
      
    if (click == 0){
      
     if(board[mouseX/25][mouseY/25 - 4].getBomb() == true){
        board[mouseX/25][mouseY/25 - 4].setBomb(false);
        FLAGS--;
        
      }
      
     click++;
    }
   }
    
    if(mouseY > 100 && mouseButton == RIGHT  && board[mouseX/25][mouseY/25 - 4].getFlagged() == false){
    int col = mouseX/25;
    int row = (mouseY - 100)/25;
    if(lose == false){
      if(board[col][row].getBomb() == false){ 
        reveal(col, row);
        if(checkFinished()){
          win = true ;
        }
       }
      else{
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
   }else if (x > width - 400 && x < width - 200 && y > 405 && y < 455){
     retry = false ;
     lose = false ;
     score = 0 ;
     time = 0 ;
     board = new TILE[ROWS][COLS] ;
     makeBoard() ;
   }
  }
    }
    
    if(mouseButton == LEFT){
  if(mouseY > 100 && board[mouseX/25][mouseY/25-4].getFlagged() == false){
    if(FLAGS > 0){
      color a = get(mouseX, mouseY);
      color b = color(0,255,0);
      color c = color(0,0,255);
      color d = color(0);
      color e = color(255);
      color f = color(144,238,144);
      if(a != b && a != c && a == f){
      board[mouseX/25][mouseY/25 - 4].setFlag(true);
      FLAGS--;
      }
    }
  }
  else{
    if(mouseY > 100){
    board[mouseX/25][mouseY/25 - 4].setFlag(false);
    FLAGS++;
    }
  }
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
