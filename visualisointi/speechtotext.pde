/*
  Simple WebSocketServer example that can receive voice transcripts from Chrome
 */


void stop(){
  socket.stop();
}

//Opens websocket to Chrome browser for use of Google Speach API
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

//Notifies when a connection has been made
void websocketOnOpen(WebSocketConnection con){
  println("A client joined");
}

//Notifies when a connection has been disconnected
void websocketOnClosed(WebSocketConnection con){
  println("A client left");
}
