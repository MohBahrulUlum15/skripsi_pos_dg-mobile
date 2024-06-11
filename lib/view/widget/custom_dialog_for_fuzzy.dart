import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skripsi_pos_dg/data/models/fuzzy_model.dart';

class CustomDialogForFuzzy extends StatefulWidget {
  final FuzzyModel responseData;
  final VoidCallback onConfirm, onClose;
  const CustomDialogForFuzzy(
      {super.key,
      required this.responseData,
      required this.onConfirm,
      required this.onClose});

  @override
  State<CustomDialogForFuzzy> createState() => _CustomDialogForFuzzyState();
}

class _CustomDialogForFuzzyState extends State<CustomDialogForFuzzy>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return this.widget;
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        title: Text('Data Pemeriksaan'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Usia: ${widget.responseData.usia}'),
              Text('Berat Badan: ${widget.responseData.beratBadan}'),
              Text('Tinggi Badan: ${widget.responseData.tinggiBadan}'),
              // Display other relevant data from responseData as needed
              if (widget.responseData.hasil != null)
                Text('Hasil: ${widget.responseData.hasil!.toJson()}'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Confirm'),
            onPressed: () {
              widget.onConfirm();
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Close'),
            onPressed: () {
              widget.onClose();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
