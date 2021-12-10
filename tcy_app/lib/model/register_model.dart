import 'package:tcy_app/global/Global.dart';
import 'package:tcy_app/utils/rsa/rsa_utils.dart';

Future RegisterModel(String json) async {
  var result = await Global.getInstance().dio.post(
    "/zxw/user/register",
    queryParameters: {
      "json": json,
    },
  );
  return result;
}
