import 'package:app_riverpod/data/province/province.dart';
import 'package:equatable/equatable.dart';

class ProvinceData extends Equatable {
  const ProvinceData({
    required this.province,
    required this.selectedProvince,
  }); 

  final List<Province> province;
  final Province? selectedProvince;

  factory ProvinceData.empty() => const ProvinceData(
    province: [],
    selectedProvince: null,
  );

  ProvinceData copyWith({
    List<Province>? province,
    Province? selectedProvince,
  }) => ProvinceData(
    province: province ?? this.province,
    selectedProvince: selectedProvince ?? this.selectedProvince,
  );

  @override
  List<Object?> get props => [province, selectedProvince];
}