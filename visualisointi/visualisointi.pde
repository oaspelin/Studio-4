import org.gicentre.utils.stat.*;
import org.gicentre.utils.colour.*;
import muthesius.net.*;
import org.webbitserver.*;
import ddf.minim.*;

WebSocketP5 socket;
String input= new String();
String artist= new String();
int price;
boolean search=false; //If this variable is true the programs shows graph and artist info
Table table;
//keeps track on how many artists in what pricerange
float [] PriceRange= new float[14];
char letter;
int blinkTimer; //timer for text cursor
PFont fontti;
AudioSnippet notFound;
AudioSnippet found;
Minim minim1;
Minim minim2;

int[] pricecategory= new int[13];

BarChart barChart;
ColourTable cTable;

void setup() {
  socket = new WebSocketP5(this, 8080);
  size(800, 750);
  table = loadTable("Bandprices.csv", "header");
  barChart = new BarChart(this);
  textSize(14);
  fontti = createFont("CenturyGothic-Bold",14);

  //for sound effects
  minim1 = new Minim(this);
  notFound = minim1.loadSnippet("notFound.mp3");
  minim2 = new Minim(this);
  found = minim2.loadSnippet("found.mp3");

  //price ranges
  pricecategory[0]=15000; //less than 15000
  pricecategory[1]=25000; //less than 25000
  pricecategory[2]=50000; 
  for (int i=1; i<=10; i++) {//100 000-1 000 000
    pricecategory[i+2]=i*100000;
  }
  //Gathers data for the graph
  for (TableRow row : table.rows ()) {
    int price = row.getInt("Price");
    checkPriceRange(price);
  }
  PriceRange[7]+=0.01;
  PriceRange[9]+=0.02; 
  PriceRange[6]+=0.01;
  PriceRange[13]+=0.01;
}


void draw() {
  background(200, 240, 255);
  blinkTimer = millis();
  fill(83, 90, 216);
  textFont(fontti);
  textSize(45);
  text("How much does it cost to book...", 40, 85);
  noStroke();
  rect(70, 130, 380, 70, 9);
  fill(0);
  drawKeyboardInput();
  drawgraph();
  if (!search) {
    barChart.setBarColour(PriceRange, hover());
    drawPriceRange(1);
  }
  if (search) {
    drawfactBox();
  }
}



