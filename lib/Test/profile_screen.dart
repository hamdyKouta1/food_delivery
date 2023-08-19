import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class profileScreenTest extends StatelessWidget {

  profileScreenTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset(
              'assets/images/PhotoProfile.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.2,
              fit: BoxFit.cover,
            ),
            DraggableScrollableSheet(
                minChildSize: 0.6,
                maxChildSize: 0.9,
                initialChildSize: 0.6,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return ListView(
                    controller: scrollController,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50)),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(bottom: 30),
                                  height: 10,
                                  width: MediaQuery.of(context).size.width/3,
                                  decoration:  BoxDecoration(
                                      color: Colors.orangeAccent,
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                              ],
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 40,
                              width: MediaQuery.of(context).size.width/3,
                              decoration:  BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Text('Member Gold',style: TextStyle(color: Colors.white),),
                            ),
                            const SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Mohamed Rizk',style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.black),),
                                IconButton(onPressed: (){}, icon: const Icon(Icons.edit,color: Colors.green,))
                              ],
                            ),
                            const Text('MohamedRizk@gmail.com',style: TextStyle(fontSize: 12,fontWeight:FontWeight.normal,color: Colors.grey),),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 80,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 2,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const SizedBox(width: 10,),
                                        Image.asset('assets/images/voucher.png',),
                                        const SizedBox(width: 20,),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: const [
                                            Text('You have 3 vouchers',
                                              style: TextStyle(
                                                  color: Colors.black ,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 18),),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 15,),
                            const Text('Favorite',style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.black),),
                            const SizedBox(height: 15,),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height/2,
                              child: ListView.builder(
                                  controller: scrollController,
                                  itemCount: 5,
                                  itemBuilder: (context,index){
                                    return Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      elevation: 2,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                  padding: const EdgeInsets.all(10),
                                                  child: Image.asset('assets/images/PhotoMenu.png',)),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: const [
                                                  Text('Green Noddle',
                                                    style: TextStyle(
                                                        color: Colors.black ,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 18),),
                                                  Text('Noodle Home', style: TextStyle(color: Colors.grey)),
                                                  Text('15 USD',style: TextStyle(
                                                      color: Colors.orangeAccent ,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 18),),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(right: 10),
                                            child: ElevatedButton(
                                                onPressed: (){},
                                                style: ElevatedButton.styleFrom(
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(30),
                                                    ),
                                                    backgroundColor: Colors.green,
                                                    minimumSize: const Size(20, 40)),
                                                child:   const Text(
                                                  'Buy again',
                                                  style:  TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.normal),
                                                )
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                })
          ],
        ),
      ),
    );
  }
}
