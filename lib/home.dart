import 'package:custom_dropdown/multiple_selection_dropdown.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
const HomePage({Key? key}) : super(key: key);

@override
State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _selectedItems = [];

  void _showMultiSelect() async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    final List<String> items = [
      'Dog',
      'Cat',
      'Horse',
      'Snake',
      'Mouse',
      'Rabbit',
      'Cow',
      'Sheep',
    ];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelectDropDown(list: items);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        _selectedItems = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Dropdown',style:TextStyle(fontSize: 20,fontWeight: FontWeight.w500,),),centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // use this button to open the multi-select dialog
            ElevatedButton(
              onPressed: _showMultiSelect,
              child: const Text('Select Your Favorite Animal',style: TextStyle(color: Colors.black,fontSize: 15),textAlign: TextAlign.center,),
            ),
           /* const Divider(
              height: 30,
            ),*/
            const SizedBox(
              height: 20,
            ),
            // display selected items
            Wrap(
              spacing: 8,
              children: _selectedItems.map((e) => Chip(label: Text(e),
               // padding: const EdgeInsets.all(20),

              ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}