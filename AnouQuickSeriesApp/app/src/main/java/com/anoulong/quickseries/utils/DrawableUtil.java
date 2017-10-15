package com.anoulong.quickseries.utils;

import android.content.Context;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.drawable.Drawable;
import android.support.annotation.ColorRes;
import android.support.annotation.DrawableRes;
import android.support.v4.content.ContextCompat;

/**
 * Created by Anou on 2017-10-15.
 */

public class DrawableUtil {
    public static Drawable getTintedDrawable(Context context, @DrawableRes int drawableResId, @ColorRes int colorResId) {
        Drawable drawable = ContextCompat.getDrawable(context, drawableResId).mutate();
        drawable.setColorFilter(new PorterDuffColorFilter(ContextCompat.getColor(context, colorResId), PorterDuff.Mode.SRC_ATOP));
        return drawable;
    }

    public static Drawable getTintedDrawable(Context context, Drawable d, @ColorRes int colorResId) {
        Drawable drawable = d.mutate();
        drawable.setColorFilter(new PorterDuffColorFilter(ContextCompat.getColor(context, colorResId), PorterDuff.Mode.SRC_ATOP));
        return drawable;
    }
}
