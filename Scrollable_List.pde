// Credit: Modified from the 'Scrollable List' example in the controlP5 library
void scrollableList(){
  for (int i = 0; i < childrenS.length; i++) {
    cp5.addScrollableList("dropdown")
       .setPosition(10, 10)
       .setSize(100, height-10)
       .setBarHeight(20)
       .setItemHeight(20)
       .addItems(storedName)
       .setType(ScrollableList.LIST) 
       ;
  }
}
