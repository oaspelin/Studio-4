/*
  Simple WebSocketServer example that can receive voice transcripts from Chrome
 */


void stop(){
  socket.stop();
}

void websocketOnMessage(WebSocketConnection con, String msg){
  println(msg.trim());
  if (msg.trim().toLowerCase().contains("search")) {
    artist=searchforArtist(input.toLowerCase().trim());
    search=true;
    input=new String();
  } else if (msg.trim().toLowerCase().contains("random")){
    TableRow rndrow=table.getRow(int(random(755)));
    artist=searchforArtist(rndrow.getString("Artist").toLowerCase().trim());
    search=true;
    input=new String();
  } else {
    input= msg.trim();
  }
}

void websocketOnOpen(WebSocketConnection con){
  println("A client joined");
}

void websocketOnClosed(WebSocketConnection con){
  println("A client left");
}
