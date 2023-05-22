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
