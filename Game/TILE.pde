public class TILE{
boolean Bomb, flagged, revealed ;
int NumBomb;
int diff = 2;

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

public void setDiff(int x){
 diff = x; 
}

public void reveals(){
  //if(flagged == false){
    revealed = true ;
  //}
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
  revealed = wtv;
}

public boolean getBomb(){
  return Bomb ;
}

public void setBomb(boolean x){
  Bomb = x;
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
  if(revealed){
    if(getBomb() == false){
      fill(0,255,0) ;
    square(x, y, size) ;
    fill(0,0,255) ;
    textSize(size) ;
    textAlign(LEFT) ;
    if(NumBomb == 0){
      text("", x, y+size) ;
      fill(211,211,211) ;
      square(x, y, size) ;
    }
    if(NumBomb == 2){
     fill(255,0,0) ;
     textSize(size) ;
     textAlign(LEFT) ;
     text(NumBomb + "", x, y+size) ;
    }
    if(NumBomb>2){
     fill(128,0,128) ;
     textSize(size) ;
     textAlign(LEFT) ;
     text(NumBomb + "", x, y+size) ;
    } 
    else{
        text(NumBomb + "", x, y+size);
      }
    } 
  }
  
    if(flagged == true && diff == 2){
    fill(255,0,0);
    stroke(0);
    line(x+20,y+10,x+20,y+40);
    triangle(x+20, y+10, x+20, y+25, x+40, y+20);
  }
  
  if(flagged == true && diff == 1){
    fill(255,0,0);
    stroke(0);
    line(x+30,y+10,x+30,y+90);
    triangle(x+30, y+10, x+30, y+45, x+70, y+30);
  }
  
}

}
