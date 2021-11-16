import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:translation_app/services/translate.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TranslationModel translate = new TranslationModel();
  String transText = '';
  String oriText = '';

  void updateUI(dynamic translationData){
    setState(() {
      if(translationData == null){
      transText = 'Failed';
      print(transText);
      return;
      }

      transText = translationData['sentences'][0]['trans'];
      print(transText);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Text(
              'Language Translator',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
            )
            ),

            SizedBox(height: 40,),

            TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
              onChanged: (value){
                oriText = value;
              },
            ),

            TextButton(
              onPressed: () async{
                var translationData = await translate.getTranslation('ms', 'en', oriText);
                updateUI(translationData);
              },
              child: Container(
                child: Text('Submit'),
              ),
            ),

          ],
        ),
      ),
      ),
    );
  }
}
