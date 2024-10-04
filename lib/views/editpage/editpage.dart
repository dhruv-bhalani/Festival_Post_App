import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:festival_post_maker/festival_utils.dart';
import 'package:festival_post_maker/models/festival_models.dart';
import 'package:festival_post_maker/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class Editpage extends StatefulWidget {
  const Editpage({super.key});

  @override
  State<Editpage> createState() => _EditpageState();
}

class _EditpageState extends State<Editpage> {
  Color bgColor = Colors.white;
  String? bgImage;
  double fontSize = 14;
  TextStyle textStyle = googleFonts[0];

  GlobalKey key = GlobalKey();
  Future<File> share() async {
    RenderRepaintBoundary boundary =
        key.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(
      pixelRatio: 25,
    );
    ByteData? bytes = await image.toByteData(
      format: ui.ImageByteFormat.png,
    );
    Uint8List uInt8list = bytes!.buffer.asUint8List();

    Directory directory = await getTemporaryDirectory();
    File file = await File(
            "${directory.path}/QA-${DateTime.now().millisecondsSinceEpoch}.png")
        .create();
    file.writeAsBytesSync(uInt8list);

    return file;
  }

  Widget saveChild = const Icon(Icons.save_alt_rounded);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    FestivalModels festival =
        ModalRoute.of(context)!.settings.arguments as FestivalModels;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editpage"),
        centerTitle: true,
        actionsIconTheme: const IconThemeData(
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.copy,
              color: Colors.black,
              size: 25,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.download),
            color: Colors.white,
            onPressed: () async {
              saveChild = const CircularProgressIndicator();
              setState(() {});
              File file = await share();
              ImageGallerySaver.saveFile(file.path).then(
                (value) {
                  saveChild =
                      const Icon(Icons.done) as CircularProgressIndicator;
                  setState(() {});
                },
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/image/1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    festival.festivalName,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                10.height,
                Center(
                  child: RepaintBoundary(
                    key: key,
                    child: Container(
                      height: 350,
                      width: 350,
                      decoration: bgImage == null
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(),
                              color: bgColor,
                            )
                          : BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(),
                              image: DecorationImage(
                                image: NetworkImage(bgImage!),
                                fit: BoxFit.cover,
                              ),
                            ),
                      child: Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Text(
                          festival.wishes[0],
                          style: textStyle.copyWith(
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                30.height,
                const Text(
                  "Back Ground Color",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      colorBg.length,
                      (index) => GestureDetector(
                        onTap: () {
                          bgImage = null;
                          bgColor = colorBg[index];
                          setState(() {});
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: colorBg[index],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                30.height,
                const Text(
                  "Back Ground Image",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      festival.images.length,
                      (index) => GestureDetector(
                        onTap: () {
                          bgImage = festival.images[index];
                          setState(() {});
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                festival.images[index],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Text(
                  "Text Style",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      googleFonts.length,
                      (index) => GestureDetector(
                        onTap: () {
                          textStyle = googleFonts[index];
                          setState(() {});
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          margin: const EdgeInsets.all(5),
                          child: Text(
                            "ABCD",
                            style: TextStyle(
                                fontFamily: googleFonts[index].fontFamily,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          File file = await share();
          await Share.shareXFiles([XFile(file.path)]);
        },
        child: const Icon(Icons.share),
      ),
    );
  }
}
