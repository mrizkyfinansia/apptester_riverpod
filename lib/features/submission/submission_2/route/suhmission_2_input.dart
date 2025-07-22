import 'package:app_riverpod/core/screen/screen_input.dart';
import 'package:app_riverpod/data/district/district.dart';
import 'package:app_riverpod/data/province/province.dart';

class Submission2Input extends ScreenInput {
  final String customerId;
  final Province province;
  final District district;
  
  const Submission2Input({
    required this.customerId,
    required this.province,
    required this.district,
  });

  factory Submission2Input.empty() => Submission2Input(
    customerId: "",
    province: Province.empty(),
    district: District.empty(),
  );
  
  @override
  Map<String, String> toQueryParams() => {
    'customerId': customerId,
    'province': province.name,
    'district': district.name,
  };
}