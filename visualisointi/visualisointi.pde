
import org.gicentre.utils.stat.*;

String input= new String();
String artist= new String();
Table table;
IntList prices= new IntList();
int one,two,three,four,five,six,seven,eight,nine,ten;


BarChart barChart;



void setup(){
  size(600, 600);
  table = loadTable("Bandprices.csv", "header");
  generateData();
  barChart = new BarChart(this);
}

void generateData(){
  for(int i=0; i<100;i++){
    int r=int(ceil(random(1,10)));
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
  text("Input"+input,50,50);
  text("Artist: "+artist,50,80);
  drawgraph();
}

void drawgraph(){
  barChart.setData(new Int[] {one, two, three, four, five,six,seven,eight,nine,ten});
  barChart.draw(200,200,width-30,height-30);
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
