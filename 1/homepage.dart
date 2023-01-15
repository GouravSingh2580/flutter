import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:day1/Details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var res;
  var drinks;
  var api =
      "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita";
  @override
  void initState() {
    super.initState();

    fetchData();
  }

  fetchData() async {
    res = await http.get(Uri.parse(api));
    if (kDebugMode) {
      drinks=jsonDecode(res.body.toString())['drinks'];
      print(drinks.toString());
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Martini Store'),
      ),
      body: Center(
        child: (res != null) ? ListView.builder(
          itemCount: drinks.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(drinks[index]['strDrink']),
              subtitle: Text(drinks[index]['strCategory']),
              leading: CircleAvatar( backgroundImage:NetworkImage (drinks[index]['strDrinkThumb'])),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Details()));
              },
            );
          },
        ) : CircularProgressIndicator(),
      ),
    );
  }
}
