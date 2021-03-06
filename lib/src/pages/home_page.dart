import 'package:flutter/material.dart';

import 'package:scanner/src/widget/custom_navigationBar.dart';
import 'package:scanner/src/widget/scanner_floatingButton.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scanner'),
        centerTitle: true,
        actions:  [
          Icon(Icons.delete) 
          ],
      ),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScannerFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation .centerDocked,
    );
  }
}