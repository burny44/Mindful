package com.mindful.android.services.accessibility

import android.accessibilityservice.AccessibilityService
import android.content.Context
import android.content.res.Configuration
import android.graphics.Color
import android.graphics.PixelFormat
import android.graphics.Rect
import android.graphics.drawable.GradientDrawable
import android.util.Log
import android.view.Gravity
import android.view.View
import android.view.WindowManager
import android.view.accessibility.AccessibilityNodeInfo
import android.widget.FrameLayout
import android.widget.ImageView
import com.mindful.android.R
import com.mindful.android.utils.ThreadUtils

/**
 * Draws a lock button over Instagram's Reels tab (bottom navigation bar) so the Reels
 * feed cannot be opened from there, while the rest of Instagram (home feed, DMs, etc.)
 * stays usable.
 *
 * The lock is an accessibility overlay ([WindowManager.LayoutParams.TYPE_ACCESSIBILITY_OVERLAY]),
 * so no extra "display over other apps" permission is needed. It consumes taps on the tab.
 */
class InstagramReelsLock(private val service: AccessibilityService) {

    private val windowManager =
        service.getSystemService(Context.WINDOW_SERVICE) as WindowManager

    private var lockView: View? = null
    @Volatile
    private var lockViewDarkMode = false
    private val shownBounds = Rect()

    @Volatile
    private var isShowing = false

    /// Whether the lock should currently be visible. Checked on the main thread so a
    /// pending "show" never runs after the lock was asked to hide.
    @Volatile
    private var isRequested = false

    /**
     * Shows, moves or hides the lock based on the current Instagram screen.
     * Safe to call from a background thread.
     *
     * @param root The root node of Instagram's active window.
     * @param shouldLock Whether Reels are currently blocked.
     */
    fun update(root: AccessibilityNodeInfo, shouldLock: Boolean) {
        if (!shouldLock) {
            hide()
            return
        }

        val reelsTab = root.findAccessibilityNodeInfosByViewId(REELS_TAB_ID)
            .firstOrNull { it.isVisibleToUser }

        if (reelsTab == null) {
            // Tab bar is not on screen (e.g. inside a chat), nothing to cover
            hide()
            return
        }

        val bounds = Rect()
        reelsTab.getBoundsInScreen(bounds)
        if (bounds.isEmpty) {
            hide()
            return
        }

        // Skip main thread work if already shown at the same place
        if (isRequested && isShowing && bounds == shownBounds && lockViewDarkMode == isDarkMode()) return
        isRequested = true
        ThreadUtils.runOnMainThread { showAt(bounds) }
    }

    /**
     * Removes the lock if it is shown. Safe to call from any thread.
     */
    fun hide() {
        if (!isRequested && !isShowing) return
        isRequested = false
        ThreadUtils.runOnMainThread { removeView() }
    }

    private fun showAt(bounds: Rect) {
        if (!isRequested) return
        try {
            val params = WindowManager.LayoutParams(
                bounds.width(),
                bounds.height(),
                WindowManager.LayoutParams.TYPE_ACCESSIBILITY_OVERLAY,
                WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE or
                        WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN or
                        WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS,
                PixelFormat.TRANSLUCENT
            ).apply {
                gravity = Gravity.TOP or Gravity.START
                x = bounds.left
                y = bounds.top
            }

            val view = lockView
            if (view != null && isShowing && lockViewDarkMode == isDarkMode()) {
                windowManager.updateViewLayout(view, params)
            } else {
                // First show, or light/dark mode changed: (re)build with matching colors
                if (view != null) windowManager.removeView(view)
                val newView = buildLockView(minOf(bounds.width(), bounds.height()))
                windowManager.addView(newView, params)
                lockView = newView
                lockViewDarkMode = isDarkMode()
            }

            shownBounds.set(bounds)
            isShowing = true
        } catch (e: Exception) {
            Log.e(TAG, "showAt: Failed to show reels lock", e)
        }
    }

    private fun removeView() {
        if (isRequested) return
        try {
            lockView?.let { windowManager.removeView(it) }
        } catch (e: Exception) {
            Log.e(TAG, "removeView: Failed to remove reels lock", e)
        }
        lockView = null
        isShowing = false
        shownBounds.setEmpty()
    }

    /**
     * Builds a lock that looks like one of Instagram's own tab icons: an outlined lock of the
     * same size, replacing the Reels icon.
     *
     * The window itself is transparent so Instagram's rounded, floating tab bar stays visible.
     * Only a small disc in the bar's color hides the Reels icon underneath, with the lock on top.
     * Colors follow the system light/dark mode, which Instagram follows by default.
     */
    private fun buildLockView(size: Int): View {
        val isDarkMode = isDarkMode()
        val iconColor = if (isDarkMode) ICON_COLOR_DARK else ICON_COLOR_LIGHT
        val barColor = if (isDarkMode) BAR_COLOR_DARK else BAR_COLOR_LIGHT

        val density = service.resources.displayMetrics.density

        // Instagram's tab icons are 24dp, the disc only needs to cover the icon underneath
        val iconSize = minOf((24 * density).toInt(), (size * 0.7f).toInt())
        val discSize = minOf((40 * density).toInt(), size)

        val disc = FrameLayout(service).apply {
            background = GradientDrawable().apply {
                shape = GradientDrawable.OVAL
                setColor(barColor)
            }
            addView(
                ImageView(service).apply {
                    setImageResource(R.drawable.ic_reels_lock)
                    setColorFilter(iconColor)
                },
                FrameLayout.LayoutParams(iconSize, iconSize, Gravity.CENTER)
            )
        }

        return FrameLayout(service).apply {
            setBackgroundColor(Color.TRANSPARENT)
            addView(disc, FrameLayout.LayoutParams(discSize, discSize, Gravity.CENTER))

            // Consume taps on the whole tab area so Reels is never opened
            isClickable = true
        }
    }

    private fun isDarkMode(): Boolean =
        (service.resources.configuration.uiMode and Configuration.UI_MODE_NIGHT_MASK) ==
                Configuration.UI_MODE_NIGHT_YES

    companion object {
        private const val TAG = "Mindful.InstagramReelsLock"
        const val REELS_TAB_ID = "com.instagram.android:id/clips_tab"

        // Instagram's floating tab bar colors (sampled from the app)
        private val BAR_COLOR_DARK = Color.rgb(25, 29, 32)
        private val BAR_COLOR_LIGHT = Color.WHITE
        private val ICON_COLOR_DARK = Color.WHITE
        private val ICON_COLOR_LIGHT = Color.rgb(12, 16, 20)
    }
}
