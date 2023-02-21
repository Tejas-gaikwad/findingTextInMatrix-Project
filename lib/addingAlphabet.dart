import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'homescree2.dart';

class AddingAlphabets extends StatefulWidget {
  final column;
  final row;
  const AddingAlphabets({super.key, required this.column, required this.row});

  @override
  State<AddingAlphabets> createState() => _AddingAlphabetsState();
}

class _AddingAlphabetsState extends State<AddingAlphabets> {
  List listOfStrings = [];

  late TextEditingController alphabetController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    alphabetController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
            child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors: [
              Color.fromARGB(255, 32, 17, 200),
              Colors.purple,
            ],
          )),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50),
                Text("Column  :   " +
                    widget.column.toString() +
                    "  Row  :   " +
                    widget.row.toString()),
                SizedBox(height: 50),
                Container(
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 3.0)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  child: TextField(
                    maxLength: 1,
                    controller: alphabetController,
                    decoration: InputDecoration(
                      counterText: "",
                      hintText: "Add Alphabet",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (listOfStrings.length >= (widget.column * widget.row)) {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return FindText2(
                            column: widget.column,
                            row: widget.row,
                            listOfAlphabets: listOfStrings,
                          );
                        },
                      ));
                    } else {
                      print(alphabetController.text.toString());

                      if (alphabetController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Enter alphabet")));
                      } else {
                        if (listOfStrings.length <
                            (widget.column * widget.row)) {
                          setState(() {
                            listOfStrings.add(alphabetController.text);
                            alphabetController.clear();
                          });

                          print(listOfStrings.toString());
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Now click on submit")));
                        }
                      }
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 16),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 48, 214, 14),
                      border: Border.all(color: Colors.black, width: 3.0),
                    ),
                    child: Text(
                        listOfStrings.length >= (widget.column * widget.row)
                            ? "Submit"
                            : "Add"),
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: listOfStrings.length,
                    itemBuilder: (context, index) {
                      return Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        margin: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 6),
                        child: Text(listOfStrings[index].toString()),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        )));
  }
}
