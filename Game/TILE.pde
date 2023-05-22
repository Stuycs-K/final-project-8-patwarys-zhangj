boolean Bomb, flagged, revealed ;
int NumBomb ;

public TILE(boolean bomb, numBomb){
  Bomb = bomb ;
  NumBomb = numBomb ;
  flagged = false ;
  revealed = false ;
}

public void flag(){
  flag = !flag ;
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

}
