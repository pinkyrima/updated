import 'package:first_assignment_with_updated/src/model/hero.dart' as model;
import 'package:first_assignment_with_updated/src/utils/helper.dart';
import 'package:flutter/material.dart';
class UpdateHero extends StatefulWidget {
  final int id;
  final Function() onSuccess;

  UpdateHero({this.id, this.onSuccess});




  @override
  _UpdateHeroState createState() => _UpdateHeroState();
}

class _UpdateHeroState extends State<UpdateHero> {
  TextEditingController nameController=TextEditingController();

  int stamina=0;
  int health =0;
  int charisma=0;

  model.Hero hero;

  @override
  void initState() {
    hero=Helper.getHeroById(widget.id);
    nameController.text=hero.name;
    health=hero.health;
    charisma=hero.charisma;
    stamina=hero.stamina;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Update"),
      ),
      body: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        padding: EdgeInsets.all(16.0),
        children: [
          TextField(
            controller: nameController,
          ),
          SizedBox(height: 12,),
          Text("Stamina"),
          Slider(value: stamina.toDouble(), onChanged: (val)
          {
            setState(() {
              stamina=val.toInt();
            });
          },
            max: 100,
            min: 0,
          ),
          SizedBox(height: 12,),
          Text("Health"),
          Slider(value: health.toDouble(), onChanged: (val)
          {
            setState(() {
              health=val.toInt();
            });
          },
            max: 100,
            min: 0,
          ),
          SizedBox(height: 12,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Charisma"),
              Text("${charisma.toString()}"),
            ],
          ),
          Slider(
            value: charisma.toDouble(),
            onChanged: (val) {
            setState(() {
              charisma=val.toInt();
            });
          },
            max: 100,
            min: 0,
          ),
          SizedBox(height: 12,),
          RaisedButton(onPressed: (){
            hero.name=nameController.text;
            hero.stamina=stamina;
            hero.charisma=charisma;
            hero.health=health;
            if(Helper.updateHero(hero)){
              widget.onSuccess();
              Navigator.of(context).pop();
            }else{
              print("Update failed");
            }
          },child: Text("Update"),)
        ],
      ),
    );
  }
}
