import 'package:flutter/material.dart';
import 'package:kuispraktpm/disease_data.dart';
import 'package:kuispraktpm/pageDetail.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plant Diseases'),
        centerTitle: true,
      ),
      body: GridView.builder(
        
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemCount: 12,
          // vertical: true,
          itemBuilder: (context, index) {
            final Diseases disease = listDisease[index];
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //return HalamanDetail(place: place);
                  return HalamanDetail(disease: disease);
                }));
              },
              child: Card(
                  child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height / 3,
                    child: Image.network(disease.imgUrls),
                  ),
                  Text(disease.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                ],
              )),
            );
            
          }),
    );
  }
}
