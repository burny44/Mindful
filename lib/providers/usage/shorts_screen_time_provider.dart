import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mindful/core/services/method_channel_service.dart';
import 'package:mindful/core/utils/date_time_utils.dart';
import 'package:mindful/providers/usage/short_form_usage_provider.dart';

/// Short content time (SECONDS) used today from the shared daily allowance:
/// all Reels and Shorts watched today plus other blocked short content.
final shortsScreenTimeProvider = FutureProvider.autoDispose<int>((ref) async {
  /// Refresh together with today's Reels/Shorts usage
  await ref.watch(shortFormUsageProvider(dateToday).future);
  return await MethodChannelService.instance.getShortsScreenTimeSec();
});
