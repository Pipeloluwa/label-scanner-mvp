import 'package:flutter/material.dart';

class AddLabel extends StatefulWidget {
  const AddLabel({super.key});

  @override
  State<AddLabel> createState() => _AddLabelState();
}

class _AddLabelState extends State<AddLabel> {
  FocusNode brand_name= FocusNode();
  FocusNode product_name= FocusNode();
  FocusNode ingredients= FocusNode();
  FocusNode suppliers_location= FocusNode();
  FocusNode expiry_date= FocusNode();


  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text("SAVE LABEL", style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
        ),

        body: ListView(
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
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                // onTap: (){isFocused_();},
                // onTapOutside: (event){FocusScope.of(context).unfocus();},
                focusNode: brand_name,

                decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.blueAccent),
                    label: Expanded(child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Expanded(child: Text("Brand name", textScaler: TextScaler.noScaling,)),
                    ))
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                // onTap: (){isFocused_();},
                // onTapOutside: (event){FocusScope.of(context).unfocus();},
                focusNode: product_name,

                decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.blueAccent),
                    label: Expanded(child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Expanded(child: Text("Product name", textScaler: TextScaler.noScaling,)),
                    ))
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                // onTap: (){isFocused_();},
                // onTapOutside: (event){FocusScope.of(context).unfocus();},
                focusNode: ingredients,

                decoration: InputDecoration(
                    labelStyle: TextStyle(
                        color: Colors.blueAccent,
                    ),
                    label: Expanded(child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Expanded(child: Text("Ingredients", textScaler: TextScaler.noScaling,)),
                    ))
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                // onTap: (){isFocused_();},
                // onTapOutside: (event){FocusScope.of(context).unfocus();},
                focusNode: suppliers_location,

                decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.blueAccent),
                    label: Expanded(child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Expanded(child: Text("Supplier's location", textScaler: TextScaler.noScaling,)),
                    ))
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                // onTap: (){isFocused_();},
                // onTapOutside: (event){FocusScope.of(context).unfocus();},
                focusNode: expiry_date,

                decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.blueAccent),
                    label: Expanded(child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Expanded(child: Text("Expiry date", textScaler: TextScaler.noScaling,)),
                    ))
                ),
              ),
            ),




            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 16.0, bottom: 50.0),
              child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.green),
                    foregroundColor: MaterialStatePropertyAll(Colors.white),
                    elevation: MaterialStatePropertyAll(4.0),
                    shadowColor: MaterialStatePropertyAll(Colors.black),
                  ),
                  onPressed: (){},
                  child: Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Expanded(child: Text("Save Label", style: TextStyle(fontSize: 18), textScaler: TextScaler.noScaling,))
                    ),
                  )),
            ),


          ],
        ),

      ),
    );
  }
}
