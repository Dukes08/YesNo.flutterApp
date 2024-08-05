import 'package:dio/dio.dart';
import 'package:yesno_app/domain/entities/message.dart';
import 'package:yesno_app/infrasctructure/models/yes_no_model.dart';

class YesNoAnswer {
  final _dio = Dio();
  Future<Message> getAnswer() async {
    final response = await _dio.get("https://yesno.wtf/api");
    final YesNoModel yesNoModel = YesNoModel.fromJson(response.data);
    return Message(
        text: yesNoModel.answer,
        fromWho: FromWho.future,
        img: yesNoModel.image);
  }
}
