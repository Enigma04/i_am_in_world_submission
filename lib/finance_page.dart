import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:i_am_in_world_submission/domino_effect.dart';

class FinancePage extends StatefulWidget {
  const FinancePage({Key? key}) : super(key: key);

  @override
  _FinancePageState createState() => _FinancePageState();
}

class _FinancePageState extends State<FinancePage> {

  //list of tile data
  final List<DataTiles> dataTile = [
    DataTiles(title: "Mobile Home Dealers",
        subtitle: "Last payment 17 May",
        color: Colors.deepPurpleAccent),
    DataTiles(title: "Taxicabs and Limousines",
        subtitle: "Last payment 26 May",
        color: Colors.lightBlueAccent),
    DataTiles(title: "Miscellaneous Apparel and Accessory Shops",
        subtitle: "Last payment 06 April",
        color: Colors.redAccent),
    DataTiles(title: "Electric, Gas, Sanitary and Water utilities",
        subtitle: "Last payment 01 May",
        color: Colors.deepPurpleAccent),
    DataTiles(title: "Misc. General Merchandise",
        subtitle: "Last payment 01 March",
        color: Colors.lightBlueAccent),
  ];

  //list of list data
  final List<DataList> dataList = [
    DataList(listTitle: "WWWOLACABSCOM", listSubtitle: "26 May 2021", amount: 449, time: "6:40 PM"),
    DataList(listTitle: "Recharge", listSubtitle: "26 May 2021", amount: 115, time: "6:35 PM"),
    DataList(listTitle: "Reliance Retail Ltd", listSubtitle: "17 May 2021", amount: 4949, time: "12:11 AM"),
    DataList(listTitle: "Recharge", listSubtitle: "16 May 2021", amount: 4500, time: "12:09 AM"),
    DataList(listTitle: "AIRTEL", listSubtitle: "01 May 2021", amount: 49, time: "8:06 PM"),
  ];

  //list of colors which will affect the look of the numbers
  List colors = [
    Colors.red,
    Colors.green
  ];

  var currentColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    //refreshes the page
    return RefreshIndicator(
        onRefresh: (){
          Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (a,b,c)=> const FinancePage(), transitionDuration: const Duration(seconds: 2)));
          return Future.value();
        },
        child: Scaffold(
    backgroundColor: Colors.deepPurple.shade800,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              //creates the card which shows "Card Balance"
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    elevation: 3,
                    child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        tileColor: Colors.deepPurpleAccent,
                        leading: const Text(
                          "Card balance",
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: FittedBox(
                          fit: BoxFit.fill,
                          child: Row(
                            children: const [
                              Text(
                                "0₹",
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 10,
                              )
                            ],
                          ),
                        )),
                  )),
              const Text("PAYMENT CATEGORIES",
                  style: TextStyle(
                    color: Colors.grey,
                  )),
              SizedBox(
                height: 200,
                //builds the horizontal list consisting of payment category cards
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: dataTile.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 150,
                        child: Card(
                          child: Padding(padding: const EdgeInsets.all(4),
                            child: Column(
                              children: [
                                Text(dataTile[index].title,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(dataTile[index].subtitle,
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 103,),
                                Row(

                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    //animation of the payment category cards
                                    DominoEffect(
                                      child: Container(
                                        height: 15,
                                        width: 20,
                                        color: const Color(0xFFFFFFFF).withOpacity(0.5),
                                      ),
                                      delay: const Duration(milliseconds: 150),
                                    ),
                                    const SizedBox(width: 3,),
                                    DominoEffect(
                                      child: Container(
                                        height: 15,
                                        width: 20,
                                        color: const Color(0xFFFFFFFF).withOpacity(0.5),
                                      ),
                                      delay: const Duration(milliseconds: 200),
                                    ),
                                    const SizedBox(width: 3,),
                                    DominoEffect(
                                      child: Container(
                                        height: 15,
                                        width: 20,
                                        color: const Color(0xFFFFFFFF).withOpacity(0.5),
                                      ),
                                      delay: const Duration(milliseconds: 250),
                                    ),
                                    const SizedBox(width: 3,),
                                    DominoEffect(
                                      child: Container(
                                        height: 15,
                                        width: 20,
                                        color: const Color(0xFFFFFFFF).withOpacity(0.5),
                                      ),
                                      delay: const Duration(milliseconds: 300),
                                    ),
                                    const SizedBox(width: 3,),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: dataTile[index].color,
                        ),
                      );
                    }),
              ),
              const SizedBox(height: 10),
              Row(
                children: const [
                  Text("Latest Transactions",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 190,),
                  Text("See All",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 10,),
                ],
              ),
              //builds a vertical list to show recent transactions
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: dataList.length,
                  itemBuilder: (context, index){
                    return ListTile(
                      leading: const Icon(Icons.wifi_protected_setup_outlined, color: Colors.white,),
                      title:   Text(dataList[index].listTitle,
                        style: const TextStyle(
                            color: Colors.white
                        ),
                      ),
                      subtitle: Text(dataList[index].listSubtitle,
                        style: const TextStyle(
                            color: Colors.grey
                        ),
                      ),
                      trailing: Column(
                        children: [
                          Text("₹ ${Random().nextInt(1001).toString()}",
                            style:   TextStyle(
                                color:  currentColor = colors[Random().nextInt(colors.length)], //randomizes colors between red and green
                            ),
                          ),
                          Text(dataList[index].time,
                            style: const TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              )
            ],
          ),
        )
    ),
    );
  }
}

//stores the 'DataTiles' data given in the list
class DataTiles {
  DataTiles({required this.title, required this.subtitle, required this.color});

  final String title;
  final String subtitle;
  final Color color;
}

//stores the 'DataList' data given in the list
class DataList {
  DataList({required this.listTitle, required this.listSubtitle, required this.amount, required this.time});

  final String listTitle;
  final String listSubtitle;
  final int amount;
  final String time;
}
