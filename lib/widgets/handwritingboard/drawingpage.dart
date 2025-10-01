// ignore_for_file: library_private_types_in_public_api

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'dart:typed_data';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' as math;

import 'package:shopping_list/widgets/handwritingboard/imagepreviewpage.dart';

enum DrawActionType {
  normal,
  line,
  eraser,
  text,
  moveCanvas,
  hightlighter,
  triangle
}

class DrawingPage extends StatefulWidget {
  const DrawingPage({super.key});

  @override
  _DrawingPageState createState() => _DrawingPageState();
}

class _DrawingPageState extends State<DrawingPage> {
  List<DrawingAction> actions = []; // 儲存繪圖動作

  Color selectedColor = Colors.black;
  double strokeWidth = 4.0;
  double eraserSize = 10.0; // 橡皮擦大小
  Offset? startPoint;
  Offset? currentPoint;
  List<Uint8List> savedImages = [];
  List<String> savedImagePaths = [];
  DrawActionType drawType = DrawActionType.normal;

  // Protractor properties
  Offset protractorPosition = Offset(100, 100); // Initial position
  double protractorAngle = 0.0; // Initial rotation angle
  bool showProtractor = false;
  bool isProtractorFront = false; // Whether to display the protractor

  String? inputText;
  double textSize = 20.0;

  double _scale = 1.0;

  Uint8List? selectedImageForCanvas; // 新增變數來儲存選中的圖片
  int? selectedImageIndex; // 新增變數來保存選中圖片的索引，方便儲存時更新

  // 追蹤畫布的偏移
  Offset _canvasOffset = Offset.zero;
  // 初始化變數
  Offset _initialFocalPoint = Offset.zero; // 用來記錄觸摸的初始位置
  Offset _initialCanvasOffset = Offset.zero; // 用來記錄畫布初始的偏移量

  // 新增的文本保存
  List<TextAction> textActions = [];

  List<Offset> trianglePoints = []; // 用來存儲三角形的三個點

  final GlobalKey _globalKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadLastSavedImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('繪圖工具'),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              // 工具列
              topToolBarBuild(),
              // 繪圖區域
              Expanded(
                child: buildDrawingCanvas(),
              ),
              bottomToolBarBuild(),
              // 顯示儲存的圖片
              Container(
                height: 150,
                child: savedImages.isNotEmpty
                    ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: savedImages.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                actions.clear();
                                selectedImageForCanvas = savedImages[index];
                                selectedImageIndex = index;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.memory(
                                savedImages[index],
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      )
                    : const Center(child: Text("尚未儲存圖片")),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Build protractor widget
  Widget _buildProtractor() {
    return Positioned(
      left: protractorPosition.dx,
      top: protractorPosition.dy,
      child: GestureDetector(
        onScaleUpdate: (details) {
          // 當拖動時，更新量角器的位置和角度
          setState(() {
            protractorPosition += details.focalPointDelta;
            protractorAngle += details.rotation;
          });
        },
        child: Transform.rotate(
          angle: protractorAngle,
          child: Opacity(
            opacity: 0.5, // 設置透明度
            child: Image.asset(
              'assets/protractor.png', // 量角器圖像
              width: 600,
              height: 300,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }

  // 修改繪圖區域的邏輯來允許在量角器上繪圖
  Widget buildDrawingCanvas() {
    return GestureDetector(
      onPanStart: (details) {
        switch (drawType) {
          case DrawActionType.normal:
            setState(() {
              actions.add(DrawingAction(
                points: [details.localPosition],
                color: selectedColor,
                strokeWidth: strokeWidth,
              ));
            });
            break;
          case DrawActionType.line:
            startPoint = details.localPosition;
            currentPoint = details.localPosition;
            break;
          case DrawActionType.eraser:
            setState(() {
              actions.add(DrawingAction(
                points: [details.localPosition],
                color: Colors.white, // 橡皮擦使用白色
                strokeWidth: eraserSize,
              ));
            });
            break;
          case DrawActionType.text:
            _showTextInputDialog(details.localPosition);
          case DrawActionType.moveCanvas:
            _initialFocalPoint = details.localPosition;
            _initialCanvasOffset = _canvasOffset;
          case DrawActionType.hightlighter:
            setState(() {
              actions.add(DrawingAction(
                points: [details.localPosition],
                color: selectedColor.withOpacity(0.5), // 使用半透明顏色
                strokeWidth: strokeWidth * 3, // 笔刷寬度較大
              ));
            });
            break;
          case DrawActionType.triangle:
            setState(() {
              trianglePoints.add(details.localPosition); // 儲存點
              if (trianglePoints.length == 3) {
                // 當三個點都儲存後，畫出三角形
                actions.add(DrawingAction(
                  points: [
                    trianglePoints[0],
                    trianglePoints[1],
                    trianglePoints[2],
                    trianglePoints[0], // 最後再連回第一個點
                  ],
                  color: selectedColor,
                  strokeWidth: strokeWidth,
                ));
                trianglePoints = []; // 清空點，等待下一次繪製
              }
            });
            break;
        }
      },
      onPanUpdate: (details) {
        if (actions.isEmpty && drawType != DrawActionType.line) return;

        switch (drawType) {
          case DrawActionType.normal:
          case DrawActionType.hightlighter:
            setState(() {
              actions.last.points.add(details.localPosition);
            });
            break;
          case DrawActionType.line:
            if (startPoint != null) {
              setState(() {
                currentPoint = details.localPosition;
              });
            }
            break;
          case DrawActionType.eraser:
            setState(() {
              actions.last.points.add(details.localPosition);
            });
            break;
          case DrawActionType.text:
            break;
          case DrawActionType.moveCanvas:
            setState(() {
              _canvasOffset = _initialCanvasOffset +
                  (details.localPosition - _initialFocalPoint);
            });
            break;
          case DrawActionType.triangle:
          // TODO: Handle this case.
        }
      },
      onPanEnd: (details) {
        if (drawType == DrawActionType.moveCanvas) return;

        if (drawType == DrawActionType.line) {
          if (startPoint != null && currentPoint != null) {
            setState(() {
              actions.add(DrawingAction(
                points: [startPoint!, currentPoint!],
                color: selectedColor,
                strokeWidth: strokeWidth,
              ));
            });
          }
        }

        if (actions.isNotEmpty && drawType != DrawActionType.line) {
          setState(() {
            actions.last.points.add(Offset.zero); // 用於分割筆畫
          });
        }

        startPoint = null;
        currentPoint = null;
      },
      child: Stack(
        children: [
          if (selectedImageForCanvas != null)
            Image.memory(
              selectedImageForCanvas!,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ), // 顯示儲存的圖片

          Transform.translate(
            offset: _canvasOffset,
            child: Transform.scale(
              scale: _scale,
              child: RepaintBoundary(
                key: _globalKey,
                child: CustomPaint(
                  painter: DrawingPainter(
                      actions: actions,
                      currentLine: drawType == DrawActionType.line &&
                              startPoint != null &&
                              currentPoint != null
                          ? [startPoint!, currentPoint!]
                          : null,
                      showGrid: true,
                      textActions: textActions),
                  child: Container(),
                ),
              ),
            ),
          ),
          if (showProtractor) _buildProtractor(),
        ],
      ),
    );
  }

  // 顏色選擇器
  void _showColorPicker() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('選擇顏色'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: selectedColor,
              onColorChanged: (color) {
                setState(() {
                  selectedColor = color;
                });
                Navigator.of(context).pop();
              },
            ),
          ),
        );
      },
    );
  }

  Widget bottomToolBarBuild() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
            onPressed: () {
              setState(() {
                drawType = DrawActionType.moveCanvas;
                showProtractor = false;
              });
            },
            icon: Icon(
              Icons.pan_tool,
              color:
                  drawType == DrawActionType.moveCanvas ? Colors.green : null,
            )),
        Slider(
          min: 1.0,
          max: 3.0,
          value: _scale,
          onChanged: (value) {
            setState(() {
              _scale = value;
            });
          },
        ),
        // 新增圖片預覽按鈕
        IconButton(
          icon: Icon(Icons.photo),
          onPressed: () {
            if (savedImagePaths.isNotEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ImagePreviewPageFromFile(
                    imagePath: savedImagePaths.last, // 傳遞最近儲存的圖片路徑
                  ),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('目前沒有儲存的圖片')),
              );
            }
          },
        ),

        IconButton(
            onPressed: () {
              setState(() {
                if (actions.isNotEmpty) {
                  actions.removeLast();
                }
              });
            },
            icon: const Icon(
              Icons.redo_rounded,
              color: Colors.pink,
            ))
      ],
    );
  }

  Widget topToolBarBuild() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.brush,
                color: drawType == DrawActionType.normal ? Colors.green : null),
            onPressed: () {
              setState(() {
                drawType = DrawActionType.normal;
                showProtractor = false;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.linear_scale,
                color: drawType == DrawActionType.line ? Colors.red : null),
            onPressed: () {
              setState(() {
                drawType = DrawActionType.line;
                showProtractor = false;
              });
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.color_lens,
              color: Colors.blue,
            ),
            onPressed: () {
              _showColorPicker();
            },
          ),
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              setState(() {
                actions.clear();
                textActions.clear();
                startPoint = null;
                currentPoint = null; // 清空時重置狀態
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveToFile,
          ),
          // 橡皮擦大小選擇
          DropdownButton<double>(
            underline: Container(),
            alignment: Alignment.center,
            icon: Icon(
              eraserSize == 10.0
                  ? Icons.delete
                  : eraserSize == 20.0
                      ? Icons.delete_forever_outlined
                      : eraserSize == 30.0
                          ? Icons.delete_outline
                          : Icons.delete_forever,
              color: Colors.orange,
            ),
            value: eraserSize,
            items: const [
              DropdownMenuItem(value: 10.0, child: Icon(Icons.delete)),
              DropdownMenuItem(
                  value: 20.0, child: Icon(Icons.delete_forever_outlined)),
              DropdownMenuItem(value: 30.0, child: Icon(Icons.delete_outline)),
            ],
            onChanged: (value) {
              setState(() {
                drawType = DrawActionType.eraser;
                eraserSize = value!;
                showProtractor = false;
              });
            },
          ),
          IconButton(
            icon: Icon(
              Icons.track_changes,
              color: showProtractor ? Colors.purple : null,
            ), // 量角器按鈕
            onPressed: () {
              setState(() {
                showProtractor = !showProtractor; // 顯示量角器
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.text_fields,
                color: drawType == DrawActionType.text ? Colors.orange : null),
            onPressed: () {
              setState(() {
                drawType = DrawActionType.text;
                showProtractor = false;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.highlight,
                color: drawType == DrawActionType.hightlighter
                    ? Colors.yellow
                    : null),
            onPressed: () {
              setState(() {
                drawType = DrawActionType.hightlighter;
                showProtractor = false;
              });
            },
          ),
          Slider(
            min: 1.0,
            max: 10.0,
            value: strokeWidth,
            onChanged: (newValue) {
              setState(() {
                strokeWidth = newValue;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.change_history, // 這是畫三角形的icon
                color: drawType == DrawActionType.triangle ? Colors.blue : null),
            onPressed: () {
              setState(() {
                drawType = DrawActionType.triangle;
                showProtractor = false;
              });
            },
          ),
        ],
      ),
    );
  }

  void _showTextInputDialog(Offset position) {
    showDialog(
      context: context,
      builder: (context) {
        String tempText = '';
        double boxWidth = 200; // 可以自訂文本框寬度
        double boxHeight = 50; // 可以自訂文本框高度
        return AlertDialog(
          title: Text('輸入文字'),
          content: TextField(
            onChanged: (value) {
              tempText = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('取消'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  inputText = tempText;
                  textActions.add(TextAction(
                    text: inputText!,
                    textBox: Rect.fromLTWH(
                        position.dx, position.dy, boxWidth, boxHeight),
                    color: selectedColor,
                    fontSize: textSize,
                  ));
                });
                Navigator.of(context).pop();
              },
              child: Text('確定'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _loadLastSavedImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? lastSavedImagePath = prefs.getStringList('imagepaths');

    if (lastSavedImagePath != null) {
      for (var path in lastSavedImagePath) {
        File imageFile = File(path);
        if (await imageFile.exists()) {
          Uint8List imageBytes = await imageFile.readAsBytes();

          setState(() {
            savedImages.add(imageBytes); // 加载图片
          });
        }
      }
      savedImagePaths = lastSavedImagePath;
    }
  }

  // 儲存功能
  Future<void> _saveToFile() async {
    try {
      RenderRepaintBoundary boundary = _globalKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage();
      ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      // 獲取存儲路徑
      final directory = (await getApplicationDocumentsDirectory()).path;
      String filePath;

      if (selectedImageIndex != null) {
        // 如果選中了圖片，覆蓋該圖片
        filePath = savedImagePaths[selectedImageIndex!];
        File imgFile = File(filePath);
        await imgFile.writeAsBytes(pngBytes);

        setState(() {
          savedImages[selectedImageIndex!] = pngBytes; // 更新圖片
        });
      } else {
        // 否則，儲存為新圖片
        filePath =
            '$directory/drawing_${DateTime.now().millisecondsSinceEpoch}.png';
        File imgFile = File(filePath);
        await imgFile.writeAsBytes(pngBytes);

        setState(() {
          savedImages.add(pngBytes); // 儲存後的圖片
          savedImagePaths.add(filePath); // 儲存圖片路徑
        });
      }

      // 儲存圖片路徑到 shared preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('imagepaths', savedImagePaths);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('繪圖已儲存!')),
      );
    } catch (e) {
      print(e);
    }
  }
}

class DrawingAction {
  List<Offset> points;
  final Color color;
  final double strokeWidth;

  DrawingAction({
    required this.points,
    required this.color,
    required this.strokeWidth,
  });
}

// 新增一个 TextAction 类来保存文字信息
class TextAction {
  final String text;
  final Rect textBox; // 使用 Rect 來表示文字框的位置與大小
  final Color color;
  final double fontSize;

  TextAction({
    required this.text,
    required this.textBox, // 使用 textBox 來設定邊框
    required this.color,
    required this.fontSize,
  });
}

class DrawingPainter extends CustomPainter {
  final List<DrawingAction> actions;
  final List<Offset>? currentLine;
  final List<TextAction> textActions;
  final bool showGrid;

  DrawingPainter({
    required this.actions,
    required this.textActions,
    this.currentLine,
    this.showGrid = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // 畫每個動作的線條
    for (var action in actions) {
      if (action.points.length < 2) continue; // 確保有兩個以上的點

      Paint paint = Paint()
        ..color = action.color
        ..strokeCap = StrokeCap.round
        ..strokeWidth = action.strokeWidth
        ..style = PaintingStyle.stroke;

      Path path = Path();
      path.moveTo(action.points.first.dx, action.points.first.dy);

      // 如果是三角形，點數為 4，則封閉路徑形成三角形
      if (action.points.length == 4) {
        path.lineTo(action.points[1].dx, action.points[1].dy);
        path.lineTo(action.points[2].dx, action.points[2].dy);
        path.lineTo(action.points[3].dx, action.points[3].dy); // 連回起點
      } else {
        // 繪製普通的連線
        for (int i = 1; i < action.points.length; i++) {
          if (action.points[i] != Offset.zero) {
            path.lineTo(action.points[i].dx, action.points[i].dy);
          }
        }
      }

      canvas.drawPath(path, paint);
    }

    // 當正在畫直線時，顯示暫時的直線
    if (currentLine != null && currentLine!.length == 2) {
      Paint tempLinePaint = Paint()
        ..color = actions.isNotEmpty ? actions.last.color : Colors.black
        ..strokeCap = StrokeCap.round
        ..strokeWidth = actions.isNotEmpty ? actions.last.strokeWidth : 1.0;
      canvas.drawLine(currentLine![0], currentLine![1], tempLinePaint);
    }

    // 绘制文本
    for (var textAction in textActions) {
      // 繪製邊框
      Paint borderPaint = Paint()
        ..color = Colors.grey
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.0;

      canvas.drawRect(textAction.textBox, borderPaint); // 畫出邊框

      // 繪製文本
      TextSpan span = TextSpan(
        text: textAction.text,
        style: TextStyle(
          color: textAction.color,
          fontSize: textAction.fontSize,
        ),
      );
      TextPainter tp = TextPainter(
        text: span,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr,
      );
      tp.layout();
      tp.paint(canvas, textAction.textBox.topLeft); // 繪製文本在邊框內
    }

    // 最後繪製網格
    if (showGrid) {
      Paint gridPaint = Paint()
        ..color = Colors.grey.withOpacity(0.3)
        ..strokeWidth = 0.5;

      for (double i = 0; i < size.width; i += 20) {
        canvas.drawLine(Offset(i, 0), Offset(i, size.height), gridPaint);
      }

      for (double i = 0; i < size.height; i += 20) {
        canvas.drawLine(Offset(0, i), Offset(size.width, i), gridPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
