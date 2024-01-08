import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
    int currentIndex = 0 ;

  final List<Widget> _screens = const[
    Welocme(),
    PlaceholderWidget(Icon(Icons.compare_arrows,size: 200,)),
    PlaceholderWidget(Icon(Icons.favorite,size: 200,)),
    PlaceholderWidget(Icon(Icons.person,size: 200,)),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //to prevent the floating button from changing its position
      resizeToAvoidBottomInset: false,
      backgroundColor:const Color.fromARGB(255, 241, 241, 241),
      body: _screens[currentIndex],

      // Floating button

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 237, 160, 51),
        onPressed: () {},
        child: Stack(
          children: [
            const Icon(Icons.shopping_bag_outlined, size: 45),
            Positioned(
              top: 27,
              right: 4,
              child: Container(
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white,
                ),
                constraints: const BoxConstraints(
                  minWidth: 14,
                  minHeight: 14,
                ),
                child: const Center(
                  child: Text(
                    '0',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 11,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      // the rest of the icons at the bottom
      
      bottomNavigationBar: BottomAppBar(
        
        color: const Color.fromARGB(255, 255, 255, 255),
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(          
              splashRadius: 25,
              
              onPressed: () {
                setState(() {
                   currentIndex = 0;
                });
              },                
              icon: Icon(
                Icons.home,
                color:currentIndex == 0? Colors.orange:const  Color.fromRGBO(152, 153, 153, 1),
              ),
            
            ),
            Padding(
              padding: const EdgeInsets.only(right: 65),
              child: IconButton(
                splashRadius: 25,
                onPressed: () {
                setState(() {
                  currentIndex = 1;
                });
                },
                icon: Icon(
                  Icons.compare_arrows,
                  color:currentIndex==1?Colors.orange:const Color.fromRGBO(152, 153, 153, 1),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 65),
              child: IconButton(
                splashRadius: 25,
                onPressed: () {
                  setState(() {
                   currentIndex = 2;
                });
                },
                icon: Icon(
                  Icons.favorite,
                  color:currentIndex==2?Colors.orange:const Color.fromRGBO(152, 153, 153, 1),
                ),
              ),
            ),
            IconButton(
              splashRadius: 25,
              onPressed: () {
                setState(() {
                  currentIndex = 3;
                });
              },
              icon:  Icon(
                Icons.person,
                color: currentIndex == 3? Colors.orange : const Color.fromRGBO(152, 153, 153, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Welocme extends StatelessWidget {
  const Welocme({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 90.0),
                  child: Text(
                    'Welcome, Robert Carlos',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                const Spacer(),
                Stack(
                  children: [
                    IconButton(
                      padding: const EdgeInsets.only(left: 35),
                      onPressed: () {},
                      splashColor: Colors.transparent,
                      splashRadius: 25,
                      icon: const Icon(
                        Icons.notifications_none_outlined,
                      ),
                    ),
                    Positioned(
                      top: 19,
                      right: 4,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 7,
                          minHeight: 7,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
             SearchBar(
              overlayColor:const MaterialStatePropertyAll(Colors.transparent),
              constraints:const BoxConstraints(
                minHeight: 30,
              ),
              elevation: const MaterialStatePropertyAll(3),
              hintText: 'Search',
              trailing: [
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: (){},
                  child:const Icon(Icons.search),),
              ],
            ),
            const SizedBox(
              height: 17,
            ),
            SizedBox(
              height: 220,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/images/wm.jpg',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
       
             Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 5.0),
                  child: Text(
                    'All Categories',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                const Spacer(),
                CupertinoButton(
                  padding:const EdgeInsets.only(left: 10),
                  onPressed: (){},
                  child: const Text(
                    'See All',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      MyCategory('assets/images/glasses.png', 'Accessories',
                          '100 items'),
                      MyCategory(
                        'assets/images/shoes.png',
                        'Shoes',
                        '1 item',
                      ),
                      MyCategory('assets/images/toy.png', 'Baby and Toy',
                          '200 items'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      MyCategory(
                          'assets/images/bag.png', 'Bags', '120 items'),
                      MyCategory(
                        'assets/images/tv.png',
                        'Tv',
                        '50 items',
                      ),
                      MyCategory('assets/images/beauty.png',
                          'Health and Beauty', '60 items'),
                    ],
                  ),
                ),
              ],
            ),
            //Offer Product and see all
             Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 5.0),
                  child: Text(
                    'Offer Product',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                const Spacer(),
                CupertinoButton(
                  padding: const EdgeInsets.only(left: 10),
                  onPressed: (){},
                  child: const Text(
                    'See All',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 3,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(7),
                        child: Image.asset(
                          'assets/images/bubu.jpg',
                          width: 290,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Positioned(
                        left: 250,
                        top: 4,
                        child: Container(
                          decoration:const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(9),
                              bottomLeft: Radius.circular(9),),
                            shape: BoxShape.rectangle,
                            color: Colors.red,
                          ),
                          child: const Center(
                              child: Padding(
                                padding: EdgeInsets.all(3.0),
                                child: Text(
                                  '10% OFF',
                                   style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,),
                                                          ),
                              ),),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/gigi.png',
                      width: 290,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/los.jpg',
                      width: 290,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Icon myIcon;

  const PlaceholderWidget(this.myIcon,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: myIcon,
      ),
    );
  }
}

//reusable class for category

class MyCategory extends StatelessWidget {
  const MyCategory(this._myImage, this._myText, this._myItem, {super.key});
  final String _myImage;
  final String _myText;
  final String _myItem;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Center(
        child: Column(
          children: [
            SizedBox(
              width: 60,
              height: 60,
              child: Image.asset(_myImage),
            ),
            const SizedBox(
              height: 4,
            ),
            SizedBox(
              width: 100,
              child: Column(
                children: [
                  Text(
                    _myText,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 12,),
                  ),
                  Text(
                    _myItem,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 12,),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
