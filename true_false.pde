class true_false {
  boolean TFCheck = false;
  boolean Answer;
  boolean check=true;    
  int button_w = 150;
  int button_h = 80;
  boolean right=false;
  boolean timerCheck=false;
  int timesChecked;
  
  true_false(boolean Answer) {
    this.Answer=Answer;
    timesChecked=0;
  }

  void display() {
    textFont(f2, 30);

    fill(255, 211, 31);    
    rectMode(CENTER);
    rect(width/6, height/2, button_w, button_h);
    fill(0);
    textAlign(CENTER, CENTER);
    text("True", width/6, height/2);

    fill(255, 211, 31);
    rectMode(CENTER);
    rect(width/6, height/2+100, button_w, button_h);
    fill(0);
    textAlign(CENTER, CENTER);
    text("False", width/6, height/2+100);
  }

  void check() {
   if(timerCheck==false){
    if (check) {
      if (mousePressed && mouseX>=width/6-button_w/2 && mouseX<=width/6+button_w/2 && mouseY>=height/2-button_h/2 && mouseY<=height/2+button_h/2) {
        timesChecked++;
        TFCheck=true;
        check=false;
      }
      if (mousePressed && mouseX>=width/6-button_w/2 && mouseX<=width/6+button_w/2 && mouseY>=height/2+60 && mouseY<=height/2+140) {
        timesChecked++;
        TFCheck = false;
        check=false;
      }
    } else {
      //not able to choose another answer
      if (TFCheck==Answer) {
        right=true;
        textFont(f2, 40);
        fill(0, 255, 0);
        text("Correct!", width/2, height/1.2);
        

        //Play correct answer sound only once
        if (!correct_answer.isPlaying() && correct_answer_playing ==false) {
          correct_answer.play();
          correct_answer_playing=true;
        }

        //Next button
        fill(38, 252, 247, 110);
        rectMode(CENTER);
        rect(width/12, height/1.1, w, h);
        fill(0);
        textAlign(CENTER, CENTER);
        textFont(f2, 30);
        text("Next", width/12, height/1.1);
        if (mousePressed && mouseX >= width/12-w/2 && mouseX<width/12+w/2 && mouseY > height/1.1-h/2 && mouseY<height/1.1+h/2) {
          page2 = false;
        }
        if (page5==false && mousePressed && mouseX >= width/12-w/2 && mouseX<width/12+w/2 && mouseY > height/1.1-h/2 && mouseY<height/1.1+h/2) {
          page6=false;
        }
      } else {
        right=false;
        //we need to be able to try again - try again button allows that by changing check back to true
        textFont(f2, 40);
        fill(255, 0, 0);
        text("Incorrect!", width/2, height/1.2);
        
        if (!wrong_answer.isPlaying() && wrong_answer_playing==false) {
            wrong_answer.play();
            wrong_answer.amp(0.4);
            wrong_answer_playing = true;
          }
          
        //Try again button
        fill(38, 252, 247, 110);
        rectMode(CENTER);
        rect(width/2, height/1.1, w, h);
        fill(0);
        textAlign(CENTER, CENTER);
        textFont(f2, 20);
        text("Try again", width/2, height/1.1);
        if (mousePressed && mouseX >= width/2-w/2 && mouseX<width/2+w/2 && mouseY > height/1.1-h/2 && mouseY<height/1.1+h/2) {
          check = true;
          wrong_answer_playing = false;  //change boolean back to false when pressing try again button to play sound again
        }
      }
    }
   }
  }

  boolean timerCheck() {
    if (right==false) {
      return false;
    } else {
      return true;
    }
  }
}
