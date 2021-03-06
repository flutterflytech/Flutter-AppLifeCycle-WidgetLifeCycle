import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String title = 'Flutter Home Page';

  void updateTitle() {
    setState(() {
      title = 'New Flutter Home Page';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: title,
        onPressed: updateTitle,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
    this.title,
    this.onPressed,
  }) : super(key: key);

  final String title;
  final VoidCallback onPressed;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  AnimationController _animationController;
  AppLifecycleState _appLifecycleState;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    print('MMMMMM initState');
    _animationController = AnimationController(vsync: this);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    print('MMMMMM didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    // TODO: implement didUpdateWidget
    print('MMMMMM didUpdateWidget');
    if (this.widget.title != oldWidget.title) {
      print('MMMMMM Title has changed');
    }
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    print('MMMMMM deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print('MMMMMM dispose');
    _animationController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      _appLifecycleState = state;
      print("MMMMMM App State: $_appLifecycleState");
    });
  }

  @override
  Widget build(BuildContext context) {
    print('MMMMMM build');

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _appLifecycleState.toString(),
            ),
            ElevatedButton(
              onPressed: widget.onPressed,
              child: Text('DidUpdateWidget'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ExampleRoutedPage()),
                );
              },
              child: Text('Dispose'),
            ),
          ],
        ),
      ),
    );
  }
}

class ExampleRoutedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
