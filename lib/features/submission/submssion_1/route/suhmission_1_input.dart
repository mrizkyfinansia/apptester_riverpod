import 'package:app_riverpod/core/screen/screen_input.dart';

class Submission1Input extends ScreenInput {
  final String customerId;
  
  const Submission1Input({required this.customerId});
  
  @override
  Map<String, String> toQueryParams() => {
    'customerId': customerId,
  };
}