import org.gicentre.utils.stat.*;

String input= new String();
Table table;
IntList prices= new IntList();
int one,two,three,four,five,six,seven,eight,nine,ten;


BarChart barChart;

void setup(){
  size(600, 600);
  table = loadTable("Bandprices.csv", "header");
  generateData();
  barChart = new BarChart(this);


  println(table.getRowCount() + " total rows in table"); 
  for (TableRow row : table.rows()) {
    String artist = row.getString("Artist");
    int price = row.getInt("Price");
    if(artist=="Prince"){
      println("DERP");
      break;
    }
    println(artist + " can be booked for $" + price + ",00"); 
  }
}

void generateData(){
  for(int i=0; i<100;i++){
    int r=int(ceil(random(0,10)));
    switch (r){
      case 1:one++; break;
      case 2:two++;break;
      case 3:three++;break;
      case 4:four++;break;
      case 5:five++;break;
      case 6:six++;break;
      case 7:seven++;break;
      case 8:eight++;break;
      case 9:nine++;break;
      case 10:ten++;break;
    }
  }
}

void draw(){
  background(255);
  fill(0);
  textSize(32);
  drawgraph();
}


void drawgraph(){
  textFont(createFont("Serif",10),20);
  barChart.setData(new float[] {one, two, three, four, five,six,seven,eight,nine,ten});
  barChart.draw(100,100,400,200);
  barChart.showValueAxis(true);
  barChart.setValueFormat("#€");
  barChart.showCategoryAxis(true);
  barChart.setBarColour(color(200,80,80,150));
  barChart.setBarLabels(new String[] {str(one),str(two),str(three),str(four),str(five),str(six),str(seven),str(eight),str(nine),str(ten)});
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
