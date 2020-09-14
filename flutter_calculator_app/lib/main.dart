import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Calcualtor'),
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

  String output = "0";
  double x, y;
  String operand = "", _ouput = "";


  buttonPressed(String btnTxt) {



    if (btnTxt.toLowerCase().contains("clear")) {
      x = 0;
      y = 0;
      operand = "";
      _ouput = "";
    }
    else if (btnTxt == "/" || btnTxt == "*" || btnTxt == "-" || btnTxt == "+") {
      operand = btnTxt;
      x = double.parse(output);
      _ouput = "0";
    }
    else if (btnTxt == ".") {
      if (_ouput.contains(".")) {
        return;
      }
    }
    else if (btnTxt == "=") {

    }




  }


  Widget caluclatorBtn(String btnTxt) {
    return Expanded(
      child: new OutlineButton(
          padding: EdgeInsets.all(24.0),
          child: new Text(btnTxt,
            style: TextStyle (
                fontSize: 20.0,
                fontWeight: FontWeight.w700
            ),
          ),
          onPressed: () => buttonPressed(btnTxt)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(

          title: Text(widget.title),
        ),
        body: new Container(
          child: new Column(
            children: <Widget>[

              Container(



                  padding: EdgeInsets.symmetric(
                      vertical: 24.0,
                      horizontal: 12.0
                  ),

                  alignment: Alignment.centerRight,

                  child: new Text(output,
                    style: new TextStyle(
                        fontSize: 48.0,
                        fontWeight: FontWeight.bold
                    ),
                  )),

              Expanded(
                  child: new Divider()
              ),

              Column(

                children: [
                  Row(
                    children: [
                      caluclatorBtn("7"),
                      caluclatorBtn("8"),
                      caluclatorBtn("9"),
                      caluclatorBtn("/")
                    ],
                  ),
                  Row(
                    children: [
                      caluclatorBtn("4"),
                      caluclatorBtn("5"),
                      caluclatorBtn("6"),
                      caluclatorBtn("*")
                    ],
                  ),
                  Row(
                    children: [
                      caluclatorBtn("1"),
                      caluclatorBtn("2"),
                      caluclatorBtn("3"),
                      caluclatorBtn("-")
                    ],
                  ),
                  Row(
                    children: [
                      caluclatorBtn("."),
                      caluclatorBtn("0"),
                      caluclatorBtn("00"),
                      caluclatorBtn("+")
                    ],
                  ),

                  Row(
                    children: [
                      caluclatorBtn("CLEAR"),
                      caluclatorBtn("=")
                    ],
                  )


                ],
              )


            ],
          ),
        )
    );
  }
}
