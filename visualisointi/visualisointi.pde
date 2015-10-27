import org.gicentre.utils.stat.*;
/*import muthesius.net.*;
import org.webbitserver.*;*/

//WebSocketP5 socket;
String input= new String();
String artist= new String();
boolean search=false; //If this variable is true the programs shows graph and artist info
Table table;
IntList Prices= new IntList();
//keeps track on how many artists in what pricerange
float [] PriceRange= new float[27];
char letter;

BarChart barChart;

void setup() {
 // socket = new WebSocketP5(this,8080);
  size(800, 600);
  table = loadTable("Bandprices.csv", "header");
  barChart = new BarChart(this);
  //println(table.getRowCount() + " total rows in table"); 
  /*for (TableRow row : table.rows ()) {
    String artist = row.getString("Artist");
    int Price = row.getInt("Price");
    String str1="Prince";
    if (str1.equals(artist) == true) {
      println(artist + " can be booked for $" + Price + ",00");
    }
  }*/
  //Gathers data for the graph
  for (TableRow row : table.rows ()) {
    int Price = row.getInt("Price");
    checkPriceRange(Price);
  }
}

//sorts the band prices in price ranges
//tätä vois tsiigailla jos tää on hyvä lajittelu
void checkPriceRange(int p) {
  if (p<=7500) PriceRange[0]+=1;
  else if (p<10000) PriceRange[1]+=1; 
  else if (p==10000) PriceRange[2]+=1; 
  else if (p<=13500) PriceRange[3]+=1;
  else if (p==15000) PriceRange[4]+=1;
  else if (p<20000) PriceRange[5]+=1;
  else if (p==20000) PriceRange[6]+=1;
  else if (p==25000) PriceRange[7]+=1;
  else if (p==30000) PriceRange[8]+=1;
  else if (p==35000) PriceRange[9]+=1;
  else if (p==40000) PriceRange[10]+=1;
  else if (p<=50000) PriceRange[11]+=1;
  else if (p<=70000) PriceRange[12]+=1;
  else if (p==75000) PriceRange[13]+=1;
  else if (p<100000) PriceRange[14]+=1;
  else if (p==100000) PriceRange[15]+=1;
  else if (p<=135000) PriceRange[16]+=1;
  else if (p==150000) PriceRange[17]+=1;
  else if (p<=175000) PriceRange[18]+=1;
  else if (p==200000) PriceRange[19]+=1;
  else if (p<=275000) PriceRange[20]+=1;
  else if (p==300000) PriceRange[21]+=1;
  else if (p==350000) PriceRange[22]+=1;
  else if (p==400000) PriceRange[23]+=1;
  else if (p<=600000) PriceRange[24]+=1;
  else if (p==750000) PriceRange[25]+=1;
  else if (p<1000000) PriceRange[26]+=1;
}

void draw() {
  background(255);
  fill(200);
  rectMode(CENTER);
  noStroke();
  rect(400, 40, 800, 80);
  fill(0);
  rectMode(CORNER);
  drawKeyboardInput();
  if(search){
    drawgraph();
    drawArtistInfo();
  }
}

String searchforArtist(String searchedArtist){
  String ret= "The artist could not be found :(";
  for (TableRow row : table.rows ()) {
    String value = row.getString("Artist");
    int Price = row.getInt("Price");
    String str1=searchedArtist;
    if (str1.equals(value.toLowerCase()) == true) {
      ret= value + " can be booked for $" + Price + ",00";
    }
  }
  return ret;
}

//testing
void drawArtistInfo(){
  text(artist, 30, 60);
}

//used for testing
void drawKeyboardInput() {
  text("Search for artist: "+input, 30, 30, 300, 100);
}

void drawgraph() {
  textFont(createFont("Arial", 10), 10);
  barChart.setData(
  PriceRange
    );
  barChart.draw(40, 100, 700, 450);
  barChart.showValueAxis(true);
  barChart.setValueFormat("#");
  barChart.setBarColour(color(200, 80, 80, 150));
  barChart.setBarGap(1);
}

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
  
/*  void websocketOnMessage(WebSocketConnection con, String msg){
  println(msg);
  input= input + msg;
}
  
  void stop(){
  socket.stop();
}

void websocketOnOpen(WebSocketConnection con){
  println("A client joined");
}

void websocketOnClosed(WebSocketConnection con){
  println("A client left");
}*/