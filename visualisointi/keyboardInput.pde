//used for testing
void keyPressed() {
  //backspace
  if (key == BACKSPACE && input.length() > 0 ) {
    input = input.substring(0, input.length() - 1);
  }
  //hakee tästä artistista dataa
  //could be made so they are not case sensitive
  else if (key ==ENTER) {
    //input=input.replaceAll("\\s+",""); <-- Mitä varten? t. Anssi
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
