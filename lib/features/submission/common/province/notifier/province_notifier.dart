import 'package:app_riverpod/data/province/province.dart';
import 'package:app_riverpod/data/province/province_mock.dart';
import 'package:app_riverpod/features/submission/common/district/notifier/district_notifier.dart';
import 'package:app_riverpod/features/submission/common/province/state/province_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'province_notifier.g.dart';

@riverpod
class ProvinceNotifier extends _$ProvinceNotifier {

  @override
  ProvinceState build() {
    return ProvinceState.initial();
  }

  Future<void> onProvinceLoaded() async {
    state = state.loading();
    await Future.delayed(const Duration(seconds: 1));
    state = state.success(data: state.data.copyWith(province: provinceMock));
  }

  void onProvinceSelected(Province selectedProvince) {
    state = state.update(state.data.copyWith(selectedProvince: selectedProvince));
    
    final districtNotifier = ref.read(districtNotifierProvider.notifier);
    districtNotifier.onDistrictLoaded(selectedProvince);
  }
}