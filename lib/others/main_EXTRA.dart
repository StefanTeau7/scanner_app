import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scanner_app/others/constants.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:scanner_app/others/widgets.dart';

class MainScreen extends StatefulWidget {
  final FirebaseUser user;

  MainScreen({Key key, this.user})
      : assert(user != null),
        super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ScanResult scanResult;

  final _flashOnController = TextEditingController(text: "Flash on");
  final _flashOffController = TextEditingController(text: "Flash off");
  final _cancelController = TextEditingController(text: "Cancel");
  var _aspectTolerance = 0.00;
  var _numberOfCameras = 0;
  var _selectedCamera = -1;
  var _useAutoFocus = true;
  var _autoEnableFlash = false;

  static final _possibleFormats = BarcodeFormat.values.toList()
    ..removeWhere((e) => e == BarcodeFormat.unknown);

  List<BarcodeFormat> selectedFormats = [..._possibleFormats];
  initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      _numberOfCameras = await BarcodeScanner.numberOfCameras;
      setState(() {});
    });
  }
// -------- USER INTERFACE  ---------

  @override
  Widget build(BuildContext context) {
    var contentList = <Widget>[
      if (scanResult != null)
        Card(
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text("Result Type"),
                subtitle: Text(scanResult.type?.toString() ?? ""),
              ),
              ListTile(
                title: Text("Raw Content"),
                subtitle: Text(scanResult.rawContent ?? ""),
              ),
              ListTile(
                title: Text("Format"),
                subtitle: Text(scanResult.format?.toString() ?? ""),
              ),
              ListTile(
                title: Text("Format note"),
                subtitle: Text(scanResult.formatNote ?? ""),
              ),
            ],
          ),
        ),
      ListTile(
        title: Text("Camera selection"),
        dense: true,
        enabled: false,
      ),
      RadioListTile(
        onChanged: (v) => setState(() => _selectedCamera = -1),
        value: -1,
        title: Text("Default camera"),
        groupValue: _selectedCamera,
      ),
    ];

    for (var i = 0; i < _numberOfCameras; i++) {
      contentList.add(RadioListTile(
        onChanged: (v) => setState(() => _selectedCamera = i),
        value: i,
        title: Text("Camera ${i + 1}"),
        groupValue: _selectedCamera,
      ));
    }

    contentList.addAll([
      ListTile(
        title: Text("Button Texts"),
        dense: true,
        enabled: false,
      ),
      ListTile(
        title: TextField(
          decoration: InputDecoration(
            hasFloatingPlaceholder: true,
            labelText: "Flash On",
          ),
          controller: _flashOnController,
        ),
      ),
      ListTile(
        title: TextField(
          decoration: InputDecoration(
            hasFloatingPlaceholder: true,
            labelText: "Flash Off",
          ),
          controller: _flashOffController,
        ),
      ),
      ListTile(
        title: TextField(
          decoration: InputDecoration(
            hasFloatingPlaceholder: true,
            labelText: "Cancel",
          ),
          controller: _cancelController,
        ),
      ),
    ]);

    if (Platform.isAndroid) {
      contentList.addAll([
        ListTile(
          title: Text("Android specific options"),
          dense: true,
          enabled: false,
        ),
        ListTile(
          title:
              Text("Aspect tolerance (${_aspectTolerance.toStringAsFixed(2)})"),
          subtitle: Slider(
            min: -1.0,
            max: 1.0,
            value: _aspectTolerance,
            onChanged: (value) {
              setState(() {
                _aspectTolerance = value;
              });
            },
          ),
        ),
        CheckboxListTile(
          title: Text("Use autofocus"),
          value: _useAutoFocus,
          onChanged: (checked) {
            setState(() {
              _useAutoFocus = checked;
            });
          },
        )
      ]);
    }

    contentList.addAll([
      ListTile(
        title: Text("Other options"),
        dense: true,
        enabled: false,
      ),
      CheckboxListTile(
        title: Text("Start with flash"),
        value: _autoEnableFlash,
        onChanged: (checked) {
          setState(() {
            _autoEnableFlash = checked;
          });
        },
      )
    ]);

    contentList.addAll([
      ListTile(
        title: Text("Barcode formats"),
        dense: true,
        enabled: false,
      ),
      ListTile(
        trailing: Checkbox(
          tristate: true,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          value: selectedFormats.length == _possibleFormats.length
              ? true
              : selectedFormats.length == 0 ? false : null,
          onChanged: (checked) {
            setState(() {
              selectedFormats = [
                if (checked ?? false) ..._possibleFormats,
              ];
            });
          },
        ),
        dense: true,
        enabled: false,
        title: Text("Detect barcode formats"),
        subtitle: Text(
          'If all are unselected, all possible platform formats will be used',
        ),
      ),
    ]);

    contentList.addAll(_possibleFormats.map(
      (format) => CheckboxListTile(
        value: selectedFormats.contains(format),
        onChanged: (i) {
          setState(() => selectedFormats.contains(format)
              ? selectedFormats.remove(format)
              : selectedFormats.add(format));
        },
        title: Text(format.toString()),
      ),
    ));
    return Scaffold(
      backgroundColor: normalColor,
      bottomNavigationBar: BottomAppBar(
          elevation: 15,
          color: secondColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                color: backgroundColor,
                onPressed: () {
                  //Navigator.push
                },
              ),
              IconButton(
                icon: Icon(Icons.bookmark),
                color: backgroundColor,
                onPressed: () {
                  //Navigator.push
                },
              ),
              IconButton(
                icon: Icon(Icons.track_changes),
                color: backgroundColor,
                onPressed: () {
                  //Navigator.push
                },
              ),
            ],
          )),
      body: ListView(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                      height: 100.0,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                ),
                Text("Scazy",
                    style: TextStyle(
                      color: normalColor,
                      fontSize: 50,
                      fontFamily: myFont,
                    )),
              ],
            ),
          ),
          SizedBox(
              height: 200,
              child: Container(
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(15),
                ),
              )),
          RoundedButton(onPressed: scan),
        ],
      ),
    );
  }

  Future scan() async {
    try {
      var options = ScanOptions(
        strings: {
          "cancel": _cancelController.text,
          "flash_on": _flashOnController.text,
          "flash_off": _flashOffController.text,
        },
        restrictFormat: selectedFormats,
        useCamera: _selectedCamera,
        autoEnableFlash: _autoEnableFlash,
        android: AndroidOptions(
          aspectTolerance: _aspectTolerance,
          useAutoFocus: _useAutoFocus,
        ),
      );

      var result = await BarcodeScanner.scan(options: options);

      setState(() => scanResult = result);
    } on PlatformException catch (e) {
      var result = ScanResult(
        type: ResultType.Error,
        format: BarcodeFormat.unknown,
      );

      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          result.rawContent = 'The user did not grant the camera permission!';
        });
      } else {
        result.rawContent = 'Unknown error: $e';
      }
      setState(() {
        scanResult = result;
      });
    }
  }
}
