String input= new String();
String artist= new String();
Table table;
void setup(){
  size(600, 600);
   table = loadTable("Bandprices.csv", "header");
   println(table.getRowCount() + " total rows in table"); 
}

void draw(){
  background(255);
  fill(0);
  textSize(32);
  text("Input"+input,50,50);
  text("Artist: "+artist,50,80);
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
