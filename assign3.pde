final int GAME_START = 0, GAME_RUN = 1, GAME_OVER = 2;
int gameState = 0;

final int GRASS_HEIGHT = 15;
final int START_BUTTON_W = 144;
final int START_BUTTON_H = 60;
final int START_BUTTON_X = 248;
final int START_BUTTON_Y = 360;
int groundHogX=320;
int groundHogY=80;
int groundHogSpeed=80;
int soldierX;
int soldierY;
int life1=10, life2=80, life3=-300, life4=-400 , life5=-500;
int soilY;
int groundHogMove=0;

//movement
int moveRange=80;
final int stop=0; 
final int goRight=1;
final int goLeft=2;
final int goDown=3;
int movement=stop;

PImage title, gameover, startNormal, startHovered, restartNormal, restartHovered;
PImage bg, soil8x24 , groundHog, life , soldier , soil0, soil1 , soil2 , soil3 , soil4 , soil5;
PImage stone1 , stone2;
// For debug function; DO NOT edit or remove this!
int playerHealth = 2;
float cameraOffsetY = 0;
boolean debugMode = false;


void setup() {
	size(640, 480, P2D);
	// Enter your setup code here (please put loadImage() here or your game will lag like crazy)
	bg = loadImage("img/bg.jpg");
	title = loadImage("img/title.jpg");
	gameover = loadImage("img/gameover.jpg");
	startNormal = loadImage("img/startNormal.png");
	startHovered = loadImage("img/startHovered.png");
	restartNormal = loadImage("img/restartNormal.png");
	restartHovered = loadImage("img/restartHovered.png");
	
  groundHog = loadImage("img/groundhogIdle.png");
  life = loadImage("img/life.png");
  soil0 = loadImage("img/soil0.png");
  soil1 = loadImage("img/soil1.png");
  soil2 = loadImage("img/soil2.png");
  soil3 = loadImage("img/soil3.png");
  soil4 = loadImage("img/soil4.png");
  soil5 = loadImage("img/soil5.png");
  stone1 = loadImage("img/stone1.png");
  stone2 = loadImage("img/stone2.png");
}

void draw() {
    /* ------ Debug Function ------ 

      Please DO NOT edit the code here.
      It's for reviewing other requirements when you fail to complete the camera moving requirement.

    */
    if (debugMode) {
      pushMatrix();
      translate(0, cameraOffsetY);
    }
    /* ------ End of Debug Function ------ */

    
	switch (gameState) {

		case GAME_START: // Start Screen
		image(title, 0, 0);

		if(START_BUTTON_X + START_BUTTON_W > mouseX
	    && START_BUTTON_X < mouseX
	    && START_BUTTON_Y + START_BUTTON_H > mouseY
	    && START_BUTTON_Y < mouseY) {

			image(startHovered, START_BUTTON_X, START_BUTTON_Y);
			if(mousePressed){
				gameState = GAME_RUN;
				mousePressed = false;
			}

		}else{

			image(startNormal, START_BUTTON_X, START_BUTTON_Y);

		}
		break;

		case GAME_RUN: // In-Game


    switch(movement){
    case stop:
    groundHog = loadImage("img/groundhogIdle.png");
    groundHogY+=0;
    break;
    
    case goDown:
        
        if(groundHogMove < 20){
        groundHogMove++;
        groundHog = loadImage("img/groundhogDown.png");
        if(groundHogY%moveRange==0){movement=stop;}  
        }else{
         groundHogY+=5;
         groundHog = loadImage("img/groundhogDown.png");
         moveRange=80;
        }
        if(groundHogY%moveRange==0){movement=stop;}  
       //if(groundHogY>=1600){  
       //if(groundHogY%moveRange==0){movement=stop;}}
        break;
    case goLeft:
          groundHogX-=5;
          groundHog = loadImage("img/groundhogLeft.png");
          if(groundHogX%moveRange==0){movement=stop;}
        break;
    case goRight:
          groundHogX+=5;
          groundHog = loadImage("img/groundhogRight.png");
          if(groundHogX%moveRange==0){movement=stop;}
        break;
    }
		// Background
		image(bg, 0, 0);

		// Sun
	    stroke(255,255,0);
	    strokeWeight(5);
	    fill(253,184,19);
	    ellipse(590,50,120,120);

		// Grass
		fill(124, 204, 25);
		noStroke();
		rect(0, 160 - GRASS_HEIGHT-soilY, width, GRASS_HEIGHT);



		// Soil - REPLACE THIS PART WITH YOUR LOOP CODE!
		for(int y=160 ; y<=480 ; y+=80){
   for(int x=0 ; x<width ; x+=80)
   image(soil0, x, y-soilY); }
   
   for(int y=480 ; y<=480+320 ; y+=80){
   for(int x=0 ; x<width ; x+=80)
   image(soil1, x, y-soilY); }
   
    for(int y=800 ; y<=800+320 ; y+=80){
   for(int x=0 ; x<width ; x+=80)
   image(soil2, x, y-soilY); }
   
   for(int y=1120 ; y<=1120+320 ; y+=80){
   for(int x=0 ; x<width ; x+=80)
   image(soil3, x, y-soilY); }
   
   for(int y=1440 ; y<=1440+320 ; y+=80){
   for(int x=0 ; x<width ; x+=80)
   image(soil4, x, y-soilY); }
   
   for(int y=1760 ; y<1760+320 ; y+=80){
   for(int x=0 ; x<width ; x+=80)
   image(soil5, x, y-soilY); }
   
  
      //stone
      //1-8
    for(int i=0; i<=720 ; i+=80){
    image(stone1 , i , 160+i-soilY);}
   
    //9-16
    for(int y=800; y<800+320 ; y+=240){
    for(int x=80; x<640 ; x+=320)
    image(stone1 , x , y-soilY);}
    
    for(int y=800; y<800+320 ; y+=240){
    for(int x=160; x<640 ; x+=320)
    image(stone1 , x , y-soilY);}
    
    for(int y=1120; y<1120+320 ; y+=240){
    for(int x=80; x<640 ; x+=320)
    image(stone1 , x , y-soilY);}
    
    for(int y=1120; y<1120+320 ; y+=240){
    for(int x=160; x<640 ; x+=320)
    image(stone1 , x , y-soilY);}
    
    for(int y=880; y<880+320 ; y+=320){
    for(int x=0; x<640 ; x+=320)
    image(stone1 , x , y-soilY);}
    
    for(int y=960; y<960+320 ; y+=320){
    for(int x=0; x<640 ; x+=320)
    image(stone1 , x , y-soilY);}
    
    for(int y=880; y<880+320 ; y+=320){
    for(int x=240; x<640 ; x+=320)
    image(stone1 , x , y-soilY);}
    
    for(int y=960; y<960+320 ; y+=320){
    for(int x=240; x<640 ; x+=320)
    image(stone1 , x , y-soilY);}
    
    for(int y=1200; y<1200+240 ; y+=320){
    for(int x=0; x<640 ; x+=320)
    image(stone1 , x , y-soilY);}
    
    for(int y=1280; y<1280+240 ; y+=320){
    for(int x=0; x<640 ; x+=320)
    image(stone1 , x , y-soilY);}
    
    for(int y=1200; y<1200+240 ; y+=320){
    for(int x=240; x<640 ; x+=320)
    image(stone1 , x , y-soilY);}
    
    for(int y=1280; y<1280+240 ; y+=320){
    for(int x=240; x<640 ; x+=320)
    image(stone1 , x , y-soilY);}
    
    //17-24
  
    for(int A=1120 ; A>0 ;A-=240)
    for(int y=1440; y<=2080; y+=80){
      A-=80;
    for(int x=A; x>=0 ; x-=240){
     image(stone1,x,y-soilY);}
    for(int x=A+80; x>=0 ; x-=240){
        image(stone1,x,y-soilY);
      
    for(int a=A+80; a>=0 ; a-=240){
  image(stone2,a,y-soilY);}}}
    
    
    
   
    
    
		// Player
    image(groundHog,groundHogX,groundHogY);
    
    
		// Health UI
    
     
     for(int i=10 ;  i<70*playerHealth+10; i+=70){
     image(life, i,10);}
     
     
   
		break;

		case GAME_OVER: // Gameover Screen
		image(gameover, 0, 0);
		
		if(START_BUTTON_X + START_BUTTON_W > mouseX
	    && START_BUTTON_X < mouseX
	    && START_BUTTON_Y + START_BUTTON_H > mouseY
	    && START_BUTTON_Y < mouseY) {

			image(restartHovered, START_BUTTON_X, START_BUTTON_Y);
			if(mousePressed){
				gameState = GAME_RUN;
				mousePressed = false;
       life1=10; life2=80; life3=-300; life4=-400; life5=-500;
				// Remember to initialize the game here!
			}
		}else{

			image(restartNormal, START_BUTTON_X, START_BUTTON_Y);

		}
		break;
		
	}

    // DO NOT REMOVE OR EDIT THE FOLLOWING 3 LINES
    if (debugMode) {
        popMatrix();
    }
}

void keyPressed(){
	// Add your moving input code here
if(groundHogX%moveRange==0 && groundHogY%moveRange==0){
 switch(keyCode){
 case DOWN:
 soilY+=moveRange;
  if(soilY>=1600){
  soilY=1600;
  groundHogY+=80;}
  if(groundHogY>=height){groundHogY=height-80;}
 if(groundHogY+moveRange<height){movement=goDown;}
 break;
 case RIGHT:
 if(groundHogX+moveRange<width){movement=goRight;}
 break;
 case LEFT:
 if(groundHogX>0){movement=goLeft;}
 break;
 }}

//if(key == CODED){
  //switch(keyCode){
 
  //case DOWN:
  //soilY+=80;
  //if(soilY>=1600){
  //soilY=1600;
  //groundHogY+=80;}
  //if(groundHogY>=height){groundHogY=height-80;}
  
  
  //break;
  
  //case LEFT:
  //groundHogX -= groundHogSpeed;
  //if (groundHogX<0){groundHogX=0;}
  //break;
  
  //case RIGHT:
  //groundHogX += groundHogSpeed;
  //if (groundHogX>560){groundHogX=560;}
  //break;
//}
//}
	// DO NOT REMOVE OR EDIT THE FOLLOWING SWITCH/CASES
    switch(key){
      case 'w':
      debugMode = true;
      cameraOffsetY += 25;
      break;

      case 's':
      debugMode = true;
      cameraOffsetY -= 25;
      break;

      case 'a':
      if(playerHealth > 0)playerHealth--;
     
     
      
      break;

      case 'd':
      if(playerHealth < 5)playerHealth++;
      break;
    }
}

void keyReleased(){
}
