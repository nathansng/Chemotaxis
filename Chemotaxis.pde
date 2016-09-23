 Bacteria [] colony;
 Predator bigBoy, bigBoy2;  

int movingX;
int movingY;

int bigBoyX = (int) (Math.random() * 100);
int bigBoyY = (int) (Math.random() * 100);


int eaten = 0;

 void setup() { 
 	size(400, 400);    
 	colony = new Bacteria [100];
 	for (int i = 0; i < colony.length; i ++) {
 		colony[i] = new Bacteria();
 	}  

 	bigBoy = new Predator(bigBoyX, bigBoyY);

 }

 void draw() {
	background(255);

  	bigBoy.move();
 	bigBoy.show();


 	for (int i = 0; i < colony.length; i ++) {
  		colony[i].move();
  		colony[i].show();
 	}

 	

 }

 class Bacteria {     
 	int myX, myY, myColor, myRed, myBlue, myGreen, mySize;
 	boolean alive;

 	Bacteria () {
 		myX = (int)(Math.random() * 100) + 150;
 		myY = (int)(Math.random() * 100) + 150;

 		mySize = 10;

 		alive = true;

 		// myRed  = (int)(Math.random() * 255) + 1;
 		// myGreen = (int)(Math.random() * 255) + 1;
 		// myBlue = (int)(Math.random() * 255) + 1;

 		myColor = color((int)(Math.random()*255));
 	}

 	void move () {

 		if (myX - mySize <= 0) {
 			movingX = (int)(Math.random() * 5);
 		} else if (myX + mySize >= 400) {
 			movingX = (int)(Math.random() * 5) - 5;
 		} else if (myX > 50 && myX < 350) {
 			movingX = (int)(Math.random() * 5) - 2;
 		}

 		if (myY - mySize <= 0) {
 			movingY = (int)(Math.random() * 5);
 		} else if (myY + mySize >= 400) {
 			movingY = (int)(Math.random() * 5) - 5;
 		} else if (myY > 50 && myX < 350) {
 			movingY = (int)(Math.random() * 5) - 2;
 		}

 		myX = myX + movingX;
 		myY = myY + movingY;

 		
 	}

	

 	void show () {
 		if (get(myX, myY) == color(255, 0, 0)) {
 			if (eaten < 1000) {
 				eaten = eaten + 1;
 			}
			
			alive = false;
		} else {
			alive = true;
		}
 
 		if (alive == true) {
	 		fill(myColor);
	 		ellipse(myX, myY, mySize, mySize);
		} else if (alive == false) {
			int randomLocation = (int) (Math.random() * 4);
			if (randomLocation == 0) {
				myX = (int) (Math.random() * 50) - 200;
				myY = (int) (Math.random() * 400);
			} else if (randomLocation == 1) {
				myX = (int) (Math.random() * 50) + 600;
				myY = (int) (Math.random() * 400);
			} else if (randomLocation == 2) {
				myX = (int) (Math.random() * 400);
				myY = (int) (Math.random() * 50) - 200;
			} else if (randomLocation == 3) {
				myX = (int) (Math.random() * 400);
				myY = (int) (Math.random() * 50 ) + 600;
			}

			alive = true;
		}
 	}



 }    

 class Predator {
 	int myX, myY, mySize, myColor;

 	Predator (int x, int y) {
 		myX = x;
 		myY = y;
 		mySize = 20;
 		myColor = color (255, 0, 0);
 	}

 	void show () {
 		fill(myColor);
 		ellipse(myX, myY, mySize + eaten / 5, mySize + eaten / 5);
 	}

 	void move () {
 		if (myX - mySize <= 0) {
 			movingX = (int)(Math.random() * 5);
 		} else if (myX + mySize >= 400) {
 			movingX = (int)(Math.random() * 5) - 5;
 		} else if (myX > 50 && myX < 350) {
 			movingX = (int)(Math.random() * 5) - 2;
 		}

 		if (myY - mySize <= 0) {
 			movingY = (int)(Math.random() * 5);
 		} else if (myY + mySize >= 400) {
 			movingY = (int)(Math.random() * 5) - 5;
 		} else if (myY > 50 && myX < 350) {
 			movingY = (int)(Math.random() * 5) - 2;
 		}

 		int randomPrey = (int)(Math.random()*colony.length);

 		if (myX < colony[randomPrey].myX) {
 			movingX = (int)(Math.random() * 2);
 		} else if (myX > colony[randomPrey].myX) {
 			movingX = (int)(Math.random() * 2) - 2;
 		}

 		if (myY < colony[randomPrey].myY) {
 			movingY = (int)(Math.random() * 2);
 		} else if (myY > colony[randomPrey].myY) {
 			movingY = (int)(Math.random() * 2) - 2;
 		}

 		myX = myX + movingX;
 		myY = myY + movingY;
 	}
 }