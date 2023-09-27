import 'package:animation_painter/home_screen.dart';
import 'package:animation_painter/image_screen2.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:drawing_animation/drawing_animation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AnimationPainter extends StatefulWidget {
  const AnimationPainter({Key? key}) : super(key: key);

  @override
  State<AnimationPainter> createState() => _AnimationPainterState();
}

class _AnimationPainterState extends State<AnimationPainter> with SingleTickerProviderStateMixin{

  late final AnimationController _controller = AnimationController(vsync: this, duration: Duration(seconds: 2))..repeat();

  var run = true;
  var onTap = false;
  var tapRound = false;
  var tapRound1 = false;
  var tapRound2 = false;
  var tapRound3 = false;
  var tapRound4 = false;
  var isDroppedOnDropTarget = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    final centerCircle = GestureDetector(
      onTap: () {
        setState(() {
          onTap = true;
        });
      },
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 30,
        child: CustomPaint(
          painter: (onTap == false)
              ? RoundPainter(color: Colors.black)
              : RoundPainter(color: Colors.black, onTap: true),
        )
      ),
    );
    final centerReceiverCircle = CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 30,
      child: CustomPaint(
        painter: RoundPainter(color: Colors.grey),
        child: Padding(
          padding: const EdgeInsets.all(73.0),
          child: DottedBorder(
            color: Colors.black,
            strokeWidth: 5,
            borderPadding: const EdgeInsets.all(0.5),
            dashPattern: const [0.5,9],
            strokeCap: StrokeCap.round,
            borderType: BorderType.Circle,
            radius: const Radius.circular(25), child: Container(),
          ),
        ),
      ),
    );

    final circle1 = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          dragStartBehavior: DragStartBehavior.start,
          onLongPressStart: (LongPressStartDetails longPressStartDetails) {
            setState(() {
              tapRound1 = true;
              tapRound = true;
            });
          },
          onLongPressEnd: (LongPressEndDetails longPressEndDetails){
            setState(() {
              tapRound1 = false;
              tapRound =  false;
            });
          },
          // onTap: () {
          //   setState(() {
          //     tapRound1 = true;
          //   });
          // },
          child: const CircleAvatar(
            backgroundColor: Color(0xFFF8DD71),
            radius: 30,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            'My Projects',
            style: TextStyle(
              fontSize: 15,
              color: Colors.black
            ),
          ),
        ),
      ],
    );

    final circle2 = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          dragStartBehavior: DragStartBehavior.start,
          onLongPressStart: (LongPressStartDetails longPressStartDetails) {
            setState(() {
              tapRound2 = true;
              tapRound = true;
            });
          },
          onLongPressEnd: (LongPressEndDetails longPressEndDetails){
            setState(() {
              tapRound2 = false;
              tapRound =  false;
            });
          },
          // onTap: () {
          //   setState(() {
          //     tapRound2 = true;
          //   });
          // },
          child: const CircleAvatar(
            backgroundColor: Color(0xB83DE88E),
            radius: 30,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            'About Me',
            style: TextStyle(
                fontSize: 15,
                color: Colors.black
            ),
          ),
        ),
      ],
    );

    final circle3 = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onLongPressStart: (LongPressStartDetails longPressStartDetails) {
            setState(() {
              tapRound3 = true;
              tapRound = true;
            });
          },
          onLongPressEnd: (LongPressEndDetails longPressEndDetails){
            setState(() {
              tapRound3 = false;
              tapRound =  false;
            });
          },
          dragStartBehavior: DragStartBehavior.start,
          // onTap: () {
          //   setState(() {
          //     tapRound3 = true;
          //   });
          // },
          child: const CircleAvatar(
            backgroundColor: Color(0xFFF6997C),
            radius: 30,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            'Contact Me',
            style: TextStyle(
                fontSize: 15,
                color: Colors.black
            ),
          ),
        ),
      ],
    );

    final circle4 = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          dragStartBehavior: DragStartBehavior.start,
          onLongPressStart: (LongPressStartDetails longPressStartDetails) {
            setState(() {
              tapRound4 = true;
              tapRound = true;
            });
          },
          onLongPressEnd: (LongPressEndDetails longPressEndDetails){
            setState(() {
              tapRound4 = false;
              tapRound =  false;
            });
          },
          // onTap: () {
          //   setState(() {
          //     tapRound4 = true;
          //   });
          // },
          child: const CircleAvatar(
            backgroundColor: Color(0xE883CEF8),
            radius: 30,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            'My Skills',
            style: TextStyle(
                fontSize: 15,
                color: Colors.black
            ),
          ),
        ),
      ],
    );

     receiver () {
      return Container(
        height: 200,
        width: 200,
        color: Colors.transparent,
        child: DragTarget(
          builder: (context, candidateData, rejectedData) {
            return candidateData.isNotEmpty
                ? centerReceiverCircle
                : centerCircle;
          },
          onWillAccept: (value){
            return true;
          },
          onAccept: (value) {
            setState(() {
              run = true;
              onTap = false;
              isDroppedOnDropTarget = true;
              Future.delayed(const Duration(seconds: 2), () {
                (tapRound1 == true || tapRound3 == true)
                ? Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const ImageScreen()))
                : Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const ImageScreen2()));
              });
            });
          },
        ),
      );
    }

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              (onTap == false)
                ? (isDroppedOnDropTarget == false)
                  ? AnimatedDrawing.paths(
                  [
                    (Path()
                      ..moveTo(0, 0)
                      ..quadraticBezierTo(0, 0, width, 0)
                    ),
                    (Path()
                      ..moveTo(width, 0)
                      ..quadraticBezierTo(width, 0, width, height)
                    ),
                    (Path()
                      ..moveTo(width, height)
                      ..quadraticBezierTo(width, height, 0, height)
                    ),
                    (Path()
                      ..moveTo(0, height)
                      ..quadraticBezierTo(0, height, 0, 0)
                    )
                  ],
                  paints: [
                    Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 15
                      ..strokeCap = StrokeCap.square
                      ..color =  const Color(0xFFF8DD71),
                    Paint()
                      ..color = const Color(0xB83DE88E)
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 15
                      ..strokeCap = StrokeCap.square,
                    Paint()
                      ..color = const Color(0xFFF6997C)
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 15
                      ..strokeCap = StrokeCap.square,
                    Paint()
                      ..color = const Color(0xE883CEF8)
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 15
                      ..strokeCap = StrokeCap.square,
                  ],
                  run: run,
                  animationOrder: PathOrders.topToBottom,
                  duration: const Duration(seconds: 2),
                  lineAnimation: LineAnimation.oneByOne,
                  animationCurve: Curves.linear,
                  onFinish: () =>
                      setState(() {
                        run = false;
                      }),
                )
                  : AnimatedDrawing.paths(
                    [
                      (Path()
                        ..moveTo(0, 0)
                        ..quadraticBezierTo(0, 0, width, 0)
                        ..moveTo(width, 0)
                        ..quadraticBezierTo(width, 0, width, height)
                        ..moveTo(width, height)
                        ..quadraticBezierTo(width, height, 0, height)
                        ..moveTo(0, height)
                        ..quadraticBezierTo(0, height, 0, 0)
                      ),
                    ],
                    paints: [
                      Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 15
                        ..strokeCap = StrokeCap.square
                        ..color =  (tapRound1 == true)
                          ? const Color(0xFFF8DD71)
                          : (tapRound2 == true)
                            ? const Color(0xB83DE88E)
                            : (tapRound3 == true)
                              ? const Color(0xFFF6997C)
                              : const Color(0xE883CEF8),
                    ],
                    run: run,
                    animationOrder: PathOrders.topToBottom,
                    duration: const Duration(seconds: 2),
                    lineAnimation: LineAnimation.oneByOne,
                    animationCurve: Curves.linear,
                    onFinish: () =>
                      setState(() {
                        run = false;
                      }),
                  )
                : Padding(
                  padding: EdgeInsets.only(top: 80,left: width/8,right: width/8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Draggable(
                            data: 1,
                            feedback: circle1,
                            dragAnchorStrategy: childDragAnchorStrategy,
                            onDragStarted: () {
                              setState(() {
                                tapRound1 = true;
                                tapRound = true;
                              });
                            },
                            onDragEnd: (details){
                              // if ((details.offset.dx >= width/2 - 10)
                              //     && (details.offset.dx <= width/2 + 10)
                              //     || (details.offset.dx == width/2)
                              //     || (details.offset.dy == height/2)
                              //         && (details.offset.dy >= height/2 - 10)
                              //         && (details.offset.dy <= height/2 + 10)){
                              //   setState(() {
                              //     run = true;
                              //     isDroppedOnDropTarget = true;
                              //   });
                              //   Future.delayed(Duration(seconds: 2), () {
                              //     Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const ImageScreen()));
                              //   });
                              // }
                              setState(() {
                                tapRound1 =false;
                                tapRound = false;
                              });
                            },
                            onDragCompleted: () {
                              setState(() {
                                tapRound1 = true;
                              });
                            },
                            child: circle1,
                          ),
                          Draggable(
                            data: 1,
                            feedback: circle2,
                            onDragStarted: () {
                              setState(() {
                                tapRound2 = true;
                                tapRound = true;
                              });
                            },
                            onDragEnd: (draggable){
                              setState(() {
                                tapRound2 = false;
                                tapRound = false;
                              });
                            },
                            onDragCompleted: (){
                              setState(() {
                                tapRound2 = true;
                              });
                            },
                            child: circle2,
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: height - height/2.6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Draggable(
                              data: 1,
                              feedback: circle4,
                              onDragStarted: () {
                                setState(() {
                                  tapRound4 = true;
                                  tapRound = true;
                                });
                              },
                              onDragEnd: (draggable){
                                setState(() {
                                  tapRound4 = false;
                                  tapRound = false;
                                });
                              },
                              onDragCompleted: (){
                                setState(() {
                                  tapRound4 = true;
                                });
                              },
                              child: circle4,
                            ),
                            Draggable(
                              data: 1,
                              feedback: circle3,
                              onDragStarted: () {
                                setState(() {
                                  tapRound3 = true;
                                  tapRound = true;
                                });
                              },
                              onDragEnd: (draggable){
                                setState(() {
                                  tapRound3 = false;
                                  tapRound = false;
                                });
                              },
                              onDragCompleted: (){
                                setState(() {
                                  tapRound3 = true;
                                });
                              },
                              child: circle3,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: height/9),
                  child: Column(
                    children: [
                      (isDroppedOnDropTarget == true)
                      ? Column(
                        children: [
                          Text(
                            (tapRound1 == true)
                              ? 'My Projects'
                              : (tapRound2 == true)
                                ? 'About Me'
                                : (tapRound3 == true)
                                  ? 'Contact Me'
                                  : (tapRound4 == true)
                                    ? 'My Skills'
                                    : '',
                            style: const TextStyle(
                                fontSize: 25
                            ),
                          ),
                          TextButton(
                            onPressed: (){
                              setState(() {
                                run = true;
                                onTap = false;
                                isDroppedOnDropTarget = false;
                              });
                            },
                            child: const Text(
                              'Back To Home'
                            ),
                          ),
                        ],
                      )
                      : (onTap == true)
                        ? IconButton(
                          icon: Image.asset(
                            'assets/images/cancel_icon.png',
                            height: 30,
                            width: 30,
                          ),
                          onPressed: (){
                            setState(() {
                              onTap = false;
                              run = true;
                            });
                          },
                        )
                        : const Text(
                          'Portfolio',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black
                          ),
                        ),
                      Padding(
                        padding: EdgeInsets.only(top: (isDroppedOnDropTarget == true) ? height/13 : height /8 ),
                        child:
                        Text(
                          (onTap == false) ? 'Click Menu' : (tapRound == true) ? 'Drop Here' : 'Drag to Open',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black87
                          ),
                        ),
                      ),
                      Image.asset(
                        'assets/images/down_arrow_icon.png',
                        height: 120,
                      ),
                      (isDroppedOnDropTarget == true)
                      ? const Text('')
                      : (onTap == true)
                        ? Padding(
                          padding: EdgeInsets.only(top: height/4),
                          child: TextButton(
                            child: const Text(
                              'Back to home',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                            onPressed: () {
                            },
                          ),
                        )
                        : Padding(
                          padding: EdgeInsets.only(top: height /4),
                          child: const Text(
                            'Name',
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w400,
                              fontSize:  25
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              AnimatedDrawing.paths(
                width: 200,
                height: 200,
                [
                  (Path()
                    ..moveTo(width / 5, height - height / 3 - 10)
                    ..quadraticBezierTo((width / 5), height - height / 3 - 10,
                        width / 5, height / 3)

                    ..moveTo(width / 5, height / 3)
                    ..quadraticBezierTo(
                        width / 5, height / 3, width - width / 5, height / 3)

                    ..moveTo(width - width / 5, height / 3)
                    ..quadraticBezierTo(width - width / 5, height / 3,
                        width - width / 5, height - height / 3)

                    ..moveTo(width - width / 5, height - height / 3)
                    ..quadraticBezierTo(width - width / 5, height - height / 3,
                        width / 5 + 10, height - height / 3))
                ],
                paints: [
                  Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 25
                    ..strokeCap = StrokeCap.square
                    ..color = (tapRound1 == true)
                        ? const Color(0xFFF8DD71)
                        : (tapRound2 == true)
                          ? const Color(0xB83DE88E)
                          : (tapRound3 == true)
                            ? const Color(0xFFF6997C)
                            : (tapRound4 == true)
                              ? const Color(0xE883CEF8)
                              : Colors.black,
                ],
                run: run,
                animationOrder: PathOrders.original,
                duration: const Duration(seconds: 2),
                lineAnimation: LineAnimation.oneByOne,
                animationCurve: Curves.linear,
                onFinish: () => setState(() {
                  run = false;
                }),
              ),
              Positioned(
                left: width/2 - 100,
                top: height/2 - 100,
                child: receiver(),
              )
            ],
          ),
        ],
      ),
    );
  }
}


class RoundPainter extends CustomPainter {

  Color color;
  bool onTap;
  RoundPainter({required this.color, this.onTap = false});

  @override
  void paint(Canvas canvas, Size size) {

    var roundPaint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = (onTap == false) ? PaintingStyle.fill : PaintingStyle.stroke;
    canvas.drawCircle(Offset(size.width/2, size.height/2), 30, roundPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

