import 'package:app_riverpod/core/state/base_state.dart';
import 'package:app_riverpod/module/home/event/home_event.dart';
import 'package:app_riverpod/module/home/notifier/home_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    Future.microtask(
        () => ref.read(homeNotifierProvider.notifier).onEvent(OnInitial()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeNotifierProvider);
    final notifier = ref.read(homeNotifierProvider.notifier);
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
                    notifier.onEvent(OnRefresh());
                  },
                  child: const Text('Refresh'),
                ),
                ElevatedButton(
                  onPressed: () {
                    notifier.onEvent(OnUpdateData(username: "Parno"));
                  },
                  child: const Text('Update Data'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    notifier.onEvent(OnTapNavigate(
                      context: context,
                      prospectId: "NWG-1212121212",
                    ));
                  },
                  child: const Text('Push to Detail Transaction'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    notifier.onEvent(OnTapNavigateSubmission(
                      context: context,
                      customerId: "NWG-sugeng123",
                    ));
                  },
                  child: const Text('Push to Submission'),
                ),
              ],
            ),
            Visibility(
              visible: state.stateStatus == StateStatus.initialLoading,
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
