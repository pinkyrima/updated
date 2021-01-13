import 'package:first_assignment_with_updated/src/model/hero.dart' as model;
import 'package:first_assignment_with_updated/src/utils/helper.dart';
import 'package:first_assignment_with_updated/src/view/screen_hero_details.dart';
import 'package:first_assignment_with_updated/src/view/widget/widget_insert_hero.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<model.Hero> heroList = [];
  @override
  void initState() {
    heroList = Helper.getAllHeroes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("WelCome",style: TextStyle(
            fontSize: 25,fontWeight: FontWeight.bold),)),
        leadingWidth: 20,
        backgroundColor: Colors.pink.shade300,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,color: Colors.purple,),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => InsertHero(onSuccess: (){
                setState(() {
                  heroList=Helper.getAllHeroes();

                });
              },)));
        },
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              margin: EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width,
                height: 54,
                child: TextField(
                  onChanged: (key){
                    setState(() {
                      if(key.isNotEmpty){
                        heroList=Helper.searchHero(key);
                      }else{
                        heroList=Helper.getAllHeroes();
                      }
                    });

                  },
                  decoration: InputDecoration(
                    fillColor: Colors.teal.shade50,
                    filled: true,
                    hintText: "Search",
                    isDense: true,
                    suffixIcon: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(30),
                      child: Icon(
                        Icons.search,
                        color: Colors.grey,
                        size: 24,
                      ),
                    ),
                    contentPadding: EdgeInsets.all(12),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(42),
                    ),
                  ),
                )
            ),
            Expanded(child: ListView.builder(
              itemBuilder :(context,index){
                model.Hero hero= heroList[index];
                return ListTile(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HeroDetails(id: hero.id,onRefresh: (){
                          setState(() {
                            heroList = Helper.getAllHeroes();

                          });
                        },)));
                  },
                  leading: CircleAvatar(
                    backgroundColor: Colors.teal.shade50,
                    child: Text(hero.convertOrigin(),style: TextStyle(fontSize: 9),),
                  ),
                  title: Text(hero.name),
                  subtitle: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Stamina: ${heroList[index].stamina}"),
                            ],
                          ),

                          SizedBox(width: 12,),
                          Row(),
                          Text("Health: ${heroList[index].health}"),
                          SizedBox(width: 12,),
                          Text("Charisma: ${heroList[index].charisma}"),

                        ],
                      ),
                      Row(mainAxisSize: MainAxisSize.min,
                        children: [],)
                    ],
                  ),
                );
              },
              itemCount: heroList.length,
              scrollDirection: Axis.vertical,
            physics: ScrollPhysics(),))
          ],
        ),
      )
    );
  }
}
