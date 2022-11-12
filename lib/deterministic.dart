import 'package:flutter/material.dart';
import 'package:queue/home_screen.dart';
import 'package:queue/result.dart';

import 'Helper.dart';

class Deterministic extends StatefulWidget {
  @override
  State<Deterministic> createState() => _DeterministicState();
}

class _DeterministicState extends State<Deterministic> {
  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController lambaController = TextEditingController();

  TextEditingController muController = TextEditingController();

  TextEditingController kController = TextEditingController();

  TextEditingController textFieldControllerD = TextEditingController();

  String? lamba, mu, k, m;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onTap: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
                    (route) => false);
          },
        ),
        title: Text(
          'deterministic queueing system',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: muController,
                  validator: (data) {
                    if (data!.isEmpty) return 'field required';
                  },
                  onSaved: (data) {
                    muController.text = data!;
                    muController.clear();
                    print(muController);
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                    hintText: 'Enter the service time ',
                    labelText: 'Enter the mu',
                    suffixIcon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('µ'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: lambaController,
                  validator: (data) {
                    if (data!.isEmpty) return 'field required';
                  },
                  onSaved: (data) {
                    lambaController.text = data!;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                    hintText: 'Enter the arrival time ',
                    labelText: 'Enter the lamba',
                    suffixIcon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('λ'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: kController,
                  validator: (data) {
                    if (data!.isEmpty) return 'field required';
                  },
                  onSaved: (data) {
                    kController.text = data!;
                  },
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                    hintText: 'Enter K ',
                    labelText: 'Enter K',
                    suffixIcon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('K'),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 50),
                CustomTextButton(
                  width: MediaQuery.of(context).size.width,
                  buttonName: 'Calculate',
                  onPress: () {
                    if (formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                      mu = muController.text;
                      lamba = lambaController.text;
                      k = kController.text;


         if(int.parse(mu!) > int.parse(lamba!)){
           Navigator.pushAndRemoveUntil<void>(
             context,
             MaterialPageRoute<void>(
               builder: (BuildContext context) =>
                   Result(k: k, lamba: lamba, mu: mu  ),
             ),
                 (Route<dynamic> route) => false,
           );

         }else{
           _displayTextInputDialog(context);

         }

                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('initial number of customers (M)'),
            content: TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {

          setState(() {
               m = value;

          });
              },
              controller: textFieldControllerD,
              decoration: InputDecoration(hintText: "initial number of customers"),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text('CANCEL'),
                onPressed: () {

            setState(() {
               Navigator.pop(context);
            });

                },
              ),
              FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                child: Text('Enter'),
                onPressed: () {

             setState(() {

               Navigator.pushAndRemoveUntil<void>(
                 context,
                 MaterialPageRoute<void>(
                   builder: (BuildContext context) =>
                       Result(k: k, lamba: lamba, mu: mu  , m: int.parse(m!)),
                 ),
                     (Route<dynamic> route) => false,
               );

             });
                },
              ),
            ],
          );
        });
  }
}
