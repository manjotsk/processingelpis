Ball ball= new Ball(400,100,0,5,50);
Ball ball2= new Ball(400,200,10,5,100);
int noOfBalls=300;
Ball[] balls = new Ball[noOfBalls];

void setup(){
  size(640,480);
  for(int i=0; i<noOfBalls; i++){
    balls[i]=new Ball(int(random(1,width-1)),int(random(1,height-1)),int(random(-2,5)),int(random(-2,5)),int(random(10,20)));
  }
}
void draw(){
  background(155);
  for(int i=0;i<noOfBalls;i++){
    balls[i].display();
    balls[i].update();
  }
}
class Ball{
  private int y=100;
  private int x=400;
  private int dy=5;
  private int dx=0;
  private int size=50;
  public Ball(int x, int y, int dx, int dy,int size){
    this.x=x;
    this.y=y;
    this.dx=dx;
    this.dy=dy;
    this.size=size;
  }
  public void update(){
    move();
    checkCollidingWithWalls();
  }
  public void move(){
   y+=dy;
   x+=dx;
  }
  public void checkCollidingWithWalls(){
    if(isCollidingWithHorizontalWalls()){
      setdy(getdy()*-1);
    }
    if(isCollidingWithVerticleWalls()){
      setdx(getdx()*-1);
    }
  }
  public boolean isCollidingWithVerticleWalls(){
    if(getx()>width-getSize()/2||getx()<getSize()/2){
      return true;
    }
    return false;
  }
  public boolean isCollidingWithHorizontalWalls(){
    if(gety()>height-getSize()/2||gety()<getSize()/2){
      return true;
    }
    return false;
  }

  public void setdy(int dy){
    this.dy = dy;
  }
  public int getdy(){
    return this.dy;
  }
  public int getdx(){
    return this.dx;
  }
  public int gety(){
    return this.y;
  }
  public int getx(){
    return this.x;
  }
  public int getSize(){
    return this.size;
  }
  public void setdx(int dx){
    this.dx = dx;
  }
  public void display(){
    ellipse(x,y,size,size);
  }
  
}
