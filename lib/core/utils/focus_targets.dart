/*
 *
 *  * Copyright (c) 2024 Mindful (https://github.com/akaMrNagar/Mindful)
 *  * Author : Pawan Nagar (https://github.com/akaMrNagar)
 *  *
 *  * This source code is licensed under the GPL-2.0 license license found in the
 *  * LICENSE file in the root directory of this source tree.
 *
 */

import 'package:mindful/models/app_group.dart';

/// Helpers for the "targets" a focus session or earn-unlock rule can point to.
///
/// A target is either:
/// * an installed app's package name,
/// * a virtual app such as Instagram Reels, which is blocked inside the real
///   app by the accessibility service instead of blocking the whole app,
/// * a reference to an [AppGroup], which expands to the group's targets.
///
/// Groups are resolved on the Flutter side, so the native service only ever
/// sees package names and virtual app ids.
class FocusTargets {
  FocusTargets._();

  /// Must match AppConstants.VIRTUAL_INSTAGRAM_REELS on the native side.
  static const String instagramReels = "mindful.virtual.instagram_reels";

  /// Must match AppConstants.VIRTUAL_YOUTUBE_SHORTS on the native side.
  static const String youtubeShorts = "mindful.virtual.youtube_shorts";

  static const List<String> virtualApps = [instagramReels, youtubeShorts];

  static const String _groupPrefix = "mindful.group.";

  static bool isVirtualApp(String target) => virtualApps.contains(target);

  static bool isGroup(String target) => target.startsWith(_groupPrefix);

  /// True for real, installed-app package names.
  static bool isApp(String target) => !isVirtualApp(target) && !isGroup(target);

  static String groupTarget(int groupId) => "$_groupPrefix$groupId";

  static int? groupIdOf(String target) => isGroup(target)
      ? int.tryParse(target.substring(_groupPrefix.length))
      : null;

  /// Svg icon used for a virtual app.
  static String virtualAppIcon(String target) => switch (target) {
        instagramReels => "assets/vectors/instagram.svg",
        _ => "assets/vectors/youtube.svg",
      };

  /// Replaces group references with the group's members and removes
  /// duplicates. References to deleted groups are dropped.
  static List<String> expand(List<String> targets, List<AppGroup> groups) {
    final byId = {for (final g in groups) g.id: g};
    final result = <String>{};

    for (final target in targets) {
      final groupId = groupIdOf(target);
      if (groupId == null) {
        result.add(target);
      } else {
        result.addAll(byId[groupId]?.apps ?? const []);
      }
    }

    return result.toList();
  }
}
