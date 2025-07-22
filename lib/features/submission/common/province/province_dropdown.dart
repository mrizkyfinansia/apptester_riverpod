import 'package:app_riverpod/core/state/base_state.dart';
import 'package:app_riverpod/data/province/province.dart';
import 'package:app_riverpod/features/submission/common/province/notifier/province_notifier.dart';
import 'package:app_riverpod/features/submission/common/province/state/province_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProvinceDropdown extends ConsumerStatefulWidget {
  const ProvinceDropdown({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProvinceDropdownState();
}

class _ProvinceDropdownState extends ConsumerState<ProvinceDropdown> {
  late final provinceNotifier = ref.read(provinceNotifierProvider.notifier);

  @override
  void initState() {
    Future.microtask(() => provinceNotifier.onProvinceLoaded());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("BUILD PROVINCE DROPDOWN");
    final provinceState = ref.watch(provinceNotifierProvider);
    switch (provinceState.stateStatus) {
      case StateStatus.loading:
        return const Center(child: CircularProgressIndicator());
      case StateStatus.success:
        return renderProvinceDropdown(provinceState, provinceNotifier);
      default:
        return const Center(child: CircularProgressIndicator());
    }
  }

  DropdownButton<Province> renderProvinceDropdown(ProvinceState provinceState, ProvinceNotifier provinceNotifier) {
    return DropdownButton<Province>(
      value: provinceState.data.selectedProvince,
      hint: const Text("Pilih Provinsi"),
      items: provinceState.data.province.map((item) {
        return DropdownMenuItem<Province>(
          value: item,
          child: Text(item.name),
        );
      }).toList(),
      onChanged: (Province? newValue) {
        if (newValue != null) {
          provinceNotifier.onProvinceSelected(newValue);
        }
      },
    );
  }
}
