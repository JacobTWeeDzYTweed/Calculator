Button[] numButtons = new Button[10];
Button[] opButtons = new Button [12];
String ls, rs;
float ans; 
char op;
boolean left, eq;

void setup() {
  size(715, 890);
  ls = "0";
  rs = "0";
  ans = 0.0;
  op = ' ';
  left = true;
  eq = false;
  numButtons[0] = new Button(370, 750, 90, 60).asNumber(0);
  numButtons[1] = new Button(105, 550, 90, 70).asNumber(1);
  numButtons[2] = new Button(200, 550, 145, 70).asNumber(2);
  numButtons[3] = new Button(345, 550, 120, 70).asNumber(3);
  numButtons[4] = new Button(105, 620, 90, 70).asNumber(4);
  numButtons[5] = new Button(200, 620, 145, 70).asNumber(5);
  numButtons[6] = new Button(345, 620, 120, 70).asNumber(6);
  numButtons[7] = new Button(105, 690, 90, 60).asNumber(7);
  numButtons[8] = new Button(200, 690, 145, 60).asNumber(8);
  numButtons[9] = new Button(345, 690, 120, 60).asNumber(9);

  opButtons[0] = new Button(145, 500, 20, 20).asOperation('C');
  opButtons[1] = new Button(185, 500, 20, 20).asOperation('.');
  opButtons[2] = new Button(225, 500, 20, 20).asOperation('^');
  opButtons[3] = new Button(262, 500, 20, 20).asOperation('!');
  opButtons[4] = new Button(300, 500, 20, 20).asOperation('P');
  opButtons[5] = new Button(342, 500, 20, 20).asOperation('%');
  opButtons[6] = new Button(460, 550, 90, 44).asOperation('/');
  opButtons[7] = new Button(460, 600, 90, 44).asOperation('*');
  opButtons[8] = new Button(460, 650, 90, 40).asOperation('-');
  opButtons[9] = new Button(460, 700, 90, 40).asOperation('+');
  opButtons[10] = new Button(460, 750, 90, 60).asOperation('n');
  opButtons[11] = new Button(105, 750, 200, 60).asOperation('=');
}

void draw() {
  PImage img;
  img = loadImage("Picture2.png");
  background(img);
  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].over();
  }
  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].over();
  }
  updateDisplay();
}

void mousePressed() {
  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].hov && left) {
      ls += numButtons[i].v;
    } else if (numButtons[i].hov && !left) {
      rs += numButtons[i].v;
    }
  }

  for (int i=0; i<opButtons.length; i++) {
    if (opButtons[i].hov && opButtons[i].o == '+') {
      left = false;
      op=opButtons[i].o;
      rs = "";
    } else if (opButtons[i].hov && opButtons[i].o == '-') {
      left = false;
      op=opButtons[i].o;
      rs = "";
    } else if (opButtons[i].hov && opButtons[i].o == '*') {
      left = false;
      op=opButtons[i].o;
      rs = "";
    } else if (opButtons[i].hov && opButtons[i].o == '/') {
      left = false;
      op=opButtons[i].o;
      rs = "";
    } else if (opButtons[i].hov && opButtons[i].o == 'C') {
      performClear();
    } else if (opButtons[i].hov && opButtons[i].o == '=') {
      eq = true;
      performCalc();
    } else if (opButtons[i].hov && opButtons[i].o == 'n') {
      if (left) {
        ans = float(ls)*-1;
        ls = str((float)ans);
      } else {
        ans = float(ls)*-1;
        rs = str((float)ans);
      }
    } else if (opButtons[i].hov && opButtons[i].o == '.') {
      if (left) {
        ls += opButtons[i].o;
      } else {
        rs += opButtons[i].o;
      }
    } else if (opButtons[i].hov && opButtons[i].o == '^') {
      if (left) {
        ans = float(ls)*float(ls);
        ls = str((float)ans);
      } else {
        ans = float(rs)*float(rs);
        rs = str((float)ans);
      }
    } else if (opButtons[i].hov && opButtons[i].o == '!') {
      if (left) {
        ans = float(ls)*float(ls)*float(ls);
        ls = str((float)ans);
      } else {
        ans = float(rs)*float(rs)*float(rs);
        rs = str((float)ans);
      }
    } else if (opButtons[i].hov && opButtons[i].o == 'P') {
      if (left) {
        ans = float(ls)*3.14;
        ls = str((float)ans);
      } else {
        ans = float(rs)*3.14;
        ls = str((float)ans);
      }
    } else if (opButtons[i].hov && opButtons[i].o == '%') {
      if (left) {
        ans = float(ls)*0.01;
        ls = str((float)ans);
      } else {
        ans = float(rs)*0.01;
        rs = str((float)ans);
      }
    }
  }
}

void performClear() {
  ls = "0";
  rs = "0";
  ans = 0.0;
  op = ' ';
  left = true;
  eq = false;
}


void updateDisplay() {
  fill(255);
  textSize(30);
  textFont(loadFont("04b30-30.vlw"));
  if (eq) {
    text((float)ans, 140, 470);
  } else {
    if (left) {
      text(ls, 140, 470);
    } else { 
      text(rs, 140, 470);
    }
  }
}

void performCalc() {
  switch(op) {
  case '+':
    ans = float(ls)+float(rs);
    ls = str((float)ans);
    left = true;
    break;
  case '-':
    ans = float(ls)-float(rs);
    ls = str((float)ans);
    left = true;
    break;
  case '*':
    ans = float(ls)*float(rs);
    ls = str((float)ans);
    left = true;
    break;
  case '/':
    ans = float(ls)/float(rs);
    ls = str((float)ans);
    left = true;
    break;
  }
}