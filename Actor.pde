// A class describes a thing,
// including it's properties (kind of like adjectives)
// and methods of interacting with that thing (kind of like verbs).
// Our Actor class will describe the item on the screen 
// that is controllable by the person playing this game
// Our Actors can represent people (like ours player themself)
// or objects that people interact with (like props in a play).

class Actor {
  int BALL=0;
  int PICTURE=1;
  
  PShape ball;
  PImage picture;
  int a_type=0;
  int a_size=50;
  float a_rotation=0;
  float a_X=0;
  float a_Y=0;
  color a_color=color(255);
  
  // Here we define a method for creating a new Actor variable;
  Actor(int type, String file) { 
  this.set_type(type);
    if (this.a_type==BALL) {
      fill(a_color);
      this.ball = createShape(ELLIPSE,a_X,a_Y,a_size,a_size); 
    }
    else if (this.a_type==PICTURE) {
      this.picture = new PImage();
      this.picture = loadImage (file);   
    }
      
  }
  
  // Here we define a second method for creating a new Actor.
  // This is called "overloading a method" and allows us 
  // to have several ways of doing the same, or almost the same thing.
  Actor(int type) {
    this.set_type(type); 
    if (this.a_type==BALL) {
      fill(a_color);
      this.ball = createShape(ELLIPSE,a_X,a_Y,a_size,a_size); 
    }
    else if (this.a_type==PICTURE) {
      this.picture = new PImage();
      this.picture = loadImage ("arch.png");   
    }
      
  }
  
  int get_type () {
    return this.a_type;
  }
  
  float get_X() {
    return this.a_X;
  }
  
  float get_Y() {
    return this.a_Y;
  }
  
  int get_width() {
    // We need to do different things 
    // depending on what type of Actor we have created.
    // If it's a BALL type Actor, 
    if (this.a_type==BALL) {
       // we answer like this:
       return int(this.a_size);
    }
    // otherwise, if it's a PICTURE type Actor,
    else if (this.a_type==PICTURE) {
      // we answer like this:
      return  int(this.picture.width);
    }
    // If it's none of these, we answer with a zero.
    return 0;
  }

  int get_height() {
    if (this.a_type==BALL) {
       return int(this.a_size);
    }
    else if (this.a_type==PICTURE) {
      return  int(this.picture.height);
    }
   return 0;
  }
  
  void set_type (int t) {
    this.a_type = t;
  }
  
  void set_size(int s) {
    this.a_size = s;
  }
  
  void set_color(color c) {
    this.a_color = c;
    this.ball.setFill(this.a_color);
  }
  
  void set_border_weight(int b) {
    this.ball.setStrokeWeight(b);
  }
  
  void set_border_color(color c) {
    this.ball.setStroke(c);
  }

  void move (float new_x, float new_y) {
      this.a_X+=new_x;
      this.a_Y+=new_y;
    }
  
  void display () {   
    if (this.a_type==BALL) {
      shape(this.ball,this.a_X,this.a_Y,this.a_size,this.a_size); 
    }
    else if (this.a_type==PICTURE) {
      image(this.picture,this.a_X,this.a_Y); 
    }
     
  }
  
  void scroll(float speed) {
    this.move(-speed,0);
    if (this.get_X()+this.picture.width <= 0 ) {this.move(width + this.picture.width,0);}
    //println(this.stage_X);
  }
  
  void scroll(float speed, char direction) {
    float current_X = this.get_X();
    float current_Y = this.get_Y();
    switch(direction) {
      case 'L':  // scroll from the right to the left
        this.move(-speed,0);
        if (this.get_X()+this.picture.width <= 0 ) {this.move(width + this.picture.width,0);}
        break;
      case 'R': // scroll from the left to the right
        this.move(speed,0);
        if (this.get_X()+this.picture.width >= width ) {this.move(0,0);}      
        break;
      case 'U': // scroll up
        this.move(0,-speed);
        if (this.get_Y()+this.picture.height <= 0 ) {this.move(height + this.picture.height,0);}
        break;
      case 'D':
        this.move(0,speed); // scroll down
        if (this.get_X()+this.picture.width >= width ) {this.move(0,0);} 
        break;        
    }
  }
  
  char arrow_keys () {
    if (keyPressed) {
      if (key==CODED){
        if(keyCode==UP)
          { 
          if (this.get_Y() >= 0) { this.move(0,-1); }  // if we wont go above the top of the window, move the Actor up 1 pixel.
          if (a_Y < 0) {return 'T';} 
          }
        if(keyCode==DOWN)
          { 
          if (this.get_Y() <= height) { this.move(0,1); } // if we wont go below the bottom of the window, move the Actor down 1 pixel.
          if (this.get_Y() > height) {return 'B';}
          }
        if(keyCode==LEFT)
          { 
          if (this.get_X() >= 0) { this.move(-1,0); } // if we wont go past the left side of the window, move the Actor left 1 pixel.
          if (this.get_X() < 0) {return 'L';}
          }
        if(keyCode==RIGHT)
          { 
          if (this.get_X() <= width) { this.move(1,0); }  // if we wont go past the right side of the window, move the Actor right 1 pixel.
          // We can use "println" to output things in the console.  
          // This can be helpful in showing us what exactly is happening, especially if our program has problems.
          // That process of uncovering and fixing problems in our program's code is called "debugging".
          //println(this.a_X);  
          if (this.get_X() > width) {return 'R'; }
          }
      }
    }
    return ' ';
  }
  
}
