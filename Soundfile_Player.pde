// This player triggers a random file each time an element on the scrollable list
void randomSoundfilePlayer(){
  mplayer[idx].pause();
  idx=(int)random(songs.length);
  mplayer[idx].rewind();
  mplayer[idx].shiftGain(-80.0, 0, 1000);   // 1000ms is chosen as a ramp to counteract the delay before each station's info appears
  mplayer[idx].loop();
  println("Randomly chosen sample is "+idx);  
}
