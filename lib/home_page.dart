import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final amount = TextEditingController();

  final rate = TextEditingController();

  final days = TextEditingController();

  final months = TextEditingController();

  final years = TextEditingController();

  double interest = 0;

  double famount = 0;

  double day_month = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("calculator"),
      ),
      body: Material(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 20.0)),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: amount,
                decoration: InputDecoration(
                  labelText: "Amount",
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(),
                  ),
                  //fillColor: Colors.green
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: rate,
                decoration: InputDecoration(
                  labelText: "Rate of interest",
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(),
                  ),
                  //fillColor: Colors.green
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3.2,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: days,
                      decoration: InputDecoration(
                        labelText: "Days",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(),
                        ),
                        //fillColor: Colors.green
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3.2,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: months,
                      decoration: InputDecoration(
                        labelText: "Months",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(),
                        ),
                        //fillColor: Colors.green
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3.2,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: years,
                      decoration: InputDecoration(
                        labelText: "Years",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(),
                        ),
                        //fillColor: Colors.green
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          double p1 = double.tryParse(amount.text) ?? 0;
                          for (int i = 0;
                              i < (double.tryParse(years.text) ?? 0);
                              i++) {
                            double i1 = (p1 *
                                12 *
                                (double.tryParse(rate.text) ?? 0) /
                                100);
                            p1 += i1;
                          }
                          day_month = (double.tryParse(days.text) ?? 0) / 30 +
                              (double.tryParse(months.text) ?? 0);
                          if (day_month > 0) {
                            double i2 = p1 *
                                day_month *
                                (double.tryParse(rate.text) ?? 0) /
                                100;
                            p1 += i2;
                          }
                          famount = p1;
                          interest = p1 - (double.tryParse(amount.text) ?? 0);
                        });
                      },
                      icon: const Icon(Icons.percent_rounded),
                      label: const Text("Compound"),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          double time = (double.tryParse(days.text) ?? 0) / 30 +
                              (double.tryParse(months.text) ?? 0) +
                              (double.tryParse(years.text) ?? 0) * 12;
                          interest = (double.tryParse(amount.text) ?? 0) *
                              time *
                              (double.tryParse(rate.text) ?? 0) /
                              100;
                          famount =
                              (double.tryParse(amount.text) ?? 0) + interest;
                        });
                      },
                      icon: const Icon(Icons.percent_rounded),
                      label: const Text("Simple"),
                    ),
                    ElevatedButton.icon(
                        onPressed: () {
                          amount.clear();
                          rate.clear();
                          days.clear();
                          months.clear();
                          years.clear();
                        },
                        icon: const Icon(Icons.clear_all_sharp),
                        label: const Text("Clear all"))
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Interest : ${interest.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 30),
              ),
              Text(
                "Total : ${famount.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     ElevatedButton.icon(
//                       onPressed: () {
//                         setState(() {
//                           double p1 = double.parse(amount.text);
//                           for (int i = 0; i < double.parse(years.text); i++) {
//                             double i1 =
//                                 (p1 * 12 * double.parse(rate.text) / 100);
//                             p1 += i1;
//                           }
//                           day_month = double.parse(days.text) / 30 +
//                               double.parse(months.text);
//                           if (day_month > 0) {
//                             double i2 =
//                                 p1 * day_month * double.parse(rate.text) / 100;
//                             p1 += i2;
//                           }
//                           famount = p1;
//                           interest = p1 - double.parse(amount.text);
//                         });
//                       },
//                       icon: const Icon(Icons.percent_rounded),
//                       label: const Text("Compound"),
//                     ),
//                     ElevatedButton.icon(
//                       onPressed: () {
//                         setState(() {
//                           double time = double.parse(days.text) / 30 +
//                               double.parse(months.text) +
//                               double.parse(years.text) * 12;
//                           interest = double.parse(amount.text) *
//                               time *
//                               double.parse(rate.text) /
//                               100;
//                           famount = double.parse(amount.text) + interest;
//                         });
//                       },
//                       icon: const Icon(Icons.percent_rounded),
//                       label: const Text("Simple"),
//                     ),
//                     ElevatedButton.icon(
//                         onPressed: () {
//                           amount.clear();
//                           rate.clear();
//                           days.clear();
//                           months.clear();
//                           years.clear();
//                         },
//                         icon: const Icon(Icons.clear_all_sharp),
//                         label: const Text("Clear all"))
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               Text(
//                 "Interest : ${interest.toStringAsFixed(2)}",
//                 style: const TextStyle(fontSize: 30),
//               ),
//               Text(
//                 "Total : ${famount.toStringAsFixed(2)}",
//                 style: const TextStyle(fontSize: 30),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
