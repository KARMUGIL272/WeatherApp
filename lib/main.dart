import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
TextEditingController nameController = TextEditingController();
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tour Planner",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainLayout(),

    );
  }
}
class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  @override
  Widget build(BuildContext context) {
    return Text("this is weather page");
  }
}

final city=['chennai','madurai','rameshwaram','thanjavur'];

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex=0;
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex=index;
    });
  }
  static const List<Widget> _pages=<Widget>[
    HomePage(),
    Weather(),
    // Location(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tour Planner'),
        
      ),
      body:Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      drawer:Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Tour Planners'),
              accountEmail: Text('TourPlanners@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text("TP"),
              ),
            ),
            ListTile(
              title:Text('9025036068') ,
              leading: Icon(Icons.phone),
            ),
            ListTile(
              title:Text('www.tourplanners.com') ,
              leading: Icon(Icons.account_circle_rounded),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black54,
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon:Icon(Icons.home),
          ),
          BottomNavigationBarItem(
              label: "Weather",
              icon:Icon(Icons.cloud),
          ),
          // BottomNavigationBarItem(
          //   label: "Current Location",
          //   icon:Icon(Icons.location_on_outlined),
          // ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    "images/img1.png"
                ),
                fit:BoxFit.cover
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              SizedBox(height: 17),
              Text.rich(TextSpan(
                  text: 'Welcome',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: 'To Tour Planners',
                    ),
                  ]
              ),
                style: TextStyle(fontSize: 50),
              ),
              SizedBox(height: 30),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  // prefixIcon: Icon(Icons.search, size: 18),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Enter the City',
                ),
              ),
              //SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 120),
                child: FlatButton(
                  color: Colors.lightBlueAccent,
                  textColor: Colors.white,
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const App()),
                    );
                    setState(() {
                      print(nameController.text);
                    });
                  },
                  child: Text("Search"),
                ),
              ),

              SizedBox(height: 10),
              Text(
                'Popular Places',
                style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),
              ),
              SizedBox(height: 10),

              SizedBox(
                height: 300,
                child: GridView.count(
                  padding: EdgeInsets.zero,
                  crossAxisCount:2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.491,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    for (var i in city)
                      Image.asset('images/$i.jpeg'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(nameController.text),

    );
  }
}

// class HomePage extends StatelessWidget {
//
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 30.0),
//         child: Container(
//           constraints: BoxConstraints.expand(),
//           decoration: BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage(
//                     "images/img1.png"
//                 ),
//                 fit:BoxFit.cover
//             ),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//
//             children: [
//               SizedBox(height: 37),
//               Text.rich(TextSpan(
//                   text: 'Welcome',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                   children: [
//                     TextSpan(
//                       text: 'To Tour Planners',
//                     ),
//                   ]
//               ),
//                 style: TextStyle(fontSize: 50),
//               ),
//               SizedBox(height: 30),
//               TextField(
//                 controller: nameController,
//                 decoration: InputDecoration(
//                   // prefixIcon: Icon(Icons.search, size: 18),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   hintText: 'Enter the City',
//                 ),
//               ),
//               SizedBox(height: 10),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 150),
//                 child: RaisedButton(
//                   color: Colors.lightBlueAccent,
//                   textColor: Colors.white,
//                   onPressed: (){},
//                   child: Text("Search"),
//                 ),
//               ),
//               SizedBox(height: 80),
//               Text(
//                 'Popular Places',
//                 style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),
//               ),
//               SizedBox(height: 10),
//
//               SizedBox(
//                 height: 300,
//                 child: GridView.count(
//                   padding: EdgeInsets.zero,
//                   crossAxisCount:2,
//                   crossAxisSpacing: 10,
//                   mainAxisSpacing: 10,
//                   childAspectRatio: 1.491,
//                   physics: NeverScrollableScrollPhysics(),
//                   children: [
//                     for (var i in city)
//                       Image.asset('images/$i.jpeg'),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       backgroundColor: Colors.black,
//     );
//   }
// }