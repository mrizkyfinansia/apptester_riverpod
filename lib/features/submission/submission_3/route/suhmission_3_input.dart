import 'package:app_riverpod/core/screen/screen_input.dart';
import 'package:app_riverpod/data/customer/customer.dart';

class Submission3Input extends ScreenInput {
  final Customer customerData;
  
  const Submission3Input({required this.customerData});

  factory Submission3Input.empty() => Submission3Input(
    customerData: Customer.empty(),
  );
}