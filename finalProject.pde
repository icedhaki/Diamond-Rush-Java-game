import processing.sound.*;

float circleX;
float circleY;
float storyY;
float storyZ;

float i=60.0;
float j=60.0;
float k=60.0;
float l=60.0;
float m=60.0;
float n=60.0;
float o=60.0;
float p=60.0;
float q=60.0;

int y;
int totalTime;
int totalTime1;
int timesChecked;
int timesChecked2;
int timesChecked3;
int timesChecked4;

float totalScore;
float totalScore1;
float totalScore2;
float totalScore3;
float totalScore4;
float totalScore5;
float totalScore6;
float totalScore7;

int w = 100;    //for next button
int h = 70;     //for next button

PImage logoImg;
PImage flowchart;
PImage d;
PImage paper;
PImage box;
PImage img;
PImage diamond_background;
PImage diamond1;
PImage diamond2;
PImage mining_tool;
PImage mining_tools;
PImage story_back;
PImage fillblankQ;
PImage mcQ;
PImage tfQ;
PImage setorderQ;

PFont f;
PFont f2;

boolean check=true;
boolean start=true;
boolean fill_blank;
boolean storyCheck;
boolean instrCheck;
boolean user;
boolean game;

boolean correctAnswer;
boolean correctAnswer1;
boolean correctAnswer2;
boolean correctAnswer3;

boolean checkAnswer;
boolean checkAnswer1;
boolean checkAnswer2;
boolean checkAnswer3;
boolean checkAnswer4;

boolean text1;
boolean text2;
boolean text3;
boolean text4;
boolean text5;
boolean text6;
boolean text7;
boolean text8;

boolean page1;
boolean page2;
boolean page3;
boolean page4;
boolean page5;
boolean page6;
boolean page7;
boolean page8;

boolean correct_answer_playing = false;
boolean wrong_answer_playing = false;
boolean gameover_playing = false;
boolean story_playing = false;
boolean intro_playing = false;
boolean hint_playing = false;

boolean checkUser=false;
boolean question1_lost;
boolean question2_lost;
boolean question3_lost;
boolean question4_lost;

String typing = "";
String saved = "";
String typing1 = "";
String saved1 = "";
String saved2="";
String typing2="";
String typing3 = "";
String saved3 = "";
String typing4 = "";
String saved4 = "";
String finalSaved;

fill_blank question1;
fill_blank question2;

true_false tf1;
true_false tf2;

multiple_choice mc1A;
multiple_choice mc2A;

set_order set_q1;
set_order set_q2;

SoundFile intro;
SoundFile story;
SoundFile story1;
SoundFile correct_answer;
SoundFile wrong_answer;
SoundFile gameover;
SoundFile hint;

Ball ball1;
Ball ball2;
Ball ball3;
Ball ball4;
Ball ball5;
Ball ball6;
Ball ball7;
Ball ball8;

table_scores table;

int total_score;

String[] names=new String[4];
int[] score=new int[4];

boolean lost=false;
boolean lost1=false;
boolean lost2=false;
boolean lost3=false;

boolean enter;

void setup() {
  size(950, 850, P3D);

  question1 = new fill_blank("if");
  question2 = new fill_blank("w");
  tf1= new true_false(true);
  tf2= new true_false(false);
  mc1A = new multiple_choice(4);
  mc2A = new multiple_choice(4);
  set_q1=new set_order("2,3,1,4");
  set_q2=new set_order("3,1,2,4");

  correct_answer = new SoundFile(this, "Correct-answer.mp3");
  wrong_answer = new SoundFile(this, "Wrong-alert-beep.mp3");
  intro=new SoundFile(this, "Gentle-intro.mp3");
  gameover = new SoundFile(this, "Mission-failed.mp3");
  story = new SoundFile(this, "Echinoderm_Regeneration.mp3");
  hint = new SoundFile(this, "Ding-sound.mp3");

  logoImg = loadImage("logo.png");
  flowchart = loadImage("flowchart1.png");
  paper=loadImage("paper.png");
  fillblankQ = loadImage("fill_blank_Q.png");
  mcQ = loadImage("multiple_choice_Q.png");
  tfQ = loadImage("true_false_Q.png");
  setorderQ = loadImage("set_order_Q.png");
  diamond_background = loadImage("diamond.png");
  diamond1 = loadImage("diamond1.png");
  diamond2 = loadImage("diamond2.png");
  mining_tool = loadImage("mining_tool.png");
  mining_tools = loadImage("mining_tools.png");
  img=loadImage("mod1_q4.PNG");
  d=loadImage("diamond.png");
  box=loadImage("box.png");
  story_back=loadImage("story_back.jpg");

  f = loadFont("DOCKERTHREE-48.vlw");
  f2 = createFont("Arial", 20);

  totalTime = 0;
  totalTime1 = 0;
  circleX = 0;
  circleY = 0;
  y = -280;
  storyZ = 0;

  storyCheck = false;
  instrCheck = false;
  user = false;
  game = false;

  text1 = false;
  text2=false;
  text3 = false;
  text4 = false;
  text5 = false;
  text6 = false;
  text7 = false;
  text8 = false;

  fill_blank = false;

  checkAnswer=false;
  checkAnswer1=false;
  checkAnswer2=false;
  checkAnswer3=false;
  checkAnswer4=false;

  page1=true;
  page2=true;
  page3=true;
  page4=true;
  page5=true;
  page6=true;
  page7=true;
  page8=true;

  timesChecked=0;
  timesChecked2=0;
  timesChecked3=0;
  timesChecked4=0;

  correctAnswer=false;
  correctAnswer1=false;
  correctAnswer2=false;
  correctAnswer3=false;

  ball1 = new Ball(64, random(0, 255), random(0, 255), random(0, 255));
  ball2 = new Ball(32, random(0, 255), random(0, 255), random(0, 255));
  ball3 = new Ball(72, random(0, 255), random(0, 255), random(0, 255));
  ball4 = new Ball(40, random(0, 255), random(0, 255), random(0, 255));
  ball5 = new Ball(50, random(0, 255), random(0, 255), random(0, 255));
  ball6 = new Ball(15, random(0, 255), random(0, 255), random(0, 255));
  ball7 = new Ball(32, random(0, 255), random(0, 255), random(0, 255));
  ball8 = new Ball(32, random(0, 255), random(0, 255), random(0, 255));

  table = new table_scores();

  question1_lost=false;
  question2_lost=false;
  question3_lost=false;
  question4_lost=false;
  
  enter=true;
}

void draw() {
  background(255);
  if (storyCheck==false) {
    startPage();
  } else {
    storyPage();
  }
}

void startPage() {
  if (totalTime<550) {
    //Plays the sound once (runs for both pages)
    if (!intro.isPlaying() && intro_playing == false) {
      intro.play();
      intro_playing = true;
    }
    int k=0;
    while (k<width) {
      int j=0;
      while (j<height) {
        fill(random(0, 255), 255, 255);
        noStroke();
        rect(k, j, 10, 10);
        j=j+10;
      }
      k=k+10;
    }

    stroke(0);
    totalTime++;
    if (check==true) {
      for (int i=0; i<5; i++) {
        beginShape();
        fill(random(0, 255), random(0, 255), random(0, 255)); // Red color
        vertex(75+180*i, 280+y*(i+1)+150);
        vertex(90+180*i, 235+y*(i+1)+150);
        vertex(45+180*i, 210+y*(i+1)+150);
        vertex(100+180*i, 210+y*(i+1)+150);
        vertex(115+180*i, 170+y*(i+1)+150);
        vertex(130+180*i, 210+y*(i+1)+150);
        vertex(185+180*i, 210+y*(i+1)+150);
        vertex(140+180*i, 235+y*(i+1)+150);
        vertex(155+180*i, 280+y*(i+1)+150);
        vertex(115+180*i, 255+y*(i+1)+150);
        vertex(75+180*i, 280+y*(i+1)+150);
        endShape(CLOSE);
      }
    } else {
      for (int i=0; i<5; i++) {
        beginShape();        
        fill(random(0, 255), random(0, 255), random(0, 255));    // Red color
        vertex(75+180*i, 280+50+150);
        vertex(90+180*i, 235+50+150);
        vertex(45+180*i, 210+50+150);
        vertex(100+180*i, 210+50+150);
        vertex(115+180*i, 170+50+150);
        vertex(130+180*i, 210+50+150);
        vertex(185+180*i, 210+50+150);
        vertex(140+180*i, 235+50+150);
        vertex(155+180*i, 280+50+150);
        vertex(115+180*i, 255+50+150);
        vertex(75+180*i, 280+50+150);
        endShape(CLOSE);
      }
      ball1.move();
      ball2.move();
      ball3.move();
      ball4.move();
      ball5.move();
      ball6.move();
      ball7.move();
      ball8.move();
      ball1.display();
      ball2.display();
      ball3.display();
      ball4.display();
      ball5.display();
      ball6.display();
      ball7.display();
      ball8.display();
    }
    y=y+2;
    if (y>height/24) {
      check=false;
    }
    fill(0);
    textFont(f, 100);
    textAlign(CENTER,CENTER);
    text("MINERS", width/2, height/4);
    textFont(f, 50);
    text("present", width/2, height/4+100);
    start=false;
  } else {
    // step 2
    fill(0);
    textAlign(CENTER, CENTER);
    imageMode(CENTER);
    image(logoImg, width/2, height/3, 900, 500);
    textSize(40);
    text("Gabriela Pesantez Velarde", width/2, height/1.5);
    text("Khaknazar Shyntassov", width/2, height/1.4);
    text("Ryan Cappel", width/2, height/1.3);
    text("CS-104 Final Project Spring 2020", width/2, height/1.1);
  }
}

void storyPage() {
  //CHANGE 40 TO 1400 FOR THE MUSIC TO PLAY FOR ENTIRELY
  if (totalTime1<1400) {
    //Background music
    if (!story.isPlaying() && story_playing == false) {
      story.play();
      story_playing = true;
    }
    totalTime1++;
    String story="On the west coast of Java island, mysteriously lost jewels of the native tribes were found. Get ready to go, explore the area and find the diamonds!";
    String story1="But hurry up, because there are more and more hunters searching for the ancient treasures. Solve Java's secrets and riddles, and find the treasures!";

    translate(width/6, 400+storyY, storyZ);
    // Rotating in x-direction
    rotateX(PI/5);
    textFont(f);
    // Aligning text in center
    textAlign(CENTER);
    // Displaying text
    text(story, 20, 0, 600, 800);
    text(story1, 20, 500, 600, 800);
    // Decrementing y and z values, so that text goes upward and farther away
    storyY=storyY-0.5;
    storyZ=storyZ-0.5;
  } else {
    instrPage();
  }
}

void instrPage() {
  if (instrCheck==false) {
    imageMode(CENTER);
    image(paper, width/2, height/2, width, height);
    fill(0);
    textSize(50);
    textAlign(CENTER, CENTER);
    text("How to play the game?", width/2, height/4.5);
    textSize(28);
    text("The objective of this game is to test your understanding of the basic principles of programming in Java. Game includes two modules: conditionals and functions. In each module, you will be provided with study materials, such as short text paragraphs, examples, and figures for you to revise each topic.", width/2, height/2.5, 680, 300);
    text("After that you will be prompted to answer a set of 4 different types of questions: multiple-choice, true or false, complete the blank and set in the correct order.", width/2, height/2.5+180, 680, 300);

    // button
    rectMode(CENTER);
    fill(255);
    rect(width/2, height/1.3, 250, 90);
    fill(211, 157, 19);
    textSize(28);
    textAlign(CENTER, CENTER);
    text("Show additional instructions", width/2, height/1.3, 250, 100);
    if (mousePressed && mouseX>width/2-125 && mouseX<width/2+125 && mouseY>height/1.3-45 && mouseY<height/1.3+45) {
      instrCheck=true;
    }
  } else {
    instrPage2();
  }
}

void instrPage2() {
  String m_c = "1) Multiple choice questions: 4 buttons with 4 different answer choices will be displayed. Click on one of the options to choose an answer.";
  String t_f = "2) True or false questions: 2 buttons, True and False, will be displayed. To choose an answer, you need to click on one of them, and press enter to check your answer.";
  String blank = "3) Complete the blank questions: type your answer in the required fields and press enter to check your answer.";
  String order = "4) Set in the correct order questions: type the order as a text, e.g. 1,2,3,4 and press enter to check your answer";
  //Button width and height
  int w = 210;
  int h = 70;

  if (user==false) {
    //Instructions
    //images
    imageMode(CENTER);
    image(box, width/2, height/8+80, 60, 60);
    image(box, width/2, height/1.5, 60, 60);
    imageMode(CORNER);
    for (int i=0; i<21; i++) {
      image(d, (width/68)+45*i, height/1.1+45, 30, 30);
    }
    //images of game
    mcQ.resize(320, 240);
    image(mcQ, width/25, height/25-20);
    tfQ.resize(350, 220);
    image(tfQ, width/1.7+20, height/3-115);
    fillblankQ.resize(295, 220);
    image(fillblankQ, width/26, height/2-25);
    setorderQ.resize(350, 260);
    image(setorderQ, width/1.6-10, height/1.5-20);

    fill(0);
    textSize(24);
    text(m_c, width/1.5+10, height/9, 530, 300);
    text(t_f, width/4+50, height/2.2-70, 550, 300);
    text(blank, width/1.5+10, height/1.7-35, 550, 300);
    text(order, width/4+52, height/1.3+30, 550, 300);

    rectMode(CENTER);
    fill(255);
    rect(width/2, height/1.1, w, h);
    fill(211, 157, 19);
    textSize(28);
    text("Start Game", width/2, height/1.1);
    if (mousePressed && mouseX>width/2-w/2 && mouseX<width/2+w/2 && mouseY>height/1.1-h/2 && mouseY<height/1.1+h/2) {
      user=true;
    }
  } else {
    userPrompt();
  }
}

void userPrompt() {
  if (game==false) {
    // type your username
    int indent = 25;
    int w = 300;
    int h = 75;

    // Set the font and fill for text
    textFont(f);
    textSize(30);
    fill(0);
    textAlign(LEFT);
    rectMode(CORNER);
    // Display everything
    text("Click in this window and your username. \nHit enter to save. ", indent, 40);
    text("Your username: " + typing, indent, 190);
    text("Saved username: " + saved, indent, 230);

    if (checkUser==false) {
      finalSaved=saved;
      checkUser=true;
    }

    //2 diamond images
    imageMode(CENTER);
    diamond1.resize(190, 190);
    image(diamond1, width/6, height/2);
    image(diamond1, width/1.2, height/2);

    fill(255);
    textSize(38);
    textAlign(CENTER, CENTER);
    rectMode(CENTER);
    rect(width/2, height/2, w, h);
    fill(211, 157, 19);
    text("Start game!", width/2, height/2);
    if (mousePressed && mouseX>=width/2-w/2 && mouseX<=width/2+w/2 && mouseY>=height/2-h/2 && mouseY<=height/2+h/2) {
      game=true;
    }
  } else {
    gameStart();
    story.stop();
  }
}

void gameStart() {
  if (page1) {
    if (text1==false) {
      // Conditionals - First text portion
      String cond_title1 = "Conditionals: What are they?";
      String cond_text1 = "Conditionals are also known as if statements. These if statements check to see whether a certain condition is met or not to perform a particular action. For example, if the if statement’s condition evaluates to true, then the code within the statement will execute. If the condition evaluates to false, then the code will not execute. This is syntax and structure for if statements:";
      String cond_text1_ex = "if (condition) {";
      String cond_text1_ex2 = "// code to execute if boolean expression is true;";
      String cond_text1_con = "The following relational operators can be used in an if statement:";

      imageMode(CENTER);
      tint(255, 70);
      image(diamond_background, width/2, height/2);

      fill(0);
      textFont(f2, 35);
      textAlign(CENTER, CENTER);
      text(cond_title1, width/2, height/12);

      textFont(f2, 20);
      textAlign(LEFT);
      text(cond_text1, width/2, height/3, 800, 150);

      text(cond_text1_ex, width/12, height/2);
      text(cond_text1_ex2, width/12+10, height/2+30);
      text("}", width/12, height/2+60);

      text(cond_text1_con, width/12, height/1.5);
      text(">  greater than", width/12, height/1.5+25);
      text("<   less than", width/12, height/1.5+45);
      text(">=  greater than or equal to", width/12, height/1.5+65);
      text("<=  less than or equal to", width/2.5, height/1.5+25);
      text("==  equal to", width/2.5, height/1.5+45);
      text("!=  not equal to", width/2.5, height/1.5+65);

      //Next button
      fill(38, 252, 247, 110); 
      rectMode(CENTER);
      rect(width/1.1, height/1.1, w, h);
      fill(0);
      textFont(f2, 30);
      textAlign(CENTER, CENTER);
      text("Next", width/1.1, height/1.1);
      if (mouseX>width/1.1-w/2 && mouseX<width/1.1+w/2 && mouseY>height/1.1-h/2 && mouseY<height/1.1+h/2 && mousePressed) {
        text1 = true;
      }
    } else {
      //Conditionals - Question 1 (fill in the blank)
      String ques1 = "Complete the following code to print “Hey there!”.";
      String line1 = "int x = 10;";
      String line2 = "int y = 10;";
      String line3 = "(x == y) {";
      String line4 = "println(“Hey there!”);";

      //3 images
      imageMode(CENTER);
      diamond2.resize(120, 120);
      mining_tool.resize(100, 100);
      mining_tools.resize(120, 120);
      tint(255, 255);
      image(diamond2, width/1.1, height/1.13);
      image(mining_tool, width/12, height/12);
      image(mining_tools, width/1.1, height/10);

      //Question
      fill(0);
      textFont(f2, 23);
      textAlign(LEFT);
      text(ques1, width/8, height/6);
      text(line1, width/8, height/2);
      text(line2, width/8, height/2+40);
      text(line3, width/8+50, height/2+80);
      text(line4, width/8+10, height/2+120);
      text("}", width/8, height/2+160);

      //blank field
      fill(255);
      rectMode(CORNER);
      rect(width/8, height/2+60, 43, 27);
      textAlign(LEFT);
      //Type in first blank and saves when enter is pressed
      question1.display(typing1, width/8+12, height/2+82);
      question1.display(saved1, width/8+12, height/2+82);
     
      //checks the typed answer
      if (checkAnswer) {
        if (question1.compare(saved1)==true) {
          textFont(f2, 40);
          fill(0, 255, 0);
          textAlign(CENTER, CENTER);
          text("Correct!", width/2, height/1.2);
          correctAnswer=true;
          //Score
          totalScore=40+(int)i;
          text("You've found "+(int)totalScore+" diamonds!", width/2+10, height/1.2+50);

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
          if (mousePressed && mouseX>width/12-w/2 && mouseX<width/12+w/2 && mouseY>height/1.1-h/2 && mouseY<=height/1.1+h/2) {
            page1=false;
          }
        } else {
          //Play wrong answer sound only once
          if (!wrong_answer.isPlaying() && wrong_answer_playing==false) {
            wrong_answer.play();
            wrong_answer.amp(0.4);
            wrong_answer_playing = true;
          }
          textFont(f2, 40);
          fill(255, 0, 0);
          textAlign(CENTER, CENTER);
          text("Incorrect!", width/2, height/2);
          typing1="";
          saved1="";
        }
      }

      if (timesChecked>=2 && question1.compare(saved1)==false) {
        textFont(f2, 23);
        fill(211, 157, 19);
        textAlign(CENTER, CENTER);
        text("A conditional is also callled an __ statement", width/5+150, height/2+65, 300, 100);
        //Hint sound ((MAKE SURE TO INCLUDE IN OTHER HINTS)
        if (!hint.isPlaying() && hint_playing==false) {
          hint.play();
          hint.amp(0.2);
          hint_playing = true;
        }
      }

      //Once you lose (game over), shouldn't be able to type or continue
      if (timesChecked>=4 && question1.compare(saved1)==false) {
        textFont(f, 90);
        fill(219, 18, 21);
        text("You lost!", width/2, height/1.2);
        textFont(f, 50);
        textAlign(CENTER,CENTER);
        text("Answer is: if",width/2,height/1.2+100);
        i=0;          //brings timer to 0
        totalScore=0;
        question1_lost=true;

        
        //Next button
        fill(38, 252, 247, 110);
        rectMode(CENTER);
        rect(width/12, height/1.1, w, h);
        fill(0);
        textAlign(CENTER, CENTER);
        textFont(f2, 30);
        text("Next", width/12, height/1.1);
        if (mousePressed && mouseX>width/12-w/2 && mouseX<width/12+w/2 && mouseY>height/1.1-h/2 && mouseY<=height/1.1+h/2) {
          page1=false;
        }
      }

      //Timer 1
      textFont(f2, 23);
      fill(0);
      textAlign(LEFT);
      text("Time: "+(int)i, width/8, height/6+50);

      if (i>=0 && correctAnswer==false) {
        i=i-0.02;
      }
      //////////////////
      if (i<=0 && timesChecked<4) {
        totalScore=0;
        question1_lost=true;

        textFont(f, 90);
        fill(219, 18, 21);
        text("Time is up!", width/2-250, height/1.2);
        textFont(f, 50);
        textAlign(CENTER,CENTER);
        text("Answer: if",width/2,height/1.2+100);
        //Next button
        fill(38, 252, 247, 110);
        rectMode(CENTER);
        rect(width/12, height/1.1, w, h);
        fill(0);
        textAlign(CENTER, CENTER);
        textFont(f2, 30);
        text("Next", width/12, height/1.1);
        if (mousePressed && mouseX>width/12-w/2 && mouseX<width/12+w/2 && mouseY>height/1.1-h/2 && mouseY<=height/1.1+h/2) {
          page1=false;
        }
      }
    }
  } else {
    cond_section2();
  }
}

void cond_section2() {
  if (page2) {
    if (text2==false) {
      //Conditionals - Second Text Portion
      String cond_title2 = "Else and else if Statements";

      String cond_text2 = "Conditional statements can be expanded with else and else if statements to execute code if the condition is found to be false. The else statement is equivalent to “otherwise, do this”. This is its syntax:";
      String cond_text2_ex = "if (condition) {";
      String cond_text2_ex2 = "//code to execute is true;";
      String cond_text2_ex3 = "} else {";
      String cond_text2_ex4 = "//code to execute is false;";

      String cond_text2_note = "Note: If the first condition is true then the second code following the “else” will not be executed.";
      String cond_text2_con = "Else if statements are used to test multiple conditions. When an else if is used, the conditional statements are evaluated in the order presented. As soon as one condition is found to be true, the corresponding code is executed and the remaining conditions are ignored. This is the syntax and structure:";
      String cond_text2_ex5 = "if (condition #1) {";
      String cond_text2_ex6 = "// code to execute if boolean expression #1 is true;";
      String cond_text2_ex7 = "} else if (condition #2) {";
      String cond_text2_ex8 = "// code to execute if boolean expression #2 is true;";
      String cond_text2_ex9 = "} else if (condition #3) {";
      String cond_text2_ex10 = "// code to execute if boolean expression #3 is true;";
      String cond_text2_ex11 = "} else {";
      String cond_text2_ex12 = "// code to execute if none of the above conditions are true;";

      imageMode(CENTER);
      tint(255, 70);
      image(diamond_background, width/2, height/2);

      fill(0);
      textFont(f2, 35);
      textAlign(CENTER, CENTER);
      text(cond_title2, width/2, height/12);

      textFont(f2, 19);
      textAlign(LEFT);
      text(cond_text2, width/2, height/4, 800, 150);
      text(cond_text2_ex, width/12, height/3.3);
      text(cond_text2_ex2, width/12+10, height/3.3+25);
      text(cond_text2_ex3, width/12, height/3.3+45);
      text(cond_text2_ex4, width/12+10, height/3.3+65);
      text("}", width/12, height/3.3+85);

      text(cond_text2_note, width/2, height/1.9, 800, 100);
      text(cond_text2_con, width/2, height/1.6, 800, 100);

      text(cond_text2_ex5, width/12, height/1.4+5);
      text(cond_text2_ex6, width/12+10, height/1.4+25);
      text(cond_text2_ex7, width/12, height/1.4+45);
      text(cond_text2_ex8, width/12+10, height/1.4+65);
      text(cond_text2_ex9, width/12, height/1.4+85);
      text(cond_text2_ex10, width/12+10, height/1.4+105);
      text(cond_text2_ex11, width/12, height/1.4+125);
      text(cond_text2_ex12, width/12+10, height/1.4+145);
      text("}", width/12, height/1.4+165);

      //Next button
      fill(38, 252, 247, 110);
      rectMode(CENTER);
      rect(width/1.1, height/1.1, w, h);
      fill(0);
      textAlign(CENTER, CENTER);
      textFont(f2, 30);
      text("Next", width/1.1, height/1.1);
      if (mousePressed && mouseX > width/1.1-w/2 && mouseX<width/1.1+w/2 && mouseY > height/1.1-h/2 && mouseY<height/1/1+h/2) {
        text2 = true;
        correct_answer_playing = false;  //change boolean back to false to be able to play sound again
        wrong_answer_playing = false;
        hint_playing = false;
      }
    } else {
      //Conditionals - Question 2 (true or false)
      String cond_question2 = "Decide whether the following statement is true or false:";
      String cond_question2A = "Else and else if are used to expand conditional statements to execute code if the condition is evaluated to “false”.";
      //boolean click1=false;
      //3 images
      imageMode(CENTER);
      diamond2.resize(120, 120);
      mining_tool.resize(100, 100);
      mining_tools.resize(120, 120);
      tint(255, 255);
      image(diamond2, width/1.1, height/1.13);
      image(mining_tool, width/12, height/12);
      image(mining_tools, width/1.1, height/10);

      textFont(f2, 23);
      fill(0);
      textAlign(LEFT);
      text(cond_question2, width/18, height/6+10);
      text(cond_question2A, width/2, height/5+70, 850, 100);

      tf1.display();
      tf1.check();
      
      
      //Timer 2
      textFont(f2, 23);
      fill(0);
      textAlign(LEFT);
      text("Time: "+(int)j, width/8-70, height/4+80);

      if (j>0 && tf1.timerCheck()==false) {
        j=j-0.02;
      }    
      textFont(f2, 40);
      fill(0, 255, 0);
      textAlign(CENTER, CENTER);
      
      
      if (tf1.timerCheck()==true) {
        totalScore1=40+(int)j;
        text("You've found "+(int)totalScore1+" diamonds!", width/2+10, height/1.2+50);
      }

      if (tf1.timesChecked>=2 && tf1.check==false && tf1.TFCheck==false) {
        textFont(f2, 23);
        fill(211, 157, 19);
        textAlign(CENTER, CENTER);
        text("The following statement is true because when using the else function in Processing.",width/2,height/1.5+20);
        text("You are typically giving a conditional as to whether or not the statement is true or false.",width/2,height/1.5+40);
        text("Typically you are going to use the else to say whether or not the statement is not true.",width/2,height/1.5+60);
        //Hint sound ((MAKE SURE TO INCLUDE IN OTHER HINTS)
        if (!hint.isPlaying() && hint_playing==false) {
          hint.play();
          hint.amp(0.2);
          hint_playing = true;
        }
      }
      
      if (j<=0 && lost==false) {
        tf1.timerCheck=true;
        totalScore1=0;

        textFont(f, 90);
        fill(219, 18, 21);
        text("Time is up!", width/2, height/1.2);
        textFont(f, 50);
        text("Answer: true",width/2,height/1.2+100);
        //Next button
        fill(38, 252, 247, 110);
        rectMode(CENTER);
        rect(width/12, height/1.1, w, h);
        fill(0);
        textAlign(CENTER, CENTER);
        textFont(f2, 30);
        text("Next", width/12, height/1.1);
        if (mousePressed && mouseX>width/12-w/2 && mouseX<width/12+w/2 && mouseY>height/1.1-h/2 && mouseY<=height/1.1+h/2) {
          page2=false;
        }
      }
      
      if(tf1.timesChecked>=4 && tf1.check==false && tf1.TFCheck==false){
        tf1.timerCheck=true;
        lost=true;
        textFont(f, 90);
        fill(219, 18, 21);
        text("You lost!", width/2, height/1.2);
        textFont(f, 50);
        text("Answer is: true",width/2,height/1.2+100);

        j=0;          //brings timer to 0
        totalScore1=0;

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
      }
    }
  } else {
    cond_section3();
  }
}

void cond_section3() {
  if (page3) {
    if (text3==false) {
      //Conditionals = Third Text Portion
      String cond_title3 = "Ampersands and Pipes";
      String cond_text3 = "We have learned the basics of simple conditional statements. However, sometimes, performing an action based on only one condition is not enough. We may want to check two or three conditions. This could be done using a “logical and” or a “logical or”. The “logical and” is represented by two ampersands (“&&”). Note: a single ampersand means something else in Processing. The “logical or” is represented with two vertical bars also known as “pipes” (“||”).";
      String cond_text3_con = "This is an example using the “logical and”:";
      String cond_text3_ex = "int x = 12;";
      String cond_text3_ex2 = "int y = 1;";
      String cond_text3_ex3 = "if (x > 10 || y < 0) {";
      String cond_text3_ex4 = "println(“Hello”);";
      String cond_text3_con2 = "This code will print “Hello” if x is greater than 10 or if y is less than 0.";

      imageMode(CENTER);
      tint(255, 70);
      image(diamond_background, width/2, height/2);

      fill(0);
      textFont(f2, 35);
      textAlign(CENTER, CENTER);
      text(cond_title3, width/2, height/12);

      textFont(f2, 20);
      textAlign(LEFT);
      text(cond_text3, width/2, height/3.2, 820, 150);
      text(cond_text3_con, width/15, height/2);

      text(cond_text3_ex, width/12, height/1.8);
      text(cond_text3_ex2, width/12, height/1.8+25);
      text(cond_text3_ex3, width/12, height/1.8+47);
      text(cond_text3_ex4, width/12+10, height/1.8+67);
      text("}", width/12, height/1.8+87);

      text(cond_text3_con2, width/15, height/1.3);

      //Next button
      fill(38, 252, 247, 110);
      rectMode(CENTER);
      rect(width/1.1, height/1.1, w, h);
      fill(0);
      textFont(f2, 30);
      textAlign(CENTER, CENTER);
      text("Next", width/1.1, height/1.1);
      if (mousePressed && mouseX > width/1.1-w/2 && mouseX<width/1.1+w/2 && mouseY > height/1.1-h/2 && mouseY<=height/1.1+h/2) {
        text3 = true;
        correct_answer_playing = false;
        wrong_answer_playing = false;
        gameover_playing = false;
        hint_playing = false;
      }
    } else {
      //Conditionals - Question 3 (multiple choice)
      String cond_question3 = "The “logical and” is represented by which of the following?";

      //3 images
      imageMode(CENTER);
      diamond2.resize(120, 120);
      mining_tool.resize(100, 100);
      mining_tools.resize(120, 120);
      tint(255, 255);
      image(diamond2, width/1.1, height/1.13);
      image(mining_tool, width/12, height/12);
      image(mining_tools, width/1.1, height/10);

      textFont(f2, 23);
      fill(0);
      textAlign(LEFT);
      text(cond_question3, width/18, height/5);

      mc1A.button_a("&");
      mc1A.button_b("||");
      mc1A.button_c("//");
      mc1A.button_d("&&");

      mc1A.check(mouseX, mouseY);
      if (mc1A.timesChecked>=2 && mc1A.right==false && mc1A.check==true) {
        textFont(f2, 23);
        fill(211, 157, 19);
        textAlign(CENTER, CENTER);
        text("It's not B or C.",width*.4,height/2);
        if (!hint.isPlaying() && hint_playing==false) {
          hint.play();
          hint.amp(0.2);
          hint_playing = true;
        }       
      }

      //Timer 3
      fill(0);
      textFont(f2, 23);
      textAlign(LEFT);
      text("Time: "+(int)k, width/8-70, height/5+50);
      if (k>0 && mc1A.timerCheck()==false) {
        k=k-0.02;
      }
      
      if (k<=0 && lost1==false) {
        mc1A.timerCheck=true;
        totalScore2=0;

        textFont(f, 90);
        fill(219, 18, 21);
        textAlign(CENTER,CENTER);
        text("Time is up!", width/2, height/1.2);
        textFont(f, 50);
        text("Answer: D",width/2,height/1.2+100);
        
        //Next button
        fill(38, 252, 247, 110);
        rectMode(CENTER);
        rect(width/12, height/1.1, w, h);
        fill(0);
        textAlign(CENTER, CENTER);
        textFont(f2, 30);
        text("Next", width/12, height/1.1);
        if (mousePressed && mouseX>width/12-w/2 && mouseX<width/12+w/2 && mouseY>height/1.1-h/2 && mouseY<=height/1.1+h/2) {
          page3=false;
        }
      }
      
      if(mc1A.timesChecked>=4 && mc1A.Answer!=4 && mc1A.check==true){
        lost1=true;
        textFont(f, 90);
        fill(219, 18, 21);
        textAlign(CENTER,CENTER);
        text("You lost!", width/2, height/1.2);
        textFont(f, 50);
        text("Answer: D",width/2,height/1.2+100);

        k=0;          //brings timer to 0
        mc1A.timerCheck=true;
        totalScore2=0;

        
        //Next button
        fill(38, 252, 247, 110);
        rectMode(CENTER);
        rect(width/12, height/1.1, w, h);
        fill(0);
        textAlign(CENTER, CENTER);
        textFont(f2, 30);
        text("Next", width/12, height/1.1);
        if (mousePressed && mouseX >= width/12-w/2 && mouseX<width/12+w/2 && mouseY > height/1.1-h/2 && mouseY<height/1.1+h/2) {
          page3 = false;
        }
      }


      fill(0, 255, 0);
      textFont(f2, 40);
      textAlign(CENTER, CENTER);
      if (mc1A.timerCheck()==true) {
        totalScore2=40+(int)k;
        text("You've found "+(int)totalScore2+" diamonds!", width/2+10, height/1.2+50);
      }
    }
  } else {
    cond_section4();
  }
}

void cond_section4() {
  if (page4) {
    if (text4 == false) {
      //Conditionals - Fourth Text Portion
      String cond_title4 = "Flowcharts";
      String cond_text4 = "Writing conditional statements can become very confusing especially when using multiple conditions and else and else if statements. To make this easier, you can use flowcharts. Flowcharts help you visualize conditional statements. ";
      String cond_text4_con = "Here are three examples of flowcharts using a simple if statement, an else statement, and an else if statement:";

      imageMode(CENTER);
      tint(255, 70);
      image(diamond_background, width/2, height/2);

      fill(0);
      textFont(f2, 35);
      textAlign(CENTER, CENTER);
      text(cond_title4, width/2, height/12);

      textFont(f2, 20);
      textAlign(LEFT);
      text(cond_text4, width/2, height/4, 800, 150);
      text(cond_text4_con, width/2, height/2.7, 800, 150);

      //flowchart image
      imageMode(CENTER);
      flowchart.resize(850, 430);
      tint(255, 255);
      image(flowchart, width/2+10, height/1.7+15);

      //Next button
      fill(38, 252, 247, 110);
      rectMode(CENTER);
      rect(width/1.1, height/1.1, w, h);
      fill(0);
      textFont(f2, 30);
      textAlign(CENTER, CENTER);
      text("Next", width/1.1, height/1.1);
      if (mousePressed && mouseX > width/1.1-w/2 && mouseX<width/1.1+w/2 && mouseY > height/1.1-h/2 && mouseY<height/1.1+h/2) {
        text4=true;
        correct_answer_playing = false;
        gameover_playing = false;
        hint_playing = false;
      }
    } else {
      //Conditionals - Question 4 (set in the correct order)
      String q4="Set program's actions in the correct order.";
      String q4A="If variable 'day' equals to 7, check what program will check first.";

      // answer choices
      String q4_1="1) Check whether day = 7 and the condition is true, so it will print “Saturday”.";
      String q4_2="2) Check whether day = 1 but the condition is false, so it will not print “Sunday”.";
      String q4_3="3) Check whether day = 4  but the condition is false, so it will not print “Wednesday”.";
      String q4_4="4) Exit conditional statements and continue with the rest of the program.";

      //3 images
      imageMode(CENTER);
      diamond2.resize(120, 120);
      mining_tool.resize(100, 100);
      mining_tools.resize(120, 120);
      tint(255, 255);
      image(diamond2, width/1.1, height/1.13);
      image(mining_tool, width/12, height/12);
      image(mining_tools, width/1.1, height/10);

      textFont(f2, 23);
      fill(0);
      textAlign(LEFT);
      text(q4, width/12, height/7);
      text(q4A, width/12, height/7+45);

      imageMode(CENTER);
      img.resize(640, 400);
      image(img, width/1.6, height/2.18);

      rectMode(CORNER);
      text(q4_1, width/20, height/3.5, 190, 500);
      text(q4_2, width/20, height/3.5+175, 190, 500);
      text(q4_3, width/23, height/1.38);
      text(q4_4, width/23, height/1.38+35);

      //blank field
      fill(255);
      rectMode(CORNER);
      rect(width/2.5, height/6+540, 150, 45);

      //Timer 4
      fill(0);
      textAlign(LEFT);
      text("Time:", width/12, height/7+90);
      text((int)m, width/12+60, height/7+90);
      if (m>0 && correctAnswer1==false) {
        m=m-0.02;
      }

      //type answer in blank field and save it
      set_q1.display(typing2, width/2.5+75, height/6+560);
      set_q1.display(saved2, width/2.5+75, height/6+560);

      //check answer
      if (checkAnswer2==true) {
        if (set_q1.compare(saved2)==true) {
          fill(0, 255, 0);
          textFont(f2, 40);
          textAlign(CENTER, CENTER);
          text("Correct!", width/2, height/1.2+40);
          correctAnswer1=true;
          totalScore3 = 40+(int)m;
          text("You've found "+(int)totalScore3+" diamonds!", width/2+10, height/1.2+80);

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
            page4 = false;
          }
        } else {
          if (!wrong_answer.isPlaying() && wrong_answer_playing==false) {
            wrong_answer.play();
            wrong_answer.amp(0.4);
            wrong_answer_playing = true;
          }
          fill(255, 0, 0);
          textFont(f2, 30);
          textAlign(CENTER, CENTER);
          text("Incorrect!", width/2-10, height/1.2+40);
          typing2="";
          saved2="";
        }
      }

      //FIX HINT***
      if (timesChecked2>=2 && set_q1.compare(saved2)==false) {
        textFont(f2, 23);
        fill(211, 157, 19);
        text("Follow the arrows by day!", width/20+170, height/1.2);
        if (!hint.isPlaying() && hint_playing==false) {
          hint.play();
          hint.amp(0.2);
          hint_playing = true;
        }
      }
      //Game Over
      if (timesChecked2>=4 && set_q1.compare(saved2)==false) {
        
        textFont(f, 90);
        fill(219, 18, 21);
        textAlign(CENTER, CENTER);
        text("You lost", width/2, height/1.2+100);
        textAlign(LEFT);
        textFont(f2, 30);
        text("Answer: 2,3,1,4", width/20+500, height/1.2+20);
        question2_lost=true;
        m=0;          //brings timer 4 to 0
        totalScore3=0;  //earned 0 points

        //Next button
        fill(38, 252, 247, 110);
        rectMode(CENTER);
        rect(width/12, height/1.1, w, h);
        fill(0);
        textAlign(CENTER, CENTER);
        textFont(f2, 30);
        text("Next", width/12, height/1.1);
        if (mousePressed && mouseX > width/12-w/2 && mouseX<width/12+w/2 && mouseY > height/1.1-h/2 && mouseY<height/1.1+h/2) {
          page4 = false;
        }
      }  

      if (m<=0 && timesChecked2<4) {
        totalScore3=0;
        question2_lost=true;

        textFont(f, 90);
        fill(219, 18, 21);
        text("Time is up!", width/2, height/1.2+100);
        
        textAlign(LEFT);
        textFont(f2, 30);
        text("Answer: 2,3,1,4", width/20+500, height/1.2+20);
        //Next button
        fill(38, 252, 247, 110);
        rectMode(CENTER);
        rect(width/12, height/1.1, w, h);
        fill(0);
        textAlign(CENTER, CENTER);
        textFont(f2, 30);
        text("Next", width/12, height/1.1);
        if (mousePressed && mouseX>width/12-w/2 && mouseX<width/12+w/2 && mouseY>height/1.1-h/2 && mouseY<=height/1.1+h/2) {
          page4=false;
        }
      }
    }
  } else {
    func_title1();
  }
}
void func_title1() {
  if (page5) {
    if (text5==false) {
      //Functions - First Text Portion
      String func_title1 = "What is a function?";
      String func_text1 = "A function is a program code that is packaged for repeated use and sometimes for one time use in order to hide the details. Functions are a means of taking the parts of our program and separating them out into modular pieces, making our code easier to read, as well as to revise. Before getting into the technical steps of writing functions, let’s highlight the importance and benefits of functions.";
      String func_text1_ex = "Modularity: Functions break down a large program into smaller parts, making the code easier to understand, read, and manage. We can store a chunk of code into a function, and call that function in our program whenever we need to.";
      String func_text1_ex2 = "Reusability: Functions allow us to reuse the code without having to retype it all over again. Therefore, it shortens the number of lines in your program, which is what we want.";

      imageMode(CENTER);
      tint(255, 70);
      image(diamond_background, width/2, height/2);

      fill(0);
      textFont(f2, 35);
      textAlign(CENTER, CENTER);
      text(func_title1, width/2, height/12, 800, 150);

      textFont(f2, 20);
      textAlign(LEFT);
      text(func_text1, width/2, height/3, 800, 150);
      text(func_text1_ex, width/2, height/1.8, 800, 150);
      text(func_text1_ex2, width/2, height/1.8+120, 800, 150);

      fill(38, 252, 247, 110);
      rectMode(CENTER);
      rect(width/1.1, height/1.1, w, h);
      fill(0);
      textFont(f2, 30);
      textAlign(CENTER, CENTER);
      text("Next", width/1.1, height/1.1);
      if (mousePressed && mouseX > width/1.1-w/1 && mouseX<width/1.1+w/2 && mouseY > height/1.1-h/2 && mouseY<height/1.1+h/2) {
        text5=true;
        correct_answer_playing = false;
        wrong_answer_playing = false;
        gameover_playing = false;
        hint_playing = false;
      }
    } else {
      //Functions - Question 5 (multiple choice)
      String func_question1 = "What are the two major benefits of using functions in our program?";

      //3 images
      imageMode(CENTER);
      diamond2.resize(120, 120);
      mining_tool.resize(100, 100);
      mining_tools.resize(120, 120);
      tint(255, 255);
      image(diamond2, width/1.1, height/1.13);
      image(mining_tool, width/12, height/12);
      image(mining_tools, width/1.1, height/10);

      //Question
      fill(0);
      textFont(f2, 23);
      textAlign(LEFT);
      text(func_question1, width/18, height/5);

      mc2A.button_a("Clarity");
      mc2A.button_b("Modularity");
      mc2A.button_c("Reusability");
      mc2A.button_d("Both b and c");

      mc2A.check(mouseX, mouseY);
      
      if (n<=0 && lost2==false) {
        mc2A.timerCheck=true;
        totalScore4=0;

        textFont(f, 90);
        fill(219, 18, 21);
        textAlign(CENTER,CENTER);
        text("Time is up!", width/2, height/1.2);
        textFont(f, 50);
        text("Answer: D",width/2,height/1.2+100);
        
        //Next button
        fill(38, 252, 247, 110);
        rectMode(CENTER);
        rect(width/12, height/1.1, w, h);
        fill(0);
        textAlign(CENTER, CENTER);
        textFont(f2, 30);
        text("Next", width/12, height/1.1);
        if (mousePressed && mouseX>width/12-w/2 && mouseX<width/12+w/2 && mouseY>height/1.1-h/2 && mouseY<=height/1.1+h/2) {
          page5=false;
        }
      }
      
      if(mc2A.timesChecked>=4 && mc2A.Answer!=4 && mc2A.check==true){
        lost2=true;
        textFont(f, 90);
        fill(219, 18, 21);
        textAlign(CENTER,CENTER);
        text("You lost!", width/2, height/1.2);
        textFont(f, 50);
        text("Answer: D",width/2,height/1.2+100);

        n=0;          //brings timer to 0
        mc2A.timerCheck=true;
        totalScore4=0;

        
        //Next button
        fill(38, 252, 247, 110);
        rectMode(CENTER);
        rect(width/12, height/1.1, w, h);
        fill(0);
        textAlign(CENTER, CENTER);
        textFont(f2, 30);
        text("Next", width/12, height/1.1);
        if (mousePressed && mouseX >= width/12-w/2 && mouseX<width/12+w/2 && mouseY > height/1.1-h/2 && mouseY<height/1.1+h/2) {
          page5 = false;
        }
      }
      
      //Timer 5
      fill(0);
      textFont(f2, 23);
      textAlign(LEFT);
      text("Time: "+(int)n, width/8-70, height/5+50);
      if (n>0 && mc2A.timerCheck()==false) {
        n=n-0.02;
      }

      fill(0, 255, 0);
      textFont(f2, 40);
      textAlign(CENTER, CENTER);
      if (mc2A.timerCheck()==true) {
        totalScore4=40+(int)n;
        text("You've found "+(int)totalScore4+" diamonds!", width/2+10, height/1.2+50);
      }
      
      if (mc2A.timesChecked>=2 && mc2A.right==false && mc2A.check==true) {
        textFont(f2, 23);
        fill(211, 157, 19);
        textAlign(CENTER, CENTER);
        text("It could be more than one right answer!",width*0.4,height/2);
        if (!hint.isPlaying() && hint_playing==false) {
          hint.play();
          hint.amp(0.2);
          hint_playing = true;
        }       
      }
      
      
    }
  } else {
    func_title2();
  }
}

void func_title2() {
  if (page6) {
    if (text6==false) {
      //Functions - Second Text Portion
      String func_title2A = "Writing and Calling Functions";
      String func_title2B = "The syntax for writing a function is:";
      String func_text2_ex = "returnType functionName (arguments) {";
      String func_text2_ex2 = "//code of function;";
      String func_text2_ex4 = "The syntax has 3 major parts: the return type, the function name, and the arguments.";
      String func_text2_ex5 = "For now, let’s focus on the function name along with its code, and how to call it. Let’s write a function that draws a red rectangle in the middle of the window.";
      String func_text2_ex6 = "void drawRedRect() {";
      String func_text2_ex7 = "fill(255,0,0);";
      String func_text2_ex8 = "rectMode(CENTER);";
      String func_text2_ex9 = "rect(width/2,height/2,100,50);";
      String func_text2_ex11 = "When naming your functions, name them to help you identify the code within that function. Don’t name it something completely random or that doesn’t relate to your code because then it defeats the purpose of using functions.";
      String func_text2_ex12 = "We wrote our function for drawing a red rectangle, however, it’s useless unless we call it in a part of our program that is being executed like this:";
      String func_text2_ex13 = "void draw() {";
      String func_text2_ex14 = "background(255);";
      String func_text2_ex15 = "drawRedRect();";

      imageMode(CENTER);
      tint(255, 70);
      image(diamond_background, width/2, height/2);

      fill(0);
      textFont(f2, 35);
      textAlign(CENTER, CENTER);
      text(func_title2A, width/2, height/12);

      textFont(f2);
      textAlign(LEFT);
      text(func_title2B, width/12-5, height/6);
      text(func_text2_ex, width/12, height/5+10);
      text(func_text2_ex2, width/12+10, height/5+32);
      text("}", width/12, height/5+52);

      text(func_text2_ex4, width/12-5, height/4+50);
      text(func_text2_ex5, width/2+3, height/4+120, 800, 100);

      text(func_text2_ex6, width/12, height/2.5+30);
      text(func_text2_ex7, width/12+10, height/2.5+55);
      text(func_text2_ex8, width/12+10, height/2.5+77);
      text(func_text2_ex9, width/12+10, height/2.5+98);
      text("}", width/12, height/2.5+117);

      text(func_text2_ex11, width/2+3, height/2+100, 800, 100);
      text(func_text2_ex12, width/2+3, height/2+200, 800, 100);

      text(func_text2_ex13, width/12, height/1.3+25);
      text(func_text2_ex14, width/12+10, height/1.3+47);
      text(func_text2_ex15, width/12+10, height/1.3+68);
      text("}", width/12, height/1.3+87);


      fill(38, 252, 247, 110);
      rectMode(CENTER);
      rect(width/1.1, height/1.1, w, h);
      fill(0);
      textFont(f2, 30);
      textAlign(CENTER, CENTER);
      text("Next", width/1.1, height/1.1);
      if (mousePressed && mouseX > width/1.1-w/2 && mouseX<width/1.1+w/2 && mouseY > height/1.1-h/2 && mouseY<height/1.1+h/2) {
        text6=true;
        correct_answer_playing = false;
        wrong_answer_playing = false;
        gameover_playing = false;
        hint_playing = false;
      }
    } else {
      //Functions - Question 6 (true or false)
      String func_question2 = "Decide whether the following statement is true or false:";
      String func_question2A = "Our function will be executed whether we call it or not in our program.";

      //3 images
      imageMode(CENTER);
      diamond2.resize(120, 120);
      mining_tool.resize(100, 100);
      mining_tools.resize(120, 120);
      tint(255, 255);
      image(diamond2, width/1.1, height/1.13);
      image(mining_tool, width/12, height/12);
      image(mining_tools, width/1.1, height/10);

      //Question
      fill(0);
      textFont(f2, 23);
      textAlign(LEFT);
      text(func_question2, width/18, height/5);
      text(func_question2A, width/18, height/4);

      tf2.display();
      tf2.check();
      
      if (tf2.timesChecked>=2 && tf2.check==false && tf2.TFCheck==true) {
        textFont(f2, 23);
        fill(211, 157, 19);
        textAlign(CENTER, CENTER);
        text("The answer is false because you must call a function in order to use it.",width/2,height/1.5+40);
        text("The computer will only do as you instruct it to do.",width/2,height/1.5+60);
        text("This is not machine learning, it is only a tool.",width/2,height/1.5+80);
        text("So if you do not tell the code to call a function then the code will not execute said function.",width/2,height/1.5+100);
        //Hint sound ((MAKE SURE TO INCLUDE IN OTHER HINTS)
        if (!hint.isPlaying() && hint_playing==false) {
          hint.play();
          hint.amp(0.2);
          hint_playing = true;
        }
      }
      
      if (o<=0 && lost3==false) {
        tf2.timerCheck=true;
        totalScore5=0;

        textFont(f, 90);
        fill(219, 18, 21);
        text("Time is up!", width/2, height/1.2);
        textFont(f, 50);
        text("Answer: true",width/2,height/1.2+100);
        //Next button
        fill(38, 252, 247, 110);
        rectMode(CENTER);
        rect(width/12, height/1.1, w, h);
        fill(0);
        textAlign(CENTER, CENTER);
        textFont(f2, 30);
        text("Next", width/12, height/1.1);
        if (mousePressed && mouseX>width/12-w/2 && mouseX<width/12+w/2 && mouseY>height/1.1-h/2 && mouseY<=height/1.1+h/2) {
          page6=false;
        }
      }
      
      if(tf2.timesChecked>=4 && tf2.check==false && tf2.TFCheck==true){
        tf2.timerCheck=true;
        lost3=true;
        textFont(f, 90);
        fill(219, 18, 21);
        text("You lost!", width/2, height/1.2);
        textFont(f, 50);
        text("Answer is: true",width/2,height/1.2+100);

        o=0;          //brings timer to 0
        totalScore5=0;

       
        //Next button
        fill(38, 252, 247, 110);
        rectMode(CENTER);
        rect(width/12, height/1.1, w, h);
        fill(0);
        textAlign(CENTER, CENTER);
        textFont(f2, 30);
        text("Next", width/12, height/1.1);
        if (mousePressed && mouseX >= width/12-w/2 && mouseX<width/12+w/2 && mouseY > height/1.1-h/2 && mouseY<height/1.1+h/2) {
          page6 = false;
        }
      }
      
      
      
      
      //Timer 6
      fill(0);
      textFont(f2, 23);
      textAlign(LEFT);
      text("Time: "+(int)o, width/8-70, height/4+50);
      if (o>0 && tf2.timerCheck()==false) {
        o=o-0.02;
      }

      fill(0, 255, 0);
      textFont(f2, 40);
      textAlign(CENTER, CENTER);
      if (tf2.timerCheck()==true) {
        totalScore5=40+(int)o;
        text("You've found "+(int)totalScore5+" diamonds!", width/2+10, height/1.2+50);
      }
      
      
    }
  } else {
    func_title3();
  }
}

void func_title3() {
  if (page7) {
    if (text7==false) {
      //Functions - Third Text Portion
      String func_title3 = "Arguments";
      String func_text3_ex = "Arguments also known as parameters are values that are “passed” into a function. It’s pretty simple to add arguments to your function - arguments are simply variable declarations inside the parenthesis following your function name. Let’s return to our previous function example, but this time we’ll add arguments.";
      String func_text3_ex2 = "void drawRedRect(int w, int h) {";
      String func_text3_ex3 = "fill(255,0,0);";
      String func_text3_ex4 = "rectMode(CENTER);";
      String func_text3_ex5 = "rect(width/2,height/2,w,h);";
      String func_text3_ex7 = "In our new function, we added 2 arguments both of type integer, and then we added them into our rect() function as variables (w for width and h for height). Note: Arguments act as local variables to a function meaning that they’re only accessible within that function.";
      String func_text3_ex8 = "When you call your function, you have to pass the same number of arguments and the same type as declared within the arguments of your function. For example:";
      String func_text3_ex9 = "void draw() {";
      String func_text3_ex10 = "background(255);";
      String func_text3_ex11 = "drawRedRect(30,60);";
      String func_text3_ex13 = "This code will draw a red rectangle in the middle of the window with a width of 30 and a height of 60.";

      imageMode(CENTER);
      tint(255, 70);
      image(diamond_background, width/2, height/2);

      fill(0);
      textFont(f2, 35);
      textAlign(CENTER, CENTER);
      text(func_title3, width/2, height/12);

      textFont(f2);
      textAlign(LEFT);
      text(func_text3_ex, width/2, height/4, 800, 150);
      text(func_text3_ex2, width/12, height/3+5);
      text(func_text3_ex3, width/12+10, height/3+25);
      text(func_text3_ex4, width/12+10, height/3+47);
      text(func_text3_ex5, width/12+10, height/3+68);
      text("}", width/12, height/3+87);

      text(func_text3_ex7, width/2, height/2+30, 800, 100);
      text(func_text3_ex8, width/2, height/2+135, 800, 100);

      text(func_text3_ex9, width/12, height/1.4+10);
      text(func_text3_ex10, width/12+10, height/1.4+35);
      text(func_text3_ex11, width/12+10, height/1.4+57);
      text("}", width/12, height/1.4+77);

      text(func_text3_ex13, width/2-25, height/1.4+150, 750, 100);

      fill(38, 252, 247, 110);
      rectMode(CENTER);
      rect(width/1.1, height/1.1, 100, 80);
      fill(0);
      textFont(f2, 30);
      textAlign(CENTER, CENTER);
      text("Next", width/1.1, height/1.1);
      if (mousePressed && mouseX > width/1.1-w/2 && mouseX<width/1.1+w/2 && mouseY > height/1.1-h/2 && mouseY<height/1.1+h/2) {
        text7=true;
        correct_answer_playing = false;
        wrong_answer_playing=false;
        gameover_playing = false;
        hint_playing = false;
      }
    } else {
      //Functions - Question 7 (fill in the blank)
      String fb1="Complete the following function code to draw a blue circle anywhere within our window with any size. (Don’t worry about calling the function).";
      String fb2="void drawBlueCircle(int x, int y, int";
      String fb2A=", int h) {";
      String fb3="fill(0,0,255);";
      String fb4="ellipseMode(CENTER);";
      String fb5="ellipse(x,y,w,h);";
      String fb6="}";

      //3 images
      imageMode(CENTER);
      diamond2.resize(120, 120);
      mining_tool.resize(100, 100);
      mining_tools.resize(120, 120);
      tint(255, 255);
      image(diamond2, width/1.1, height/1.13);
      image(mining_tool, width/12, height/12);
      image(mining_tools, width/1.1, height/10);

      //Question
      fill(0);
      textFont(f2, 23);
      textAlign(LEFT);
      text(fb1, width/2, height/3.8, 800, 150);
      text(fb2, width/8, height/2.5);
      text(fb2A, width/8+410, height/2.5);
      text(fb3, width/8+10, height/2.5+40);
      text(fb4, width/8+10, height/2.5+80);
      text(fb5, width/8+10, height/2.5+120);
      text(fb6, width/8, height/2.5+160);

      //Blank field
      rectMode(CENTER);
      fill(255);
      rect(width/8+380, height/2.5-10, 41, 23);

      question2.display(typing3, width/8+374, height/2.5-3);
      question2.display(saved3, width/8+374, height/2.5-3);

      //checks the typed answer
      if (checkAnswer3) {
        if (question2.compare(saved3)==true) {
          textFont(f2, 40);
          fill(0, 255, 0);
          rectMode(CENTER);
          text("Correct!", width/2-80, height/1.2);
          correctAnswer2=true;
          //Score
          totalScore6=40+(int)p;
          text("You've found "+(int)totalScore6+" diamonds!", width/2-220, height/1.2+50);

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
          if (mousePressed && mouseX>width/12-w/2 && mouseX<width/12+w/2 && mouseY>height/1.1-h/2 && mouseY<=height/1.1+h/2) {
            page7=false;
          }
        } else {
          //FIX
          if (!wrong_answer.isPlaying() && wrong_answer_playing==false) {
            wrong_answer.play();
            wrong_answer.amp(0.4);
            wrong_answer_playing = true;
          }
          textFont(f2, 40);
          fill(255, 0, 0);
          text("Incorrect!", width/2, height/2);
          typing3="";
          saved3="";
        }
      }

      //Fix hint
      if (timesChecked3>=2 && question2.compare(saved3)==false) {
        textFont(f2, 23);
        fill(211, 157, 19);
        textAlign(CENTER, CENTER);
        text("Look at the ellipse shape!", width/8+200, height/2+172);
        if (!hint.isPlaying() && hint_playing==false) {
          hint.play();
          hint.amp(0.2);
          hint_playing = true;
        }
      }

      //Once you lose (game over), shouldn't be able to type or continue
      if (timesChecked3>=4 && question2.compare(saved3)==false) {
        textFont(f, 90);
        fill(219, 18, 21);
        question3_lost=true;
        textAlign(CENTER, CENTER);
        text("You lost!", width/2, height/1.2);
        textFont(f, 50);
        text("Answer: w", width/2, height/1.2+100);

        p=0;          //brings timer 7 to 0
        totalScore6=0;

        //Next button
        fill(38, 252, 247, 110);
        rectMode(CENTER);
        rect(width/12, height/1.1, w, h);
        fill(0);
        textAlign(CENTER, CENTER);
        textFont(f2, 30);
        text("Next", width/12, height/1.1);
        if (mousePressed && mouseX > width/12-w/2 && mouseX<width/12+w/2 && mouseY > height/1.1-h/2 && mouseY<height/1.1+h/2) {
          page7 = false;
        }
      }

      //Timer 7 
      textFont(f2, 23);
      fill(0);
      textAlign(LEFT);
      text("Time: "+(int)p, width/8-70, height/3.8+50);
      if (p>0 && correctAnswer2==false) {
        p=p-0.02;
      }


      if (p<=0 && timesChecked3<4) {
        totalScore6=0;
        question3_lost=true;

        textFont(f, 90);
        fill(219, 18, 21);
        text("Time is up!", width/2, height/1.2);
        textFont(f, 50);
        text("Answer: w", width/2, height/1.2+100);
        //Next button
        fill(38, 252, 247, 110);
        rectMode(CENTER);
        rect(width/12, height/1.1, w, h);
        fill(0);
        textAlign(CENTER, CENTER);
        textFont(f2, 30);
        text("Next", width/12, height/1.1);
        if (mousePressed && mouseX>width/12-w/2 && mouseX<width/12+w/2 && mouseY>height/1.1-h/2 && mouseY<=height/1.1+h/2) {
          page7=false;
        }
      }
    }
  } else {
    func_title4();
  }
}

void func_title4() {
  if (page8) {
    if (text8==false) {
      //Functions - Fourth Text Portion
      String func_title4 = "Return types";
      String func_text4_ex = "The last part of a function is the return type. A return type is the data type that the function returns. Let’s look again at our drawRedRect() function.";
      String func_text4_ex2 = "void drawRedRect(int w, int h) {";
      String func_text4_ex3 = "fill(255,0,0);";
      String func_text4_ex4 = "rectMode(CENTER);";
      String func_text4_ex5 = "rect(width/2,height/2,w,h);";
      String func_text4_ex7 = "Our return type here is void. But what does void mean? Void simply means that the function doesn’t return anything. In this case, we are simply drawing a red rectangle - we are not returning a value. However, let’s say that we want to write a function that returns a number of type int.";
      String func_text4_ex9 = "int multiply(int a, int b) {";
      String func_text4_ex11 = "int total = a * b;";
      String func_text4_ex12 = "return total;";
      String func_text4_ex13 = "Here, we declare our return type, int, with 2 parameters also of type int. In our function, we declare another int variable that multiples a and b together, and finally we return the total. Our return type specifies that the function must always return a value of the same data type, and this is done with a return statement. In this case, the function will always return an integer value. As soon as the return statement is executed, the program exits the function and sends the returned value back to the location in the code where the function was called.";

      imageMode(CENTER);
      tint(255, 70);
      image(diamond_background, width/2, height/2);

      fill(0);
      textFont(f2, 35);
      textAlign(CENTER, CENTER);
      text(func_title4, width/2, height/12);

      textFont(f2);
      textAlign(LEFT);
      text(func_text4_ex, width/2, height/4, 800, 150);

      text(func_text4_ex2, width/12, height/3+5-60);
      text(func_text4_ex3, width/12+10, height/3+25-60);
      text(func_text4_ex4, width/12+10, height/3+47-60);
      text(func_text4_ex5, width/12+10, height/3+68-60);
      text("}", width/12, height/3+87-60);

      text(func_text4_ex7, width/2, height/2+30-50, 800, 150);

      text(func_text4_ex9, width/12, height/1.4+10-140);
      text(func_text4_ex11, width/12+10, height/1.4+37-140);
      text(func_text4_ex12, width/12+10, height/1.4+57-140);
      text("}", width/12, height/1.4+77-140);

      text(func_text4_ex13, width/2, height/1.4+50, 800, 200);

      fill(38, 252, 247, 110);
      rectMode(CENTER);
      rect(width/1.1, height/1.1, 100, 80);
      fill(0);
      textFont(f2, 30);
      textAlign(CENTER, CENTER);
      text("Next", width/1.1, height/1.1);
      if (mousePressed && mouseX > width/1.1-w/2 && mouseX<width/1.1+w/2 && mouseY > height/1.1-h/2 && mouseY<height/1.1+h/2) {
        text8=true;
        correct_answer_playing = false;
        wrong_answer_playing=false;
        gameover_playing = false;
        hint_playing = false;
      }
    } else {
      //Functions - Question 4 (set in the correct order)
      String q8="Rearrange the following code by selecting them in the correct order.";
      String q8A="Write a function that returns a float and adds three numbers together.";

      String q8_1="1) float total = a + b + c;";
      String q8_2="2) return total;";
      String q8_3="3) float sum(float a, float b, float c) {";
      String q8_4="4) }";

      //3 images
      imageMode(CENTER);
      diamond2.resize(120, 120);
      mining_tool.resize(100, 100);
      mining_tools.resize(120, 120);
      tint(255, 255);
      image(diamond2, width/1.1, height/1.13);
      image(mining_tool, width/12, height/12);
      image(mining_tools, width/1.1, height/10);

      textFont(f2, 23);
      fill(0);
      textAlign(LEFT);
      text(q8, width/12, height/7);
      text(q8A, width/12, height/7+45);

      rectMode(CORNER);
      text(q8_1, width/12, height/7+150);
      text(q8_2, width/12, height/7+200);
      text(q8_3, width/12, height/7+250);
      text(q8_4, width/12, height/7+300);

      //blank field
      fill(255);
      rectMode(CORNER);

      rect(width/2.5, height/7+400, 150, 45);

      //Timer 8
      fill(0);
      textAlign(LEFT);
      text("Time:", width/12, height/7+90);
      text((int)q, width/12+60, height/7+90);
      if (q>0 && correctAnswer3==false) {
        q=q-0.02;
      }

      //type answer in blank field and save it
      set_q2.display(typing4, width/2.5+75, height/7+420);
      set_q2.display(saved4, width/2.5+75, height/7+420);

      //check answer
      if (checkAnswer4==true) {
        if (set_q2.compare(saved4)==true) {
          fill(0, 255, 0);
          textFont(f2, 40);
          textAlign(CENTER, CENTER);
          rectMode(CENTER);
          text("Correct!", width/2, height/1.2+40);
          correctAnswer3=true;
          totalScore7 = 40+(int)q;
          text("You've found "+(int)totalScore7+" diamonds!", width/2+10, height/1.2+80);

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
            page8 = false;
          }
        } else {
          if (!wrong_answer.isPlaying() && wrong_answer_playing==false) {
            wrong_answer.play();
            wrong_answer.amp(0.4);
            wrong_answer_playing = true;
          }
          fill(255, 0, 0);
          textFont(f2, 30);
          textAlign(CENTER, CENTER);
          text("Incorrect!", width/2-10, height/1.2);
          typing4="";
          saved4="";
        }
      }

      //FIX HINT***
      if (timesChecked4>=2 && set_q2.compare(saved4)==false) {
        textFont(f2, 23);
        fill(211, 157, 19);
        textAlign(CENTER, CENTER);
        text("Check the '{}' symbols", width/8+100, height/2+35);
        if (!hint.isPlaying() && hint_playing==false) {
          hint.play();
          hint.amp(0.2);
          hint_playing = true;
        }
      }

      //Game Over
      if (timesChecked4>=4 && set_q2.compare(saved4)==false) {
        textFont(f, 90);
        fill(219, 18, 21);
        textAlign(CENTER, CENTER);
        question4_lost=true;
        text("You lost", width/2, height/1.3);
        textFont(f, 50);
        text("Answer: 3,1,2,4", width/2, height/1.3+150);
        q=0;          //brings timer 8 to 0
        totalScore7=0;

        //Next button
        fill(38, 252, 247, 110);
        rectMode(CENTER);
        rect(width/12, height/1.1, w, h);
        fill(0);
        textAlign(CENTER, CENTER);
        textFont(f2, 30);
        text("Next", width/12, height/1.1);
        if (mousePressed && mouseX > width/12-w/2 && mouseX<width/12+w/2 && mouseY > height/1.1-h/2 && mouseY<height/1.1+h/2) {
          page8 = false;
        }
      }

      if (q<=0 && timesChecked4<4) {
        totalScore7=0;
        question4_lost=true;

        textFont(f, 90);
        fill(219, 18, 21);
        text("Time is up!", width/2, height/1.2);
        textFont(f, 50);
        text("Answer: 3,1,2,4", width/2, height/1.3+150);
        //Next button
        fill(38, 252, 247, 110);
        rectMode(CENTER);
        rect(width/12, height/1.1, w, h);
        fill(0);
        textAlign(CENTER, CENTER);
        textFont(f2, 30);
        text("Next", width/12, height/1.1);
        if (mousePressed && mouseX>width/12-w/2 && mouseX<width/12+w/2 && mouseY>height/1.1-h/2 && mouseY<=height/1.1+h/2) {
          page8=false;
        }
      }
    }
  } else {
    table.table(saved);

    textFont(f);
    fill(211, 157, 19);
    textSize(100);
    text("Leaderboard:", width/2, height/10);
    fill(0);
    textFont(f2, 40);
    for (int i=0; i<2; i++) {
      for (int j=0; j<names.length; j++) {
        fill(255);
        rect(width/3+300*i, height/4+100*j, 300, 100);
      }
    }

    fill(0);
    int spacing=0;
    for (int i=0; i<names.length; i++) {
      text(names[i], width/3, height/4+(100*spacing));
      text(score[i], width/3+300, height/4+(100*spacing));
      spacing++;
    }  

    //2 diamond images
    imageMode(CENTER);
    diamond1.resize(200, 200);
    image(diamond1, width/6-30, height/1.2);
    image(diamond1, width/1.2+30, height/1.2);

    textFont(f);
    textSize(52);
    fill(211, 157, 19);
    rectMode(CENTER);
    rect(width/2, height/1.1, 400, 100);
    fill(255);
    text("Play Again", width/2, height/1.1);
    if (mouseX>width/2-200 && mouseX<width/2+200 && mouseY>height/1.1-50 && mouseY<height/1.1+50 && mousePressed) {
      table.checkRows=false;
      instrCheck = false;
      user = false;
      game = false;

      text1 = false;
      text2=false;
      text3 = false;
      text4 = false;
      text5 = false;
      text6 = false;
      text7 = false;
      text8 = false;

      fill_blank = false;

      checkAnswer=false;
      checkAnswer1=false;
      checkAnswer2=false;
      checkAnswer3=false;
      checkAnswer4=false;

      page1=true;
      page2=true;
      page3=true;
      page4=true;
      page5=true;
      page6=true;
      page7=true;
      page8=true;

      timesChecked=0;
      timesChecked2=0;
      timesChecked3=0;
      timesChecked4=0;

      correctAnswer=false;
      correctAnswer1=false;
      correctAnswer2=false;
      correctAnswer3=false;

      typing = "";
      saved = "";
      typing1 = "";
      saved1 = "";
      saved2="";
      typing2="";
      typing3 = "";
      saved3 = "";
      typing4 = "";
      saved4 = "";
      checkUser=false;

      i=60.0;
      j=60.0;
      k=60.0;
      l=60.0;
      m=60.0;
      n=60.0;
      o=60.0;
      p=60.0;
      q=60.0;
      
      tf1.TFCheck = false;
      tf1.check=true;
      tf1.right=false;
      tf1.timerCheck=false;
      tf1.timesChecked=0;
      
      tf2.check=true;
      tf2.TFCheck = false;
      tf2.right=false;
      tf2.timerCheck=false;
      tf2.timesChecked=0;

      mc1A.answer = 0;
      mc1A.check=false;
      mc1A.switchPage=false;
      mc1A.right=false;
      mc1A.timerCheck=false;
      mc1A.timesChecked=0;
      
      mc2A.answer = 0;
      mc2A.check=false;
      mc2A.switchPage=false;
      mc2A.right=false;
      mc2A.timerCheck=false;
      mc2A.timesChecked=0;

      correct_answer_playing = false;
      wrong_answer_playing = false;
      gameover_playing = false;
      story_playing = false;
      intro_playing = false;
      hint_playing = false;

      question1_lost=false;
      question2_lost=false;
      question3_lost=false;
      question4_lost=false;
      
      lost=false;
      lost1=false;
      lost2=false;
      lost3=false;
      
      enter=true;
    }
  }
}
void keyPressed() {
  if(totalTime>=550){
    storyCheck=true;
  }
  fill_blank=true;

  if (user==true && game==false && enter==true) {
    if (key == '\n' ) {
      saved = typing;
      // A String can be cleared by setting it equal to ""
      typing = "";
      enter=false;
    } else {
      // Otherwise, concatenate the String
      // Each character typed by the user is added to the end of the String variable.
      typing = typing + key;
    }
  }

  if (game) {
    if (text1 && question1_lost==false && correctAnswer==false) {
      if (key == '\n') {
        saved1 = typing1;
        //when you press enter, change value of checktyping to stop typing in that box
        question1.compare(saved1);
        //Allows to play wrong_answer sound again(works for all fill blank and set order)
        if (question1.compare(saved1)==false) {
          wrong_answer_playing=false;
        }
        timesChecked++;
        checkAnswer=true;
      } else {
        typing1 = typing1 + key;
        checkAnswer=false;
      }
    }

    if (text4 && question2_lost==false && correctAnswer1==false) {
      if (key == '\n') {
        saved2 = typing2;
        //when you press enter, change value of checktyping to stop typing in that box
        set_q1.compare(saved2);
        if (set_q1.compare(saved2)==false) {
          wrong_answer_playing=false;
        }
        timesChecked2++;
        checkAnswer2=true;
      } else {
        typing2 = typing2 + key;
        checkAnswer2=false;
      }
    }
    if (text7 && question3_lost==false && correctAnswer2==false) {
      if (key == '\n') {
        saved3 = typing3;
        //when you press enter, change value of checktyping to stop typing in that box
        question2.compare(saved3);
        if (question2.compare(saved3)==false) {
          wrong_answer_playing=false;
        }
        timesChecked3++;
        checkAnswer3=true;
      } else {
        typing3 = typing3 + key;
        checkAnswer3=false;
      }
    }
    if (text8 && question4_lost==false && correctAnswer3==false) {
      if (key == '\n') {
        saved4 = typing4;
        //when you press enter, change value of checktyping to stop typing in that box
        set_q2.compare(saved4);
        if (set_q2.compare(saved3)==false) {
          wrong_answer_playing=false;
        }
        timesChecked4++;
        checkAnswer4=true;
      } else {
        typing4 = typing4 + key;
        checkAnswer4=false;
      }
    }
  }
}
