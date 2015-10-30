//sorts the band pricecategory in price ranges
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

String searchforArtist(String searchedArtist) {
  found.pause();
  notFound.pause();
  found.rewind();
  notFound.rewind();
  String ret= "Not found";
  for (TableRow row : table.rows ()) {
    String value = row.getString("Artist");
    int tempprice = row.getInt("Price");
    String str1=searchedArtist;
    if (str1.equals(value.toLowerCase()) == true) {
      ret=value; 
      price=tempprice;
    }
  }
  if (ret.equals("Not found") == true) {
    notFound.play();
  }
  else found.play();
  return ret;
}

int getArtistsinPricerange(int price) {
  int ret=0;
  for (int i= 0; i<=pricecategory.length-1; i++) {
    if (price<pricecategory[i] && i!=pricecategory.length-1) {
      ret=int(PriceRange[i+1]);
      factBoxColor(PriceRange[i+1]);
      drawPriceRange(i+1);
      break;
    } else if (i==pricecategory.length-1) {
      ret=int(PriceRange[i+1]);
      factBoxColor(PriceRange[i+1]);
      drawPriceRange(i+1);
    }
  }
  textSize(14);
  return ret;
}
