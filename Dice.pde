int credits = 1000;
int bet = 10;
int prob = 4;
void setup()
{
	noLoop();
	size(400,400);
}
void draw()
{
	background(0);
	Die randy = new Die(60,160);
	randy.show();
	Die joe = new Die(160,160);
	joe.show();
	Die etc = new Die(260,160);
	etc.show();
	int total = randy.roll + joe.roll + etc.roll;
	fill(255);
	text("Total -------------- " + total, 40, 320);
	if(total < prob)
	{
		credits = credits + (bet*250);
	}
	else
	{
		credits = credits - bet;
	}
	text("Credits ------------ " + credits, 40, 340);
	text("Bet ---------------- " + bet, 40, 360);
    text("Probability -------- " + prob, 40, 380);
    fill(255);
    rect(200,320,165,20);
    rect(200,345,165,20);
    rect(200,370,165,20);
    fill(0);
    text("INCREASE BET BY 10",201,331);
    text("DECREASE BET BY 10",201,356);
    text("BUY 1 CHANCE ENHANCER",201,381);
}
void mousePressed()
{
	if(200 < mouseX && mouseX < 365)
	{
		if(320 < mouseY && mouseY < 340)
		{
			bet = bet + 10;
		}
		else if(345 < mouseY && mouseY < 365)
		{
			bet = bet - 10;
		}
		else if(370 < mouseY&& mouseY < 390)
		{
			prob = prob + 1;
		}
	}
    else
    {
        redraw();
    }
}
class Die //models one single dice cube
{
	int myX, myY, roll;
	Die(int x, int y) //constructor
	{
		myX = x;
		myY = y;
	}
	void show()
	{
		int one = 40;
		int two = 40;
		int three = 40;
		int four = 40;
		int five = 40;
		int six = 40;
		int seven = 40;
		roll = (int)(Math.random()*6+1);
		if(roll == 1)
		{
			four = 255;
		}
		else if(roll == 2)
		{
			three = 255;
			five = 255;
		}
		else if(roll == 3)
		{
			one = 255;
			four = 255;
			seven = 255;
		}
		else if(roll == 4)
		{
			one = 255;
			two = 255;
			six = 255;
			seven = 255;
		}
		else if(roll == 5)
	    {
	    	one = 255;
			two = 255;
			four = 255;
			six = 255;
			seven = 255;
	    }
	    else if(roll == 6)
	    {
	    	one = 255;
			two = 255;
			three = 255;
			five = 255;
			six = 255;
			seven = 255;
	    }
		stroke(0);
		fill(255);
		ellipse(myX+40,myY+40,80,80);
		fill(one,0,0);
		ellipse(20+myX,20+myY,5,5);
		fill(two,0,0);
		ellipse(60+myX,20+myY,5,5);
		fill(three,0,0);
		ellipse(20+myX,40+myY,5,5);
		fill(four,0,0);
		ellipse(40+myX,40+myY,5,5);
		fill(five,0,0);
		ellipse(60+myX,40+myY,5,5);
		fill(six,0,0);
		ellipse(20+myX,60+myY,5,5);
		fill(seven,0,0);
		ellipse(60+myX,60+myY,5,5);
	}
}