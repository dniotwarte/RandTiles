int ilepasow = 5;    // w kratkach na ekranie
int ilepozycji = 9;


void setup(){
  orientation(PORTRAIT);
  //size(600, 1100);
  textSize(130);
  textAlign(CENTER);
  //scale(1,-1);
  
  dlugosc = height / ilepozycji;
  szerokosc = width / ilepasow;
  prep();

}

void draw(){
  if(lost){
    if(lostF<300){
      background(255, 0, 0);
      fill(0);
      text("You Lost", width/2, 200);
      text(score,  width/2, 350);
      lostF++;
    }else{
      lost=false;
      lostF=0;
      score = 0;
      prep();
    }
  }else{
    background(255);
    fill(0);
    for(int i =0; i <melodia.length; i++){
      rect(szerokosc*melodia[i], dlugosc*(abs(i-melodia.length)-1) , szerokosc, dlugosc);
      
    }
    fill(0, 255, 0);
    text(score, width/2, 200);
    
  }
}

int lostF = 0;
boolean lost = false;


int[] melodia = new int[ilepozycji];

int dlugosc;     //w pikselach jednej kratki
int szerokosc;
int score = 0;

void prep(){
  for(int i =0; i<melodia.length; i++){
    RandAdd();
    scroolList();
  }
}


void scroolList(){
  for(int i =0; i<melodia.length-1; i++){
    melodia[i] = melodia[i+1];
  }
}

void RandAdd(){
  melodia[melodia.length-1] = floor(random(0, ilepasow-1)+0.5);
}

void mouseReleased(){
  if(melodia[0] == mouseX/szerokosc){
    scroolList();
    score++;
    RandAdd();
  }else{
    lost=true;
  }
    
}