import 'package:first_assignment_with_updated/src/utils/constraints.dart';
import 'package:flutter/material.dart';

import '../utils/constraints.dart';


class Hero {
  int id;
  String name;
  int health = 0;
  int charisma = 0;
  int stamina = 0;
  Origin origin;

  Hero({
    @required this.id,
    @required this.name,
    @required this.health,
    @required this.charisma,
    @required this.stamina,
    @required this.origin,
  });


String convertOrigin(){
  switch(origin){
    case Origin.DC:
      return "DC";
      break;
    case Origin.Marvel:
      return "Marvel";
      break;
    default:
      return "Unknown";

  }
}

}
