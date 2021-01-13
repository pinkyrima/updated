import 'package:first_assignment_with_updated/src/model/hero.dart';
import 'package:first_assignment_with_updated/src/utils/constraints.dart';

class Helper {
  static List<Hero> getAllHeroes() {
    List<Hero> heroList = heroes.values.toList();
    heroList.sort((a,b)=>b.id.compareTo(a.id));
    return heroList;
  }

  static Hero getHeroById(int id) {
   return heroes[id];
  }

  static bool createHero(Hero hero) {
    try{
      hero.id =getAllHeroes().first.id+1;
      if(heroes.containsKey(hero.id)){
         return false;
      }else{
        heroes[hero.id]=hero;
      }
      return true;
    }catch(error){
      return false;
    }
  }

  static bool updateHero(Hero hero) {
    try{
      if(heroes.containsKey(hero.id)){
        heroes[hero.id] =hero;
        return true;
      }else{
        return false;
      }
    }
    catch(error){
      return false;
    }
  }

  static List<Hero> searchHero(String key) {
    return getAllHeroes().where((hero) =>
    hero.name.toLowerCase().startsWith(key.toLowerCase()) || hero.convertOrigin().toLowerCase()==key.toLowerCase()).toList();
  }

  static bool deleteHero(int id) {
    try{
     if(heroes.containsKey(id)){
       heroes.remove(id);
       return true;
     }else{
       return false;
     }
    }catch(error){
      return false;
    }
  }

  static Hero duplicateHero(Hero hero) {
    try{
      Hero newHero = Hero(id: getAllHeroes().first.id+1,
          name: "${hero.name} - Duplicate",
          health: hero.health,
          charisma: hero.charisma,
          stamina: hero.stamina,
          origin: hero.origin
      );
      if(heroes.containsKey(newHero.id)){
        return null;
      }else{
        heroes[newHero.id]=newHero;
        return newHero;
      }


    }catch(error){
      return null;
    }


    /*newHero.id=getAllHeroes().first.id+1;
    newHero.name="${hero.name} - Duplicate";*/
    //return flag ? newHero:null;
  }
}
