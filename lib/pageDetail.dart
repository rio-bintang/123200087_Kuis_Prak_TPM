import 'package:flutter/material.dart';
import 'package:kuispraktpm/disease_data.dart';

class HalamanDetail extends StatefulWidget {
  final Diseases disease;
  const HalamanDetail({
    Key? key,
    required this.disease,
  }) : super(key: key);

  @override
  State<HalamanDetail> createState() => _HalamanDetailState();
}

class _HalamanDetailState extends State<HalamanDetail> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detail Diseases'),
          centerTitle: true,
          actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
              if (isFavorite == true)
              ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Set Favorite')));
            if (isFavorite == false) {
              ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Unset Favorite')));
            }
            },
            icon: (isFavorite)
                ? Icon(Icons.favorite) 
                : Icon(Icons.favorite_border),
          ),
        ],
          
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(height: 10,),
            Container(
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.height / 4,
                child: Image.network(widget.disease.imgUrls)
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.disease.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,),),
                Text('\nDisease Name', style: TextStyle(fontWeight: FontWeight.bold),),
                Text(widget.disease.name),
                Text('\nPlant Name', style: TextStyle(fontWeight: FontWeight.bold),),
                Text(widget.disease.plantName),
                Text('\nCiri-ciri', style: TextStyle(fontWeight: FontWeight.bold),),
                for (var ciri in widget.disease!.nutshell) Text(ciri + " "),
                Text('\nDisease ID', style: TextStyle(fontWeight: FontWeight.bold),),
                Text(widget.disease.id),
                 Text('\nSympton', style: TextStyle(fontWeight: FontWeight.bold),),
            Container(
                alignment: Alignment.center,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width/ 2,
                  child: Text(widget.disease.symptom),
                )),
            // SizedBox(width: MediaQuery.of(context).size.width * 3/5,child: Text(disease.symptom), ),
          ],),
              ],
            

           
        ));
  }
}
