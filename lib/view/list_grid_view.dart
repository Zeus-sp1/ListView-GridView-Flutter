import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ListViewGrid extends StatefulWidget {
  const ListViewGrid({super.key});

  @override
  State<ListViewGrid> createState() => _ListViewGridState();
}

class _ListViewGridState extends State<ListViewGrid> {
  bool isGrid = true;

  List<String> items = [
    'Bars',
    'Restaurant',
    'Parks',
    'Hotel',
    'Spa',
    'Club',
    'View Centers',
    'Relaxation Centers',
    'Sharp Food Joints',
    'Palm Wine Joints',
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('ListView || GridView'),
          backgroundColor: Color(0xFF00E676),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: buildList(),
        ),
      );
  //set bool to GridView || ListView
  Widget buildList() => isGrid
      ? GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 8, mainAxisSpacing: 8),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return GridTile(
                child: InkWell(
                  child: Ink.image(
                    image: NetworkImage(
                        'https://media.istockphoto.com/id/1445022757/photo/modern-kitchen-interior-with-bar-island-and-eating-area-kitchenware-and-window.jpg?s=612x612&w=0&k=20&c=SvkA1RY62cDNOnZngOx1XCBkuQnnNAxLdqHzjYH93I8='),
                    fit: BoxFit.cover,
                  ),
                  onTap: () => selectItem(item),
                ),
                footer: Container(
                  padding: const EdgeInsets.all(12),
                  alignment: Alignment.center,
                  child: Text(
                    item,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent,
                    ),
                  ),
                ));
          },
        )
      : ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return ListTile(
              leading: CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(
                      'https://media.istockphoto.com/id/1445022757/photo/modern-kitchen-interior-with-bar-island-and-eating-area-kitchenware-and-window.jpg?s=612x612&w=0&k=20&c=SvkA1RY62cDNOnZngOx1XCBkuQnnNAxLdqHzjYH93I8=')),
              title: Text(item),
              subtitle: Text('Subtitle $index'),
              onTap: () => selectItem(item),
            );
          });

  //creating a function for selectedItem
  void selectItem(String item) {
    final snackBar = SnackBar(
        content: Text(
      'selected $item...',
      style: TextStyle(fontSize: 24),
    ));

    ScaffoldMessenger.of(context)
      ..removeCurrentMaterialBanner()
      ..showSnackBar(snackBar);
  }
}
