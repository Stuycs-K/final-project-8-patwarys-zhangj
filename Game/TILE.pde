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

public void reveals(){
  if(flagged == false){
    revealed = true ;
  }
}

public boolean getFlagged(){
  return flagged ;
}

public void setFlag(boolean opp){
  flagged = opp;
}

public boolean getRevealed(){
  return revealed ;
}

public void setRevealed(boolean wtv){
  revealed = wtv;;
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
    fill(255,0,0);
    stroke(0);
    line(x+20,y-90,x+20,y-60);
    triangle(x+20, y-90, x+20, y-75, x+40, y-75);
  }
  if(revealed){
    if(getBomb() == false){
    fill(0,255,0) ;
    square(x, y, size) ;
    fill(0,0,255) ;
    textSize(size) ;
    textAlign(LEFT) ;
    text(NumBomb + "", x, y+size) ;
    } 
  }
}

}
