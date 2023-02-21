import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobigic_task/Spalash%20screens/splash1.dart';

class FindText2 extends StatefulWidget {
  final column;
  final row;
  final listOfAlphabets;
  FindText2(
      {super.key,
      required this.column,
      required this.row,
      required this.listOfAlphabets});

  @override
  State<FindText2> createState() => _FindText2State();
}

class _FindText2State extends State<FindText2> {
  List grid = [
    "a",
    "s",
    "x",
    "u",
    "w",
    "g",
    "t",
    "e",
    "j",
    "f",
    "y",
    "o",
    "t",
    "p",
    "l"
  ];

  List foundedList = [];
  List oneListData = [];

  List result = [];

  findFromLeftToRight(
    List grid,
    String searchWord,
    List foundedList,
    resultData,
  ) async {
    int count = 0;
    int searchWordCount = 0;

    foundedList.clear();

    for (int i = 0; i < grid.length; i++) {
      if (searchWordCount <= (searchWord.length - 1) &&
          grid[i] == searchWord[searchWordCount]) {
        if (searchWordCount <= (searchWord.length - 1)) {
          foundedList.add(i);
          searchWordCount++;
        } else {
          searchWordCount = 0;
        }
      } else {
        searchWordCount = 0;
      }

      // print("FOUNDED LIST ---   " + foundedList.toString());
    }

    int counter = 0;
    for (int i = 0; i < foundedList.length; i++) {
      print("FOUNDED LIST 2  ---   " + foundedList.toString());
      if (counter <= (searchWord.length - 1) &&
          widget.listOfAlphabets[foundedList[i]] == searchWord[counter]) {
        // print("Founded List ----    " + foundedList[i].toString());

        resultData.add(foundedList[i]);
        counter = counter + 1;
      } else {
        resultData.clear();
        counter = 0;
      }
      print("Result ---   " + resultData.toString());
    }
  }

  findFromRightToLeft(
    List grid,
    String searchWord,
    List foundedList,
    resultData,
  ) async {
    int count = 0;
    int searchWordCount = 0;

    foundedList.clear();

    for (int i = grid.length - 1; i > 0; i--) {
      print(" i  is  ---  " + i.toString());
      if (searchWordCount <= (searchWord.length - 1) &&
          grid[i] == searchWord[searchWordCount]) {
        if (searchWordCount <= (searchWord.length - 1)) {
          foundedList.add(i);
          searchWordCount++;
        } else {
          searchWordCount = 0;
        }
      } else {
        searchWordCount = 0;
      }

      print("FOUNDED LIST ---   " + foundedList.toString());
    }

    // int counter = 0;
    // for (int i = 0; i < foundedList.length; i++) {
    //   print("FOUNDED LIST 2  ---   " + foundedList.toString());
    //   if (counter <= (searchWord.length - 1) &&
    //       widget.listOfAlphabets[foundedList[i]] == searchWord[counter]) {
    //     // print("Founded List ----    " + foundedList[i].toString());

    //     resultData.add(foundedList[i]);
    //     counter = counter + 1;
    //   } else {
    //     resultData.clear();
    //     counter = 0;
    //   }
    //   print("Result ---   " + resultData.toString());
    // }
  }

  findDiagonally(
    List grid,
    String searchWord,
    List foundedList,
  ) {
    int wordLength = searchWord.length;
    List wordArray = grid;
    for (int i = 0, length = grid.length; i < length; i++) {
      loop:
      for (int j = 0, k = i, subLength = grid[i].length;
          j < subLength && k >= wordLength;
          j++, k--) {
        for (int l = 0; l < wordLength; l++) {
          if (grid[j + l][k - l] != wordArray[l]) {
            continue loop;
          }
          return true;
        }
      }
    }
    return false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // oneListDatas(grid);
  }

  oneListDatas(List<List> grid) {
    for (int i = 0; i <= grid.length - 1; i++) {
      for (int j = 0; j <= grid[i].length - 1; j++) {
        oneListData.add(grid[i][j]);
      }
    }
  }

  TextEditingController searchWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                  builder: (context) {
                    return SplashOne();
                  },
                ), (route) => false);
              },
              child: Icon(Icons.refresh),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: searchWordController,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search text",
                        hintStyle: TextStyle(
                          color: Colors.black,
                        )),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  // height: 500,
                  child: GridView.builder(
                    itemCount: widget.row * widget.column,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 3.0,
                      crossAxisCount: widget.column,
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
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color: foundedList.contains(index) == true
                                ? Colors.green
                                : Colors.white, //foundedList[[0][1]] ==
                            border: Border.all(
                              color: Colors.black,
                            )),
                        alignment: Alignment.center,
                        child: Text(widget.listOfAlphabets[index].toString()),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 80),
                InkWell(
                  onTap: () {
                    if (searchWordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Enter text First!")));
                    } else {
                      findFromLeftToRight(
                        widget.listOfAlphabets,
                        searchWordController.text,
                        foundedList,
                        result,
                      );
                    }
                    setState(() {});
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                    ),
                    child: Text("Search Left to Right"),
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    findFromRightToLeft(
                      widget.listOfAlphabets,
                      searchWordController.text,
                      foundedList,
                      result,
                    );
                    setState(() {});
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                    ),
                    child: Text("Search Right to Left"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
