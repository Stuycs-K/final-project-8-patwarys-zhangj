public class TILE{
boolean Bomb, flagged, revealed ;
int NumBomb ;

public TILE(boolean bomb){
  Bomb = bomb ;
  NumBomb = 0 ;
  flagged = false ;
  revealed = false ;
}

public void flag(){
  if(!revealed){
    flagged = !flagged ;
  }
}

public void reveal(){
  if(flagged == false){
    revealed = true ;
  }
}

public boolean getFlagged(){
  return flagged ;
}

public boolean getRevealed(){
  return revealed ;
}

public boolean getBomb(){
  return Bomb ;
}

public int getNumBomb(){
  return NumBomb ;
}

public void setNumBomb(int num){
  NumBomb = num ;
}

public void display(float x, float y, float size){
  /*fill(120) ;
  square(x, y, size) ;*/
  if(flagged){
    fill(255, 0, 0) ;
    circle(x, y, size) ;
  }
  if(revealed){
    fill(0,255,0) ;
    square(x, y, size) ;
    fill(0,0,255) ;
    textSize(size) ;
    textAlign(LEFT) ;
    text(NumBomb + "", x, y+size) ;
  }
}

}
