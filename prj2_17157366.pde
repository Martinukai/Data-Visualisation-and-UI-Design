//Martin Crowley - 17157366
//MA/MSc Interactive Media
//Visual Coding - Dr. Leon McCarthy
//Assignment 2 - 2018

import ddf.minim.*;
import ddf.minim.effects.*;
AudioPlayer[] mplayer;
Minim minim;

import controlP5.*;
import java.util.*;
ControlP5 cp5;

//**Soundfile credits to the following Freesound.org users**
//Sandermotions - 'Trainstation passenger terminal with hooligans.WAV': https://freesound.org/people/Sandermotions/sounds/222497/
//InspectorJ - 'Ambience, London Waterloo Train Station.wav': https://freesound.org/people/InspectorJ/sounds/394411/
//ice91prinzeugen - 'Sound_Atmo Zurich Main Station.wav': https://freesound.org/people/ice91prinzeugen/sounds/218715/
//Strannix1979 - 'Liège Guillemins Train Station': https://freesound.org/people/Strannix1979/sounds/161319/
//Emanuele_Correani - 'Ambience - Train Station - Outside': https://freesound.org/people/Emanuele_Correani/sounds/332770/
//clt008 - 'DH14_SchipTrain1AirBrake.aif': https://freesound.org/people/clt008/sounds/231711/
//alex@vsi.tv - 'Train_Station_walking_out_of_a_train_through_station_to_ticket_barrier.wav': https://freesound.org/people/alex@vsi.tv/sounds/277757/
String[] songs={"train1.wav", "train2.wav", "train3.wav", "train4.wav", "train4.wav", "train6.wav"};

String urlStationInfo = "http://" + "api.irishrail.ie/realtime/realtime.asmx/getStationsFilterXML?StationText=";

XML xmlA; 
XML[] childrenA;

XML xmlS; 
XML[] childrenS;
  
String[] storedName;

StringList arrayOrigin;
StringList arrayDestination;
IntList arrayDueTimes;
IntList arrayLateTimes;
StringList arrayID;
StringList stationID;

Timer timer = new Timer(50000); // Query every 50secs (XML feed only updates every minute)

int index, angle = 0, scaler = 8, idx = 0;   
String  settingsValue[] = new String[4]; 

//________________________________________________________________________________________________________________________________ 
void setup() {
  //size(800, 800);  
  fullScreen();   // *** Runs slower in full screen ***
  
  settingsValue = loadStrings("settings.txt"); {
    float(split(settingsValue[0], ",")[1]);
    float(split(settingsValue[1], ",")[1]);
    float(split(settingsValue[2], ",")[1]);
    float(split(settingsValue[3], ",")[1]);
  }//settingsValue  
  
  minim = new Minim(this);
  mplayer=new AudioPlayer[songs.length];

  for (int i=0; i<songs.length; i++) {      
    mplayer[i] = minim.loadFile(songs[i]);  // Instantly play one of the random soundfiles on startup
    mplayer[i].play();
    mplayer[i].pause();
  }
  
  randomSoundfilePlayer();
  
  cp5 = new ControlP5(this); 
  
  requestStationData();
  requestArrayData();  
  timer.start();
  
  scrollableList();  
} 
//________________________________________________________________________________________________________________________________ 
void draw() {
  background(#EDB512);  
    
  if (timer.isFinished()) {   // Every 50 secs, make a new request.
    println("Timer is finished: Requesting values and restarting"); 
    requestStationData();     // First, get the list of stations codes for every station on the country.
    requestArrayData();       // Use the above list of stations as a basis to check each for data on each station.
    timer.start();            // And restart the timer. 
  }
  
  drawArcs();                 // Draw the animated visualisation

}
