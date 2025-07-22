import 'package:app_riverpod/core/state/base_state.dart';
import 'package:app_riverpod/module/home/notifier/home_notifier.dart';
import 'package:app_riverpod/module/submission/submssion_1/route/suhmission_1_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({
    super.key,
    required this.navigateToSubmission1,
  });

  final void Function(Submission1Input) navigateToSubmission1;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  @override
  void initState() {
    Future.microtask(() => ref.read(homeNotifierProvider.notifier).onInitial());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeNotifierProvider);
    final event = ref.read(homeNotifierProvider.notifier);
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  state.data.user.username,
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  "Notification: ${state.data.notifCount}",
                  style: const TextStyle(fontSize: 20),
                ),
                ElevatedButton(
                  onPressed: () {
                    event.onRefresh();
                  },
                  child: const Text('Refresh'),
                ),
                ElevatedButton(
                  onPressed: () {
                    event.onUpdateData("Parno");
                  },
                  child: const Text('Update Data'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    widget.navigateToSubmission1(const Submission1Input(customerId: "sugeng123"));
                  },
                  child: const Text('Push to Submission'),
                ),
              ],
            ),
            Visibility(
              visible: state.stateStatus == StateStatus.loading,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )
          ],
        ),
      ),
    );
  }
}