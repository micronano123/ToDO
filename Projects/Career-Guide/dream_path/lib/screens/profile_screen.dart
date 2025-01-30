import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget{
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>{
  //Dummy user data
  String _name = "Takatso Molekane";
  String _email = "takatso.molekane@gmail.com";
  String _hollandCode = "RIA";
  List<String> _savedCareers = ["Mechanical Engineer","Architect"];

  //Controllers for editing name and email
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState(){
    super.initState();
    _nameController.text = _name;
    _emailController.text = _email;
  }

  @override
  void dispose(){
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _editProfile(){
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Edit Profile"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: "Name"),
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: "Email"),
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text("Cancel"),
              ),
              TextButton(
                  onPressed: (){
                    setState(() {
                      _name = _nameController.text;
                      _email = _emailController.text;
                    });
                  },
                  child: Text("Save"),
              ),
            ],
          );
        },
    );
  }


  void _logout(){
    Navigator.pop(context); //Go back to previous screen
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          IconButton(
              onPressed: _editProfile,
              icon: Icon(Icons.edit),
          ),
          IconButton(
              onPressed: _logout,
              icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "personal Information",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Name"),
              subtitle: Text(_name),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text("Email"),
              subtitle: Text(_email),
            ),
            SizedBox(height: 20),
            Text(
              "Holland Code",
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
            ),
            ListTile(
              leading: Icon(Icons.assignment),
              title: Text("Your Holland Code"),
              subtitle: Text(_hollandCode),
            ),
            SizedBox(height: 20),
            Text(
              "Saved Careers",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
                child: ListView.builder(
                  itemCount: _savedCareers.length,
                  itemBuilder: (context, index){
                    return ListTile(
                      leading: Icon(Icons.work),
                      title: Text(_savedCareers[index]),
                    );
                  },
                ),
            ),
          ],
        ),
      ),
    );
  }
}