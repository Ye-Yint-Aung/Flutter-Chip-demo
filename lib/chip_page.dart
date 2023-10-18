import 'package:flutter/material.dart';

class ChipPage extends StatefulWidget {
  const ChipPage({super.key});

  @override
  State<ChipPage> createState() => _ChipPageState();
}

class _ChipPageState extends State<ChipPage> {
  final TextEditingController _textEditingController = TextEditingController();

  List<String> _values = [];
  List<String> selected = [];

  List<String> apiData = ["Name", "Email", "Password"];

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InputChips by @ Adnan'),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _textEditingController,
                  // onFieldSubmitted: (value) {
                  //   _values.add(_textEditingController.text);
                  //   _textEditingController.clear();

                  //   setState(() {
                  //     _values = _values;
                  //   });
                  // },
                  decoration: InputDecoration(
                    hintText: "Type",
                    border: const OutlineInputBorder(),
                    contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    prefixIcon: selected.length < 1
                        ? null
                        : Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Wrap(
                              spacing: 5,
                              runSpacing: 5,
                              children: selected.map(
                                (s) {
                                  return InkWell(
                                    onTap: () => print(s),
                                    child: Chip(
                                      avatar: const FlutterLogo(),
                                      elevation: 0,
                                      shadowColor: Colors.teal,
                                      label: Text(s, style: TextStyle(color: Colors.blue[900])),
                                      onDeleted: () {
                                        setState(
                                          () {
                                            selected.remove(s);
                                          },
                                        );
                                      },
                                    ),
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 400,
                  child: ListView.builder(
                    itemCount: apiData.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selected.add(apiData[index]);
                          });
                        },
                        child: Card(
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(apiData[index]),
                            ),
                          ]),
                        ),
                      );
                    },
                  ),
                )
              ],
            )),
      ),
    );
  }

  // Widget buildChips() {
  //   List<Widget> chips = [];

  //   for (int i = 0; i < _values.length; i++) {
  //     InputChip actionChip = InputChip(
  //       label: Text(_values[i]),
  //       avatar: const FlutterLogo(),
  //       elevation: 0,
  //       pressElevation: 0,
  //       shadowColor: Colors.teal,
  //       onPressed: () {
  //         setState(() {
  //           if (!selected.contains(_values[i])) selected.add(_values[i]);
  //         });
  //       },
  //       onDeleted: () {
  //         _values.removeAt(i);
  //         setState(() {
  //           _values = _values;
  //         });
  //       },
  //     );

  //     chips.add(actionChip);
  //   }

  //   return ListView(
  //     scrollDirection: Axis.horizontal,
  //     children: chips,
  //   );
  // }
}
