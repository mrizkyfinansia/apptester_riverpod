import 'package:app_riverpod/core/state/base_state.dart';
import 'package:app_riverpod/data/district/district.dart';
import 'package:app_riverpod/features/submission/common/district/notifier/district_notifier.dart';
import 'package:app_riverpod/features/submission/common/district/state/district_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DistrictDropdown extends ConsumerWidget {
  const DistrictDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("BUILD DISTRICT DROPDOWN");
    final districtState = ref.watch(districtNotifierProvider);
    final districtNotifier = ref.read(districtNotifierProvider.notifier);

    switch (districtState.stateStatus) {
      case StateStatus.loading:
        return const Center(child: CircularProgressIndicator());
      case StateStatus.success:
        return renderDropdown(districtState, districtNotifier);
      case StateStatus.initial:
        return renderDropdown(districtState, districtNotifier);
      default:
        return const Center(child: CircularProgressIndicator());
    }
  }

  DropdownButton<District> renderDropdown(DistrictState districtState, DistrictNotifier districtNotifier) {
    return DropdownButton<District>(
      value: districtState.data.selectedDistrict,
      hint: const Text("Pilih Kabupaten"),
      items: districtState.data.district.map((item) {
        return DropdownMenuItem<District>(
          value: item,
          child: Text(item.name),
        );
      }).toList(),
      onChanged: (District? newValue) {
        if (newValue != null) {
          districtNotifier.onDistrictSelected(newValue);
        }
      },
    );
  }
}
