 Bacteria [] colony;   
 void setup() {     
 	colony = new Bacteria [10];
 	for (int i = 0; i < colony.length; i ++) {
 		colony[i] = new Bacteria;
 	}  
 }

 void draw() {    
 	for (int i = 0; i < colony.length; i ++) {
 		colony[i].show();
 	}
 }

 class Bacteria {     
 	int myX, myY, myColor;

 	Bacteria (int x, int y) {
 		myX = x;
 		myY = y;
 		myColor = fill(Math.random()*255 , Math.random()*255, Math.random()*255)
 	}

 	void move () {

 	}

 	void show () {
 		ellipse(myX, myY, 20, 20);
 	}

 }    