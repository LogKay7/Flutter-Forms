import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,

        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      home: MyHomePage(title: 'Flutter Demo Formulaires'),

    );
  }

}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
{

  String _tf = 'Aucun texte saisi';
  String _tfs = 'Aucun texte soumis';

  String _ctf = 'Aucun texte saisi';
  String _ctfs = 'Aucun texte soumis';

  String _num = 'Aucun numéro saisi';


  TextStyle _textStyleDefault = TextStyle(
    color: Colors.white,
  );

  TextStyle _textStyleSaisie = TextStyle(
    color: Colors.amber,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context){
    return Scaffold(
        resizeToAvoidBottomPadding: true,
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.yellow,
        ),
        body: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 20)),
                  Text(
                      'Formulaire',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.blue
                      )
                  ),
                  Divider(),
                  Padding(padding: EdgeInsets.only(bottom: 20)),
                  Container(
                    height: MediaQuery.of(context).size.height*0.7,
                    width: MediaQuery.of(context).size.width*0.9,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('1- Saisie d\'un texte dans une TextField :'),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Saisissez ce que vous voulez !',
                          ),
                          onChanged: (value){
                            setState(() {
                              _tf = value;
                            });
                          },
                          onSubmitted: (value){
                            setState(() {
                              _tfs = value;
                            });
                          },
                        ),
                        Padding(padding: EdgeInsets.only(top: 20)),
                        Text('2- Saisie d\'un texte dans une CupertinoTextField :'),
                        Padding(padding: EdgeInsets.only(top: 10)),

                        CupertinoTextField(
                          placeholder: 'Saisissez ce que vous voulez !',
                          onChanged: (value){
                            setState(() {
                              _ctf = value;
                            });
                          },
                          onSubmitted: (value){
                            setState(() {
                              _ctfs = value;
                            });
                          },
                        ),

                        Padding(padding: EdgeInsets.only(top: 20)),
                        Text('3- Saisie d\'un numéro :'),
                        TextField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: 'Saisissez un nombre!',
                          ),
                          onChanged: (value){
                            setState(() {
                              _num = value;
                            });
                          },
                          onSubmitted: (value){
                            _num = value;
                          },
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 40)),
                        Container(
                          width: MediaQuery.of(context).size.width*0.9,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Padding(padding: EdgeInsets.only(top: 10)),
                              Text(
                                '1- Texte en cours de saisie dans le TextField : ',
                                style: _textStyleDefault,
                              ),
                              Text(
                                '$_tf',
                                style: _textStyleSaisie,
                              ),
                              Text(
                                '1- Texte soumis dans le TextField : ',
                                style: _textStyleDefault,
                              ),
                              Text(
                                '$_tfs',
                                style: _textStyleSaisie,
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 10)),
                              Text(
                                '2- Texte en cours de saisie dans le CupertinoTf : ',
                                style: _textStyleDefault,
                              ),
                              Text(
                                '$_ctf',
                                style: _textStyleSaisie,
                              ),
                              Text(
                                '2- Texte soumis dans le CupertinoTextField : ',
                                style: _textStyleDefault,
                              ),
                              Text(
                                '$_ctfs',
                                style: _textStyleSaisie,
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 10)),
                              Text(
                                '3- Numéro saisi : ',
                                style: _textStyleDefault,
                              ),
                              Text(
                                '$_num',
                                style: _textStyleSaisie,
                              ),

                              Padding(padding: EdgeInsets.only(bottom: 10)),
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Colors.lightBlueAccent,
                              boxShadow: [BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 30.0,
                                  spreadRadius: -15.0,
                                  offset: Offset(0, 15)
                              )]
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
        )
    );
  }
}
