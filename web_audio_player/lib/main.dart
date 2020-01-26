import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:web_audio_player/presentation/demo_icons.dart';
import 'dart:js' as js;

void main() => runApp(MyApp());

final String soundPath = 'https://freesound.org/data/previews/147/147597_2173181-lq.mp3';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web Audio Player',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Web Audio Player'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 1986;
  
  void clap() {
    _incrementCounter();
    if(kIsWeb) {
      //js.context.callMethod('playAudio', [soundPath.toString()]);
      //js.context.callMethod('playAudio', ['https://storage.constanting.com/flutter/demo/assets/audio/clap.mp3']);
      js.context.callMethod('playAudio', ['assets/audios/clap.mp3']);
    } else {
      // not on the web...
    }
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You clapped $_counter ${_counter==1?'time':'times'}.',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: clap,
        tooltip: 'Clap',
        child: Icon(Demo.claps, size: 40,),
      ),
    );
  }
}
