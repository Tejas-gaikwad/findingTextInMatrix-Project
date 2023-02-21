import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../addingAlphabet.dart';
import '../homescree2.dart';
import '../homescreen.dart';

class SplashOne extends StatefulWidget {
  SplashOne({super.key});

  @override
  State<SplashOne> createState() => _SplashOneState();
}

class _SplashOneState extends State<SplashOne>
    with SingleTickerProviderStateMixin {
  TextEditingController columnController = TextEditingController();

  TextEditingController rowController = TextEditingController();

  late AnimationController controller;
  late Animation offsetAnimation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    offsetAnimation =
        Tween<double>(begin: 120.0, end: 50.0).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text("Enter Rows and Columns Numbers",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              const SizedBox(height: 50),
              // Positioned(
              //   left: offsetAnimation.value,
              //   top: 120.0,
              //   child:
              TextFieldContaner(
                controller: rowController,
                hintText: "Rows",
              ),
              // ),
              TextFieldContaner(
                controller: columnController,
                hintText: "Columns",
              ),
              const SizedBox(height: 50),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return AddingAlphabets(
                        column: int.parse(columnController.text),
                        row: int.parse(rowController.text),
                      );
                    },
                  ));
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 1, 85),
                      border: Border.all(color: Colors.black)),
                  child: Text("Submit",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class TweenAnimation extends StatelessWidget {
//   final childWidget;
//   final time;
//   final controller;
//   const TweenAnimation(
//       {super.key, this.childWidget, this.time, this.controller});

//   @override
//   Widget build(BuildContext context) {
//     return TweenAnimationBuilder(
//       tween:
//           Tween<Offset>(begin: Offset(100.0, 50.0), end: Offset(200.0, 100.0))
//               .animate(controller),
//       duration: Duration(milliseconds: time),
//       builder: (context, value, child) {
//         return childWidget;
//       },
//     );
//   }
// }

class TextFieldContaner extends StatelessWidget {
  final hintText;
  final controller;
  const TextFieldContaner(
      {super.key, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 08),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          border: Border.all(color: Colors.black)),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 242, 255, 0),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
