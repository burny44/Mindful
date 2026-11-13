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
import 'package:mindful/config/navigation/app_routes.dart';
import 'package:mindful/config/hero_tags.dart';
import 'package:mindful/core/extensions/ext_build_context.dart';
import 'package:mindful/ui/common/default_fab_button.dart';

class FocusNowFab extends StatelessWidget {
  const FocusNowFab({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      alignmentOffset: const Offset(0, -8),
      builder: (context, controller, _) {
        return DefaultFabButton(
          heroTag: HeroTags.focusModeFABTag,
          icon: FluentIcons.target_arrow_20_filled,
          label: context.locale.focus_now_fab_button,
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
        );
      },
      menuChildren: [
        MenuItemButton(
          leadingIcon: const Icon(FluentIcons.calendar_clock_20_regular),
          onPressed: () => Navigator.of(context).pushNamed(
            AppRoutes.scheduledFocusPath,
          ),
          child: Text(context.locale.new_session_option_label),
        ),
        MenuItemButton(
          leadingIcon: const Icon(FluentIcons.lock_open_20_regular),
          onPressed: () => Navigator.of(context).pushNamed(
            AppRoutes.focusUnlockRulePath,
          ),
          child: Text(context.locale.focus_unlock_option_label),
        ),
        MenuItemButton(
          leadingIcon: const Icon(FluentIcons.resize_video_20_regular),
          onPressed: () => Navigator.of(context).pushNamed(
            AppRoutes.shortsBlockingPath,
          ),
          child: Text(context.locale.shorts_blocking_tab_title),
        ),
      ],
    );
  }
}
