import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Designer',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: MyHomePage(title: 'Designer'),
      debugShowCheckedModeBanner: false,
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

  List<Widget> tree = [];
  double _x = 0, _y = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0.0,
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: width*0.1,
            height: height,
            decoration: BoxDecoration(
              color: Colors.white
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Draggable<String>(
                  data: "circle",
                  child: CustomPaint(
                    painter: ShapePainter(shape: "circle", sx: 30, sy: 30),
                    child: Container(
                      width: 60,
                      height: 60,
                    ),
                  ),
                  feedback: CustomPaint(
                    painter: ShapePainter(shape: "circle",  sx: 30, sy: 30),
                    child: Container(
                      width: 60,
                      height: 60,
                    ),
                  ),
                  childWhenDragging: CustomPaint(
                    painter: ShapePainter(shape: "circle" ,sx: 30, sy: 30),
                    child: Container(
                      width: 60,
                      height: 60,
                    ),
                  ),
                  onDragEnd: (details) {
                    setState(() {
                      _x = details.offset.dx - width*0.1;
                      _y = details.offset.dy - 55;
                    });                    
                  },
                )
              ],
            ),

          ),
          Container(
            width: width*0.9,
            height: height,
            decoration: BoxDecoration(
              color: Colors.grey[200]
            ),  
            child: GestureDetector(
              onTapDown: (data){
                
              },
              child: DragTarget<String>(
                builder: (a,b,c)=>Stack(
                  children: tree,
                ),
                onAccept: (data){
                  double sx = 60, sy = 60;
                  Timer(Duration(microseconds: 1), (){
                    setState(() {
                      tree.add(Positioned(
                        key: Key("$sx$sy"),
                        top: _y,
                        left: _x,
                        child: FlatButton(
                          onPressed: (){
                            
                          },
                          child: CustomPaint(
                            size: Size(sx/2, sy/2),
                            painter: ShapePainter(shape: "circle", sx : sx/2, sy: sy/2),
                            child: Container(
                              width: sx,
                              height: sy,
                            ),
                          ),
                        ),
                      ));
                    });
                  });         
                },
              )
            )      
          )
        ],
      ),  
    );
  }
}

class ShapePainter extends CustomPainter{

  final String shape;
  final double sx,sy;
  ShapePainter({@required this.shape, this.sx, this.sy});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    var center = Offset(size.width/2, size.height/2);
    paint.color = Colors.deepOrange;
    switch (shape) {
      case "circle":
        canvas.drawCircle(center, sx, paint);
        break;
      case "rect":
        var rect = Rect.fromLTRB(0, 0, size.width, size.height);
        canvas.drawRect(rect, paint);
        break;
      case "tri":
        var path = Path();
        path.addPolygon([
          Offset(size.width/2, 0),
          Offset(0, size.height),
          Offset(size.width, size.height)
        ], true);
        canvas.drawPath(path, paint);
        break;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}