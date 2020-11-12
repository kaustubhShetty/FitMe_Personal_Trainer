import 'package:flutter/material.dart' hide Router;
import 'package:provider_architecture/core/viewmodels/menu_model.dart';
import 'package:provider_architecture/ui/shared/text_styles.dart';
import 'package:provider_architecture/ui/views/base_view.dart';
import 'package:provider_architecture/ui/widgets/menu_widgets/category_item.dart';
import 'package:provider_architecture/ui/views/bmi_calculator_view.dart';
import 'package:provider_architecture/ui/router.dart';

class MenuView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<MenuModel>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
              child: Text(
            "Workout Categories",
            style: appBarTitleStyle,
          )),
        ),
        body: SafeArea(
          child: ListView.builder(
            padding: EdgeInsets.only(left: 8, right: 8, top: 8),
            itemCount: model.workoutCategories.length,
            itemBuilder: (BuildContext context, int index) {
              return CategoryItem(model.workoutCategories.elementAt(index),
                  model.navigateToInstructions, model.navigateToStartworkout);
            },
          ),

          // Container(
          //   height: 400,
          //   padding: EdgeInsets.all(8),
          //   child: Card(
          //     elevation: 4,
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: <Widget>[
          //         Stack(
          //           children: <Widget>[
          //             Image.asset(
          //               "lib/assets/images/bmi1.jpg",
          //               fit: BoxFit.fitWidth,
          //             ),
          //             Positioned(
          //               bottom: 0,
          //               left: 0,
          //               right: 0,
          //               child: Container(
          //                 padding: EdgeInsets.all(8),
          //                 decoration: BoxDecoration(
          //                   gradient: LinearGradient(
          //                       colors: [Colors.black, Colors.transparent],
          //                       begin: Alignment.bottomCenter,
          //                       end: Alignment.topCenter),
          //                 ),
          //                 child: Text(
          //                   "Bmi Calculator",
          //                   style: categoryTitleStyle,
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: Text(
          //             "Determine any health risks you may face if it's outside of the healthy range.",
          //             style: categoryDescStyle,
          //             textAlign: TextAlign.start,
          //           ),
          //         ),
          //         Expanded(
          //           child: ButtonBar(
          //             alignment: MainAxisAlignment.start,
          //             children: <Widget>[
          //               // FlatButton(
          //               //   child: const Text(
          //               //     'INSTRUCTIONS',
          //               //     style: categoryButtonTextStyle,
          //               //   ),
          //               //   onPressed: () {
          //               //     Navigator.of(context)
          //               //         .pushNamed(Router.BMICALCULATOR);                        },
          //               //),
          //               FlatButton(
          //                 child: const Text(
          //                   'START',
          //                   style: categoryButtonTextStyle,
          //                 ),
          //                 onPressed: () {
          //                   Navigator.of(context)
          //                       .pushNamed(Router.BMICALCULATOR);
          //                 },
          //               ),
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ),
        floatingActionButton: Container(
          height: 90.0,
          width: 90.0,
          child: FittedBox(
            child: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Router.BMICALCULATOR);
                },
            child:
                Text('BMI',style:TextStyle(fontSize: 20),),

            ),
          ),
        ),
      ),
    );
  }
}
