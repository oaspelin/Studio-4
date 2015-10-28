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
  barChart.draw(60, 100, 700, 450);
  barChart.showValueAxis(true);
  barChart.setValueFormat("#");
  barChart.setBarGap(2);
  //x-axis label
  textAlign(CENTER);
  textSize(20);
  text("Booking fee", 400, 620);
  textAlign(LEFT);
  //y-axis label
  pushMatrix();
  translate(width/2,height/2);
  rotate(-PI/2);
  text("Number of Artists",-80,-350);
  popMatrix();
  textSize(14);
}

ColourTable hover() {
  cTable=new ColourTable();
  cTable.addDiscreteColourRule(170, 83, 90, 216);
  for (int i=0; i<14; i++) {
    if ((80+(i*48))<(mouseX) && (mouseX)<(80+i*48+48)) {
      cTable.addDiscreteColourRule(PriceRange[i]-0.01, 83, 90, 216);
      cTable.addDiscreteColourRule(PriceRange[i], 250, 244, 66);
      cTable.addDiscreteColourRule(PriceRange[i]+0.01, 83, 90, 216);
    }
  }
  return cTable;
}

//draws the pricerange under the corresponding graph
void drawPriceRange() {
  textAlign(CENTER);
  for (int i=0; i<14; i++) {
    if ((80+(i*48))<(mouseX) && (mouseX)<(80+i*48+48)) {
      PVector v=barChart.getDataToScreen(new PVector(i, 0));
      //vx=x coordinate of the bar
      if (i==0) text("$0-"+"$"+pricecategory[i], v.x, v.y+20);
      else if (i==13)text("$1000000 - ", v.x, v.y+20);
      else text("$"+pricecategory[i-1]+"-$"+pricecategory[i], v.x, v.y+20);
      text("Artists: "+int(PriceRange[i]), v.x, v.y+35);
    }
  }
  textAlign(LEFT);
}
