import 'dart:io';

import 'package:example_design/example_design.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:mek_stripe_terminal/mek_stripe_terminal.dart';
import 'package:flutter/material.dart';
import 'package:vader_app/vader_app.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  List<Reader> _readers = [];
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    final permissions = [
      Permission.locationWhenInUse,
      Permission.bluetooth,
      if (Platform.isAndroid) ...[Permission.bluetoothScan, Permission.bluetoothConnect],
    ];
    await permissions.request();

    await Terminal.initTerminal(
      fetchToken: () async {
        // Call your backend to get the connection token and return to this function
        // Example token can be.
        const token = "pst_test_YWNjdF8xUjBPQ0hIdlg5cTFVSGh6LFZUYXNrS2lxTXRFRWZHNzMwVXM2RTVROUpQcWFNRE0_00Gh65fnUQ";

        return token;
      },
    );

    Terminal.instance.discoverReaders(BluetoothDiscoveryConfiguration(isSimulated: true)).listen((
      List<Reader> readers,
    ) async {
      //logger.info(readers.toString());
      //setState(() => _readers = readers);

      await Terminal.instance.connectReader(
        readers.first,
        configuration: BluetoothConnectionConfiguration(locationId: 'Praha123', readerDelegate: MyMobileReaderDelegate()),
      );
      print("Connected to a device");
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageLayout(title: "Payment", child: Center(child: Text("This is Payment page.")));
  }
}

class MyMobileReaderDelegate extends MobileReaderDelegate {
  @override
  void onReportAvailableUpdate(ReaderSoftwareUpdate update) {
    print('A new update is available!');
  }

  @override
  void onFinishInstallingUpdate(ReaderSoftwareUpdate? update, TerminalException? exception) {
    // TODO: implement onFinishInstallingUpdate
  }

  @override
  void onReportReaderSoftwareUpdateProgress(double progress) {
    // TODO: implement onReportReaderSoftwareUpdateProgress
  }

  @override
  void onRequestReaderDisplayMessage(ReaderDisplayMessage message) {
    // TODO: implement onRequestReaderDisplayMessage
  }

  @override
  void onRequestReaderInput(List<ReaderInputOption> options) {
    // TODO: implement onRequestReaderInput
  }

  @override
  void onStartInstallingUpdate(ReaderSoftwareUpdate update, Cancellable cancelUpdate) {
    // TODO: implement onStartInstallingUpdate
  }
  // and handle others methods...
}
