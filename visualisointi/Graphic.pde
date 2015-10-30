void drawKeyboardInput() {
  textSize(20);
  fill(200, 240, 255);
  if (blinkTimer % 1300 <= 650) {
    text("Search for artist: "+input+"|", 90, 150, 350, 100);
  }
  else text("Search for artist: "+input, 90, 150, 350, 100);
}

void drawfactBox() {
  fill(83, 90, 216);
  rect(460, 130, 270, 100, 9);
  fill(200, 240, 255);
  textFont(fontti);
  textSize(14);
  text("Artist: "+artist, 480, 160);
  if ("Not found".equals(artist)) {
    text("Booking fee: N/A", 480, 185);
    text("Artists in this price range: N/A", 480, 210);
    factBoxColor(0.0);
  } else {
    String str = String.format("%,d", price);
    text("Booking fee: $"+str, 480, 185);
    text("Artists in this price range: "+getArtistsinPricerange(price), 480, 210);
  }
  textSize(14);
  stroke(200, 240, 255);
  line(710, 140, 720, 150);
  line(710, 150, 720, 140);
  stroke(0);
}

//closes the factbox
void mouseClicked() {
  if ((mouseX>=710 && mouseX<=720) && (mouseY>=135 && mouseY<=155)) {
    search=false;
  }
}


void drawgraph() {
  textFont(createFont("Arial", 10), 15);
  barChart.setData(
  PriceRange
    );
  barChart.draw(50, 225, 700, 440);
  barChart.showValueAxis(true);
  barChart.setValueFormat("#");
  barChart.setBarGap(2);
  //x-axis label
  textAlign(CENTER);
  fill(83, 90, 216);
  textFont(fontti);
  textSize(20);
  text("Booking fee", 400, 720);
  textAlign(LEFT);
  //y-axis label
  pushMatrix();
  translate(width/2, height/2);
  rotate(-PI/2);
  fill(83, 90, 216);
  textFont(fontti);
  textSize(20);
  text("Number of artists", -140, -360);
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

void factBoxColor(float range) {
  cTable=new ColourTable();
  cTable.addDiscreteColourRule(170, 83, 90, 216);
  if (artist.equals("N/A")==false) {
    cTable.addDiscreteColourRule(range-0.01, 83, 90, 216);
    cTable.addDiscreteColourRule(range, 250, 244, 66);
    cTable.addDiscreteColourRule(range+0.01, 83, 90, 216);
  }
  barChart.setBarColour(PriceRange, cTable);
}

//draws the pricerange under the corresponding graph
void drawPriceRange(int num) {
  textAlign(CENTER);
  if (!search) {
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
  } else {
    fill(83, 90, 216);
    PVector v2=barChart.getDataToScreen(new PVector(num, 0));
    if (num==0) text("$0-"+"$"+pricecategory[num], v2.x, v2.y+20);
    else if (num==13)text("$1000000 - ", v2.x, v2.y+20);
    else text("$"+pricecategory[num-1]+"-$"+pricecategory[num], v2.x, v2.y+20);
    text("Artists: "+int(PriceRange[num]), v2.x, v2.y+35);
  }
  fill(200, 240, 255);
  textAlign(LEFT);
}

