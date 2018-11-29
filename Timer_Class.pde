// Credit: Daniel Shiffman - 'Timer'
// https://github.com/shiffman/LearningProcessing/blob/master/chp10_algorithms/exercise_10_04_improved_rain_game/Timer.pde
class Timer {
  int savedTime;
  boolean running = false;
  int totalTime;
 
  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }
 
  void start() {
    running = true;
    savedTime = millis();
  }
 
  boolean isFinished() {
    int passedTime = millis() - savedTime;
    if (running && passedTime > totalTime) {
      running = false;
      return true;
    } else {
      return false;
    }
  }
}
