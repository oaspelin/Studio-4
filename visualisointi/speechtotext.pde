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
  } else {
    input= msg.trim();
  }
}

// Koodi palauttaa puheentunnistuksen vastauksen msg muuttujaan

void websocketOnOpen(WebSocketConnection con){
  println("A client joined");
}

void websocketOnClosed(WebSocketConnection con){
  println("A client left");
}
