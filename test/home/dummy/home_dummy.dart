// Description:
import 'package:app_riverpod/core/state/base_state.dart';
import 'package:app_riverpod/module/home/state/home_data.dart';

const descriptionStatus = "status";
const descriptionData = "data";
const descriptionUsername = "username";
const descriptionEmail = "email";
const descriptionRole = "role";
const descriptionNotifCount = "notif_count";
const descriptionCustomerId = "customer_id";
const descriptionProspectId = "prospect_id";

// Dummy Data
const statusInitial = StateStatus.initial;
const statusInitialLoading = StateStatus.initialLoading;
const statusInitialSuccess = StateStatus.success;

final homeDataEmpty = HomeData.empty();

const username = "Sugeng";
const usernameTest = "TESTING Username";
const prospectIdTest = "TESTING ProspectId";
const customerIdTest = "TESTING CustomerId";
const usernameSubmission = "TESTING Submission";
const email = "sugeng@gmail.com";
const role = "admin";
const notifCount1 = 1;
const notifCount5 = 5;