//used for testing
void keyPressed() {
  //backspace
  if (key == BACKSPACE && input.length() > 0 ) {
    input = input.substring(0, input.length() - 1);
  }
  else if (key ==ENTER) {
    artist=searchforArtist(input.toLowerCase());
    search=true;
    input=new String();
  }
  //new chars to our input string
  else if (key >= 'A' && key <= 'z' || key == ' ' || key >= '0' && key <= '9') {
    letter = key;
    input = input + letter;
  }
}
