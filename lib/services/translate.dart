import 'networking.dart';

const googleTranslateURL = 'https://translate.google.com/translate_a/single?client=at&dt=t&dt=ld&dt=qca&dt=rm&dt=bd&dj=1&ie=UTF-8&oe=UTF-8&inputm=2&otf=2&iid=1dd3b944-fa62-4b55-b330-74909a99969e';

class TranslationModel {

  Future<dynamic> getTranslation(String oriLang, String transLang, String word ) async{
    var url = '$googleTranslateURL&sl=$oriLang&tl=$transLang&q=$word';
    NetworkHelper network = new NetworkHelper(url);
    var translationData = await network.getData();

    return translationData;
  }
}