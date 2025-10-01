import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/widgets/handwritingboard/drawingpage.dart';
import 'package:signature/signature.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:path_provider/path_provider.dart'; // 用於獲取設備路徑

class HandwritingBoard extends StatefulWidget {
  const HandwritingBoard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HandwritingBoardState createState() => _HandwritingBoardState();
}

class _HandwritingBoardState extends State<HandwritingBoard> {
  // 控制手寫板的控制器
  late SignatureController _controller;

  Color selectedColor = Colors.black;
  double strokeWidth = 2.0;
  List<String> _savedFilePaths = [];

  Offset _protractorPosition = Offset(150, 150);
  double _protractorRotation = 0;

  bool _showProtractor = false;
  bool _isProtractorInFront = false;

  // 用於畫直線
  bool _isDrawingLine = false; // 是否處於畫直線模式
  Offset? _lineStart; // 直線的起點
  Offset? _lineEnd; // 直線的終點
  List<Offset> points = [];
  Offset? startPoint;
  Offset? currentPoint;

  @override
  void initState() {
    super.initState();
    _controller = SignatureController(
      penStrokeWidth: strokeWidth,
      penColor: selectedColor,
      exportBackgroundColor: Colors.transparent,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // 畫直線
  void _startDrawingLine(Offset start) {
    setState(() {
      _lineStart = start;
      _lineEnd = start;
    });
  }

  void _updateLine(Offset newEnd) {
    setState(() {
      _lineEnd = newEnd;
    });
  }

  void _endDrawingLine() {
    if (_lineStart != null && _lineEnd != null) {
      // 保存直線，並添加到 _controller 中
      _controller.addPoint(Point(_lineStart!, PointType.tap, 0));
      _controller.addPoint(Point(_lineEnd!, PointType.tap, 0));

      // setState(() {
      //   _lineStart = null;
      //   _lineEnd = null;
      // });
    }
  }

  // 保存圖片到設備
  Future<void> saveSignature() async {
    try {
      Uint8List? signature = await _controller.toPngBytes();
      if (signature != null) {
        final directory = await getApplicationDocumentsDirectory();
        String filePath =
            '${directory.path}/signature_${DateTime.now().millisecondsSinceEpoch}.png';

        File file = File(filePath);
        await file.writeAsBytes(signature);

        setState(() {
          _savedFilePaths.add(filePath);
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('簽名圖片已儲存到 $filePath')),
        );
      }
    } catch (e) {
      print('儲存簽名圖片時出錯: $e');
    }
  }

  // 讀取並顯示保存的圖片
  Widget loadSavedImage(String filePath) {
    File file = File(filePath);
    if (file.existsSync()) {
      return Image.file(file, width: 100, height: 100);
    } else {
      return Text('找不到圖片。');
    }
  }

  void pickColor() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('選擇顏色'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: selectedColor,
              onColorChanged: (Color color) {
                setState(() {
                  selectedColor = color;
                  _controller.penColor = color;
                });
              },
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('確定'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text('手寫板')),
      body: Column(
        children: [
          // 繪圖區域
          Expanded(
            child: GestureDetector(
              onPanStart: (details) {
                if (_isDrawingLine) {
                  startPoint = details.localPosition;
                  currentPoint = details.localPosition;
                } else {
                  setState(() {
                    points.add(details.localPosition);
                  });
                }
              },
              onPanUpdate: (details) {
                if (_isDrawingLine && startPoint != null) {
                  setState(() {
                    currentPoint = details.localPosition;
                  });
                } else {
                  setState(() {
                    points.add(details.localPosition);
                  });
                }
              },
              onPanEnd: (details) {
                if (_isDrawingLine && startPoint != null && currentPoint != null) {
                  setState(() {
                    points.add(startPoint!);
                    points.add(currentPoint!);
                  });
                }
                setState(() {
                  points.add(Offset.zero);
                });
              },
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size.infinite,
                    painter: GridPainter(),
                  ),
                  if (_isProtractorInFront) ... [

                    Signature(
                      controller: _controller,
                      backgroundColor: Colors.transparent,
                    ),
                    CustomPaint(
                      painter: DrawingPainter(
                      points: points, 
                      color: selectedColor, 
                      strokeWidth: strokeWidth,
                      currentLine: _isDrawingLine && startPoint != null && currentPoint != null ? 
                                  [startPoint!, currentPoint! ] : null
                    ),
                    child: Container(),
                    )
                  ],
                  if (_showProtractor)
                    Positioned(
                      left: _protractorPosition.dx,
                      top: _protractorPosition.dy,
                      child: GestureDetector(
                        onScaleEnd: (details) {
                          setState(() {
                            _isProtractorInFront = false;
                          });
                        },
                        onScaleUpdate: (details) {
                          setState(() {
                            _protractorRotation = details.rotation;
                            _protractorPosition += details.focalPointDelta;
                          });
                        },
                        child: Transform.rotate(
                          angle: _protractorRotation,
                          child: Image.asset(
                            'assets/protractor.png',
                            height: 300,
                            width: 600,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  if (!_isProtractorInFront)
                    Signature(
                      controller: _controller,
                      backgroundColor: Colors.transparent,
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text('筆觸粗細'),
                  Slider(
                    value: strokeWidth,
                    min: 1.0,
                    max: 10.0,
                    divisions: 10,
                    label: strokeWidth.toString(),
                    onChanged: (double value) {
                      setState(() {
                        strokeWidth = value;
                        _controller.penStrokeWidth = strokeWidth;
                      });
                    },
                  ),
                ],
              ),
              // 清空畫布按鈕
              ElevatedButton(
                onPressed: () {
                  _controller.clear();
                },
                child: const Text('清空'),
              ),
              // 儲存圖片按鈕
              ElevatedButton(
                onPressed: saveSignature,
                child: const Text('儲存'),
              ),
              IconButton(
                icon: Icon(Icons.color_lens),
                onPressed: pickColor,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isDrawingLine = !_isDrawingLine;
                  });
                },
                child: Text(_isDrawingLine ? '關閉畫直線' : '畫直線'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _showProtractor = !_showProtractor;
                    _isProtractorInFront = !_isProtractorInFront;
                  });
                },
                child: Text(_showProtractor ? '隱藏量角器' : '顯示量角器'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text('已儲存的簽名圖片：'),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _savedFilePaths.length,
              itemBuilder: (context, index) {
                String filePath = _savedFilePaths[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: loadSavedImage(filePath),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// 自訂網格畫家
class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.grey.withOpacity(0.5) // 網格顏色
      ..strokeWidth = 1;

    // 設定網格大小
    double step = 20;

    // 畫垂直線
    for (double x = 0; x <= size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    // 畫水平線
    for (double y = 0; y <= size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class LinePainter extends CustomPainter {
  final Offset start;
  final Offset end;
  final Color color;
  final double strokeWidth;

  LinePainter(this.start, this.end, this.color, this.strokeWidth);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class DrawingPainter extends CustomPainter {
  final List<Offset> points;
  final Color color;
  final double strokeWidth;
  final List<Offset>? currentLine; // 用於暫時顯示的直線

  DrawingPainter({required this.points, required this.color, required this.strokeWidth, this.currentLine});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    // 畫所有的點連成的線
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != Offset.zero && points[i + 1] != Offset.zero) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }

    // 當正在畫直線時，顯示暫時的直線
    if (currentLine != null && currentLine!.length == 2) {
      canvas.drawLine(currentLine![0], currentLine![1], paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

