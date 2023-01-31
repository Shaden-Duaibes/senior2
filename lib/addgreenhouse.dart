import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/material/icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  XFile? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Add greenhouse',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
                image: NetworkImage(
                    'https://thumbor.forbes.com/thumbor/fit-in/900x510/https://www.forbes.com/home-improvement/wp-content/uploads/2022/07/image6-4.jpg')),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _name,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    prefixIcon: Icon(Icons.keyboard_alt),
                    //  border: OutlineInputBorder(),
                    labelText: 'Enter Greenhouse Name'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _email,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    prefixIcon: Icon(Icons.add_a_photo),
                    // border: OutlineInputBorder(),
                    labelText: 'add Photo'),
              ),
            ),
            Container(
              padding: EdgeInsetsDirectional.all(10),
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                FloatingActionButton(
                  mini: true,
                  onPressed: () {
                    showModalBottomSheet(
                        context: context, builder: (build) => bottomsheet());
                    // Respond to button press
                  },
                  child: Icon(Icons.attachment),
                ),
                FloatingActionButton(
                  mini: true,
                  onPressed: () {
                    // Respond to button press
                  },
                  child: Icon(Icons.camera_alt),
                )
              ]),
            ),
            Hero(
              tag: 'f345',
              child: ElevatedButton(
                  onPressed: () {},
                  //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WelcomePage(name: _name.text, email: _email.text, phone: _phone.text)));
                  //},
                  child: Text('Add')),
            ),
          ],
        ),
      ),
    );
  }
}

Widget bottomsheet() {
  ImagePicker picker = ImagePicker();
  XFile? image;

  return Container(
    height: 278,
    width: 278,
    child: Card(
      margin: EdgeInsets.all(18),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              iconcreation(Icons.insert_drive_file, Colors.indigo, "Document"),
              SizedBox(
                width: 40,
              ),
              Hero(
                tag: 'f54',
                child: GestureDetector(
                  onTap: () async {
                    image = await picker.pickImage(source: ImageSource.camera);
                  },
                  child: iconcreation(Icons.camera_alt, Colors.pink, "Camera"),
                ),
              ),
              SizedBox(
                width: 40,
              ),
              Hero(
                tag: 'f57',
                child: GestureDetector(
                  onTap: () async {
                    image = await picker.pickImage(source: ImageSource.gallery);
                  },
                  child: iconcreation(
                      Icons.insert_photo, Colors.purple, "Gallery"),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
            width: 200,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              iconcreation(Icons.headset, Colors.orange, "Audio"),
              SizedBox(
                width: 40,
              ),
              iconcreation(Icons.location_pin, Colors.pink, "Locations"),
              SizedBox(
                width: 40,
              ),
              iconcreation(Icons.person, Colors.blue, "Contact"),
            ],
          )
        ]),
      ),
    ),
  );
}

Widget iconcreation(IconData icon, Color color, String text) {
  return Column(
    children: [
      CircleAvatar(
        radius: 30,
        backgroundColor: color,
        child: Icon(
          icon,
          size: 29,
          color: Colors.white,
        ),
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        text,
        style: TextStyle(fontSize: 12),
      ),
    ],
  );
}
