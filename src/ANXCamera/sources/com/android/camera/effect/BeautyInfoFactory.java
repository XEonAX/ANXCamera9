package com.android.camera.effect;

import com.aeonax.camera.R;
import com.miui.filtersdk.filter.helper.FilterFactory;
import com.miui.filtersdk.filter.helper.FilterFactory.FilterScene;
import com.miui.filtersdk.filter.helper.FilterType;
import java.util.ArrayList;
import java.util.Collections;

public class BeautyInfoFactory {
    public static ArrayList<FilterInfo> initBeautyFilterInfo() {
        Object arrayList = new ArrayList();
        arrayList.add(new FilterInfo(FilterInfo.FILTER_ID_NONE, R.string.pref_camera_coloreffect_entry_none, R.drawable.portait_effect_image_none, 0));
        FilterType[] filtersByScene = FilterFactory.getFiltersByScene(FilterScene.BEAUTY);
        int length = filtersByScene.length;
        int i = 0;
        int i2 = i;
        int i3 = i2;
        int i4 = i3;
        while (i < length) {
            int i5;
            int i6;
            FilterType filterType = filtersByScene[i];
            switch (filterType) {
                case B_NATURE:
                    i2 = 10;
                    i3 = R.string.portait_effect_entry_nature;
                    i4 = R.drawable.portait_effect_image_nature;
                    break;
                case B_JAPANESE:
                    i2 = 20;
                    i3 = R.string.portait_effect_entry_japanese;
                    i4 = R.drawable.portait_effect_image_japanese;
                    break;
                case B_PINK:
                    i2 = 30;
                    i3 = R.string.portait_effect_entry_pink;
                    i4 = R.drawable.portait_effect_image_pink;
                    break;
                case B_STORY:
                    i2 = 40;
                    i3 = R.string.portait_effect_entry_story;
                    i4 = R.drawable.portait_effect_image_story;
                    break;
                case B_FAIRYTALE:
                    i2 = 50;
                    i3 = R.string.portait_effect_entry_fairytale;
                    i4 = R.drawable.portait_effect_image_fairytale;
                    break;
                case B_MOOD:
                    i2 = 60;
                    i3 = R.string.portait_effect_entry_mood;
                    i4 = R.drawable.portait_effect_image_mood;
                    break;
                case B_ROMANCE:
                    i2 = 70;
                    i3 = R.string.portait_effect_entry_romance;
                    i4 = R.drawable.portait_effect_image_romance;
                    break;
                case B_MAZE:
                    i2 = 80;
                    i3 = R.string.portait_effect_entry_maze;
                    i4 = R.drawable.portait_effect_image_maze;
                    break;
                case B_MINT:
                    i2 = 90;
                    i3 = R.string.portait_effect_entry_cool;
                    i4 = R.drawable.portait_effect_image_cool;
                    break;
                case B_RIDDLE:
                    i2 = 100;
                    i3 = R.string.portait_effect_entry_riddle;
                    i4 = R.drawable.portait_effect_image_riddle;
                    break;
                case B_MOVIE:
                    i2 = 110;
                    i3 = R.string.portait_effect_entry_movie;
                    i4 = R.drawable.portait_effect_image_movie;
                    break;
                case B_WHITEANDBLACK:
                    i2 = 120;
                    i3 = R.string.portait_effect_entry_blackwhite;
                    i4 = R.drawable.portait_effect_image_blackwhite;
                    break;
                default:
                    i5 = i2;
                    i6 = i3;
                    i2 = i4;
                    break;
            }
            i5 = i3;
            i6 = i4;
            if (i5 == 0 || i6 == 0) {
                i3 = i6;
            } else {
                arrayList.add(new FilterInfo(2, filterType.ordinal(), i5, i6, i2));
                i3 = 0;
                i5 = i3;
            }
            i++;
            i4 = i2;
            i2 = i5;
        }
        Collections.sort(arrayList);
        return arrayList;
    }

    public static ArrayList<FilterInfo> initIndiaBeautyFilterInfo() {
        Object arrayList = new ArrayList();
        arrayList.add(new FilterInfo(FilterInfo.FILTER_ID_NONE, R.string.pref_camera_coloreffect_entry_none, R.drawable.portrait_india_effect_image_none, 0));
        FilterType[] filtersByScene = FilterFactory.getFiltersByScene(FilterScene.BEAUTY_INDIA);
        int length = filtersByScene.length;
        int i = 0;
        int i2 = i;
        int i3 = i2;
        int i4 = i3;
        while (i < length) {
            int i5;
            int i6;
            FilterType filterType = filtersByScene[i];
            switch (filterType) {
                case BI_SUNNY:
                    i2 = 10;
                    i3 = R.string.portrait_india_effect_entry_sunny;
                    i4 = R.drawable.portrait_india_effect_image_sunny;
                    break;
                case BI_PINK:
                    i2 = 20;
                    i3 = R.string.portrait_india_effect_entry_pink;
                    i4 = R.drawable.portrait_india_effect_image_pink;
                    break;
                case BI_MEMORY:
                    i2 = 30;
                    i3 = R.string.portrait_india_effect_entry_memory;
                    i4 = R.drawable.portrait_india_effect_image_memory;
                    break;
                case BI_STRONG:
                    i2 = 40;
                    i3 = R.string.portrait_india_effect_entry_strong;
                    i4 = R.drawable.portrait_india_effect_image_strong;
                    break;
                case BI_WARM:
                    i2 = 50;
                    i3 = R.string.portrait_india_effect_entry_warm;
                    i4 = R.drawable.portrait_india_effect_image_warm;
                    break;
                case BI_SWEET:
                    i2 = 60;
                    i3 = R.string.portrait_india_effect_entry_sweet;
                    i4 = R.drawable.portrait_india_effect_image_sweet;
                    break;
                case BI_PORTRAIT:
                    i2 = 70;
                    i3 = R.string.portrait_india_effect_entry_portrait;
                    i4 = R.drawable.portrait_india_effect_image_portrait;
                    break;
                case BI_RETRO:
                    i2 = 80;
                    i3 = R.string.portrait_india_effect_entry_retro;
                    i4 = R.drawable.portrait_india_effect_image_retro;
                    break;
                case BI_YOUNG:
                    i2 = 90;
                    i3 = R.string.portrait_india_effect_entry_young;
                    i4 = R.drawable.portrait_india_effect_image_young;
                    break;
                case BI_ROMANTIC:
                    i2 = 100;
                    i3 = R.string.portrait_india_effect_entry_romantic;
                    i4 = R.drawable.portrait_india_effect_image_romantic;
                    break;
                case BI_MONO:
                    i2 = 110;
                    i3 = R.string.portrait_india_effect_entry_mono;
                    i4 = R.drawable.portrait_india_effect_image_mono;
                    break;
                default:
                    i5 = i2;
                    i6 = i3;
                    i2 = i4;
                    break;
            }
            i5 = i3;
            i6 = i4;
            if (i5 == 0 || i6 == 0) {
                i3 = i6;
            } else {
                arrayList.add(new FilterInfo(2, filterType.ordinal(), i5, i6, i2));
                i3 = 0;
                i5 = i3;
            }
            i++;
            i4 = i2;
            i2 = i5;
        }
        Collections.sort(arrayList);
        return arrayList;
    }

    public static int getFilterDegree(FilterType filterType) {
        int i = AnonymousClass1.$SwitchMap$com$miui$filtersdk$filter$helper$FilterType[filterType.ordinal()];
        if (i == 1) {
            return 70;
        }
        switch (i) {
            case 24:
                return 60;
            case 25:
                return 70;
            case 26:
            case 27:
            case 28:
            case 29:
            case 30:
            case 31:
                return 80;
            default:
                return 100;
        }
    }

    public static int getIndiaFilterDegree(FilterType filterType) {
        int i = AnonymousClass1.$SwitchMap$com$miui$filtersdk$filter$helper$FilterType[filterType.ordinal()];
        if (i == 13 || i == 16) {
            return 80;
        }
        if (i == 18) {
            return 70;
        }
        switch (i) {
            case 24:
                return 60;
            case 25:
                return 70;
            case 26:
            case 27:
            case 28:
            case 29:
            case 30:
            case 31:
                return 80;
            default:
                return 100;
        }
    }
}
