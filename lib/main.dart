import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController myTextEditingController = TextEditingController();
  List<String> line = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: const Center(child: Text("TODO LIST", style: TextStyle(color: Colors.white),)),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10,top: 100,right: 10),
                  child: TextField(
                    controller: myTextEditingController,
                    maxLines: 1,
                    decoration:  const InputDecoration(labelText: "Enter Your Todo Tasks",border: OutlineInputBorder()),
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35,bottom: 35),
                  child: ElevatedButton(onPressed: (){setState(() {
                    line.add(myTextEditingController.text);
                  });}, child:  Text("Submit",style: TextStyle(color: Colors.white),),style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8,right: 8,bottom: 8),
                      child: Container(
                        height: MediaQuery.of(context).size.height*0.5,
                        width: MediaQuery.of(context).size.width*0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0, top: 10, right: 15.0),
                          child: ListView.builder(padding: const EdgeInsets.only(top: 10),itemCount: line.length,itemBuilder: (context, index){
                            return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text('${index+1}: '+line[index]), ElevatedButton(style: ButtonStyle(foregroundColor: MaterialStatePropertyAll(Colors.green)),onPressed: (){setState(() {
                              line.removeAt(index);
                            });},child: Icon(Icons.check),)],);
                          }),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

