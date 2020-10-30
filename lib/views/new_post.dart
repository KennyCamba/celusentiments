import 'package:celusentiments/models/result.dart';
import 'package:celusentiments/services/store_service.dart';
import 'package:celusentiments/services/text_sentiment_service.dart';
import 'package:celusentiments/shared/custom_text_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewPost extends StatefulWidget {
  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  TextEditingController postContoller = TextEditingController();

  _onPost() async {
    showDialog(
        context: context, child: Center(child: CircularProgressIndicator()));
    double score = await TextSentimentService.instance.post(postContoller.text);
    String value = "";
    if (score < 0.35)
      value = "negativo";
    else if (score > 0.65)
      value = "positivo";
    else
      value = "neutral";
    final result =
        Result(score: score, value: value, message: postContoller.text);
    await StoreService.instance.post(result);
    Navigator.pop(context);
    showDialog(
        context: context,
        child: AlertDialog(
          title: Text("Se ha publicado con exito"),
          content: Text("Hemos detectado un sentimiento $value en su post"),
          actions: [
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Text("Aceptar y salir"))
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nuevo post"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CustomTextArea(postContoller: postContoller),
            SizedBox(
              height: 20,
            ),
            ButtonPost(
              onPost: _onPost,
            )
          ],
        ),
      ),
    );
  }
}

class ButtonPost extends StatelessWidget {
  final Function onPost;

  const ButtonPost({Key key, this.onPost}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: 50,
        child: RaisedButton(
          color: Colors.cyan,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          onPressed: onPost,
          child: Text(
            "PUBLICAR",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ));
  }
}
