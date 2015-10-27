import org.gicentre.utils.stat.*;
import org.gicentre.utils.colour.*;
/*import muthesius.net.*;
 import org.webbitserver.*;*/

//WebSocketP5 socket;
String input= new String();
String artist= new String();
boolean search=false; //If this variable is true the programs shows graph and artist info
Table table;
//IntList Prices= new IntList();
//keeps track on how many artists in what pricerange
float [] PriceRange= new float[14];
char letter;

int[] pricecategory= new int[13];


BarChart barChart;
ColourTable cTable;

void setup() {
  // socket = new WebSocketP5(this,8080);
  size(800, 600);
  table = loadTable("Bandprices.csv", "header");
  barChart = new BarChart(this);
  textSize(14);

  //price ranges, näitä voi säätää tässä
  pricecategory[0]=15000; //less than 15000
  pricecategory[1]=25000; //less than 25000
  pricecategory[2]=50000;
  for(int i=1;i<=10;i++){
    pricecategory[i+2]=i*100000;
  }
  //Gathers data for the graph
  for (TableRow row : table.rows ()) {
    int price = row.getInt("Price");
    checkPriceRange(price);
  }
  //Purkkaviritys price ranget ei voi olla tasan yhtä suuri muuten hover kusee
  PriceRange[7]+=0.01;
  PriceRange[9]-=0.01; 
  PriceRange[6]+=0.01;
  PriceRange[13]+=0.01;
}

ColourTable hover() {
  cTable=new ColourTable();
  cTable.addDiscreteColourRule(170, 83, 90, 216);
  for (int i=0; i<14; i++) {
    if ((60+(i*48))<(mouseX) && (mouseX)<(60+i*48+48)) {
      cTable.addDiscreteColourRule(PriceRange[i]-0.01, 83, 90, 216);
      cTable.addDiscreteColourRule(PriceRange[i], 250, 244, 66);
      cTable.addDiscreteColourRule(PriceRange[i]+0.01, 83, 90, 216);
    }
  }
  return cTable;
}

void drawPriceRange() {
  textAlign(CENTER);
  for (int i=0; i<14; i++) {
    if ((60+(i*48))<(mouseX) && (mouseX)<(60+i*48+48)) {
      PVector v=barChart.getDataToScreen(new PVector(i, 0));
      //vx=x coordinate of the bar
      if (i==0) text("0$ - "+pricecategory[i]+"$", v.x, v.y+20);
      else if (i==13)text("100000$ - ", v.x, v.y+20);
      else text(pricecategory[i-1]+"$ - "+pricecategory[i]+"$", v.x, v.y+20);
    }
  }
  textAlign(LEFT);
}
//sorts the band pricecategory in price ranges
//tätä vois tsiigailla jos tää on hyvä lajittelu
void checkPriceRange(int p) {
  if (p<pricecategory[0]) PriceRange[0]++;
  else if (p<pricecategory[1]) PriceRange[1]++;
  else if (p<pricecategory[2]) PriceRange[2]++;
  else if (p<pricecategory[3])PriceRange[3]++;
  else if (p<pricecategory[4])PriceRange[4]++;
  else if (p<pricecategory[5])PriceRange[5]++;
  else if (p<pricecategory[6])PriceRange[6]++;
  else if (p<pricecategory[7])PriceRange[7]++;
  else if (p<pricecategory[8])PriceRange[8]++;
  else if (p<pricecategory[9])PriceRange[9]++;
  else if (p<pricecategory[10])PriceRange[10]++;
  else if (p<pricecategory[11])PriceRange[11]++;
  else if (p<pricecategory[12])PriceRange[12]++;
  else PriceRange[13]++; //over 1M$
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
  drawgraph();
  barChart.setBarColour(PriceRange, hover());
  drawPriceRange();
  if (search) {
    drawArtistInfo();
  }
}

String searchforArtist(String searchedArtist) {
  String ret= "The artist could not be found :(";
  for (TableRow row : table.rows ()) {
    String value = row.getString("Artist");
    int price = row.getInt("Price");
    String str1=searchedArtist;
    if (str1.equals(value.toLowerCase()) == true) {
      ret= value + " can be booked for $" + price + ",00";
    }
  }
  return ret;
}

//testing
void drawArtistInfo() {
  text(artist, 30, 60);
}

//used for testing
void drawKeyboardInput() {
  text("Search for artist: "+input, 30, 30, 300, 100);
}

void drawgraph() {
  textFont(createFont("Arial", 10), 15);
  barChart.setData(
  PriceRange
    );
  barChart.draw(40, 100, 700, 450);
  barChart.showValueAxis(true);
  barChart.setValueFormat("#");
  barChart.setBarGap(2);
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
 if (msg.toLowerCase().contains("search")) {
 artist=searchforArtist(input.toLowerCase());
 search=true;
 input=new String();
 } else {
 input= msg;
 }
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
