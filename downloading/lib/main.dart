import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Download());
  }
}

class Download extends StatefulWidget {
  const Download({super.key});

  @override
  State<Download> createState() => _DownloadState();
}

class _DownloadState extends State<Download> {
  var link =
      'https://github.com/afzalali15/flutter_alarm_clock/blob/master/flutter_clock_app.png?raw=true';
  String downloading = 'downloading';
  bool _isDownloading = false;
  double _percent = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton.extended(
            label: Text('Download'),
            icon: Icon(Icons.file_download),
            onPressed: () async {
              setState(() {
                _isDownloading = !_isDownloading;
              });
              var dir = await getExternalStorageDirectory();

              Dio dio = Dio();
              dio.download(
                link,
                '${dir!.path}/sample.jpg',
                onReceiveProgress: (actualbytes, total) {
                  var _progress = (actualbytes / total) * 100;
                  _percent = _progress / 100;
                  setState(() {
                    downloading = 'downloading... ${_progress.floor()} %';
                  });
                },
              );
            },
          ),
          const SizedBox(height: 32),
          Text(downloading, style: Theme.of(context).textTheme.headline2),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: LinearProgressIndicator(
              value: _percent,
            ),
          )
        ],
      ),
    );
  }
}
