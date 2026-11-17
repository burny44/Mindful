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
    final reelsLimitSec =
        ref.watch(wellBeingProvider.select((v) => v.instagramUsageLimitSec));
    final shortsLimitSec =
        ref.watch(wellBeingProvider.select((v) => v.youtubeShortsLimitSec));
    final notifier = ref.read(wellBeingProvider.notifier);

    bool isBlocked(PlatformFeatures f) => blockedFeatures.contains(f);
    int count(List<PlatformFeatures> fs) => fs.where(isBlocked).length;
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
          activeCount: count([
            PlatformFeatures.instagramReels,
            PlatformFeatures.instagramExplore
          ]),
          subtitle: context.locale.instagram_features_tile_subtitle,
          children: [
            DefaultListTile(
              position: ItemPosition.top,
              enabled: haveNecessaryPerms,
              color: Theme.of(context).colorScheme.surfaceContainerHigh,
              titleText: context.locale.instagram_features_block_explore,
              switchValue: isBlocked(PlatformFeatures.instagramExplore),
              onPressed: () => toggle(PlatformFeatures.instagramExplore),
            ),

            DefaultListTile(
              position: ItemPosition.mid,
              enabled: haveNecessaryPerms,
              color: Theme.of(context).colorScheme.surfaceContainerHigh,
              titleText: context.locale.instagram_features_block_reels,
              switchValue: isBlocked(PlatformFeatures.instagramReels),
              onPressed: () => toggle(PlatformFeatures.instagramReels),
            ),

            /// Reels only after watching them for a set time each day
            _ContentLimitSection(
              content: context.locale.in_app_blocking_feature_reels,
              heroTag: HeroTags.instagramUsageLimitTileTag,
              enabled: haveNecessaryPerms &&
                  isBlocked(PlatformFeatures.instagramReels),
              limitSec: reelsLimitSec,
              onChanged: notifier.setInstagramUsageLimit,
            ),
          ],
        ),

        /// YouTube
        _PlatformCard(
          icon: _buildIcon(context, "assets/vectors/youtube.svg"),
          enabled: haveNecessaryPerms,
          title: context.locale.youtube_features_tile_title,
          activeCount: count([PlatformFeatures.youtubeShorts]),
          subtitle: context.locale.youtube_features_tile_subtitle,
          children: [
            DefaultListTile(
              position: ItemPosition.top,
              enabled: haveNecessaryPerms,
              color: Theme.of(context).colorScheme.surfaceContainerHigh,
              titleText: context.locale.in_app_blocking_feature_shorts,
              switchValue: isBlocked(PlatformFeatures.youtubeShorts),
              onPressed: () => toggle(PlatformFeatures.youtubeShorts),
            ),

            /// Shorts only after watching them for a set time each day
            _ContentLimitSection(
              content: context.locale.in_app_blocking_feature_shorts,
              heroTag: HeroTags.youtubeShortsLimitTileTag,
              enabled: haveNecessaryPerms &&
                  isBlocked(PlatformFeatures.youtubeShorts),
              limitSec: shortsLimitSec,
              onChanged: notifier.setYoutubeShortsLimit,
            ),
          ],
        ),

        /// Snapchat
        _PlatformCard(
          icon: _buildIcon(context, "assets/vectors/snapchat.svg"),
          enabled: haveNecessaryPerms,
          title: context.locale.snapchat_features_tile_title,
          activeCount: count([
            PlatformFeatures.snapchatSpotlight,
            PlatformFeatures.snapchatDiscover
          ]),
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
          activeCount: count([PlatformFeatures.facebookReels]),
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
          activeCount: count([PlatformFeatures.redditShorts]),
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

/// A separate, collapsible card for one platform: a header with the app's
/// icon, name and number of active blocks. Tapping it shows the switches.
class _PlatformCard extends StatefulWidget {
  const _PlatformCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.children,
    required this.enabled,
    required this.activeCount,
  });

  final Widget icon;
  final String title;
  final String subtitle;
  final List<Widget> children;
  final bool enabled;
  final int activeCount;

  @override
  State<_PlatformCard> createState() => _PlatformCardState();
}

class _PlatformCardState extends State<_PlatformCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return RoundedContainer(
      margin: const EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.zero,
      color: colors.surfaceContainer,
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header, toggles the card open/closed
          RoundedContainer(
            color: Colors.transparent,
            padding: const EdgeInsets.fromLTRB(16, 14, 12, 14),
            onPressed: () => setState(() => _expanded = !_expanded),
            child: Row(
              children: [
                SizedBox(width: 28, height: 28, child: widget.icon),
                12.hBox,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StyledText(
                        widget.title,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: widget.enabled
                            ? null
                            : Theme.of(context).disabledColor,
                      ),
                      StyledText(
                        widget.subtitle,
                        fontSize: 13,
                        color: Theme.of(context).hintColor,
                      ),
                    ],
                  ),
                ),

                /// Number of blocked features, visible while collapsed
                if (widget.activeCount > 0)
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: colors.errorContainer,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          FluentIcons.prohibited_16_regular,
                          size: 14,
                          color: colors.onErrorContainer,
                        ),
                        4.hBox,
                        StyledText(
                          widget.activeCount.toString(),
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: colors.onErrorContainer,
                        ),
                      ],
                    ),
                  ),
                4.hBox,
                AnimatedRotation(
                  turns: _expanded ? 0.5 : 0,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeOutCubic,
                  child: const Icon(FluentIcons.chevron_down_20_regular),
                ),
              ],
            ),
          ),

          /// Switches, only while expanded
          AnimatedSize(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOutCubic,
            alignment: Alignment.topCenter,
            child: _expanded
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: widget.children,
                    ),
                  )
                : const SizedBox(width: double.infinity),
          ),
        ],
      ),
    );
  }
}

/// "Allow {content} daily" switch (bottom of a tile group) and, while it's on,
/// a separate tile with the daily watch time that opens a picker.
class _ContentLimitSection extends StatelessWidget {
  const _ContentLimitSection({
    required this.content,
    required this.heroTag,
    required this.enabled,
    required this.limitSec,
    required this.onChanged,
  });

  /// Display name of the content, e.g. "Reels"
  final String content;
  final Object heroTag;
  final bool enabled;
  final int limitSec;

  /// Called with the new limit in seconds, 0 turns it off
  final ValueChanged<int> onChanged;

  static const _defaultLimitSec = 30 * 60;

  void _editLimit(BuildContext context) async {
    final newLimit = await showContentLimitPicker(
      context: context,
      heroTag: heroTag,
      title: context.locale.content_limit_time_title(content),
      info: context.locale.content_limit_picker_info(content),
      initialTime: limitSec,
    );
    if (newLimit == null || newLimit <= 0 || newLimit == limitSec) return;
    onChanged(newLimit);
  }

  @override
  Widget build(BuildContext context) {
    final isOn = limitSec > 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DefaultListTile(
          position: ItemPosition.bottom,
          enabled: enabled,
          color: Theme.of(context).colorScheme.surfaceContainerHigh,
          titleText: context.locale.content_limit_tile_title(content),
          subtitleText: context.locale.content_limit_tile_subtitle(content),
          switchValue: isOn,
          onPressed: () => onChanged(isOn ? 0 : _defaultLimitSec),
        ),

        /// Separate time section, only shown while the switch is on
        AnimatedSize(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOutCubic,
          alignment: Alignment.topCenter,
          child: isOn
              ? Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: DefaultHero(
                    tag: heroTag,
                    child: DefaultListTile(
                      position: ItemPosition.none,
                      enabled: enabled,
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      leadingIcon: FluentIcons.timer_20_regular,
                      titleText:
                          context.locale.content_limit_time_title(content),
                      subtitleText: context.locale.content_limit_time_subtitle(
                        content,
                        Duration(seconds: limitSec).toTimeShort(context),
                      ),
                      trailing:
                          const Icon(FluentIcons.edit_20_regular, size: 20),
                      onPressed: () => _editLimit(context),
                    ),
                  ),
                )
              : const SizedBox(width: double.infinity),
        ),
      ],
    );
  }
}
