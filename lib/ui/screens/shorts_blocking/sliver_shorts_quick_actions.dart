/*
 *
 *  * Copyright (c) 2024 Mindful (https://github.com/akaMrNagar/Mindful)
 *  * Author : Pawan Nagar (https://github.com/akaMrNagar)
 *  *
 *  * This source code is licensed under the GPL-2.0 license license found in the
 *  * LICENSE file in the root directory of this source tree.
 *
 */

import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:mindful/config/hero_tags.dart';
import 'package:mindful/core/extensions/ext_duration.dart';
import 'package:mindful/ui/dialogs/timer_picker_dialog.dart';
import 'package:mindful/ui/transitions/default_hero.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mindful/core/enums/item_position.dart';
import 'package:mindful/core/enums/platform_features.dart';
import 'package:mindful/core/extensions/ext_build_context.dart';
import 'package:mindful/providers/restrictions/wellbeing_provider.dart';
import 'package:mindful/core/extensions/ext_num.dart';
import 'package:mindful/ui/common/rounded_container.dart';
import 'package:mindful/ui/common/styled_text.dart';
import 'package:mindful/ui/common/default_list_tile.dart';

class SliverShortsQuickActions extends ConsumerWidget {
  const SliverShortsQuickActions({
    super.key,
    required this.haveNecessaryPerms,
  });

  final bool haveNecessaryPerms;

  void _toggleFeature(
    BuildContext context,
    WidgetRef ref,
    List<PlatformFeatures> blockedFeatures,
    PlatformFeatures feature,
  ) {
    ref.read(wellBeingProvider.notifier).insertRemoveBlockedFeature(feature);
  }

  /// Turns the daily Instagram usage limit off, or asks for the time to turn it on.
  void _toggleInstagramUsageLimit(
    BuildContext context,
    WidgetRef ref,
    int currentLimitSec,
  ) async {
    final notifier = ref.read(wellBeingProvider.notifier);

    if (currentLimitSec > 0) {
      notifier.setInstagramUsageLimit(0);
      return;
    }

    final limitSec = await showInstagramUsageLimitPicker(
      context: context,
      heroTag: HeroTags.instagramUsageLimitTileTag,
    );

    if (limitSec == null || limitSec <= 0) return;
    notifier.setInstagramUsageLimit(limitSec);
  }

  Widget _buildIcon(BuildContext context, String path) => Opacity(
        opacity: haveNecessaryPerms ? 1 : 0.5,
        child: SvgPicture.asset(
          path,
          colorFilter: ColorFilter.mode(
            Theme.of(context).iconTheme.color ?? Colors.grey,
            BlendMode.srcIn,
          ),
        ),
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final blockedFeatures =
        ref.watch(wellBeingProvider.select((v) => v.blockedFeatures));
    final instagramUsageLimitSec =
        ref.watch(wellBeingProvider.select((v) => v.instagramUsageLimitSec));

    bool isBlocked(PlatformFeatures f) => blockedFeatures.contains(f);
    void toggle(PlatformFeatures f) =>
        _toggleFeature(context, ref, blockedFeatures, f);

    /// Every platform is its own card so it is clear which switch belongs to
    /// which app.
    return SliverList.list(
      children: [
        /// Instagram
        _PlatformCard(
          icon: _buildIcon(context, "assets/vectors/instagram.svg"),
          enabled: haveNecessaryPerms,
          title: context.locale.instagram_features_tile_title,
          subtitle: context.locale.instagram_features_tile_subtitle,
          children: [
            DefaultListTile(
              position: ItemPosition.top,
              enabled: haveNecessaryPerms,
              color: Theme.of(context).colorScheme.surfaceContainerHigh,
              titleText: context.locale.instagram_features_block_reels,
              switchValue: isBlocked(PlatformFeatures.instagramReels),
              onPressed: () => toggle(PlatformFeatures.instagramReels),
            ),

            /// Reels only after daily Instagram usage
            DefaultHero(
              tag: HeroTags.instagramUsageLimitTileTag,
              child: DefaultListTile(
                position: ItemPosition.mid,
                enabled: haveNecessaryPerms &&
                    isBlocked(PlatformFeatures.instagramReels),
                color: Theme.of(context).colorScheme.surfaceContainerHigh,
                leadingIcon: FluentIcons.timer_20_regular,
                titleText: context.locale.instagram_usage_limit_tile_title,
                subtitleText: instagramUsageLimitSec > 0
                    ? context.locale.instagram_usage_limit_tile_subtitle_on(
                        Duration(seconds: instagramUsageLimitSec)
                            .toTimeShort(context),
                      )
                    : context.locale.instagram_usage_limit_tile_subtitle_off,
                switchValue: instagramUsageLimitSec > 0,
                onPressed: () => _toggleInstagramUsageLimit(
                    context, ref, instagramUsageLimitSec),
              ),
            ),

            DefaultListTile(
              position: ItemPosition.bottom,
              enabled: haveNecessaryPerms,
              color: Theme.of(context).colorScheme.surfaceContainerHigh,
              titleText: context.locale.instagram_features_block_explore,
              switchValue: isBlocked(PlatformFeatures.instagramExplore),
              onPressed: () => toggle(PlatformFeatures.instagramExplore),
            ),
          ],
        ),

        /// YouTube
        _PlatformCard(
          icon: _buildIcon(context, "assets/vectors/youtube.svg"),
          enabled: haveNecessaryPerms,
          title: context.locale.youtube_features_tile_title,
          subtitle: context.locale.youtube_features_tile_subtitle,
          children: [
            DefaultListTile(
              position: ItemPosition.none,
              enabled: haveNecessaryPerms,
              color: Theme.of(context).colorScheme.surfaceContainerHigh,
              titleText: context.locale.in_app_blocking_feature_shorts,
              switchValue: isBlocked(PlatformFeatures.youtubeShorts),
              onPressed: () => toggle(PlatformFeatures.youtubeShorts),
            ),
          ],
        ),

        /// Snapchat
        _PlatformCard(
          icon: _buildIcon(context, "assets/vectors/snapchat.svg"),
          enabled: haveNecessaryPerms,
          title: context.locale.snapchat_features_tile_title,
          subtitle: context.locale.snapchat_features_tile_subtitle,
          children: [
            DefaultListTile(
              position: ItemPosition.top,
              enabled: haveNecessaryPerms,
              color: Theme.of(context).colorScheme.surfaceContainerHigh,
              titleText: context.locale.snapchat_features_block_spotlight,
              switchValue: isBlocked(PlatformFeatures.snapchatSpotlight),
              onPressed: () => toggle(PlatformFeatures.snapchatSpotlight),
            ),
            DefaultListTile(
              position: ItemPosition.bottom,
              enabled: haveNecessaryPerms,
              color: Theme.of(context).colorScheme.surfaceContainerHigh,
              titleText: context.locale.snapchat_features_block_discover,
              switchValue: isBlocked(PlatformFeatures.snapchatDiscover),
              onPressed: () => toggle(PlatformFeatures.snapchatDiscover),
            ),
          ],
        ),

        /// Facebook
        _PlatformCard(
          icon: _buildIcon(context, "assets/vectors/facebook.svg"),
          enabled: haveNecessaryPerms,
          title: context.locale.facebook_features_tile_title,
          subtitle: context.locale.facebook_features_tile_subtitle,
          children: [
            DefaultListTile(
              position: ItemPosition.none,
              enabled: haveNecessaryPerms,
              color: Theme.of(context).colorScheme.surfaceContainerHigh,
              titleText: context.locale.in_app_blocking_feature_reels,
              switchValue: isBlocked(PlatformFeatures.facebookReels),
              onPressed: () => toggle(PlatformFeatures.facebookReels),
            ),
          ],
        ),

        /// Reddit
        _PlatformCard(
          icon: _buildIcon(context, "assets/vectors/reddit.svg"),
          enabled: haveNecessaryPerms,
          title: context.locale.reddit_features_tile_title,
          subtitle: context.locale.reddit_features_tile_subtitle,
          children: [
            DefaultListTile(
              position: ItemPosition.none,
              enabled: haveNecessaryPerms,
              color: Theme.of(context).colorScheme.surfaceContainerHigh,
              titleText: context.locale.in_app_blocking_feature_shorts,
              switchValue: isBlocked(PlatformFeatures.redditShorts),
              onPressed: () => toggle(PlatformFeatures.redditShorts),
            ),
          ],
        ),
      ],
    );
  }
}

/// A separate card for one platform: a header with the app's icon and name,
/// followed by the switches for its blockable features.
class _PlatformCard extends StatelessWidget {
  const _PlatformCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.children,
    required this.enabled,
  });

  final Widget icon;
  final String title;
  final String subtitle;
  final List<Widget> children;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 12),
      color: Theme.of(context).colorScheme.surfaceContainer,
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              children: [
                SizedBox(width: 28, height: 28, child: icon),
                12.hBox,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StyledText(
                        title,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: enabled ? null : Theme.of(context).disabledColor,
                      ),
                      StyledText(
                        subtitle,
                        fontSize: 13,
                        color: Theme.of(context).hintColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          12.vBox,
          ...children,
        ],
      ),
    );
  }
}
