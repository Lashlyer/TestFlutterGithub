import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_list/widgets/LezzenDetail.dart';
import 'package:shopping_list/widgets/LezzenItem.dart';

class TestLeezen extends StatefulWidget {
  const TestLeezen({super.key});

  @override
  State<TestLeezen> createState() => _TestLeezenState();
}

class _TestLeezenState extends State<TestLeezen> {
  late Future<List<TestItem>> _f;

  @override
  void initState() {
    super.initState();
  }

  Future<List<TestItem>> postRequest() async {
    var url11 = Uri.parse('https://leezen.app.13930.com/api/v1/product/list');

    Map data = {
      'offset': 0,
      'limit': 36,
      'sort': 0,
      'category': 0,
      'filters': {'temperatures': []},
      'keyword': '',
    };

    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.post(url11,
        headers: {"Content-Type": "application/json"}, body: body);

    if (response.statusCode >= 400) {
      throw Exception('Failed to fetcg grocery item.');
    }

    if (response.body == 'null') {
      return [];
    }

    final List<TestItem> items = [];
    final Map<String, dynamic> listData = json.decode(response.body);

    for (final item in listData['data']['rows']) {
      items.add(TestItem.fromJson(item));
    }

    return items;
  }

  void detail(BuildContext context, TestItem item) {
    Navigator.of(context).push<LeezenDetail>(
        MaterialPageRoute(builder: (ctx) => LeezenDetail(item: item, id: item.id.toString())));
  }

  @override
  Widget build(BuildContext context) {
    
    double deviceWidth = (MediaQuery.of(context).size.width - 36.0) / 2;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Leezen'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: postRequest(),
        builder: (builder, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          if (snapshot.data!.isEmpty) {
            return const Center(child: Text('No items added yed.'));
          }

          return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: deviceWidth / 313),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return LeezenItem(
                  item: snapshot.data![index],
                  itemWidth: deviceWidth,
                  detail: () {
                    detail(context, snapshot.data![index]);
                  },
                );            
              });
        },
      ),
    );
  }
}
