// A class describes a thing,
// including it's properties (kind of like adjectives)
// and methods of interacting with that thing (kind of like verbs).
// Our Words class will describe the text that scrolls across the screen. 

class Words {
  String a = "The truth about ";
  String neighborhood = "STL";
  String b = " is... ";
  String truth = "";
  String words;
  float words_X = width;
  float words_Y = 0;
  float words_width;
  float words_size = 40;
  PFont f;

  Words(String t) {
    this.f = createFont("Arial", this.words_size, true); // Arial, 16 point, anti-aliasing on
    textFont(this.f, this.words_size);
    this.truth = t;
    this.set_words();
    println(words);
    this.words_width = textWidth(words);
  }

  void set_words() {
    this.words = this.a + this.neighborhood + this.b + this.truth + ".";
    this.words_width = textWidth(words);
  }

  void set_neighborhood(String n) {
    this.neighborhood = n;
    this.set_words();
  }

  void set_truth(String t) {
    this.truth = t;
    this.set_words();
  }
  
  void set_size(int s) {
    this.words_size = s;
    this.f = createFont("Arial", this.words_size, true);
    textFont(this.f, this.words_size);
    this.words_width = textWidth(words);
  }  

  void display() {
    int margin = 10;
    // we set the fill color of the text box to white with a 40% opacity
    fill(255, 255, 255, 100);
    rect(this.words_X - margin, this.words_Y - this.words_size, this.words_width + (margin*2), this.words_size + (margin*2));
    textSize(this.words_size);
    // we set the fill color of the text to black with a 100% opacity
    fill(0, 0, 0, 255);
    text(this.words, this.words_X, this.words_Y);
  }
  /*
   CHALLENGE:  Can you change the fill color and opacity 
   of the Words box and the fill color and opacity of the text?
   There is an easy way to do this, and some more advanced ways.  
   If you want to try the more advanced way, you might need to
   create some extra variables in the Words class 
   and maybe some of your own "setters and getters".
  */

  void scroll(float speed) {
    this.words_X -= speed;
    if (this.words_X < -this.words_width) {
      this.words_X = width;
    }
  }

  void vertical_position (float vertical_position) {
    this.words_Y = vertical_position;
  }
}

