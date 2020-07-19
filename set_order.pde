class set_order{
  String question;
  String saved;
  String typing;
  String answer;
  
  //Constructor
  set_order(String answer){
    saved = "";
    typing = "";
    this.answer=answer;
  }
  
  void display(String answer, float x, float y){
    fill(0);
    textFont(f2,20);
    textAlign(CENTER,CENTER);
    text(answer,x,y);
  }
  
  //compare a with typing 
  boolean compare(String a){
    if(a.equals(answer)){
      return true;
    }
    return false;
  }
}
