
import 'package:base_module/base_module.dart';

void main() {
  Logger.init(true);
  Logger.d('Log message with 2 methods');

  Logger.e('Info message');

  Logger.d('Just a warning!');

  Logger.e('Error! Something bad happened');

  Logger.e({'key': 5, 'value': 'something'});

}
