import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
// import 'package:qr_scanner_generator/scan.dart';
// import 'package:qr_scanner_generator/generate.dart';
// import 'package:flutter/rendering.dart';

class QRScannner extends StatefulWidget {
  @override
  _QRScannnerState createState() => _QRScannnerState();
}

class _QRScannnerState extends State<QRScannner> {
  String qrCodeResult;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(8.0),
      onPressed: () async {
        String codeScanner = await BarcodeScanner.scan();
        qrCodeResult = codeScanner;
      },
      child: Text("QR SCanner"),
    );
  }
}
