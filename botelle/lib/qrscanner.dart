import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'merchants.dart';

// import 'package:qr_scanner_generator/scan.dart';
// import 'package:qr_scanner_generator/generate.dart';
// import 'package:flutter/rendering.dart';

class QRScanner extends StatefulWidget {
  @override
  int bottleSaved = 0;
  _QRScannerState createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  String qrCodeResult;
  @override
  Widget build(BuildContext context) {
    int currentBottle = widget.bottleSaved;
    return Scaffold(
        body: Center(
      child: RaisedButton(
        child: Text(
          'You have eliminated $currentBottle plastic bottles',
        ),
        padding: EdgeInsets.all(8.0),
        onPressed: () async {
          print("hello!");
          String codeScanner = await BarcodeScanner.scan();
          qrCodeResult = codeScanner;
          setState(() {
            widget.bottleSaved += 1;
            currentBottle = widget.bottleSaved;
          });
          print(qrCodeResult);
        },
      ),
    ));
  }
}
