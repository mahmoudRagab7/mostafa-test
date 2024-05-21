import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:nfc_card/core/statics.dart';

import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScan extends StatefulWidget {
  const QRScan({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRScanState();
}

class _QRScanState extends State<QRScan> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(child: _buildQrView(context)),
          Positioned(
            top: 60,
            right: 20,
            child: GestureDetector(
              onTap: () async {
                await controller?.stopCamera();
                Navigator.pop(context);
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppStyles.primaryW)),
                child: const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        color: AppStyles.primaryW,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;

    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 40,
          borderWidth: 5,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) async {
      setState(() {
        result = scanData;
      });
      await saveScannedData(scanData.code);

      // Dispose the camera and navigate back
      await controller.stopCamera();
      Navigator.pop(context);
    }); // Automatically save the scanned data
  }

  Future<void> saveScannedData(String? data) async {
    // Implement your saving mechanism here
    log('Scanned QR Code Data: $data');
    // Replace this with actual save logic, e.g., saving to a database or shared preferences
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
