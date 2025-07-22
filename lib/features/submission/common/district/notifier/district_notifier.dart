import 'package:app_riverpod/data/district/district.dart';
import 'package:app_riverpod/data/district/district_mock.dart';
import 'package:app_riverpod/data/province/province.dart';
import 'package:app_riverpod/features/submission/common/district/state/district_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'district_notifier.g.dart';

@riverpod
class DistrictNotifier extends _$DistrictNotifier {
  @override
  DistrictState build() {
    return DistrictState.initial();
  }

  Future<void> onDistrictLoaded(Province province) async {
    if (state.data.selectedDistrict?.provinceId == province.id) return;

    state = DistrictState.initial();
    state = state.loading();
    await Future.delayed(const Duration(seconds: 1));
    state = state.success(data: state.data.copyWith(district: districtMock.where((i) => i.provinceId == province.id).toList()));
  }

  void onDistrictSelected(District selectedDistrict) {
    state = state.update(state.data.copyWith(selectedDistrict: selectedDistrict));
  }
}