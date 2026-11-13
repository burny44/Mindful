/*
 *
 *  *
 *  *  * Copyright (c) 2024 Mindful (https://github.com/akaMrNagar/Mindful)
 *  *  * Author : Pawan Nagar (https://github.com/akaMrNagar)
 *  *  *
 *  *  * This source code is licensed under the GPL-2.0 license license found in the
 *  *  * LICENSE file in the root directory of this source tree.
 *  *
 *
 */
package com.mindful.android.helpers.device

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.app.Service.NOTIFICATION_SERVICE
import android.content.Context
import android.content.Intent
import android.os.Build
import android.provider.Settings
import androidx.core.app.NotificationCompat
import androidx.core.net.toUri
import com.mindful.android.R
import com.mindful.android.utils.AppUtils

/**
 * NotificationHelper provides utility methods for managing notification channels and permissions
 * in an Android application.
 * It includes functionalities to register notification channels and request notification permissions.
 */
object NotificationHelper {

    // Notification channel IDs
    const val CRITICAL_CHANNEL_ID: String = "mindful.notification.channel.CRITICAL"
    const val NOTIFICATION_BATCHING_CHANNEL_ID: String =
        "mindful.notification.channel.NOTIFICATION_BATCHING"
    private const val SERVICE_CHANNEL_ID: String =
        "mindful.notification.channel.SERVICE"
    const val USAGE_REMINDERS_CHANNEL_ID: String = "mindful.notification.channel.USAGE_REMINDERS"

    /**
     * Registers notification channels for the application. This method creates and registers
     * channels for important and other notifications, specifying their importance and descriptions.
     *
     * @param context The application context used to access system services.
     */
    fun registerNotificationChannels(context: Context) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            // Create channels
            val criticalChannel = NotificationChannel(
                CRITICAL_CHANNEL_ID,
                "Critical Alerts",
                NotificationManager.IMPORTANCE_HIGH
            ).apply {
                description =
                    "These notifications include crucial updates regarding the essential system operations to ensure Mindful runs smoothly."
            }

            val notificationBatchingChannel = NotificationChannel(
                NOTIFICATION_BATCHING_CHANNEL_ID,
                "Notification Batch",
                NotificationManager.IMPORTANCE_DEFAULT
            ).apply {
                description =
                    "These notifications include summaries or all batched notifications from your scheduled notification batches."
            }

            val serviceChannel = NotificationChannel(
                SERVICE_CHANNEL_ID,
                "Running Services",
                NotificationManager.IMPORTANCE_LOW
            ).apply {
                description =
                    "These are non-critical notifications. They can be disabled but are included to comply with Android requirements."
            }

            val usageRemindersChannel = NotificationChannel(
                USAGE_REMINDERS_CHANNEL_ID,
                "Usage Reminders",
                NotificationManager.IMPORTANCE_HIGH
            ).apply {
                setSound(null, null)
                enableVibration(true)
                description =
                    "These notifications include usage reminders for timed apps."
            }

            // Register channels
            val notificationManager =
                context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
            notificationManager.createNotificationChannels(
                listOf(
                    criticalChannel,
                    notificationBatchingChannel,
                    serviceChannel,
                    usageRemindersChannel
                )
            )

            // Remove channels of removed features (bedtime, focus now) from older installs
            notificationManager.deleteNotificationChannel("mindful.notification.channel.BEDTIME")
            notificationManager.deleteNotificationChannel("mindful.notification.channel.FOCUS")
        }
    }

    /**
     * Builds and returns a notification for a foreground service with the specified content.
     *
     * @param context The application context used to access system services.
     * @param content The content text of the notification.
     * @return A Notification object representing the foreground service notification.
     */
    fun buildFgServiceNotification(context: Context, content: String?): Notification {
        return NotificationCompat.Builder(context, SERVICE_CHANNEL_ID)
            .setSmallIcon(R.drawable.ic_mindful_notification)
            .setOngoing(true)
            .setAutoCancel(true)
            .setContentTitle(context.getString(R.string.service_running_notification_title))
            .setContentIntent(AppUtils.getPendingIntentForMindfulUri(context))
            .setContentText(content)
            .build()
    }

    /**
     * Displays a notification that prompts the user to enable overlay permission.
     */
    fun pushAskOverlayPermissionNotification(
        context: Context,
    ) {
        val notificationManager =
            context.getSystemService(NOTIFICATION_SERVICE) as NotificationManager
        val permissionIntent = Intent(Settings.ACTION_MANAGE_OVERLAY_PERMISSION)

        permissionIntent.setData("package:${context.packageName}".toUri())
        val pendingIntent = PendingIntent.getActivity(
            context.applicationContext,
            0,
            permissionIntent,
            PendingIntent.FLAG_IMMUTABLE
        )

        val msg = context.getString(R.string.overlay_permission_denied_notification_info)
        notificationManager.notify(
            301,
            NotificationCompat.Builder(
                context,
                CRITICAL_CHANNEL_ID
            )
                .setSmallIcon(R.drawable.ic_mindful_notification)
                .setAutoCancel(true)
                .setContentTitle(context.getString(R.string.overlay_permission_denied_notification_title))
                .setContentText(msg)
                .setContentIntent(pendingIntent)
                .setStyle(NotificationCompat.BigTextStyle().bigText(msg))
                .addAction(
                    0, // No icon = text-only button
                    "Allow",
                    pendingIntent
                )
                .build()
        )
    }

}
