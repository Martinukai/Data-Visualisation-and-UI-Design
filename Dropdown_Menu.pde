// Credit: Modified from the 'Scrollable List' example in the controlP5 library
void dropdown(int n) {
  /* request the selected item based on index n */
  println(n, cp5.get(ScrollableList.class, "dropdown").getItem(n));
  index = n;
  requestStationData();
  requestArrayData(); 
  //timer.start();
  
  randomSoundfilePlayer();
  
  CColor c = new CColor();
  c.setBackground(color(255,0,0));
  cp5.get(ScrollableList.class, "dropdown").getItem(n).put("color", c); 
}
