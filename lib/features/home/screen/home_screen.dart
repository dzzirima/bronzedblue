import 'package:bronzedblue/features/home/screen/add_user_screen.dart';
import 'package:bronzedblue/features/home/screen/services/add_user_service.dart';
import 'package:bronzedblue/models/user_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AddUserService addUserService = AddUserService();

  @override
  Widget build(BuildContext context) {
    //  final userList = Provider.of<UserListProvider>(context).userList;
    return Scaffold(
      appBar: AppBar(
        title: const Text("List of all Users"),
        centerTitle: true,
      ),
      body: Center(
          child: FutureBuilder<List<UserFromApi>>(
        future: addUserService.getUsers(context: context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 75,
                    color: Colors.white,
                    child: Center(
                      child: Text(snapshot.data![index].email),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          // By default show a loading spinner.
          return const CircularProgressIndicator();
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddUserScreen(),
            ),
          );
        },
        backgroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
