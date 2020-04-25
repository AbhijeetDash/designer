import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:screenshot/screenshot.dart';

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
  ScreenshotController scr;
  File _imageFile;

  @override
  void initState() {
    scr = ScreenshotController();
    super.initState();
  }

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
          actions: <Widget>[
            Container(
              width: 100,
              height: 50,
              child: RawMaterialButton(
                  fillColor: Colors.orange,
                  onPressed: (){
                    scr.capture();
                  },
                  shape: StadiumBorder(),
                  child: Text("Save")),
            )
          ],
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
                      painter: ShapePainter(
                          shape: "circle",
                          sx: 60,
                          sy: 60,
                          color: Colors.deepOrange),
                      child: Container(
                        width: 60,
                        height: 60,
                      ),
                    ),
                    feedback: CustomPaint(
                      painter: ShapePainter(
                          shape: "circle",
                          sx: 60,
                          sy: 60,
                          color: Colors.deepOrange),
                      child: Container(
                        width: 60,
                        height: 60,
                      ),
                    ),
                    childWhenDragging: CustomPaint(
                      painter: ShapePainter(
                          shape: "circle",
                          sx: 60,
                          sy: 60,
                          color: Colors.deepOrange),
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
                      painter: ShapePainter(
                          shape: "rect",
                          sx: 60,
                          sy: 60,
                          color: Colors.deepOrange),
                      child: Container(
                        width: 60,
                        height: 60,
                      ),
                    ),
                    feedback: CustomPaint(
                      painter: ShapePainter(
                          shape: "rect",
                          sx: 60,
                          sy: 60,
                          color: Colors.deepOrange),
                      child: Container(
                        width: 60,
                        height: 60,
                      ),
                    ),
                    childWhenDragging: CustomPaint(
                      painter: ShapePainter(
                          shape: "rect",
                          sx: 60,
                          sy: 60,
                          color: Colors.deepOrange),
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
                      painter: ShapePainter(
                          shape: "tri",
                          sx: 60,
                          sy: 60,
                          color: Colors.deepOrange),
                      child: Container(
                        width: 60,
                        height: 60,
                      ),
                    ),
                    feedback: CustomPaint(
                      painter: ShapePainter(
                          shape: "tri",
                          sx: 60,
                          sy: 60,
                          color: Colors.deepOrange),
                      child: Container(
                        width: 60,
                        height: 60,
                      ),
                    ),
                    childWhenDragging: CustomPaint(
                      painter: ShapePainter(
                          shape: "tri",
                          sx: 60,
                          sy: 60,
                          color: Colors.deepOrange),
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
                    data: "text",
                    child: Icon(
                      Icons.text_fields,
                      size: 50,
                      color: Colors.deepOrange,
                    ),
                    feedback: Text("Text",
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 20,
                            color: Colors.black)),
                    childWhenDragging: Text("Text",
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 20,
                            color: Colors.black)),
                    onDragEnd: (details) {
                      setState(() {
                        _x = details.offset.dx - width * 0.1 - 17;
                        _y = details.offset.dy - 55;
                      });
                    },
                  ),
                ],
              ),
            ),
            Screenshot(
              controller: scr,
                child: Container(
                  key: Key("Canvas"),
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
                                indexValue: indexValue,
                                color: Colors.deepOrange,
                              ));
                            });
                            break;
                          case "rect":
                            setState(() {
                              tree.add(_CustomRect(
                                sx: sx,
                                sy: sy,
                                y: _y,
                                x: _x,
                                indexValue: indexValue,
                                color: Colors.deepOrange,
                              ));
                            });
                            break;
                          case "tri":
                            setState(() {
                              tree.add(_CustomTri(
                                sx: sx,
                                sy: sy,
                                y: _y,
                                x: _x,
                                indexValue: indexValue,
                                color: Colors.deepOrange,
                              ));
                            });
                            break;
                          case "text":
                            setState(() {
                              tree.add(_CustomText(
                                sx: sx,
                                sy: sy,
                                y: _y,
                                x: _x,
                              ));
                            });
                        }
                        indexValue++;
                      });
                    },
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class _CustomText extends StatefulWidget {
  double sx, sy, _x, _y, dSize = 20;
  Color color = Colors.deepOrange;
  _CustomText({
    Key key,
    @required this.sx,
    @required this.sy,
    @required double x,
    @required double y,
  })  : _y = y,
        _x = x,
        super(key: key);

  @override
  __CustomTextState createState() => __CustomTextState();
}

class __CustomTextState extends State<_CustomText> {
  Widget prop = Container();
  TextEditingController xaxis, yaxis, widt, tdata;
  String textdata = "Text";

  @override
  void initState() {
    xaxis = TextEditingController();
    xaxis.text = widget._x.toString().split(".")[0];
    yaxis = TextEditingController();
    yaxis.text = widget._y.toString().split(".")[0];
    widt = TextEditingController();
    widt.text = widget.dSize.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Positioned(
            top: widget._y,
            left: widget._x,
            child: FlatButton(
                onPressed: () {
                  setState(() {
                    prop = Container(
                      width: 350,
                      height: height,
                      color: Colors.white,
                      child: ListView(
                        children: <Widget>[
                          SizedBox(height: 10),
                          Container(
                            width: 250,
                            child: TextField(
                              controller: tdata,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Width",
                                  labelStyle: TextStyle(fontSize: 15)),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Position",
                            style: TextStyle(fontSize: 25),
                            textAlign: TextAlign.center,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Container(
                                  width: 250,
                                  child: TextField(
                                    controller: xaxis,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: "x-Axis",
                                        labelStyle: TextStyle(fontSize: 15)),
                                  ),
                                ),
                                Container(
                                  width: 50,
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      IconButton(
                                          icon: Icon(Icons.arrow_drop_up),
                                          onPressed: () {
                                            setState(() {
                                              widget._x += 1;
                                              xaxis.text = widget._x
                                                  .toString()
                                                  .split(".")[0];
                                            });
                                          }),
                                      IconButton(
                                          icon: Icon(Icons.arrow_drop_down),
                                          onPressed: () {
                                            setState(() {
                                              widget._x -= 1;
                                              xaxis.text = widget._x
                                                  .toString()
                                                  .split(".")[0];
                                            });
                                          })
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Container(
                                  width: 250,
                                  child: TextField(
                                    controller: yaxis,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: "y-Axis",
                                        labelStyle: TextStyle(fontSize: 15)),
                                  ),
                                ),
                                Container(
                                  width: 50,
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      IconButton(
                                          icon: Icon(Icons.arrow_drop_up),
                                          onPressed: () {
                                            setState(() {
                                              widget._y -= 1;
                                              yaxis.text = widget._y
                                                  .toString()
                                                  .split(".")[0];
                                            });
                                          }),
                                      IconButton(
                                          icon: Icon(Icons.arrow_drop_down),
                                          onPressed: () {
                                            setState(() {
                                              widget._y += 1;
                                              yaxis.text = widget._y
                                                  .toString()
                                                  .split(".")[0];
                                            });
                                          })
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Text(
                            "Size",
                            style: TextStyle(fontSize: 25),
                            textAlign: TextAlign.center,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Container(
                                  width: 250,
                                  child: TextField(
                                    controller: widt,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: "Width",
                                        labelStyle: TextStyle(fontSize: 15)),
                                  ),
                                ),
                                Container(
                                  width: 50,
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      IconButton(
                                          icon: Icon(Icons.arrow_drop_up),
                                          onPressed: () {
                                            setState(() {
                                              widget.dSize += 1;
                                              widt.text =
                                                  widget.dSize.toString();
                                            });
                                          }),
                                      IconButton(
                                          icon: Icon(Icons.arrow_drop_down),
                                          onPressed: () {
                                            setState(() {
                                              widget.dSize -= 1;
                                              widt.text =
                                                  widget.dSize.toString();
                                            });
                                          })
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Text(
                            "Colour",
                            style: TextStyle(fontSize: 25),
                            textAlign: TextAlign.center,
                          ),
                          ColorPicker(
                              enableAlpha: true,
                              colorPickerWidth: 200,
                              paletteType: PaletteType.rgb,
                              pickerColor: Colors.deepOrange,
                              onColorChanged: (color) {
                                setState(() {
                                  widget.color = color;
                                });
                              }),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Center(
                                  child: Container(
                                width: 100,
                                height: 50,
                                child: RawMaterialButton(
                                    fillColor: Colors.grey,
                                    onPressed: () {
                                      setState(() {
                                        widget.color = Colors.white;
                                      });
                                    },
                                    shape: StadiumBorder(),
                                    child: Text("White")),
                              )),
                              SizedBox(
                                width: 10,
                              ),
                              Center(
                                  child: Container(
                                width: 100,
                                height: 50,
                                child: RawMaterialButton(
                                    fillColor: Colors.grey,
                                    onPressed: () {
                                      setState(() {
                                        widget.color = Colors.black;
                                      });
                                    },
                                    shape: StadiumBorder(),
                                    child: Text("Black")),
                              )),
                            ],
                          ),
                          SizedBox(height: 20),
                          Center(
                            child: DecoPress(
                              onPressed: () {
                                setState(() {
                                  prop = Container();
                                  textdata = tdata.text;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  });
                },
                child: Text(textdata,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: widget.dSize,
                        color: widget.color)))),
        Align(alignment: Alignment.centerRight, child: prop),
      ],
    );
  }
}

//Stateull Circle

class _CustomCircle extends StatefulWidget {
  double sx, sy, _y, _x;
  final int indexValue;
  Color color;
  _CustomCircle(
      {Key key,
      @required this.indexValue,
      @required this.sx,
      @required this.sy,
      @required double y,
      @required double x,
      @required this.color})
      : _y = y,
        _x = x,
        super(key: key);
  @override
  __CustomCircleState createState() => __CustomCircleState();
}


class __CustomCircleState extends State<_CustomCircle> {
  Widget prop = Container();
  TextEditingController xaxis;
  TextEditingController yaxis;
  TextEditingController widt;
  TextEditingController heig;

  @override
  void initState() {
    xaxis = TextEditingController();
    xaxis.text = widget._x.toString().split(".")[0];
    yaxis = TextEditingController();
    yaxis.text = widget._y.toString().split(".")[0];
    widt = TextEditingController();
    widt.text = widget.sx.toString();
    heig = TextEditingController();
    heig.text = widget.sy.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Positioned(
          key: Key("${widget.sx}${widget.sy}"),
          top: widget._y,
          left: widget._x,
          child: FlatButton(
            onPressed: () {
              setState(() {
                prop = Container(
                  width: 350,
                  height: height,
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(height: 10),
                      Text(
                        "Position",
                        style: TextStyle(fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(
                              width: 250,
                              child: TextField(
                                controller: xaxis,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "x-Axis",
                                    labelStyle: TextStyle(fontSize: 15)),
                              ),
                            ),
                            Container(
                              width: 50,
                              height: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  IconButton(
                                      icon: Icon(Icons.arrow_drop_up),
                                      onPressed: () {
                                        setState(() {
                                          widget._x += 1;
                                          xaxis.text = widget._x
                                              .toString()
                                              .split(".")[0];
                                        });
                                      }),
                                  IconButton(
                                      icon: Icon(Icons.arrow_drop_down),
                                      onPressed: () {
                                        setState(() {
                                          widget._x -= 1;
                                          xaxis.text = widget._x
                                              .toString()
                                              .split(".")[0];
                                        });
                                      })
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(
                              width: 250,
                              child: TextField(
                                controller: yaxis,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "y-Axis",
                                    labelStyle: TextStyle(fontSize: 15)),
                              ),
                            ),
                            Container(
                              width: 50,
                              height: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  IconButton(
                                      icon: Icon(Icons.arrow_drop_up),
                                      onPressed: () {
                                        setState(() {
                                          widget._y -= 1;
                                          yaxis.text = widget._y
                                              .toString()
                                              .split(".")[0];
                                        });
                                      }),
                                  IconButton(
                                      icon: Icon(Icons.arrow_drop_down),
                                      onPressed: () {
                                        setState(() {
                                          widget._y += 1;
                                          yaxis.text = widget._y
                                              .toString()
                                              .split(".")[0];
                                        });
                                      })
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Text(
                        "Size",
                        style: TextStyle(fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(
                              width: 250,
                              child: TextField(
                                controller: widt,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Width",
                                    labelStyle: TextStyle(fontSize: 15)),
                              ),
                            ),
                            Container(
                              width: 50,
                              height: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  IconButton(
                                      icon: Icon(Icons.arrow_drop_up),
                                      onPressed: () {
                                        setState(() {
                                          widget.sx += 1;
                                          widt.text = widget.sx.toString();
                                        });
                                      }),
                                  IconButton(
                                      icon: Icon(Icons.arrow_drop_down),
                                      onPressed: () {
                                        setState(() {
                                          widget.sx -= 1;
                                          widt.text = widget.sx.toString();
                                        });
                                      })
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(
                              width: 250,
                              child: TextField(
                                controller: heig,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Height",
                                    labelStyle: TextStyle(fontSize: 15)),
                              ),
                            ),
                            Container(
                              width: 50,
                              height: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  IconButton(
                                      icon: Icon(Icons.arrow_drop_up),
                                      onPressed: () {
                                        setState(() {
                                          widget.sy += 1;
                                          heig.text = widget.sy.toString();
                                        });
                                      }),
                                  IconButton(
                                      icon: Icon(Icons.arrow_drop_down),
                                      onPressed: () {
                                        setState(() {
                                          widget.sy -= 1;
                                          heig.text = widget.sy.toString();
                                        });
                                      })
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Text(
                        "Colour",
                        style: TextStyle(fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                      ColorPicker(
                          enableAlpha: true,
                          colorPickerWidth: 200,
                          paletteType: PaletteType.rgb,
                          pickerColor: Colors.orange,
                          onColorChanged: (color) {
                            setState(() {
                              widget.color = color;
                            });
                          }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                              child: Container(
                            width: 100,
                            height: 50,
                            child: RawMaterialButton(
                                fillColor: Colors.grey,
                                onPressed: () {
                                  setState(() {
                                    widget.color = Colors.white;
                                  });
                                },
                                shape: StadiumBorder(),
                                child: Text("White")),
                          )),
                          SizedBox(
                            width: 10,
                          ),
                          Center(
                              child: Container(
                            width: 100,
                            height: 50,
                            child: RawMaterialButton(
                                fillColor: Colors.grey,
                                onPressed: () {
                                  setState(() {
                                    widget.color = Colors.black;
                                  });
                                },
                                shape: StadiumBorder(),
                                child: Text("Black")),
                          )),
                        ],
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: DecoPress(
                          onPressed: () {
                            setState(() {
                              widget._x = double.parse(xaxis.text);
                              widget._y = double.parse(yaxis.text);
                              widget.sx = double.parse(widt.text);
                              widget.sy = double.parse(heig.text);

                              prop = Container();
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 20)
                    ],
                  ),
                );
              });
            },
            child: CustomPaint(
              size: Size(widget.sx, widget.sy),
              foregroundPainter: ShapePainter(
                  shape: "circle",
                  sx: widget.sx,
                  sy: widget.sy,
                  color: widget.color),
              child: Container(
                width: widget.sx,
                height: widget.sy,
              ),
            ),
          ),
        ),
        Align(alignment: Alignment.centerRight, child: prop),
      ],
    );
  }
}


//StateFull Rectangle
class _CustomRect extends StatefulWidget {
  double sx, sy, _y, _x;
  final int indexValue;
  Color color = Colors.orange;
  _CustomRect(
      {Key key,
      @required this.indexValue,
      @required this.sx,
      @required this.sy,
      @required double y,
      @required double x,
      @required this.color})
      : _y = y,
        _x = x,
        super(key: key);

  @override
  __CustomRectState createState() => __CustomRectState();
}

class __CustomRectState extends State<_CustomRect> {
  Widget prop = Container();
  TextEditingController xaxis;
  TextEditingController yaxis;
  TextEditingController widt;
  TextEditingController heig;

  @override
  void initState() {
    xaxis = TextEditingController();
    xaxis.text = widget._x.toString().split(".")[0];
    yaxis = TextEditingController();
    yaxis.text = widget._y.toString().split(".")[0];
    widt = TextEditingController();
    widt.text = widget.sx.toString();
    heig = TextEditingController();
    heig.text = widget.sy.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Positioned(
          key: Key("${widget.sx}${widget.sy}"),
          top: widget._y,
          left: widget._x,
          child: FlatButton(
            onPressed: () {
              setState(() {
                prop = prop = Container(
                  width: 350,
                  height: height,
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(height: 10),
                      Text(
                        "Position",
                        style: TextStyle(fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(
                              width: 250,
                              child: TextField(
                                controller: xaxis,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "x-Axis",
                                    labelStyle: TextStyle(fontSize: 15)),
                              ),
                            ),
                            Container(
                              width: 50,
                              height: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  IconButton(
                                      icon: Icon(Icons.arrow_drop_up),
                                      onPressed: () {
                                        setState(() {
                                          widget._x += 1;
                                          xaxis.text = widget._x
                                              .toString()
                                              .split(".")[0];
                                        });
                                      }),
                                  IconButton(
                                      icon: Icon(Icons.arrow_drop_down),
                                      onPressed: () {
                                        setState(() {
                                          widget._x -= 1;
                                          xaxis.text = widget._x
                                              .toString()
                                              .split(".")[0];
                                        });
                                      })
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(
                              width: 250,
                              child: TextField(
                                controller: yaxis,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "y-Axis",
                                    labelStyle: TextStyle(fontSize: 15)),
                              ),
                            ),
                            Container(
                              width: 50,
                              height: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  IconButton(
                                      icon: Icon(Icons.arrow_drop_up),
                                      onPressed: () {
                                        setState(() {
                                          widget._y -= 1;
                                          yaxis.text = widget._y
                                              .toString()
                                              .split(".")[0];
                                        });
                                      }),
                                  IconButton(
                                      icon: Icon(Icons.arrow_drop_down),
                                      onPressed: () {
                                        setState(() {
                                          widget._y += 1;
                                          yaxis.text = widget._y
                                              .toString()
                                              .split(".")[0];
                                        });
                                      })
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Text(
                        "Size",
                        style: TextStyle(fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(
                              width: 250,
                              child: TextField(
                                controller: widt,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Width",
                                    labelStyle: TextStyle(fontSize: 15)),
                              ),
                            ),
                            Container(
                              width: 50,
                              height: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  IconButton(
                                      icon: Icon(Icons.arrow_drop_up),
                                      onPressed: () {
                                        setState(() {
                                          widget.sx += 1;
                                          widt.text = widget.sx.toString();
                                        });
                                      }),
                                  IconButton(
                                      icon: Icon(Icons.arrow_drop_down),
                                      onPressed: () {
                                        setState(() {
                                          widget.sx -= 1;
                                          widt.text = widget.sx.toString();
                                        });
                                      })
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(
                              width: 250,
                              child: TextField(
                                controller: heig,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Height",
                                    labelStyle: TextStyle(fontSize: 15)),
                              ),
                            ),
                            Container(
                              width: 50,
                              height: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  IconButton(
                                      icon: Icon(Icons.arrow_drop_up),
                                      onPressed: () {
                                        setState(() {
                                          widget.sy += 1;
                                          heig.text = widget.sy.toString();
                                        });
                                      }),
                                  IconButton(
                                      icon: Icon(Icons.arrow_drop_down),
                                      onPressed: () {
                                        setState(() {
                                          widget.sy -= 1;
                                          heig.text = widget.sy.toString();
                                        });
                                      })
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Text(
                        "Colour",
                        style: TextStyle(fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                      ColorPicker(
                          colorPickerWidth: 200,
                          paletteType: PaletteType.rgb,
                          pickerColor: Colors.deepOrange,
                          onColorChanged: (color) {
                            setState(() {
                              widget.color = color;
                            });
                          }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                              child: Container(
                            width: 100,
                            height: 50,
                            child: RawMaterialButton(
                                fillColor: Colors.grey,
                                onPressed: () {
                                  setState(() {
                                    widget.color = Colors.white;
                                  });
                                },
                                shape: StadiumBorder(),
                                child: Text("White")),
                          )),
                          SizedBox(
                            width: 10,
                          ),
                          Center(
                              child: Container(
                            width: 100,
                            height: 50,
                            child: RawMaterialButton(
                                fillColor: Colors.grey,
                                onPressed: () {
                                  setState(() {
                                    widget.color = Colors.black;
                                  });
                                },
                                shape: StadiumBorder(),
                                child: Text("Black")),
                          )),
                        ],
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: DecoPress(
                          onPressed: () {
                            setState(() {
                              widget._x = double.parse(xaxis.text);
                              widget._y = double.parse(yaxis.text);
                              widget.sx = double.parse(widt.text);
                              widget.sy = double.parse(heig.text);
                              prop = Container();
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 20)
                    ],
                  ),
                );
              });
            },
            child: CustomPaint(
              size: Size(widget.sx, widget.sy),
              foregroundPainter: ShapePainter(
                  shape: "rect",
                  sx: widget.sx,
                  sy: widget.sy,
                  color: widget.color),
              child: Container(
                width: widget.sx,
                height: widget.sy,
              ),
            ),
          ),
        ),
        Align(alignment: Alignment.centerRight, child: prop),
      ],
    );
  }
}


//StateFull Triangle
class _CustomTri extends StatefulWidget {
  double sx, sy, _y, _x;
  final int indexValue;
  Color color = Colors.orange;
  _CustomTri(
      {Key key,
      @required this.indexValue,
      @required this.sx,
      @required this.sy,
      @required double y,
      @required double x,
      @required this.color})
      : _y = y,
        _x = x,
        super(key: key);

  @override
  __CustomTriState createState() => __CustomTriState();
}

class __CustomTriState extends State<_CustomTri> {
  Widget prop = Container();
  TextEditingController xaxis;
  TextEditingController yaxis;
  TextEditingController widt;
  TextEditingController heig;

  @override
  void initState() {
    xaxis = TextEditingController();
    xaxis.text = widget._x.toString().split(".")[0];
    yaxis = TextEditingController();
    yaxis.text = widget._y.toString().split(".")[0];
    widt = TextEditingController();
    widt.text = widget.sx.toString();
    heig = TextEditingController();
    heig.text = widget.sy.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Positioned(
          key: Key("${widget.sx}${widget.sy}"),
          top: widget._y,
          left: widget._x,
          child: FlatButton(
            onPressed: () {
              setState(() {
                prop = prop = Container(
                  width: 350,
                  height: height,
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(height: 10),
                      Text(
                        "Position",
                        style: TextStyle(fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(
                              width: 250,
                              child: TextField(
                                controller: xaxis,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "x-Axis",
                                    labelStyle: TextStyle(fontSize: 15)),
                              ),
                            ),
                            Container(
                              width: 50,
                              height: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  IconButton(
                                      icon: Icon(Icons.arrow_drop_up),
                                      onPressed: () {
                                        setState(() {
                                          widget._x += 1;
                                          xaxis.text = widget._x
                                              .toString()
                                              .split(".")[0];
                                        });
                                      }),
                                  IconButton(
                                      icon: Icon(Icons.arrow_drop_down),
                                      onPressed: () {
                                        setState(() {
                                          widget._x -= 1;
                                          xaxis.text = widget._x
                                              .toString()
                                              .split(".")[0];
                                        });
                                      })
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(
                              width: 250,
                              child: TextField(
                                controller: yaxis,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "y-Axis",
                                    labelStyle: TextStyle(fontSize: 15)),
                              ),
                            ),
                            Container(
                              width: 50,
                              height: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  IconButton(
                                      icon: Icon(Icons.arrow_drop_up),
                                      onPressed: () {
                                        setState(() {
                                          widget._y -= 1;
                                          yaxis.text = widget._y
                                              .toString()
                                              .split(".")[0];
                                        });
                                      }),
                                  IconButton(
                                      icon: Icon(Icons.arrow_drop_down),
                                      onPressed: () {
                                        setState(() {
                                          widget._y += 1;
                                          yaxis.text = widget._y
                                              .toString()
                                              .split(".")[0];
                                        });
                                      })
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Text(
                        "Size",
                        style: TextStyle(fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(
                              width: 250,
                              child: TextField(
                                controller: widt,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Width",
                                    labelStyle: TextStyle(fontSize: 15)),
                              ),
                            ),
                            Container(
                              width: 50,
                              height: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  IconButton(
                                      icon: Icon(Icons.arrow_drop_up),
                                      onPressed: () {
                                        setState(() {
                                          widget.sx += 1;
                                          widt.text = widget.sx.toString();
                                        });
                                      }),
                                  IconButton(
                                      icon: Icon(Icons.arrow_drop_down),
                                      onPressed: () {
                                        setState(() {
                                          widget.sx -= 1;
                                          widt.text = widget.sx.toString();
                                        });
                                      })
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(
                              width: 250,
                              child: TextField(
                                controller: heig,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Height",
                                    labelStyle: TextStyle(fontSize: 15)),
                              ),
                            ),
                            Container(
                              width: 50,
                              height: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  IconButton(
                                      icon: Icon(Icons.arrow_drop_up),
                                      onPressed: () {
                                        setState(() {
                                          widget.sy += 1;
                                          heig.text = widget.sy.toString();
                                        });
                                      }),
                                  IconButton(
                                      icon: Icon(Icons.arrow_drop_down),
                                      onPressed: () {
                                        setState(() {
                                          widget.sy -= 1;
                                          heig.text = widget.sy.toString();
                                        });
                                      })
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Text(
                        "Colour",
                        style: TextStyle(fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                      ColorPicker(
                          colorPickerWidth: 200,
                          paletteType: PaletteType.rgb,
                          pickerColor: Colors.deepOrange,
                          onColorChanged: (color) {
                            setState(() {
                              widget.color = color;
                            });
                          }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                              child: Container(
                            width: 100,
                            height: 50,
                            child: RawMaterialButton(
                                fillColor: Colors.grey,
                                onPressed: () {
                                  setState(() {
                                    widget.color = Colors.white;
                                  });
                                },
                                shape: StadiumBorder(),
                                child: Text("White")),
                          )),
                          SizedBox(
                            width: 10,
                          ),
                          Center(
                              child: Container(
                            width: 100,
                            height: 50,
                            child: RawMaterialButton(
                                fillColor: Colors.grey,
                                onPressed: () {
                                  setState(() {
                                    widget.color = Colors.black;
                                  });
                                },
                                shape: StadiumBorder(),
                                child: Text("Black")),
                          )),
                        ],
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: DecoPress(
                          onPressed: () {
                            setState(() {
                              widget._x = double.parse(xaxis.text);
                              widget._y = double.parse(yaxis.text);
                              widget.sx = double.parse(widt.text);
                              widget.sy = double.parse(heig.text);
                              prop = Container();
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 20)
                    ],
                  ),
                );
              });
            },
            child: CustomPaint(
              size: Size(widget.sx, widget.sy),
              foregroundPainter: ShapePainter(
                  shape: "tri",
                  sx: widget.sx,
                  sy: widget.sy,
                  color: widget.color),
              child: Container(
                width: widget.sx,
                height: widget.sy,
              ),
            ),
          ),
        ),
        Align(alignment: Alignment.centerRight, child: prop),
      ],
    );
  }
}


//Styled Button
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

//Shape Painter
class ShapePainter extends CustomPainter {
  final String shape;
  final double sx, sy;
  Color color = Colors.black;
  ShapePainter({@required this.shape, this.sx, this.sy, this.color});

  @override
  void paint(Canvas canvas, Size size) {
    var pint = Paint()..color = color;
    var center = Offset(size.width / 2, size.height / 2);
    switch (shape) {
      case "rect":
        var rect = Rect.fromLTRB(0, 0, sx, sy);
        canvas.drawRect(rect, pint);
        break;
      case "tri":
        var path = Path();
        path.addPolygon(
            [Offset(sx / 2, 0), Offset(0, sy), Offset(sx, sy)], true);
        canvas.drawPath(path, pint);
        break;
      case "circle":
        var rect = Rect.fromLTRB(0, 0, sx, sy);
        canvas.drawOval(rect, pint);
        break;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
