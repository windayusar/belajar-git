import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // XFile? myImage;
  dynamic myImage;

  Future<void> pickerImage() async {
    final picker = ImagePicker();

    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      if (kIsWeb) {
        final imageWeb = await image.readAsBytes();
        setState(() {
          myImage = imageWeb;
        });
      } else {
        setState(() {
          myImage = image;
        });
      }
    }
  }

  @override
  void _show(BuildContext ctx) {
    showModalBottomSheet(
        elevation: 10,
        backgroundColor: Colors.amber,
        context: ctx,
        builder: (ctx) => Column(
              children: [
                Row(
                  children: [Icon(Icons.settings), Text("Setting and privasy")],
                )
              ],
            ));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Row(children: [
            Text(
              'username',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_drop_down,
                color: Colors.black,
              ),
            ),
          ]),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add_box_outlined,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {
                _show(context);
              },
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(
                  child: _buildHeaderContent(),
                ),
                SliverToBoxAdapter(
                  child: const TabBar(
                    tabs: [
                      Tab(
                          icon: Icon(
                        Icons.grid_on_outlined,
                        color: Colors.black,
                      )),
                      Tab(
                          icon: Icon(
                        Icons.person,
                        color: Colors.black,
                      )),
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(children: [grid(), Container()]),
          ),
        ));
  }

  Column _buildHeaderContent() {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            profilepicture(),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  infoitem("Post", "9999"),
                  infoitem("Followers", "9999"),
                  infoitem("Following", "9999"),
                ],
              ),
            )
          ],
        ),
      ),
      SizedBox(
        height: 15,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            'Username',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      SizedBox(
        height: 5,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: RichText(
          text: TextSpan(
              text:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: "#hastag",
                  style: TextStyle(color: Colors.blue),
                )
              ]),
        ),
      ),
      SizedBox(
        height: 5,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            'Link goes here',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ),
      SizedBox(height: 5),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Edit Profile',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(primary: Colors.grey[200]),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              width: 50,
              child: ElevatedButton(
                onPressed: () {},
                child: Icon(
                  Icons.person_add,
                  color: Colors.black,
                ),
                style: ElevatedButton.styleFrom(primary: Colors.grey[200]),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 5,
      ),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                StoryItem('Story 1'),
                StoryItem('Story 2'),
                StoryItem('Story 3'),
                StoryItem('Story 4'),
                StoryItem('Story 5'),
                StoryItem('Story 6'),
              ],
            ),
          )),
      SizedBox(
        height: 5,
      ),

      // DefaultTabController(length: 2, child: NestedScrollView(body: ,)),
      // Row(children: [
      // TabItem(Icons.grid_on_outlined, true),
      //   TabItem(Icons.video_library_sharp, false),
      //   TabItem(Icons.person_pin_outlined, false),
      // ]),
    ]);
  }
}

class grid extends StatelessWidget {
  const grid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 213,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        crossAxisCount: 3,
      ),
      itemBuilder: (context, index) => Image.asset(
        'images/gambar.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  TabItem(this.icon, this.active);

  final bool active;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: active == true ? Colors.black : Colors.white,
                    width: 1))),
        child: Icon(icon),
      ),
    );
  }
}

class StoryItem extends StatelessWidget {
  StoryItem(this.title);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey[300]),
              ),
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[300],
                  border: Border.all(
                    color: Colors.white,
                    width: 5,
                  ),
                  image: DecorationImage(
                      image: AssetImage('images/gambar.jpg'),
                      fit: BoxFit.cover),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(title)
        ],
      ),
    );
  }
}

class infoitem extends StatelessWidget {
  infoitem(this.title, this.value);
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Text(title),
      ],
    );
  }
}

class profilepicture extends StatelessWidget {
  const profilepicture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.red, Colors.amber],
            ),
            borderRadius: BorderRadius.circular(60),
          ),
        ),
        Container(
          width: 110,
          height: 110,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/gambar.jpg'), fit: BoxFit.cover),
            border: Border.all(color: Colors.white, width: 5),
            borderRadius: BorderRadius.circular(60),
          ),
        ),
      ],
    );
  }
}

//pick image

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Picker'),
//       ),
//       body: Column(
//         children: [
//           if (myImage != null)
//             if (kIsWeb)
//               Image.memory(myImage as Uint8List)
//             else
//               Image.file(
//                 File((myImage as XFile).path),
//               ),
//           ElevatedButton(
//             onPressed: () async {
//               await pickerImage();
//             },
//             child: Text('Masukkan Gambar'),
//           ),
//         ],
//       ),
//     );
//   }
// }
