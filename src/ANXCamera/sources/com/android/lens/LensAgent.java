package com.android.lens;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.PointF;
import android.graphics.Rect;
import android.media.Image;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.data.DataRepository;
import com.android.camera.log.Log;
import com.google.android.libraries.lens.lenslite.LensliteApi;
import com.google.android.libraries.lens.lenslite.LensliteUiContainer;
import com.google.android.libraries.lens.lenslite.LensliteUiController;

public class LensAgent {
    private static final String TAG = "LensAgent";
    private float mChipsLocation;
    private volatile boolean mIsResumed;
    private LensliteApi mLensliteApi;

    private static class SingletonHandler {
        private static final LensAgent sSingleton = new LensAgent();

        private SingletonHandler() {
        }
    }

    private LensAgent() {
    }

    private void applyCustomStyle(Context context, ViewGroup viewGroup) {
        LensliteUiController uiController = this.mLensliteApi.getUiController();
        Resources resources = context.getResources();
        Rect displayRect = Util.getDisplayRect(context, 0);
        this.mChipsLocation = (((float) displayRect.bottom) - resources.getDimension(R.dimen.front_camera_hint_text_place_margin)) / Util.sPixelDensity;
        uiController.setChipLocation(new PointF(0.0f, this.mChipsLocation));
        uiController.setChipDrawable(R.drawable.color_effect_image_cookie);
        uiController.setOobeLocation(1, ((float) Util.sNavigationBarHeight) / Util.sPixelDensity);
        TextView textView = (TextView) viewGroup.findViewById(R.id.makeup_item_icon);
        if (textView != null) {
            LayoutParams layoutParams = new LinearLayout.LayoutParams(textView.getLayoutParams());
            layoutParams.gravity = 17;
            layoutParams.width = -2;
            layoutParams.height = -2;
            layoutParams.setMargins(0, 0, 0, resources.getDimensionPixelOffset(R.dimen.front_camera_hint_text_place_textSize));
            textView.setLayoutParams(layoutParams);
            textView.setGravity(17);
            textView.setTextColor(-1);
            textView.setTextSize(0, resources.getDimension(R.dimen.front_camera_hint_text_rotate_textSize));
        }
        ImageView imageView = (ImageView) viewGroup.findViewById(R.id.makeup_item_name);
        if (imageView != null) {
            imageView.setImageResource(R.drawable.color_effect_image_film);
            imageView.setImageTintList(ColorStateList.valueOf(-1));
            int dimensionPixelOffset = resources.getDimensionPixelOffset(R.dimen.video_ultra_tip_margin_end);
            imageView.setPadding(dimensionPixelOffset, dimensionPixelOffset, dimensionPixelOffset, dimensionPixelOffset);
            LayoutParams layoutParams2 = new LinearLayout.LayoutParams(imageView.getLayoutParams());
            layoutParams2.gravity = 17;
            layoutParams2.width = -2;
            layoutParams2.height = -2;
            layoutParams2.setMargins(resources.getDimensionPixelOffset(R.dimen.chips_margin_preview_rect_bottom), 0, resources.getDimensionPixelOffset(R.dimen.chips_text_size), 0);
            imageView.setLayoutParams(layoutParams2);
        }
        LinearLayout linearLayout = (LinearLayout) viewGroup.findViewById(R.id.second_base);
        if (linearLayout != null) {
            linearLayout.setPadding(0, 0, 0, 0);
        }
        FrameLayout frameLayout = (FrameLayout) viewGroup.findViewById(R.id.second_text);
        if (frameLayout != null) {
            frameLayout.setVisibility(8);
            LayoutParams layoutParams3 = new FrameLayout.LayoutParams(frameLayout.getLayoutParams());
            layoutParams3.gravity = 16;
            layoutParams3.width = resources.getDimensionPixelOffset(R.dimen.chips_text_margin_bottom);
            layoutParams3.height = resources.getDimensionPixelOffset(R.dimen.chips_text_margin_bottom);
            layoutParams3.setMargins(resources.getDimensionPixelOffset(R.dimen.chips_height), 0, 0, 0);
            frameLayout.setLayoutParams(layoutParams3);
        }
        ImageView imageView2 = (ImageView) viewGroup.findViewById(R.id.makeup_item);
        if (imageView2 != null) {
            LayoutParams layoutParams4 = new LinearLayout.LayoutParams(imageView2.getLayoutParams());
            layoutParams4.gravity = 17;
            layoutParams4.width = -2;
            layoutParams4.height = -2;
            layoutParams4.setMargins(resources.getDimensionPixelOffset(R.dimen.video_ultra_tip_size), 0, resources.getDimensionPixelOffset(R.dimen.video_ultra_tip_margin_top), 0);
            imageView2.setLayoutParams(layoutParams4);
        }
        uiController.setIconForResultType(0, context.getDrawable(R.drawable.color_effect_image_koizora));
        uiController.setIconForResultType(1, context.getDrawable(R.drawable.color_effect_image_latte));
        uiController.setIconForResultType(2, context.getDrawable(R.drawable.color_effect_image_delicacy));
        uiController.setIconForResultType(3, context.getDrawable(R.drawable.color_effect_image_quiet));
        uiController.setIconForResultType(4, context.getDrawable(R.drawable.color_effect_image_glimmer));
        uiController.setIconForResultType(5, context.getDrawable(R.drawable.color_effect_image_soda));
        uiController.setIconForResultType(6, context.getDrawable(R.drawable.color_effect_image_soda));
        uiController.setIconForResultType(7, context.getDrawable(R.drawable.color_effect_image_soda));
        uiController.setIconForResultType(8, context.getDrawable(R.drawable.color_effect_image_soda));
        uiController.setIconForResultType(9, context.getDrawable(R.drawable.color_effect_image_vivid));
        uiController.setIconForResultType(10, context.getDrawable(R.drawable.color_effect_image_vivid));
        uiController.setIconForResultType(11, context.getDrawable(R.drawable.color_effect_image_vivid));
        uiController.setIconForResultType(12, context.getDrawable(R.drawable.color_effect_image_soda));
        uiController.setIconForResultType(13, context.getDrawable(R.drawable.color_effect_image_latte));
        uiController.setIconForResultType(14, context.getDrawable(R.drawable.color_effect_image_fade));
        uiController.setIconForResultType(15, context.getDrawable(R.drawable.color_effect_image_soda));
        uiController.setIconForResultType(16, context.getDrawable(R.drawable.color_effect_image_soda));
        uiController.setIconForResultType(17, context.getDrawable(R.drawable.color_effect_image_soda));
        uiController.setIconForResultType(18, context.getDrawable(R.drawable.color_effect_image_none));
    }

    public static LensAgent getInstance() {
        return SingletonHandler.sSingleton;
    }

    public static boolean isConflictAiScene(int i) {
        if (!(i == -1 || i == 19 || i == 25)) {
            if (i == 31) {
                return DataRepository.dataItemFeature().fQ();
            }
            if (!(i == 34 || i == 37)) {
                return false;
            }
        }
        return true;
    }

    public void init(Context context, View view, ViewGroup viewGroup) {
        this.mLensliteApi = LensliteApi.create(context, null);
        long currentTimeMillis = System.currentTimeMillis();
        this.mLensliteApi.onStart(new LensliteUiContainer(view, viewGroup), 3);
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("LensliteApi init cost ");
        stringBuilder.append(System.currentTimeMillis() - currentTimeMillis);
        stringBuilder.append("ms");
        Log.d(str, stringBuilder.toString());
        applyCustomStyle(context, viewGroup);
    }

    public boolean isResumed() {
        return this.mIsResumed;
    }

    public void onFocusChange(boolean z, float f, float f2) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("onFocusChange: LensliteApi down = ");
        stringBuilder.append(z);
        stringBuilder.append(", ");
        stringBuilder.append(f);
        stringBuilder.append("x");
        stringBuilder.append(f2);
        Log.d(str, stringBuilder.toString());
        try {
            this.mLensliteApi.getUiController().onFocusChange(z ? 0 : 1, new PointF(f, f2));
        } catch (Throwable e) {
            Log.e(TAG, "onFocusChange: ", e);
        }
    }

    public void onNewImage(Image image, int i) {
        if (this.mIsResumed) {
            this.mLensliteApi.onNewImage(image, i);
        } else {
            Log.w(TAG, "onNewImage: lens api not resume...");
        }
    }

    public void onPause() {
        long currentTimeMillis = System.currentTimeMillis();
        if (this.mIsResumed) {
            this.mLensliteApi.onPause();
            this.mIsResumed = false;
        }
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("LensliteApi onPause cost ");
        stringBuilder.append(System.currentTimeMillis() - currentTimeMillis);
        stringBuilder.append("ms");
        Log.d(str, stringBuilder.toString());
    }

    public void onResume() {
        long currentTimeMillis = System.currentTimeMillis();
        if (!this.mIsResumed) {
            this.mLensliteApi.onResume();
            this.mIsResumed = true;
        }
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("LensliteApi onResume cost ");
        stringBuilder.append(System.currentTimeMillis() - currentTimeMillis);
        stringBuilder.append("ms");
        Log.d(str, stringBuilder.toString());
    }

    public void release() {
        long currentTimeMillis = System.currentTimeMillis();
        this.mLensliteApi.onStop();
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("LensliteApi release cost ");
        stringBuilder.append(System.currentTimeMillis() - currentTimeMillis);
        stringBuilder.append("ms");
        Log.d(str, stringBuilder.toString());
    }

    public void setLensliteLayoutVisibility(boolean z) {
        this.mLensliteApi.getUiController().setLensliteLayoutVisibility(z);
    }

    public void showOrHideChip(boolean z) {
        this.mLensliteApi.getUiController().setChipLocation(new PointF(0.0f, z ? this.mChipsLocation : -100.0f));
    }
}
