import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_clear_architecture/app/config/router/my_routes.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'images/IG logo.png',
            ),
            SizedBox(
              width: 1,
              height: 1,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.keyboard_arrow_down_outlined),
              color: Colors.black,
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {
              // Add your onPressed logic here
            },
            icon: ImageIcon(
              AssetImage(
                  'images/chat.png'), // Replace with the actual image path
              size: 24.0, // Set the desired size of the icon
              color: Colors.black, // Set the desired color of the icon
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/gambar.jpg'),
                                fit: BoxFit.cover),
                            border: Border.all(color: Colors.white, width: 5),
                            borderRadius: BorderRadius.circular(60),
                          ),
                        ),
                        Positioned(
                            width: 20,
                            top: 50,
                            bottom: 0,
                            right: 16,
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.add_circle,
                                  color: Colors.blue,
                                )))
                      ],
                    ),
                    SizedBox(width: 10),
                    story('story 1'),
                    SizedBox(width: 10),
                    story('story 1'),
                    SizedBox(width: 10),
                    story('story 1'),
                    SizedBox(width: 10),
                    story('story 1'),
                    SizedBox(width: 10),
                    story('story 1'),
                    SizedBox(width: 10),
                    story('story 1'),
                  ],
                )),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/gambar.jpg'),
                              fit: BoxFit.cover),
                          border: Border.all(color: Colors.white, width: 5),
                          borderRadius: BorderRadius.circular(60),
                        ),
                      ),
                      Text(
                        'username',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      // Add your onPressed logic here
                    },
                    icon: ImageIcon(
                      AssetImage(
                          'images/Icons (3).png'), // Replace with the actual image path
                      size: 24.0, // Set the desired size of the icon
                      color: Colors.black, // Set the desired color of the icon
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 5),
          Container(
            width: 390,
            height: 390,
            child: Image.asset(
              'images/gambar1.png',
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_border_outlined),
                      ),
                      IconButton(
                        onPressed: () {
                          // Add your onPressed logic here
                        },
                        icon: ImageIcon(
                          AssetImage(
                              'images/Icons (1).png'), // Replace with the actual image path
                          size: 24.0, // Set the desired size of the icon
                          color:
                              Colors.black, // Set the desired color of the icon
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Add your onPressed logic here
                        },
                        icon: ImageIcon(
                          AssetImage(
                              'images/Polygon 4.png'), // Replace with the actual image path
                          size: 24.0, // Set the desired size of the icon
                          color:
                              Colors.black, // Set the desired color of the icon
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      // Add your onPressed logic here
                    },
                    icon: ImageIcon(
                      AssetImage(
                          'images/Icons (2).png'), // Replace with the actual image path
                      size: 24.0, // Set the desired size of the icon
                      color: Colors.black, // Set the desired color of the icon
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '100 Likes',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: "Username ",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text:
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ",
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: "more",
                        style: TextStyle(color: Colors.grey),
                      )
                    ]),
                  ),
                  Text('View all 16 comments'),
                ],
              )),
        ],
      ),
    );
  }
}

class story extends StatelessWidget {
  story(this.title);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.red, Colors.amber, Colors.pink],
                ),
                borderRadius: BorderRadius.circular(60),
              ),
            ),
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/gambar.jpg'), fit: BoxFit.cover),
                border: Border.all(color: Colors.white, width: 5),
                borderRadius: BorderRadius.circular(60),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Text(title),
      ],
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           ElevatedButton(
//               onPressed: () {
//                 context.goNamed(MyRoutes.homedetail, pathParameters: {
//                   'nilai': '22222324367857',
//                 });
//               },
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
//               child: Center(child: Text('kirim Nilai 100'))),
//         ],
//       ),
//     );
//   }
// }
