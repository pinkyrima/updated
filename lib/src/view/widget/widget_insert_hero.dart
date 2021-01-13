
import 'package:first_assignment_with_updated/src/model/hero.dart' as model;
import 'package:first_assignment_with_updated/src/utils/constraints.dart';
import 'package:first_assignment_with_updated/src/utils/helper.dart';
import 'package:flutter/material.dart';

class InsertHero extends StatefulWidget {
  final Function() onSuccess;

  InsertHero({this.onSuccess});

  @override
  _InsertHeroState createState() => _InsertHeroState();
}

class _InsertHeroState extends State<InsertHero> {
  TextEditingController nameController = TextEditingController();

  int stamina = 1;
  int health = 1;
  int charisma = 1;
  Origin origin = Origin.None;

  model.Hero hero;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("WelCome New Hero Screen"),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
          padding: EdgeInsets.all(16.0),
          children: [
            TextFormField(
              validator: (val) =>val.isEmpty ? "* required" : null,

              controller: nameController,
            ),
            SizedBox(
              height: 12,
            ),
            Text("Stamina"),
            Slider(
              value: stamina.toDouble(),
              onChanged: (val) {
                setState(() {
                  stamina = val.toInt();
                });
              },
              max: 100,
              min: 1,
            ),
            SizedBox(
              height: 12,
            ),
            Text("Health"),
            Slider(
              value: health.toDouble(),
              onChanged: (val) {
                setState(() {
                  health = val.toInt();
                });
              },
              max: 100,
              min: 1,
            ),
            SizedBox(
              height: 12,
            ),
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
                  charisma = val.toInt();
                });
              },
              max: 100,
              min: 1,
            ),
            SizedBox(
              height: 12,
            ),
            DropdownButtonFormField(
              validator: (value)=>value == Origin.None? "* required" : null,
              hint:Text('please select one'),
                value: origin,
                onChanged: (newValue){
                setState(() {
                  origin=newValue;
                });
                },
                items: ["please select one","DC","Marvel"].map((item) {
                  return DropdownMenuItem(
                      child: new Text(item),
                  value: item.toLowerCase()=="please select one" ? Origin.None : item =="DC" ? Origin.DC : Origin.Marvel
                  );
                }).toList(),
            ),
            //items: null, onChanged: null

            SizedBox(
              height: 12,
            ),
            RaisedButton(
              color: Colors.teal.shade100,
              onPressed: () {
                if(formKey.currentState.validate()){
                hero = model.Hero(
                id: Helper.getAllHeroes().first.id + 1,
                name: nameController.text,
                stamina: stamina,
                charisma: charisma,
                health: health,
                origin: Origin.DC,
                );

                if (Helper.createHero(hero)) {
                Navigator.of(context).pop();
                widget.onSuccess();
                } else {
                print("Insert failed");
                }
         }

              },
              child: Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}
