// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeScreen extends StatefulWidget {
  int columns;
  int rows;
  HomeScreen({
    Key? key,
    required this.columns,
    required this.rows,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int col;
  late int row;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    col = widget.columns;
    row = widget.rows;
  }

  TextEditingController gridController = TextEditingController();
  // List<TextEditingController> controllers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height,
          color: Colors.amber,
          // height: 500,
          child: GridView.builder(
              itemCount: col * row,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: col,
                // childAspectRatio: col * row / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                // controllers.add(TextEditingController());
                InkWell(
                  onTap: () {
                    // print(controllers[index].text.toString());
                  },
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(2),
                    color: Colors.green,
                    // child: Text("data"),
                    child: TextField(
                      controller: gridController,
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.center,
                      maxLength: 1,
                      enableSuggestions: false,
                      scribbleEnabled: false,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                        hintText: "",
                        border: InputBorder.none,
                        counterText: "",
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}

class FindText extends StatefulWidget {
  FindText({super.key});

  @override
  State<FindText> createState() => _FindTextState();
}

class _FindTextState extends State<FindText> {
  List<List> grid = [
    ["a", "s", "x", "u", "w"],
    ["g", "t", "e", "j", "f"],
    ["y", "o", "t", "p", "l"],
  ];
  String searchWord = "tej";
  List foundedList = [];

  List oneListData = [];

  findTextinGrid(
    List<List> grid,
    String searchWord,
    List foundedList,
  ) {
    // List<List> grid = [
    //   ["a", "s", "x", "u", "w"],
    //   ["g", "t", "e", "j", "f"],
    //   ["y", "o", "t", "p", "l"],
    // ];

    int count = 0;
    int searchWordCount = 0;
    int start = 0;
    int total = 15;

    for (int i = 0; i <= grid.length - 1; i++) {
      for (int j = 0; j <= grid[i].length - 1; j++) {
        print([i, j]);
        print("start -- " + start.toString());

        if (grid[i][j] == searchWord[searchWordCount]) {
          foundedList.add([i, j]);
          start++;

          if (searchWordCount <= searchWord.length - 2) {
            searchWordCount++;
          } else {
            searchWordCount = 0;
          }
        } else {
          searchWordCount = 0;
          start++;
        }

        print(foundedList.toString());
      }
    }

    // foundedList(total);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    oneListDatas(grid);
  }

  oneListDatas(List<List> grid) {
    for (int i = 0; i <= grid.length - 1; i++) {
      for (int j = 0; j <= grid[i].length - 1; j++) {
        oneListData.add(grid[i][j]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                // height: 500,
                child: GridView.builder(
                  itemCount: 3 * 5,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  shrinkWrap: true,
                  itemBuilder: (
                    context,
                    index,
                  ) =>
                      InkWell(
                    onTap: () {
                      print(index);
                      print(oneListData[index].toString());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white, //foundedList[[0][1]] ==
                          border: Border.all(
                            color: Colors.black,
                          )),
                      alignment: Alignment.center,
                      child: Text(oneListData[index].toString()),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 80),
              InkWell(
                onTap: () {
                  findTextinGrid(
                    grid,
                    searchWord,
                    foundedList,
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                  ),
                  child: Text("Search"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
