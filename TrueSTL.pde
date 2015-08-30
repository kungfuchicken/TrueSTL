/*
TrueSTL
Comments and introductions

Welcome to TrueSTL, throughout this you will see help, tips and friendly challenges to you in comments.
Comments are anything that is grayed out and are separated from the computer code by
  A) anything on a line starting from "//" and continuing to the end of the line
  B) any chunk of text that starts with /* and ends with */
  
/*

You'll notice that the actual code is either solid black or highlighted in a special color.
Anything highlighted in a different color is a special bit of text.  We'll talk about each
of these elements as we get to it.

Let's get started learning to code by pressing the play button,
We can go through each line of code in this tab to find out what's happening,
and then we can start making a few guided adjustments to the code
and see what happens when we hit play again.

*/

// First we create all the variables we need.
// Variables give us a place to store values 
// such as letters, numbers or collections of multiple kinds of data.
// These variables are called "global variables" 
// because they can be accessed from anywhere in our program.
// Because of the ability to access them from anywhere in our program, we say that they have a "global scope".
// Each variable is created by declaring the kind of variable it is, also known as it's "type",
// and then each variable is given a unique name.
// Our first variable is a "char" tpe with the name arrow_key_code;
// We use underscores instead of spaces, because a variable cannot have any spaces in it.
char arrow_key_code; // a "char" is a single character, including any letter, number or special keys on the keyboard.
int number_of_scenes=3;  // an "int" is whole number, and we assign it a default value of 3.

// This is a special kind of variable we've created called an About.
// It is defined in a custom "class" in the About tab. 
// A class is a lot like a type.
// We will use it to describe the creator, date of creation and other miscelaneous details of our interactive story
About project_info;

// This is a special kind of variable we've created called a Stage. 
// It is defined in a custom "class" in the Stage tab. 
// We will use it to describe the background images of our interactive story.
Stage backdrop; 

// This is a special kind of variable we've created called an Actor.
// It is defined in a custom "class" in the Actor tab. 
// We will use it to describe the hero of our interactive story.
Actor me;  
// We can create another "instance" of an Actor and use it to create a friend
Actor friend;

// This is a special kind of variable we've created called a Words.
// It is defined in a custom "class" in the Words tab. 
// We will use it to add words to our interactive story.
Words truth;

// Some variables are fully initialized and ready to use, some we will have to initialize later.
  
// Now we set up our story.
// We put all of the actions we want to perform during our set up in a special functions called "setup"
// Functions are kind of like step-by-step collections of instructions that can be grouped together.
//"void" indicates that setup is returns no data, "setup is the name of the function 
// and the parentheses are used to pass variables to a function, which you will see again soon.
void setup() 
// We put an opening curly brace in to indicate the start of the functions instructions.  
// Every open curly brace must have a closing curly brace.
{ 
  // Here we set up our display window, and "pass it" some variables within the parentheses.
  // It is 400 pixels across, 300 pixels tall and we are doing 2D graphics.
  // Pixels are tiny dots, and computer and TV screens are made of a grid of them.
  size(800, 600, P2D);
  
  // We must initialize our About called "project_info" so we can use it.
  // We tell it to set the name of the creator, the date and neighborhood.
  project_info = new About("My Name","September 21, 2013", "STL");
  // Now we'll put the word "Hello" in the console at the bottom of this window.
  println("Hello");
  // Now we'll put the current name of the creator for our project in the console
  println("Creator name: " + project_info.get_creator());
  // Now set a new name for the creator of our project
  project_info.set_creator("New Name");
  // and we put the current name of the creator for our project in the console.
  println("Creator name: " + project_info.get_creator()); 
  // Please, change the date here to today's date:
  project_info.set_date_created("September 21, 2013");
  // and tell us what city or neighborhood your story is about by changing "STL":
  project_info.set_neighborhood("STL");
 /*
  CHALLENGE:  
  We just set the project's creator, date created and neigborhood in three separate lines.
  There is also a way to comment out these lines, and still have all the information set.
  Can you figure out how to do that?
  */
  
  // We must initialize our Actor called "me" so we can use it.
  // We pass it a 0 to tell it to create our Actor as a ball instead of as an image.
  // CHALLENGE:  Can you tell it to create the Actor "me" as an image?
  me = new Actor(0);
  // Then we move that Actor to a starting point:
  // 0 pixels from the left, and 50 pixels up from the bottom (the height of the window minus 10 pixels).
  // When we refer to a particular pixel, we give it's address on the grid.
  // The top left corner of our grid of pixels has the address (0,0), or 0 pixels over and 0 pixels down.
  // The top right corner of our grid of pixels has the address (400,0).
  // The bottom left corner of our grid of pixels has the address (0,300).
  // The bottom right corner of our screen currently has the address (400,300),
  // but we can use the special address (width,height) to say the same thing so we don't have to remember those numbers.
  me.move(0,height-50);
  /*
  CUSTOMIZE IT TIP
  Here's a chance to customize our story!
  Try theses changes out to customize your Actor
  Change the line above to read "me.move(0,height/2);" to have the ball appear half-way up the window.
  Where else can you make the ball start at?
  Add the line "me.set_color(color(127,127,127))" to make your Actor gray.  
  What happens if you change each of the numbers in the color?
  */
  
  // Now let's create another Actor called "friend".
  // We pass it a 1 to tell it to create this Actor as an image, 
  // and then we tell it the name of the image file we want to use.
  // Try putting your own image file in the project folder, 
  // and change the filename passed to "friend" to the name of your file.
  friend = new Actor(1, "arch.png");
  // Let's put friend on the screen exactly where we want it.
  // We want it exactly halfway across, and at the very bottom of the screen.
  // To do that we need just a little help from math and measurements.
  friend.move((width/2)-(friend.get_width()/2),height-friend.get_height());
  
  // Here we create a new background, 
  // or a Stage for drama to unfold in front of,
  // we will call our Stage "backdrop"
  // and tell it to look for and import
  // and each file that starts with "bg" for
  // the number of files in number_of_scenes
  // and all the files end in ".png".
  backdrop = new Stage("bg",number_of_scenes, ".png");
  /* 
  You can look in the project folder and see the three default images: 
    bg1.png, bg2.png and bg3.png 
  CUSTOMIZE IT TIP
  Here's a chance to customize our story!
  Try adding your own background images:
  1.  Copy your own images into the project folder
  2.  Change the name of each file to a regular pattern like:
      my_bg1.jpg, my_bg2.jpg, my_bg3.jpg, etc.
  3.  Change the code to match the regular pattern you've used, like:
      backdrop = new Stage("my_bg",number_of_scenes, ".jpg");
  */
  
  /* SOMETHING TO CONSIDER
  // You can also just send an array of file names like this:  
  String[] file_names = {"bg1.png","bg2.png","bg3.png"};
  backdrop = new Stage(file_names);
  // or like this:
  String[] file_names = {"some.jpg","another.png","favorite.jpeg"};
  backdrop = new Stage(file_names);
  // Often in writing code, there are many ways to solve the same problem.
  // There are advantages and disadvantages to each approach.
  // Why might you use each of these approaches?
  */
  
  // Here we create a new set of Words called "truth", 
  // and append 'it is central' to the default start.
  truth = new Words("it is central");
  // and then place "truth" 50 pixels from the top.
  truth.vertical_position(50);
  truth.set_neighborhood(project_info.get_neighborhood());
  /*
  CUSTOMIZE IT TIP
  Here's a chance to customize our story!
  Try theses changes out to customize your Truth
  Change the line above to read "me.move(0,height/2);" to have the ball appear half-way up the window.
  Add the line "me.set_color(color(127,127,127))" to make your Actor gray.  What happens if you change each of the numbers in there?
  */

// Every time we have an open curly brace like {, we need to have a closing curly brace like } when we're done with a section of code
// We're done with our setup, so we put in a close curly brace, like this:
}

void draw() {

  // here you create a backdrop
  // scroll it slowly from right to left;
  backdrop.scroll(.5); // the parameter here determines the speed
  // and display the backdrop
  backdrop.display();
 
  // here you handle the text
  //Scroll the text across the screen
  truth.scroll(0.75); //the parameter here determines speed
  //dissplay the text on the screen
  truth.display(); 
  

  // here we look for input from the arrow keys
  // and move the Actor across the screen
  arrow_key_code = me.arrow_keys();
  // display your Actor
  me.display();
  // if the Actor moves beyond the right side of the window
  if (arrow_key_code == 'R') 
    { 
      // advance to the next scene
      backdrop.set_scene(backdrop.get_scene()+1); 
      // and reset the Actor at the left side of the screen
      me.move(-width,0);
    }
  // CHALLENGE:  Can you make the Actor "me" go to the left 
  //             and return to a previous scene?
  
  //println(backdrop.get_scene());
  if (backdrop.get_scene() == number_of_scenes-1) 
    {
      //friend.scroll(.1,'R');
      friend.display();
    }
}
  





