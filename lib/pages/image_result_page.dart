import 'package:flutter/material.dart';
import 'package:label_scanner_mvp/pages/add_label_page.dart';


class ImageResult extends StatefulWidget {
  const ImageResult({super.key});

  @override
  State<ImageResult> createState() => _ImageResultState();
}

class _ImageResultState extends State<ImageResult> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text("MATCHED RESULT", style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
        ),

        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Container(
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: Container(color: Colors.grey,)
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.amber),
                      foregroundColor: MaterialStatePropertyAll(Colors.white),
                      elevation: MaterialStatePropertyAll(4.0),
                      shadowColor: MaterialStatePropertyAll(Colors.black),
                    ),
                    onPressed: (){},
                    child: Expanded(
                      child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Expanded(child: Text("Update and replace label", style: TextStyle(fontSize: 18), textScaler: TextScaler.noScaling,))
                      ),
                    )),
              ),

              TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.green),
                    foregroundColor: MaterialStatePropertyAll(Colors.white),
                    elevation: MaterialStatePropertyAll(4.0),
                    shadowColor: MaterialStatePropertyAll(Colors.black),
                  ),
                  onPressed: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) =>AddLabel())
                    );
                  },
                  child: Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Expanded(child: Text("Save as new label", style: TextStyle(fontSize: 18), textScaler: TextScaler.noScaling,))
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
