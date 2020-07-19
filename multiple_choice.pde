class multiple_choice {
  int Answer;
  int button_w = 50;
  int button_h = 50;
  int answer = 0;
  boolean check=false;
  boolean switchPage=false;
  boolean right=false;
  boolean timerCheck=false;
  int timesChecked;
  
  multiple_choice(int Answer) {
    this.Answer = Answer;
    timesChecked=0;
  }

  void button_a(String option_a) {
    rectMode(CENTER);
    fill(255, 211, 31);
    rect(width/8, height/2.2, button_w, button_h);
    textAlign(LEFT);
    fill(0);
    textFont(f2, 27);
    text(option_a, width/5, height/2.2);

    textAlign(CENTER, CENTER);
    text("a", width/8, height/2.2);
  }

  void button_b(String option_b) {
    rectMode(CENTER);
    fill(255, 211, 31);
    rect(width/8, height/1.8, button_w, button_h);
    textAlign(LEFT);
    fill(0);
    textFont(f2, 27);
    text(option_b, width/5, height/1.8);

    textAlign(CENTER, CENTER);
    text("b", width/8, height/1.8);
  }

  void button_c(String option_c) {
    rectMode(CENTER);
    fill(255, 211, 31);
    rect(width/8, height/1.5, button_w, button_h);
    textAlign(LEFT);
    fill(0);
    textFont(f2, 27);
    text(option_c, width/5, height/1.5);

    textAlign(CENTER, CENTER);
    text("c", width/8, height/1.5);
  }

  void button_d(String option_d) {
    rectMode(CENTER);    
    fill(255, 211, 31);
    rect(width/8, height/1.3, button_w, button_h);
    textAlign(LEFT);
    fill(0);
    textFont(f2, 27);
    text(option_d, width/5, height/1.3);

    textAlign(CENTER, CENTER);
    text("d", width/8, height/1.3);
  }

  void check(float mx, float my) {
    if(timerCheck==false){
      if (check == false) {
        if (mx>width/8-button_w/2 && mx<width/8+button_w/2 && my>height/2.2-button_h/2 && my<height/2.2+button_h/2 && mousePressed) {
          answer = 1;
          check = true;
          timesChecked++;
        } else if (mx>width/8-button_w/2 && mx<width/8+button_w/2 && my>height/1.8-button_h/2 && my<height/1.8+button_h/2 && mousePressed) {
          answer = 2;
          check = true;
          timesChecked++;
        } else if (mx>width/8-button_w/2 && mx<width/8+button_w/2 && my>height/1.5-button_h/2 && my<height/1.5+button_h/2 && mousePressed) {
          answer = 3;
          check = true;
          timesChecked++;
        } else if (mx>width/8-button_w/2 && mx<width/8+button_w/2 && my>height/1.3-button_h/2 && my<height/1.3+button_h/2 && mousePressed) {
          answer = 4;
          check = true;
          timesChecked++;
        }
      } else {
        if (answer == Answer) {
          fill(0, 255, 0);
          textFont(f2, 40);
          textAlign(CENTER, CENTER);
          text("Correct!", width/2, height/1.2);
          right=true;
          
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
          if (mousePressed && mouseX > width/12-w/2 && mouseX<width/12+w/2 && mouseY > height/1.1-h/2 && mouseY<height/1.1+h/2) {
            page3 = false;
          }
          if (page4==false && mousePressed && mouseX > width/12-w/2 && mouseX<width/12+w/2 && mouseY > height/1.1-h/2 && mouseY<height/1.1+h/2) {
            page5 = false;
          }
        } else {
          fill(255, 0, 0);
          textFont(f2, 40);
          textAlign(CENTER, CENTER);
          right=false;
          text("Incorrect!", width/2, height/3);
          
          if (!wrong_answer.isPlaying() && wrong_answer_playing==false) {
              wrong_answer.play();
              wrong_answer.amp(0.4);
              wrong_answer_playing = true;
            }
  
          //Try again button - lets you choose another answer
          fill(38, 252, 247, 110);
          rectMode(CENTER);
          rect(width/2, height/1.1, w, h);
          fill(0);
          textAlign(CENTER, CENTER);
          textFont(f2, 20);
          text("Try again", width/2, height/1.1);
          if (mousePressed && mouseX >= width/2-w/2 && mouseX<width/2+w/2 && mouseY > height/1.1-h/2 && mouseY<height/1.1+h/2) {
            check = false;
            wrong_answer_playing = false;
          }
        }
      }
    }
  }

  boolean timerCheck() {
    if (right==true) {
      return true;
    } else {
      return false;
    }
  }
}
