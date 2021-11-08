class Fish{
  Body body;
  Vec2 location;
  //Vec2 velocity;
  //Vec2 acceleration;
  Vec2 move;
  float r;
  color col = color(175);
  
  Fish(int x_,int y_){
    r = 10;
    int x = x_;
    int y = y_;
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    location = bd.position.set(box2d.coordPixelsToWorld(x,y));
    //velocity = new Vec2(100,0);
    //acceleration = new Vec2(0,0);
    //move = new Vec2(random(-100,100),0);
    body = box2d.createBody(bd);
    
    CircleShape cat_head = new CircleShape();
    cat_head.m_radius = box2d.scalarPixelsToWorld(r);
    
    //CircleShape cat_body = new CircleShape();
    //cat_body.m_radius = box2d.scalarPixelsToWorld(r);
    FixtureDef fd = new FixtureDef();
    fd.shape = cat_head;
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;
    
    body.createFixture(fd);    
    //body.createFixture(cat_body,1.0);
    body.setUserData(this);
    //fd.setUserData("Cat");
  }
  void run(){
    display();
  }
  
  void upSize(){
    r+=1;
    if(r>=15){
      col = color(0,255,0);
      r=15;
    }
  }
  
  void applyForce(Vec2 force){
    Vec2 pos = body.getWorldCenter();
    body.applyForce(force,pos);
  }
  
  //void updateL(){
  //  location.add(new Vec2(-10,0));
  //}
  //void updateR(){
  //  location.add(new Vec2(10,0));
  //}
  
  boolean contains(float x, float y) {
    Vec2 worldPoint = box2d.coordPixelsToWorld(x, y);
    Fixture f = body.getFixtureList();
    boolean inside = f.testPoint(worldPoint);
    return inside;
  }
  
  void display(){
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    
    rectMode(CENTER);
    pushMatrix();
    translate(pos.x,pos.y);
    //rotate(-a);
    fill(col);
    stroke(0);
    strokeWeight(2);
    ellipse(0,0,r*2,r*2);
    line(0, 0, r, 0);
    //ellipse(r-25,0,r*2,r*2);
    popMatrix();
  }
 
}
