import org.gicentre.utils.stat.*;

String input= new String();
Table table;
IntList Prices= new IntList();
//Keeps count on how many artists there are in the price ranges
int Pr1, Pr2, Pr3, Pr4, Pr5, Pr6, Pr7, Pr8, Pr9, Pr10,Pr11,Pr12,Pr13,Pr14,Pr15,Pr16,Pr17,Pr18,Pr19,Pr20,Pr21,Pr22,Pr23,Pr24,Pr25,Pr26,Pr27,Pr28;
float [] PriceRange= new float[27];

BarChart barChart;

void setup() {
  size(600, 600);
  table = loadTable("Bandprices.csv", "header");
  barChart = new BarChart(this);
  //println(table.getRowCount() + " total rows in table"); 
  for (TableRow row : table.rows ()) {
    String artist = row.getString("Artist");
    int Price = row.getInt("Price");
    String str1="Prince";
    if (str1.equals(artist) == true) {
      println(artist + " can be booked for $" + Price + ",00");
    }
    checkPriceRange(Price);
  }
}

//sorts the band prices in price ranges
void checkPriceRange(int p) {
    if (p<=7500) PriceRange[0]+=1;
    else if (p<10000) PriceRange[1]+=1; 
    else if (p==10000) PriceRange[2]+=1; 
    else if (p<=1350) PriceRange[3]+=1;
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
    else if (p<10000) PriceRange[14]+=1;
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
    else if (p>1000000) PriceRange[27]+=1;
}

void draw() {
  background(255);
  fill(0);
  textSize(32);
  drawgraph();
}


void drawgraph() {
  textFont(createFont("Serif", 10), 20);
  barChart.setData(
  PriceRange
  );
  barChart.draw(100, 100, 400, 200);
  barChart.showValueAxis(true);
  barChart.setValueFormat("#€");
  barChart.showCategoryAxis(true);
  barChart.setBarColour(color(200, 80, 80, 150));
  barChart.setBarLabels(new String[] {
   // str(one), str(two), str(three), str(four), str(five), str(six), str(seven), str(eight), str(nine), str(ten)
  }
  );
  barChart.setBarGap(4);
}

/*
void keyPressed(){
 //backspace
 if (key == BACKSPACE && input.length() > 0 ){
 input = input.substring(0, input.length() - 1);
 }
 //hakee tästä artista dataa
 else if(key ==ENTER){
 //artist=input;
 input="";
 }
 //new chars to our input string
 else{
 input=input+key;
 }
 }*/
