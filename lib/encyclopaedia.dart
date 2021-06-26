import 'package:flutter/material.dart';
import './util.dart';

class Encyclopaedia extends StatefulWidget {

  String searchEntry;

  final double width;

  final List<PlantIndentifier> plantNames = [
    PlantIndentifier("Allium Cepa", commonName: "Onion"),
    PlantIndentifier("Solanum Tubersum", commonName: "Potato"),
    PlantIndentifier("Cucumis Sativas", commonName: "Cucumber"),
    PlantIndentifier("Lactuca Sativa", commonName: "Lettuce"),
    PlantIndentifier("Daucas Carota", commonName: "Carrot"),
    PlantIndentifier("Pyrus malus", commonName: "Apple"),
    PlantIndentifier("Lycopersican Esculentum", commonName: "Tomato"),
    PlantIndentifier("Solanum Melongena", commonName: "Brinjal"),
    PlantIndentifier("Raphanus Sativus", commonName: "Radish"),
    PlantIndentifier("Mangifera Indica", commonName: "Mango"),
    PlantIndentifier("Capsicum Fruitscence", commonName: "Capsicum"),
  ];

  Encyclopaedia({this.width = 300, this.searchEntry=''});

  @override
  State<StatefulWidget> createState() {
    return _Encyclopaedia();
  }
}

class _Encyclopaedia extends State<Encyclopaedia> {

  @override
  Widget build(BuildContext context) {

    List<PlantIndentifier> plants = widget.plantNames.where((element) => (
        widget.searchEntry.length == 0 ||
        element.scientificName.contains(widget.searchEntry) ||
        (element.commonName.contains(widget.searchEntry) && (element.commonName.length != 0))
      )
    ).toList();

    return SingleChildScrollView(
      child: Column(
        children: plants.asMap().entries.map((element) => Card(
          color: (element.key%2 == 0 ? Colors.green : Colors.greenAccent),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Container(
                  width: widget.width,
                  height: 50,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        element.value.scientificName,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                          color: Colors.black87
                        ),
                      )
                    )
                  )
                ),
                Container(
                  width: widget.width,
                  height: 20,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child:Text(
                        element.value.commonName,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          color: Colors.black54
                        ),
                      )
                    )
                  )
                )
              ]
            )
          )
        )).toList()
      )
    );
  }
}