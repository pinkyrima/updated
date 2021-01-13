import 'package:first_assignment_with_updated/src/model/hero.dart';

enum Origin {
  DC,
  Marvel,
  None,
}

Map<int,Hero> heroes = {
  0:Hero(
    id: 0,
    name: "Batman",
    health: 65,
    stamina: 70,
    charisma: 95,
    origin: Origin.DC,
  ),
  1:Hero(
    id: 1,
    name: "Superman",
    health: 100,
    stamina: 100,
    charisma: 90,
    origin: Origin.DC,
  ),
  2:Hero(
    id: 2,
    name: "Joker",
    health: 60,
    stamina: 60,
    charisma: 100,
    origin: Origin.DC,
  ),
  3:Hero(
    id: 3,
    name: "Captain America",
    health: 90,
    stamina: 100,
    charisma: 90,
    origin: Origin.Marvel,
  ),
  4:Hero(
    id: 4,
    name: "Iron Man",
    health: 85,
    stamina: 85,
    charisma: 95,
    origin: Origin.Marvel,
  ),
};


