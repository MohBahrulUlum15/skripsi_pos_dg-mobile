import 'package:flutter/material.dart';
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
        title: Text('Hasil Pemeriksaan'),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              // Display other relevant data from responseData as needed
              if (widget.responseData.hasil != null)
                Column(
                  children: [
                    Text('Usia: ${widget.responseData.usia}'),
                    const SizedBox(height: 4),
                    Text('Berat Badan: ${widget.responseData.beratBadan}'),
                    const SizedBox(height: 4),
                    Text('Tinggi Badan: ${widget.responseData.tinggiBadan}'),
                    const SizedBox(height: 16),
                    const Text(
                      'Detail Status Gizi Balita',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'BB/U: ${widget.responseData.hasil!.bbU!.statusGizi}'),
                        const SizedBox(height: 4),
                        Text(
                            'TB/U: ${widget.responseData.hasil!.tbU!.statusGizi}'),
                        const SizedBox(height: 4),
                        Text(
                            'BB/TB: ${widget.responseData.hasil!.bbTb!.statusGizi}'),
                      ],
                    )
                  ],
                )
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Simpan Data'),
            onPressed: () {
              widget.onConfirm();
              Navigator.of(context).pop();
            },
          ),
          // TextButton(
          //   child: Text('Close'),
          //   onPressed: () {
          //     widget.onClose();
          //     Navigator.of(context).pop();
          //   },
          // ),
        ],
      ),
    );
  }
}
