import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dio = Dio();
  List pays = [];

  getContries() async {
    final response = await dio.get("https://restcountries.com/v3.1/all");
    setState(() {
      pays = response.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        elevation: 12,
        title: Text("Meridian 🌐", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {
              getContries();
            },
            icon: Icon(Icons.refresh),
            color: Colors.white,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: pays.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text(pays[index]["flag"], style: TextStyle(fontSize: 25),),
            title: Text(pays[index]["name"]["common"]),
            subtitle: Text(pays[index]["capital"][0]),
            onTap: (){},
          );

        },
      ),
    );
  }
}
