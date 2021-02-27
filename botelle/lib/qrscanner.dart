import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'merchants.dart';

// import 'package:qr_scanner_generator/scan.dart';
// import 'package:qr_scanner_generator/generate.dart';
// import 'package:flutter/rendering.dart';

class QRScanner extends StatefulWidget {
  @override
  _QRScannerState createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  String qrCodeResult;
  int bottleSaved = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: RaisedButton(
        child: Text('You have eliminated $bottleSaved plastic bottles'),
        padding: EdgeInsets.all(8.0),
        onPressed: () async {
          print("hello!");
          String codeScanner = await BarcodeScanner.scan();
          qrCodeResult = codeScanner;
          setState(() {
            bottleSaved += 1;
          });
          print(qrCodeResult);
        },
      ),
    ));
  }
}
