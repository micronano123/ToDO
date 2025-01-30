import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state_management/user_provider.dart';

class ProfileScreen extends StatefulWidget{
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>{

  //Controllers for editing name and email
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState(){
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    _nameController.text = userProvider.name;
    _emailController.text = userProvider.email;
  }

  @override
  void dispose(){
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _editProfile(BuildContext context){
    final userProvider = Provider.of<UserProvider>(context, listen: false);
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
                    userProvider.updateProfile(
                      _nameController.text,
                      _emailController.text,
                    );
                    Navigator.pop(context);
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
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          IconButton(
              onPressed: () => _editProfile(context),
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
              "Personal Information",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Name"),
              subtitle: Text(userProvider.name),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text("Email"),
              subtitle: Text(userProvider.email),
            ),
            SizedBox(height: 20),
            Text(
              "Holland Code",
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
            ),
            ListTile(
              leading: Icon(Icons.assignment),
              title: Text("Your Holland Code"),
              subtitle: Text(userProvider.hollandCode),
            ),
            SizedBox(height: 20),
            Text(
              "Saved Careers",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
                child: ListView.builder(
                  itemCount: userProvider.savedCareers.length,
                  itemBuilder: (context, index){
                    return ListTile(
                      leading: Icon(Icons.work),
                      title: Text(userProvider.savedCareers[index]),
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