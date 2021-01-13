import 'package:first_assignment_with_updated/src/model/hero.dart' as model;
import 'package:first_assignment_with_updated/src/utils/helper.dart';
import 'package:first_assignment_with_updated/src/view/widget/widget_update_hero.dart';
import 'package:flutter/material.dart';

class HeroDetails extends StatefulWidget {
  final int id;
  final Function onRefresh;

   HeroDetails({this.id, this.onRefresh});

  @override
  _HeroDetailsState createState() => _HeroDetailsState();
}

class _HeroDetailsState extends State<HeroDetails> {
  @override
  Widget build(BuildContext context) {
    model.Hero hero = Helper.getHeroById(widget.id);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(hero.name),
        actions: [
          IconButton(icon: Icon(Icons.edit), onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => UpdateHero(
                  onSuccess: (){
                    widget.onRefresh();
                  setState(() {

                  });
                }, id: widget.id,)));
          }),
          IconButton(icon: Icon(Icons.copy), onPressed: (){
           if(
           Helper.duplicateHero(hero)!=null){
             widget.onRefresh();
           }
          }),
          IconButton(icon: Icon(Icons.delete), onPressed: (){

            if(Helper.deleteHero(widget.id)){
              Navigator.of(context).pop();


            }else{
              showDialog(context: context,
                  builder: (context)=>AlertDialog(title: Text("Something Went Wrong"),));
            }
          }),

        ],
      ),

      body: Container(
        margin: EdgeInsets.only(top: 70),
        child: Column(
          children: [
            Center(child: Text("Stamina${hero.stamina}",style: TextStyle(
              fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue.shade500
            ),)),
            SizedBox(height: 16,),
            Center(child: Text("Health${hero.health}",style: TextStyle(
                fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue.shade500
            ),)),
            SizedBox(height: 16,),
            Center(child: Text("Charisma${hero.charisma}",style: TextStyle(
                fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue.shade500
            ),)),
            SizedBox(height: 16,),
            Center(child: Text("Origin${hero.convertOrigin()}",style: TextStyle(
                fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue.shade500
            ),)),

          ],
        ),
      )
    );
  }
}
