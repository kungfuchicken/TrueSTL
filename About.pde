// A class describes a thing,
// including it's properties (kind of like adjectives)
// and methods of interacting with that thing (kind of like verbs).
// Our About class will describe miscellaneous details about our project.


class About {
  
// First we create all the variables we need.
// Variables give us a place to store values 
// such as letters, numbers or collections of multiple kinds of data.
// These variables have a scope that is local to this class. 
// That means they can only be accessed from within this class.
// This class uses lots of String variables
// A "String" is a group of char variables, such as "Hello world!", "ABCdef123" or "TrueSTL"
  String creator;  // The name of the creator of this project.
  String date_created; // The initial date this project was created.
  String geo_tag; // The geographic info for this project.
  String neighborhood; // The neighborhood or area this project is about.
  String event;  // The event where this project was created
  
  // Next we have to describe how to create a new About variable.
  // We are required to include this special set of syntax, called a "constructor" for each custom class we create.
  // First we list the name of the class, a list of variables we want to send to it in parentheses 
  // and then perform whatever actions we need to perform in order to create an instance of this class.
  About(String c, String d, String g) {
    this.creator = c;
    this.date_created = d;
    this.neighborhood = g;
  }
  
  // then we define "methods", so that we can interact with this class.
  // the most basic kind of method is a way to set and a way to get an individual variale within the class.
  // these kinds of methods are called "setters and getters", and we'll create them next.
  // Let's start with a setter method to set the creator variable, and each of our other variables as well.
  // again, we use void to return this method returns no data, give a unique name for the method,
  // list whatever variables we want to pss to it within parentheses 
  // and then open and close the actions within the method using curly braces like these: { }.
  void set_creator(String c) { 
    // We use the special word "this" to reference this particular instance of our class,
    // and then a . and the classes variable name.
    // Here we assign the variable we passed to the method to this instance's creator variable.
    this.creator = c;  
  }
  
  void set_date_created(String d) {
    this.date_created = d;
  }
  
  void set_geo_tag(String g) {
    this.geo_tag = g;
  }
  
 void set_neighborhood(String n) {
    this.neighborhood = n;
  }
  
  void set_event(String e) {
    this.event = e;
  }
  
  // Next we'll create our getter method to get the creator variable, and each of our other variables as well.
  // Here we use String to indicate this method returns a String, give a unique name for the method,
  // list whatever variables we want to pss to it within parentheses (in this case, we pass it no variables).
  // and then open and close the actions within the method using curly braces like these: { }.
  String get_creator() {
    // We use the reserved word "return" to indicate we want to return a certain variable.
    // Again, we use the syntax "this.varibale" to refer to a particular variable in this particular instance.
    return this.creator;
  }
  
  String get_date_created() {
    return this.date_created;
  }
  
  String get_geo_tag() {
    return this.geo_tag;
  }
  
  String get_neighborhood() {
    return this.neighborhood;
  }
  
  String get_event() {
    return this.event;
  }
  
}  
// remember to always make sure you have a matching set of open and close curly braces

