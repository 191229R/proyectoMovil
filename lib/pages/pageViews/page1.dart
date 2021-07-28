import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class Page1 extends StatefulWidget {
  @override
  Mypage3 createState() => Mypage3();
}

List<String> cosas = [];

class Mypage3 extends State<Page1> {
  String valor = "";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          width: 150.0,
          height: 300.0,
        ),
        Center(),
        FloatingActionButton(
            child: Icon(Icons.camera),
            onPressed: () async {
              String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                  '#A03131', 'Cancelar', false, ScanMode.QR);

              print('valor de datos $barcodeScanRes');

              cosas = barcodeScanRes.split(',');

              print(cosas);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListaCosas()),
              );
            }),
      ],
    );
  }
}

class ListaCosas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de compras"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: cosas.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: new Text('${index + 1}.- ${cosas[index]}'),
              ),
            );
          },
        ),
      ),
    );
  }
}
