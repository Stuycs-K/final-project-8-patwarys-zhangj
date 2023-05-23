class TILE{
boolean Bomb, flagged, revealed ;
int NumBomb ;

public TILE(boolean bomb){
  Bomb = bomb ;
  NumBomb = 0 ;
  flagged = false ;
  revealed = false ;
}

public void flag(){
  flagged = !flagged ;
}

public void reveal(){
  revealed = true ;
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

}
