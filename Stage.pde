// A class describes a thing,
// including it's properties (kind of like adjectives)
// and methods of interacting with that thing (kind of like verbs).
// Our Stage class will describe the background on the screen. 

class Stage {
  
  PImage[] img;
  int image_count;
  float stage_X = 0;
  float stage_Y = 0;
  int current_scene;
  
  /*
  There are three different ways of creating a Stage.
  */
    Stage(String image_prefix, int count, String image_extension) {
    // set the number of images to load
    this.image_count = count;
    //  create an array to store each of our images
    this.img = new PImage[this.image_count];

    // We will do a "for loop", or perform the same for a certain number of times.
    // This loop will use a counter variable, i, that will start at one (int i = 1).
    // It will repeat the same number of times as our image count (i <= image_count), because
    // each time we go through the loop i will increase by 1 (i++).
    for (int i = 1; i <= image_count; i++) {
      // Inside the loop, we will set a filename String that starts with our image_prefix,
      // then has the current value of i (an int type) represented as a String type (nf(i, 0))
      // and uses the file extension specified in image_extension.
      String filename = image_prefix + nf(i, 0) + image_extension;
      // Then we load this file into our array of images.  
      // Arrays reference numbers start at zero, 
      // so we have to subtract one from our counter.
      this.img[i-1] = loadImage(filename);
    }
    // Finally, we set the current_scene to start at the beginning.
    this.current_scene = 0;
  }
  
  
  Stage(String image_prefix, int count) {
    // set the number of images to load
    this.image_count = count;
    //  create an array to store each of our images
    this.img = new PImage[this.image_count];

    // We will do a "for loop", or perform the same for a certain number of times.
    // This loop will use a counter variable, i, that will start at one (int i = 1).
    // It will repeat the same number of times as our image count (i <= image_count), because
    // each time we go through the loop i will increase by 1 (i++).
    for (int i = 1; i <= image_count; i++) {
      // Inside the loop, we will set a filename String that starts with our image_prefix,
      // then has the current value of i (an int type) represented as a String type (nf(i, 0))
      // and uses the default file extension of ".png"
      String filename = image_prefix + nf(i, 0) + ".png";
      // Then we load this file into our array of images.  
      // Remember that Arrays references start at zero, 
      // so we have to subtract one from our counter.
      this.img[i-1] = loadImage(filename);
    }
    // Finally, we set the current_scene to start at the beginning.
    this.current_scene = 0;
  }
  
  Stage(String[] image_names) {
    // set the number of images to load
    this.image_count = image_names.length;
    //  create an array to store each of our images
    this.img = new PImage[this.image_count];

    // We will do a "for loop", or perform the same for a certain number of times.
    // This loop will use a counter variable, i, that will start at zero (int i = 0).
    // It will repeat the same number of times as our image count (i < image_count), because
    // each time we go through the loop i will increase by 1 (i++).
    for (int i = 0; i < image_count; i++) {
      // Inside the loop, we will load the file named at position i in the image_names array
      // into position i in the array of images called img. 
      this.img[i] = loadImage(image_names[i]);
    }
    this.current_scene = 0;
  }
  
  void set_scene( int new_scene ) {
    // If the new_scene number is equal to the total number of scenes, 
    // then reset the current_scene to zero (the beginning scene),
    if (new_scene == this.image_count) { this.current_scene = 0; }
    // or, if the new_scene number is less than zero (the beginning scene)
    // then set the current_scene to image_count minus one (the last scene).
    else if (new_scene < 0) {this.current_scene = this.image_count - 1; }
    // Otherwise, set the current_scene to the new_scene.
    else { this.current_scene = new_scene; }
  }
  
  int get_scene() {
    return this.current_scene;
  }
    
  void display() {
    // Show the image img for the current_scene 
    // with the top left corner at stage_X 
    // and the top right corner at stage_Y.
    image(this.img[this.current_scene],this.stage_X,this.stage_Y); 
  }
  
  void scroll(float speed) {
    // Set stage_X (the left side of the background image) equal to
    // the current value of stage_X minus the value of speed.
    this.stage_X -= speed;
    // If the absolute value of stage_X plus the width of the window (abs(this.stage_X)+width)
    // is greater than or equal to (>=)
    // the width of the image for current_scene (this.img[this.current_scene].width),
    // then set stage_X to zero and reset the position of the background image.
    if (abs(this.stage_X)+width >= this.img[this.current_scene].width) {this.stage_X = 0;}
    //println(this.stage_X);
  }
  
  void scroll(float speed, char direction) {
      // Depending on the value of direction, do different things (switch(direction))
      switch(direction) {
        // if direction = 'L'
        case 'L':  // scroll from the right to the left
          this.stage_X-=speed;
          if (abs(this.stage_X)+width >= this.img[this.current_scene].width) {this.stage_X = 0;}
          // don't do any more actions within the switch statement
          break;
        // if direction = 'R'
        case 'R':  // scroll from the left to the right
          this.stage_X+=speed;
          if (abs(this.stage_X)+this.img[this.current_scene].width <= 0) {this.stage_X = 0;}
          // don't do any more actions within the switch statement
          break;
        // if direction = 'U'
        case 'U': // scroll up
          this.stage_Y-=speed;
          if (abs(this.stage_Y)+height >= this.img[this.current_scene].height) {this.stage_Y = 0;}
          // don't do any more actions within the switch statement
          break;
        // if direction = 'D'
        case 'D':
          this.stage_Y+=speed; // scroll down
          if (abs(this.stage_Y)+this.img[this.current_scene].height <= 0) {this.stage_Y = 0;}
          // don't do any more actions within the switch statement
          break;
      }
  }
}

