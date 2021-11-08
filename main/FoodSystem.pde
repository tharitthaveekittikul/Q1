import java.util.Iterator;
class FoodSystem{
  ArrayList<Food> foods;
  Vec2 origin;
  
  FoodSystem(Vec2 location){
    origin = location.clone();
    foods = new ArrayList<Food>();
  }
  
  void addFood(){
    foods.add(new Food());
  }
  
  void applyForce(Vec2 force){
    for(Food f : foods){
      f.applyForce(force);
    }
  }
  
  void run(){
    Iterator<Food> it = foods.iterator();
    while(it.hasNext()){
      Food f = it.next();
      f.run();
      if(f.isExpired()){
        it.remove();
        
      }
    }
  }
}
