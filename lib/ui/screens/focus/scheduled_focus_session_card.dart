/*
 *
 *  * Copyright (c) 2024 Mindful (https://github.com/akaMrNagar/Mindful)
 *  * Author : Pawan Nagar (https://github.com/akaMrNagar)
 *  *
 *  * This source code is licensed under the GPL-2.0 license license found in the
 *  * LICENSE file in the root directory of this source tree.
 *
 */

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mindful/config/hero_tags.dart';
import 'package:mindful/core/enums/item_position.dart';
import 'package:mindful/core/extensions/ext_build_context.dart';
import 'package:mindful/core/extensions/ext_num.dart';
import 'package:mindful/models/scheduled_focus_session.dart';
import 'package:mindful/providers/apps/apps_info_provider.dart';
import 'package:mindful/providers/focus/scheduled_focus_session_provider.dart';
import 'package:mindful/ui/common/application_icon.dart';
import 'package:mindful/ui/common/default_slide_to_remove.dart';
import 'package:mindful/ui/common/rounded_container.dart';
import 'package:mindful/ui/common/styled_text.dart';
import 'package:mindful/ui/dialogs/confirmation_dialog.dart';
import 'package:mindful/ui/screens/focus/create_update_scheduled_focus_screen.dart';
import 'package:mindful/ui/transitions/default_hero.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ScheduledFocusSessionCard extends ConsumerWidget {
  const ScheduledFocusSessionCard({
    super.key,
    required this.session,
    this.position,
  });

  final ScheduledFocusSession session;
  final ItemPosition? position;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appsInfo = ref.watch(appsInfoProvider).value;
    final apps = appsInfo == null
        ? null
        : session.distractingApps.map((e) => appsInfo[e]).nonNulls.toList();

    return DefaultHero(
      tag: HeroTags.scheduledFocusRemoveTag(session.id),
      child: DefaultSlideToRemove(
        enabled: !session.isStrict,
        removable: !session.isStrict,
        key: Key("scheduledFocusSession.${session.id}"),
        position: position ?? ItemPosition.none,
        onDismiss: () => _removeSession(context, ref),
        child: RoundedContainer(
          borderRadius: BorderRadius.circular(0),
          padding: const EdgeInsets.all(16),
          color: Theme.of(context).colorScheme.surfaceContainer,
          onPressed: () {
            if (session.isStrict) {
              /// Still allow opening in read-only mode
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      CreateUpdateScheduledFocusScreen(session: session),
                ),
              );
              return;
            }
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    CreateUpdateScheduledFocusScreen(session: session),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    session.isStrict
                        ? FluentIcons.shield_lock_20_filled
                        : FluentIcons.target_arrow_20_filled,
                    color: session.isStrict
                        ? Theme.of(context).colorScheme.error
                        : Theme.of(context).colorScheme.primary,
                  ),
                  12.hBox,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StyledText(
                          session.name.isEmpty
                              ? context.locale.new_session_screen_title
                              : session.name,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        StyledText(
                          session.scheduleDurationInMins > 0
                              ? context.locale.app_active_period_tile_subtitle(
                                  session.scheduleStartTime.format(context),
                                  session.scheduleEndTime.format(context),
                                )
                              : context.locale.new_session_schedule_all_day,
                          color: Theme.of(context).hintColor,
                        ),
                      ],
                    ),
                  ),
                  if (session.isStrict)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.errorContainer,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: StyledText(
                        context.locale.new_session_strict_badge,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onErrorContainer,
                      ),
                    ),
                ],
              ),
              if (session.breaksEnabled) ...[
                8.vBox,
                StyledText(
                  "${context.locale.new_session_breaks_count_title}: ${session.numberOfBreaks}",
                  color: Theme.of(context).hintColor,
                  fontSize: 13,
                ),
              ],
              12.vBox,
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Container(
                  height: 40,
                  color: Theme.of(context).colorScheme.surfaceContainerHigh,
                  child: Skeletonizer.zone(
                    enableSwitchAnimation: true,
                    enabled: apps == null,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: apps?.length ?? session.distractingApps.length,
                      itemBuilder: (context, index) {
                        final appInfo = apps?.elementAtOrNull(index);
                        return Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: appInfo == null
                              ? const Bone.icon(size: 28)
                              : ApplicationIcon(appInfo: appInfo, size: 14),
                        );
                      },
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

  void _removeSession(BuildContext context, WidgetRef ref) async {
    if (session.isStrict) {
      context.showSnackAlert(context.locale.new_session_strict_locked_snack);
      return;
    }

    final confirm = await showConfirmationDialog(
      context: context,
      heroTag: HeroTags.scheduledFocusRemoveTag(session.id),
      title: context.locale.new_session_remove_dialog_title,
      info: context.locale.new_session_remove_dialog_info,
      icon: FluentIcons.delete_20_filled,
      positiveLabel: context.locale.dialog_button_remove,
    );

    if (!confirm) return;

    final ok =
        await ref.read(scheduledFocusSessionsProvider.notifier).removeSession(
              session,
            );
    if (!ok && context.mounted) {
      context.showSnackAlert(context.locale.new_session_strict_locked_snack);
    }
  }
}
