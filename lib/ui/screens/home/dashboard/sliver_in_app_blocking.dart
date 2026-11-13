import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mindful/config/navigation/app_routes.dart';
import 'package:mindful/core/enums/item_position.dart';
import 'package:mindful/core/enums/platform_features.dart';
import 'package:mindful/core/extensions/ext_num.dart';
import 'package:mindful/core/extensions/ext_build_context.dart';
import 'package:mindful/core/extensions/ext_duration.dart';
import 'package:mindful/core/utils/widget_utils.dart';
import 'package:mindful/providers/restrictions/wellbeing_provider.dart';
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
    final blockedFeatures =
        ref.watch(wellBeingProvider.select((v) => v.blockedFeatures));
    final instagramUsageLimitSec =
        ref.watch(wellBeingProvider.select((v) => v.instagramUsageLimitSec));

    final platforms = _buildPlatforms(
      context,
      blockedFeatures,
      instagramUsageLimitSec,
    );

    if (platforms.isEmpty) return const SliverToBoxAdapter();

    return MultiSliver(
      children: [
        ContentSectionHeader(title: context.locale.shorts_blocking_tab_title),
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

  List<_BlockedPlatform> _buildPlatforms(
    BuildContext context,
    List<PlatformFeatures> blocked,
    int instagramUsageLimitSec,
  ) {
    final locale = context.locale;
    final platforms = <_BlockedPlatform>[];

    void add(String name, String iconPath, List<String> items) {
      if (items.isNotEmpty) {
        platforms.add(_BlockedPlatform(name, iconPath, items));
      }
    }

    add(
      locale.instagram_features_tile_title,
      "assets/vectors/instagram.svg",
      [
        if (blocked.contains(PlatformFeatures.instagramReels))
          instagramUsageLimitSec > 0
              ? locale.in_app_blocking_reels_after_usage(
                  Duration(seconds: instagramUsageLimitSec)
                      .toTimeShort(context),
                )
              : locale.in_app_blocking_feature_reels,
        if (blocked.contains(PlatformFeatures.instagramExplore))
          locale.in_app_blocking_feature_explore,
      ],
    );

    add(
      locale.snapchat_features_tile_title,
      "assets/vectors/snapchat.svg",
      [
        if (blocked.contains(PlatformFeatures.snapchatSpotlight))
          locale.in_app_blocking_feature_spotlight,
        if (blocked.contains(PlatformFeatures.snapchatDiscover))
          locale.in_app_blocking_feature_discover,
      ],
    );

    add(
      locale.youtube_features_tile_title,
      "assets/vectors/youtube.svg",
      [
        if (blocked.contains(PlatformFeatures.youtubeShorts))
          locale.in_app_blocking_feature_shorts,
      ],
    );

    add(
      locale.facebook_features_tile_title,
      "assets/vectors/facebook.svg",
      [
        if (blocked.contains(PlatformFeatures.facebookReels))
          locale.in_app_blocking_feature_reels,
      ],
    );

    add(
      locale.reddit_features_tile_title,
      "assets/vectors/reddit.svg",
      [
        if (blocked.contains(PlatformFeatures.redditShorts))
          locale.in_app_blocking_feature_shorts,
      ],
    );

    return platforms;
  }
}

/// Dashboard card for one platform, styled like the focus session cards.
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

    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: ClipRRect(
        borderRadius: getBorderRadiusFromPosition(position),
        child: RoundedContainer(
          borderRadius: BorderRadius.circular(0),
          padding: const EdgeInsets.all(16),
          color: scheme.surfaceContainer,
          onPressed: () =>
              Navigator.of(context).pushNamed(AppRoutes.shortsBlockingPath),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    platform.iconPath,
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      scheme.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                  12.hBox,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StyledText(
                          platform.name,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        StyledText(
                          context.locale.in_app_blocking_card_subtitle,
                          color: Theme.of(context).hintColor,
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    FluentIcons.chevron_right_20_regular,
                    color: Theme.of(context).hintColor,
                  ),
                ],
              ),
              12.vBox,

              /// Blocked features
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Container(
                  height: 40,
                  color: scheme.surfaceContainerHigh,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: platform.blockedItems.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: Center(
                        child: Container(
                          height: 28,
                          padding: const EdgeInsets.only(left: 6, right: 10),
                          decoration: BoxDecoration(
                            color: scheme.errorContainer,
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                FluentIcons.prohibited_20_regular,
                                size: 16,
                                color: scheme.onErrorContainer,
                              ),
                              4.hBox,
                              StyledText(
                                platform.blockedItems[index],
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: scheme.onErrorContainer,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BlockedPlatform {
  const _BlockedPlatform(this.name, this.iconPath, this.blockedItems);

  final String name;
  final String iconPath;
  final List<String> blockedItems;
}
