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
  int indexValue = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return RawKeyboardListener(
      focusNode: FocusNode(),
      onKey: (evt) {
        if (evt.data.keyLabel == "z" && evt.isControlPressed) {
          setState(() {
            tree.removeLast();
            return;
          });
        }
        return false;
      },
      autofocus: true,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          elevation: 0.0,
        ),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: width * 0.1,
              height: height,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text("Shapes"),
                  ),
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
                      painter: ShapePainter(shape: "circle", sx: 30, sy: 30),
                      child: Container(
                        width: 60,
                        height: 60,
                      ),
                    ),
                    childWhenDragging: CustomPaint(
                      painter: ShapePainter(shape: "circle", sx: 30, sy: 30),
                      child: Container(
                        width: 60,
                        height: 60,
                      ),
                    ),
                    onDragEnd: (details) {
                      setState(() {
                        _x = details.offset.dx - width * 0.1 - 17;
                        _y = details.offset.dy - 55;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  Draggable<String>(
                    data: "rect",
                    child: CustomPaint(
                      painter: ShapePainter(shape: "rect", sx: 30, sy: 30),
                      child: Container(
                        width: 60,
                        height: 60,
                      ),
                    ),
                    feedback: CustomPaint(
                      painter: ShapePainter(shape: "rect", sx: 30, sy: 30),
                      child: Container(
                        width: 60,
                        height: 60,
                      ),
                    ),
                    childWhenDragging: CustomPaint(
                      painter: ShapePainter(shape: "rect", sx: 30, sy: 30),
                      child: Container(
                        width: 60,
                        height: 60,
                      ),
                    ),
                    onDragEnd: (details) {
                      setState(() {
                        _x = details.offset.dx - width * 0.1 - 17;
                        _y = details.offset.dy - 55;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  Draggable<String>(
                    data: "tri",
                    child: CustomPaint(
                      painter: ShapePainter(shape: "tri", sx: 30, sy: 30),
                      child: Container(
                        width: 60,
                        height: 60,
                      ),
                    ),
                    feedback: CustomPaint(
                      painter: ShapePainter(shape: "tri", sx: 30, sy: 30),
                      child: Container(
                        width: 60,
                        height: 60,
                      ),
                    ),
                    childWhenDragging: CustomPaint(
                      painter: ShapePainter(shape: "tri", sx: 30, sy: 30),
                      child: Container(
                        width: 60,
                        height: 60,
                      ),
                    ),
                    onDragEnd: (details) {
                      setState(() {
                        _x = details.offset.dx - width*0.1 - 17;
                        _y = details.offset.dy - 55;
                      });
                    },
                  )
                ],
              ),
            ),
            Container(
                width: width * 0.9,
                height: height,
                decoration: BoxDecoration(color: Colors.grey[200]),
                child: DragTarget<String>(
                  builder: (a, b, c) => Stack(
                    children: tree,
                  ),
                  onAccept: (data) {
                    double sx = 60, sy = 60;
                    Timer(Duration(microseconds: 1), () {
                      switch (data) {
                        case "circle":
                          setState(() {
                            tree.add(_CustomCircle(
                                sx: sx,
                                sy: sy,
                                y: _y,
                                x: _x,
                                indexValue: indexValue));
                          });
                          break;
                        case "rect":
                          setState(() {
                            tree.add(_CustomRect(
                                sx: sx,
                                sy: sy,
                                y: _y,
                                x: _x,
                                indexValue: indexValue));
                          });
                          break;
                        case "tri":
                        setState(() {
                            tree.add(_CustomTri(
                                sx: sx,
                                sy: sy,
                                y: _y,
                                x: _x,
                                indexValue: indexValue));
                          });
                        break;
                      }
                      indexValue++;
                    });
                  },
                ))
          ],
        ),
      ),
    );
  }
}

class _CustomCircle extends StatefulWidget {
  double sx, sy, _y, _x;
  final int indexValue;
  _CustomCircle({
    Key key,
    @required this.indexValue,
    @required this.sx,
    @required this.sy,
    @required double y,
    @required double x,
  })  : _y = y,
        _x = x,
        super(key: key);
  @override
  __CustomCircleState createState() => __CustomCircleState();
}
//Edit here
class __CustomCircleState extends State<_CustomCircle> {
  Widget prop = Container();
  TextEditingController xaxis;
  TextEditingController yaxis;

  @override
  void initState() {
    xaxis = TextEditingController(); 
    yaxis = TextEditingController(); 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Align(alignment: Alignment.centerRight, child: prop),
        Positioned(
          key: Key("${widget.sx}${widget.sy}"),
          top: widget._y,
          left: widget._x,
          child: FlatButton(
            onPressed: () {
              setState(() {
                xaxis.text = widget._x.toString().split(".")[0];
                yaxis.text = widget._y.toString().split(".")[0];
                prop = Container(
                  width: 300,
                  height: height,
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10,),
                      Text("Position", style: TextStyle(fontSize: 25)),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          controller: xaxis,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "x-Axis",
                            labelStyle: TextStyle(fontSize: 15)
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          controller: yaxis,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "x-Axis",
                            labelStyle: TextStyle(fontSize: 15)
                          ),
                        ),
                      ),
                      DecoPress(
                        onPressed: () {
                          setState(() {
                            prop = Container();
                          });
                        },
                      ),
                    ],
                  ),
                );
              });
            },
            child: CustomPaint(
              size: Size(widget.sx / 2, widget.sy / 2),
              painter: ShapePainter(
                  shape: "circle", sx: widget.sx / 2, sy: widget.sy / 2),
              child: Container(
                width: widget.sx,
                height: widget.sy,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _CustomRect extends StatefulWidget {
  double sx, sy, _y, _x;
  final int indexValue;
  _CustomRect({
    Key key,
    @required this.indexValue,
    @required this.sx,
    @required this.sy,
    @required double y,
    @required double x,
  })  : _y = y,
        _x = x,
        super(key: key);

  @override
  __CustomRectState createState() => __CustomRectState();
}

class __CustomRectState extends State<_CustomRect> {
  Widget prop = Container();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Align(alignment: Alignment.centerRight, child: prop),
        Positioned(
          key: Key("${widget.sx}${widget.sy}"),
          top: widget._y,
          left: widget._x,
          child: FlatButton(
            onPressed: () {
              setState(() {
                prop = Container(
                  width: 300,
                  height: height,
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: DecoPress(
                    onPressed: () {
                      setState(() {
                        prop = Container();
                      });
                    },
                  ),
                );
              });
            },
            child: CustomPaint(
              size: Size(widget.sx / 2, widget.sy / 2),
              painter: ShapePainter(
                  shape: "rect", sx: widget.sx / 2, sy: widget.sy / 2),
              child: Container(
                width: widget.sx,
                height: widget.sy,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _CustomTri extends StatefulWidget {
  double sx, sy, _y, _x;
  final int indexValue;
  _CustomTri({
    Key key,
    @required this.indexValue,
    @required this.sx,
    @required this.sy,
    @required double y,
    @required double x,
  })  : _y = y,
        _x = x,
        super(key: key);

  @override
  __CustomTriState createState() => __CustomTriState();
}

class __CustomTriState extends State<_CustomTri> {
  Widget prop = Container();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Align(alignment: Alignment.centerRight, child: prop),
        Positioned(
          key: Key("${widget.sx}${widget.sy}"),
          top: widget._y,
          left: widget._x,
          child: FlatButton(
            onPressed: () {
              setState(() {
                prop = Container(
                  width: 300,
                  height: height,
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: DecoPress(
                    onPressed: () {
                      setState(() {
                        prop = Container();
                      });
                    },
                  ),
                );
              });
            },
            child: CustomPaint(
              size: Size(widget.sx / 2, widget.sy / 2),
              painter: ShapePainter(
                  shape: "tri", sx: widget.sx / 2, sy: widget.sy / 2),
              child: Container(
                width: widget.sx,
                height: widget.sy,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DecoPress extends StatelessWidget {
  final GestureTapCallback onPressed;

  const DecoPress({Key key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 50,
      child: RawMaterialButton(
          fillColor: Colors.orange,
          onPressed: onPressed,
          shape: StadiumBorder(),
          child: Text("Done")),
    );
  }
}

class ShapePainter extends CustomPainter {
  final String shape;
  final double sx, sy;
  ShapePainter({@required this.shape, this.sx, this.sy});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    var center = Offset(size.width / 2, size.height / 2);
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
          Offset(size.width / 2, 0),
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
