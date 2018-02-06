class Button {
  //member variables
  int x, y, w, h, v;
  char o;
  boolean hov, num;
  //Constructor
  Button(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  Button asNumber(int v){
    num = true;
    this.v = v;
    return this;
  }
  
  Button asOperation(char o){
    num = false;
    this.o = o;
    return this;
  }
  //display method
  void display() {
    
    fill(180,180,180,180);
    noStroke();
    if(hov) {
      fill(180);
    } else {
      fill(180);
    }
    stroke(0);
    //rect(x+95,y+378,w+5,h+20,0);
    fill(0); 
  if(num){
   // text(v,x+500,y+300);
  }else {
   // text(o,x+10,y+15);
  }
  
    
    
  }
  //Hover method
  void over() {
    hov = mouseX>x && mouseX<x+w && mouseY>y && mouseY<y+h;
  }
}