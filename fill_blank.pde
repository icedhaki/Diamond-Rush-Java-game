class fill_blank{
  String question;
  String saved;
  String typing;
  String correctAnswer;
  
  //Constructor
  fill_blank(String correctAnswer){
    saved = "";
    typing = "";
    this.correctAnswer=correctAnswer;
  }
  
  void display(String answer, float x, float y){
    fill(0);
    textFont(f2,20);
    text(answer,x,y);
  }
  
  //compare a with typing 
  boolean compare(String a){
    if(a.equals(correctAnswer)){
      return true;
    }
    return false;
  }
}
