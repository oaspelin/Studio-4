String input= new String();
String artist;
void setup(){
  size(600, 600);
}

void draw(){
  background(255);
  fill(0);
  textSize(32);
  text(input,50,50);
}

void keyPressed(){
  //backspace
  if (key == BACKSPACE && input.length() > 0 ){
    input = input.substring(0, input.length() - 1);
  }
  //hakee tästä artista dataa
  else if(key ==ENTER){
    artist=input;
    input="";
  }
  //new chars to our input string
  else{
    input=input+key;
  }
}
