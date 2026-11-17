/*
 *
 *  * Copyright (c) 2024 Mindful (https://github.com/akaMrNagar/Mindful)
 *  * Author : Pawan Nagar (https://github.com/akaMrNagar/Mindful)
 *  *
 *  * This source code is licensed under the GPL-2.0 license license found in the
 *  * LICENSE file in the root directory of this source tree.
 *
 */

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mindful/config/navigation/app_routes.dart';
import 'package:mindful/core/enums/item_position.dart';
import 'package:mindful/core/enums/platform_features.dart';
import 'package:mindful/core/extensions/ext_build_context.dart';
import 'package:mindful/core/extensions/ext_duration.dart';
import 'package:mindful/core/extensions/ext_num.dart';
import 'package:mindful/core/utils/date_time_utils.dart';
import 'package:mindful/core/utils/focus_targets.dart';
import 'package:mindful/core/utils/widget_utils.dart';
import 'package:mindful/providers/restrictions/wellbeing_provider.dart';
import 'package:mindful/providers/usage/short_form_usage_provider.dart';
import 'package:mindful/ui/common/content_section_header.dart';
import 'package:mindful/ui/common/rounded_container.dart';
import 'package:mindful/ui/common/styled_text.dart';
import 'package:sliver_tools/sliver_tools.dart';

/// Shows the apps which currently have in-app blocking (reels, shorts, etc.) active.
/// Hidden when nothing is blocked.
class SliverInAppBlocking extends ConsumerWidget {
  const SliverInAppBlocking({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final blocked =
        ref.watch(wellBeingProvider.select((v) => v.blockedFeatures));
    final reelsLimitSec =
        ref.watch(wellBeingProvider.select((v) => v.instagramUsageLimitSec));
    final shortsLimitSec =
        ref.watch(wellBeingProvider.select((v) => v.youtubeShortsLimitSec));

    /// Reels / Shorts watch time today (seconds)
    final watched = ref.watch(shortFormUsageProvider(dateToday).select(
            (v) => v.value?.map((k, u) => MapEntry(k, u.screenTime)))) ??
        const <String, int>{};

    final locale = context.locale;
    bool has(PlatformFeatures f) => blocked.contains(f);

    final platforms = [
      _BlockedPlatform(
        name: locale.instagram_features_tile_title,
        iconPath: "assets/vectors/instagram.svg",
        features: [
          if (has(PlatformFeatures.instagramReels))
            locale.in_app_blocking_feature_reels,
          if (has(PlatformFeatures.instagramExplore))
            locale.in_app_blocking_feature_explore,
        ],
        watchedSec: watched[FocusTargets.instagramReels] ?? 0,
        limitSec: has(PlatformFeatures.instagramReels) ? reelsLimitSec : 0,
      ),
      _BlockedPlatform(
        name: locale.youtube_features_tile_title,
        iconPath: "assets/vectors/youtube.svg",
        features: [
          if (has(PlatformFeatures.youtubeShorts))
            locale.in_app_blocking_feature_shorts,
        ],
        watchedSec: watched[FocusTargets.youtubeShorts] ?? 0,
        limitSec: has(PlatformFeatures.youtubeShorts) ? shortsLimitSec : 0,
      ),
      _BlockedPlatform(
        name: locale.snapchat_features_tile_title,
        iconPath: "assets/vectors/snapchat.svg",
        features: [
          if (has(PlatformFeatures.snapchatSpotlight))
            locale.in_app_blocking_feature_spotlight,
          if (has(PlatformFeatures.snapchatDiscover))
            locale.in_app_blocking_feature_discover,
        ],
      ),
      _BlockedPlatform(
        name: locale.facebook_features_tile_title,
        iconPath: "assets/vectors/facebook.svg",
        features: [
          if (has(PlatformFeatures.facebookReels))
            locale.in_app_blocking_feature_reels,
        ],
      ),
      _BlockedPlatform(
        name: locale.reddit_features_tile_title,
        iconPath: "assets/vectors/reddit.svg",
        features: [
          if (has(PlatformFeatures.redditShorts))
            locale.in_app_blocking_feature_shorts,
        ],
      ),
    ].where((p) => p.features.isNotEmpty).toList();

    if (platforms.isEmpty) return const SliverToBoxAdapter();

    return MultiSliver(
      children: [
        ContentSectionHeader(title: locale.shorts_blocking_tab_title),
        SliverList.builder(
          itemCount: platforms.length,
          itemBuilder: (context, index) => _InAppBlockingCard(
            platform: platforms[index],
            position: getItemPositionInList(index, platforms.length),
          ),
        ),
      ],
    );
  }
}

/// One calm row per platform:
///
/// ```
/// [icon]  Instagram                 ▶ 12m / 30m  ›
///         Reels · Explore
///         ▬▬▬▬▬▬░░░░░░░░   (only with a daily limit)
/// ```
class _InAppBlockingCard extends StatelessWidget {
  const _InAppBlockingCard({
    required this.platform,
    required this.position,
  });

  final _BlockedPlatform platform;
  final ItemPosition position;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final hint = Theme.of(context).hintColor;
    final hasLimit = platform.limitSec > 0;
    final isLocked = hasLimit && platform.watchedSec >= platform.limitSec;

    /// Reels/Shorts watch time, with the limit if there is one
    String? watchText;
    if (hasLimit) {
      watchText = isLocked
          ? context.locale.in_app_blocking_locked
          : "${Duration(seconds: platform.watchedSec).toTimeShort(context)} / "
              "${Duration(seconds: platform.limitSec).toTimeShort(context)}";
    } else if (platform.watchedSec > 0) {
      watchText = Duration(seconds: platform.watchedSec).toTimeShort(context);
    }

    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: ClipRRect(
        borderRadius: getBorderRadiusFromPosition(position),
        child: RoundedContainer(
          borderRadius: BorderRadius.circular(0),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          color: scheme.surfaceContainer,
          onPressed: () =>
              Navigator.of(context).pushNamed(AppRoutes.shortsBlockingPath),
          child: Row(
            children: [
              SvgPicture.asset(
                platform.iconPath,
                width: 22,
                height: 22,
                colorFilter: ColorFilter.mode(
                  scheme.onSurfaceVariant,
                  BlendMode.srcIn,
                ),
              ),
              14.hBox,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StyledText(
                      platform.name,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    2.vBox,
                    StyledText(
                      platform.features.join("  ·  "),
                      fontSize: 13,
                      color: hint,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    /// Thin progress towards the daily limit
                    if (hasLimit)
                      Padding(
                        padding: const EdgeInsets.only(top: 8, right: 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: (platform.watchedSec / platform.limitSec)
                                .clamp(0.0, 1.0),
                            minHeight: 3,
                            backgroundColor: scheme.surfaceContainerHighest,
                            color: isLocked ? scheme.error : scheme.primary,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              if (watchText != null) ...[
                12.hBox,
                Icon(
                  isLocked
                      ? FluentIcons.lock_closed_16_regular
                      : FluentIcons.play_circle_16_regular,
                  size: 14,
                  color: isLocked ? scheme.error : hint,
                ),
                4.hBox,
                StyledText(
                  watchText,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: isLocked ? scheme.error : null,
                ),
              ],
              8.hBox,
              Icon(FluentIcons.chevron_right_20_regular, size: 18, color: hint),
            ],
          ),
        ),
      ),
    );
  }
}

class _BlockedPlatform {
  const _BlockedPlatform({
    required this.name,
    required this.iconPath,
    required this.features,
    this.watchedSec = 0,
    this.limitSec = 0,
  });

  final String name;
  final String iconPath;

  /// Names of the blocked features
  final List<String> features;

  /// Reels / Shorts watched today in seconds (0 for other platforms)
  final int watchedSec;

  /// Daily Reels / Shorts limit in seconds, 0 if none
  final int limitSec;
}
