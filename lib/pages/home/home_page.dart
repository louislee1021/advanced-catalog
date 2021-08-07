import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/home/partials/catalog_header.dart';
import 'package:flutter_catalog/pages/home/partials/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_catalog/core/data.dart';
import 'package:flutter_catalog/core/request.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/shopping.dart';
import 'package:flutter_catalog/models/item.dart';
import 'package:flutter_catalog/routes.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Codepur";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    // final catalogJson =
    //     await rootBundle.loadString("assets/files/catalog.json");
    (await Request.get(CATALOG_URL)).decode(onDecoded: (productsData) {
      DataModel.instance.items = List.from(productsData['products'])
          .map<Item>((item) => Item.fromMap(item))
          .toList();
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final shopping = (VxState.store as MyStore).shopping;
    return Scaffold(
        backgroundColor: context.canvasColor,
        floatingActionButton: VxBuilder(
          mutations: {AddMutation, RemoveMutation},
          builder: (ctx, _) => FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, Routes.cartRoute),
            backgroundColor: context.theme.buttonColor,
            child: Icon(
              CupertinoIcons.cart,
              color: Colors.white,
            ),
          ).badge(
              color: Vx.gray200,
              size: 22,
              count: shopping.items.length,
              textStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              )),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (DataModel.instance.items != null &&
                    DataModel.instance.items.isNotEmpty)
                  CatalogList().py16().expand()
                else
                  CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ));
  }
}
