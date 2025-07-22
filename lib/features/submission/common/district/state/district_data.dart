import 'package:app_riverpod/data/district/district.dart';
import 'package:equatable/equatable.dart';

class DistrictData extends Equatable {
  const DistrictData({
    required this.district,
    required this.selectedDistrict,
  }); 

  final List<District> district;
  final District? selectedDistrict;

  factory DistrictData.empty() => const DistrictData(
    district: [],
    selectedDistrict: null,
  );

  DistrictData copyWith({
    List<District>? district,
    District? selectedDistrict,
  }) => DistrictData(
    district: district ?? this.district,
    selectedDistrict: selectedDistrict ?? this.selectedDistrict,
  );

  @override
  List<Object?> get props => [district, selectedDistrict];
}