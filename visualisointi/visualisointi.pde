import org.gicentre.utils.stat.*;
import org.gicentre.utils.colour.*;
import muthesius.net.*;
import org.webbitserver.*;

WebSocketP5 socket;
String input= new String();
String artist= new String();
int price;
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
  socket = new WebSocketP5(this,8080);
  size(800, 650);
  table = loadTable("Bandprices.csv", "header");
  barChart = new BarChart(this);
  textSize(14);

  //price ranges, näitä voi säätää tässä
  pricecategory[0]=15000; //less than 15000
  pricecategory[1]=25000; //less than 25000
  pricecategory[2]=50000; 
  for(int i=1;i<=10;i++){//100 000-1 000 000
    pricecategory[i+2]=i*100000;
  }
  //Gathers data for the graph
  for (TableRow row : table.rows ()) {
    int price = row.getInt("Price");
    checkPriceRange(price);
  }
  //Purkkaviritys price ranget ei voi olla tasan yhtä suuri muuten hover kusee
  PriceRange[7]+=0.01;
  PriceRange[9]+=0.02; 
  PriceRange[6]+=0.01;
  PriceRange[13]+=0.01;
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
    drawfactBox();
  }
}





