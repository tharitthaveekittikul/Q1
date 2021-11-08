import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;
import java.util.Iterator;
Box2DProcessing box2d;
Fish fish;
//ArrayList<Food> foods;
FoodSystem fs;
Boundary floor;
int count;
Spring spring;

void setup(){
  size(480,800);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.listenForCollisions();
  box2d.setGravity(0,-9.8);
  fish = new Fish(10,10);
  
  floor = new Boundary(width/2,height+100,width,height);
  //foods = new ArrayList<Food>();
  fs = new FoodSystem(new Vec2(random(width),random(height/2)));
  spring = new Spring();
}

void mousePressed(){
  if(fish.contains(mouseX,mouseY)){
    spring.bind(mouseX,mouseY,fish);
  }
}

void mouseReleased(){
  spring.destroy();
}
void draw(){
  box2d.step();
  background(255);
  floor.display();
  //fish.display();
  fish.run();
  spring.update(mouseX,mouseY);
  //fish2.display();
  spring.display();
  //fish.applyForce(move);
  fs.addFood();
  fs.run();
}

void beginContact(Contact cp){
  Fixture f1 = cp.getFixtureA();
  Fixture f2 = cp.getFixtureB();
  
  Body b1 = f1.getBody();
  Body b2 = f2.getBody();
  
  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();
  
  if(o1.getClass() == Fish.class && o2.getClass() == Food.class){
    Fish c = (Fish) o1;
    count+=1;
    if(count%4 == 3){
      c.upSize();
    }
    Food f = (Food) o2;
    f.killBody();
  }
}

void endContact(Contact cp){
  
}

void removeContact(Contact cp){

}
