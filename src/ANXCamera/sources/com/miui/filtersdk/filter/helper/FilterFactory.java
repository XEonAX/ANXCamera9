package com.miui.filtersdk.filter.helper;

import android.util.Log;
import com.miui.filtersdk.filter.base.BaseOriginalFilter;
import com.miui.filtersdk.filter.base.ColorLookupFilter;
import com.miui.filtersdk.filter.base.ColorLookupFilter4x4;
import java.util.ArrayList;
import java.util.List;

public class FilterFactory {
    private static final String LOOKUP_TABLE_PATH_AI_SCENE_AUTUMN = "filter/aiscene/A-AUTUMN.png";
    private static final String LOOKUP_TABLE_PATH_AI_SCENE_BACKLIGHT = "filter/aiscene/A-GLOBAL-NONE.png";
    private static final String LOOKUP_TABLE_PATH_AI_SCENE_BEACH = "filter/aiscene/A-BEACH.png";
    private static final String LOOKUP_TABLE_PATH_AI_SCENE_BUDDHA = "filter/aiscene/A-BUDDHA.png";
    private static final String LOOKUP_TABLE_PATH_AI_SCENE_BUILDING = "filter/aiscene/A-BUILDING.png";
    private static final String LOOKUP_TABLE_PATH_AI_SCENE_CANDLELIGHT = "filter/aiscene/A-CANDLELIGHT.png";
    private static final String LOOKUP_TABLE_PATH_AI_SCENE_CAR = "filter/aiscene/A-CAR.png";
    private static final String LOOKUP_TABLE_PATH_AI_SCENE_CAT = "filter/aiscene/A-CAT.png";
    private static final String LOOKUP_TABLE_PATH_AI_SCENE_CITY = "filter/aiscene/A-CITY.png";
    private static final String LOOKUP_TABLE_PATH_AI_SCENE_CLOUD = "filter/aiscene/A-CLOUD.png";
    private static final String LOOKUP_TABLE_PATH_AI_SCENE_COW = "filter/aiscene/A-COW.png";
    private static final String LOOKUP_TABLE_PATH_AI_SCENE_CURRY = "filter/aiscene/A-CURRY.png";
    private static final String LOOKUP_TABLE_PATH_AI_SCENE_DOC = "filter/aiscene/A-DOC.png";
    private static final String LOOKUP_TABLE_PATH_AI_SCENE_DOG = "filter/aiscene/A-DOG.png";
    private static final String LOOKUP_TABLE_PATH_AI_SCENE_DRIVING = "filter/aiscene/A-DRIVING.png";
    private static final String LOOKUP_TABLE_PATH_AI_SCENE_FLOWER = "filter/aiscene/A-FLOWER.png";
    private static final String LOOKUP_TABLE_PATH_AI_SCENE_FOOD = "filter/aiscene/A-FOOD.png";
    private static final String LOOKUP_TABLE_PATH_AI_SCENE_GRASS = "filter/aiscene/A-GRASS.png";
    private static final String LOOKUP_TABLE_PATH_AI_SCENE_GREEN_PLANTS = "filter/aiscene/A-GREEN_PLANTS.png";
    private static final String LOOKUP_TABLE_PATH_AI_SCENE_HUMAN = "filter/aiscene/A-HUMAN.png";
    private static final String LOOKUP_TABLE_PATH_AI_SCENE_JEWELRY = "filter/aiscene/A-JEWELRY.png";
    private static final String LOOKUP_TABLE_PATH_AI_SCENE_MAPLE_LEAVES = "filter/aiscene/A-MAPLE_LEAVES.png";
    private static final String LOOKUP_TABLE_PATH_AI_SCENE_MOTORBIKE = "filter/aiscene/A-MOTORBIKE.png";
    private static final String LOOKUP_TABLE_PATH_AI_SCENE_NIGHT = "filter/aiscene/A-NIGHT.png";
    private static final String LOOKUP_TABLE_PATH_AI_SCENE_OVERCAST = "filter/aiscene/A-OVERCAST.png";
    private static final String LOOKUP_TABLE_PATH_AI_SCENE_PPT = "filter/aiscene/A-PPT.png";
    private static final String LOOKUP_TABLE_PATH_AI_SCENE_SEA = "filter/aiscene/A-SEA.png";
    private static final String LOOKUP_TABLE_PATH_AI_SCENE_SILHOUETTE = "filter/aiscene/A-SILHOUETTE.png";
    private static final String LOOKUP_TABLE_PATH_AI_SCENE_SKY = "filter/aiscene/A-SKY.png";
    private static final String LOOKUP_TABLE_PATH_AI_SCENE_SNOW = "filter/aiscene/A-SNOW.png";
    private static final String LOOKUP_TABLE_PATH_AI_SCENE_SUCCULENT = "filter/aiscene/A-SUCCULENT.png";
    private static final String LOOKUP_TABLE_PATH_AI_SCENE_SUNRISE_SUNSET = "filter/aiscene/A-SUNRISE_SUNSET.png";
    private static final String LOOKUP_TABLE_PATH_AI_SCENE_TEMPLE = "filter/aiscene/A-TEMPLE.png";
    private static final String LOOKUP_TABLE_PATH_BEAUTY_FAIRYTALE = "filter/beauty/B-FAIRYTALE.png";
    private static final String LOOKUP_TABLE_PATH_BEAUTY_INDIA_MEMORY = "filter/beauty_india/BI-MEMORY.png";
    private static final String LOOKUP_TABLE_PATH_BEAUTY_INDIA_MONO = "filter/beauty_india/BI-MONO.png";
    private static final String LOOKUP_TABLE_PATH_BEAUTY_INDIA_M_DUSK = "filter/beauty_india/BI-M-DUSK.png";
    private static final String LOOKUP_TABLE_PATH_BEAUTY_INDIA_M_LILT = "filter/beauty_india/BI-M-LILT.png";
    private static final String LOOKUP_TABLE_PATH_BEAUTY_INDIA_M_SEPIA = "filter/beauty_india/BI-M-SEPIA.png";
    private static final String LOOKUP_TABLE_PATH_BEAUTY_INDIA_M_TEA = "filter/beauty_india/BI-M-TEA.png";
    private static final String LOOKUP_TABLE_PATH_BEAUTY_INDIA_M_WHITEANDBLACK = "filter/beauty_india/BI-M-WHITEANDBLACK.png";
    private static final String LOOKUP_TABLE_PATH_BEAUTY_INDIA_PINK = "filter/beauty_india/BI-PINK.png";
    private static final String LOOKUP_TABLE_PATH_BEAUTY_INDIA_PORTRAIT = "filter/beauty_india/BI-PORTRAIT.png";
    private static final String LOOKUP_TABLE_PATH_BEAUTY_INDIA_RETRO = "filter/beauty_india/BI-RETRO.png";
    private static final String LOOKUP_TABLE_PATH_BEAUTY_INDIA_ROMANTIC = "filter/beauty_india/B-INDIA-ROMANTIC.png";
    private static final String LOOKUP_TABLE_PATH_BEAUTY_INDIA_STRONG = "filter/beauty_india/B-INDIA-STRONG.png";
    private static final String LOOKUP_TABLE_PATH_BEAUTY_INDIA_SUNNY = "filter/beauty_india/BI-SUNNY.png";
    private static final String LOOKUP_TABLE_PATH_BEAUTY_INDIA_SWEET = "filter/beauty_india/BI-SWEET.png";
    private static final String LOOKUP_TABLE_PATH_BEAUTY_INDIA_WARM = "filter/beauty_india/BI-WARM.png";
    private static final String LOOKUP_TABLE_PATH_BEAUTY_INDIA_YOUNG = "filter/beauty_india/BI-YOUNG.png";
    private static final String LOOKUP_TABLE_PATH_BEAUTY_JAPANESE = "filter/beauty/B-JAPANESE.png";
    private static final String LOOKUP_TABLE_PATH_BEAUTY_MAZE = "filter/beauty/B-MAZE.png";
    private static final String LOOKUP_TABLE_PATH_BEAUTY_MINT = "filter/beauty/B-MINT.png";
    private static final String LOOKUP_TABLE_PATH_BEAUTY_MOOD = "filter/beauty/B-HEART.png";
    private static final String LOOKUP_TABLE_PATH_BEAUTY_MOVIE = "filter/beauty/B-MOVIE.png";
    private static final String LOOKUP_TABLE_PATH_BEAUTY_M_LILT = "filter/beauty/B-M-LILT.png";
    private static final String LOOKUP_TABLE_PATH_BEAUTY_M_SEPIA = "filter/beauty/B-M-SEPIA.png";
    private static final String LOOKUP_TABLE_PATH_BEAUTY_M_TEA = "filter/beauty/B-M-TEA.png";
    private static final String LOOKUP_TABLE_PATH_BEAUTY_M_WHITEANDBLACK = "filter/beauty/B-M-WHITEANDBLACK.png";
    private static final String LOOKUP_TABLE_PATH_BEAUTY_NATURE = "filter/beauty/B-NATURE.png";
    private static final String LOOKUP_TABLE_PATH_BEAUTY_PINK = "filter/beauty/B-PINK.png";
    private static final String LOOKUP_TABLE_PATH_BEAUTY_RIDDLE = "filter/beauty/B-RIDDLE.png";
    private static final String LOOKUP_TABLE_PATH_BEAUTY_ROMANCE = "filter/beauty/B-ROMANCE.png";
    private static final String LOOKUP_TABLE_PATH_BEAUTY_STORY = "filter/beauty/B-STORY.png";
    private static final String LOOKUP_TABLE_PATH_BEAUTY_WHITEANDBLACK = "filter/beauty/B-WHITEANDBLACK.png";
    private static final String LOOKUP_TABLE_PATH_COMMON_WHITEANDBLACK = "filter/common/WHITEANDBLACK.png";
    private static final String LOOKUP_TABLE_PATH_LIGHTING_DOT = "filter/lighting/L-DOT.png";
    private static final String LOOKUP_TABLE_PATH_LIGHTING_LEAF = "filter/lighting/L-LEAF.png";
    private static final String LOOKUP_TABLE_PATH_LIGHTING_MOVIE = "filter/lighting/L-MOVIE.png";
    private static final String LOOKUP_TABLE_PATH_LIGHTING_NATURE = "filter/lighting/L-NATURE.png";
    private static final String LOOKUP_TABLE_PATH_LIGHTING_RAINBOW = "filter/lighting/L-RAINBOW.png";
    private static final String LOOKUP_TABLE_PATH_LIGHTING_SHUTTER = "filter/lighting/L-SHUTTER.png";
    private static final String LOOKUP_TABLE_PATH_LIGHTING_STAGE = "filter/lighting/L-STAGE.png";
    private static final String LOOKUP_TABLE_PATH_NORMAL_BERRY = "filter/normal/N-BERRY.png";
    private static final String LOOKUP_TABLE_PATH_NORMAL_COOKIE = "filter/normal/N-COOKIE.png";
    private static final String LOOKUP_TABLE_PATH_NORMAL_DELICACY = "filter/normal/N-DELICACY.png";
    private static final String LOOKUP_TABLE_PATH_NORMAL_FADE = "filter/normal/N-FADE.png";
    private static final String LOOKUP_TABLE_PATH_NORMAL_FILM = "filter/normal/N-FILM.png";
    private static final String LOOKUP_TABLE_PATH_NORMAL_KOIZORA = "filter/normal/N-KOIZORA.png";
    private static final String LOOKUP_TABLE_PATH_NORMAL_LATTE = "filter/normal/N-LATTE.png";
    private static final String LOOKUP_TABLE_PATH_NORMAL_LIGHT = "filter/normal/N-LIGHT.png";
    private static final String LOOKUP_TABLE_PATH_NORMAL_LIVELY = "filter/normal/N-LIVELY.png";
    private static final String LOOKUP_TABLE_PATH_NORMAL_QUIET = "filter/normal/N-QUIET.png";
    private static final String LOOKUP_TABLE_PATH_NORMAL_SODA = "filter/normal/N-SODA.png";
    private static final String LOOKUP_TABLE_PATH_NORMAL_WARM = "filter/normal/N-WARM.png";
    private static final String LOOKUP_TABLE_PATH_STICKER_FILM = "filter/video/S-FILM.png";
    private static final String LOOKUP_TABLE_PATH_STICKER_FOREST = "filter/video/S-FOREST.png";
    private static final String LOOKUP_TABLE_PATH_STICKER_POLAROID = "filter/video/S-POLAROID.png";
    private static final String LOOKUP_TABLE_PATH_STICKER_YEARS = "filter/video/S-YEARS.png";
    private static final String LOOKUP_TABLE_PATH_VIDEO_BYGONE = "filter/video/S-BYGONE.png";
    private static final String TAG = FilterFactory.class.getSimpleName();

    public enum FilterScene {
        AI,
        NORMAL,
        BEAUTY,
        BEAUTY_INDIA,
        STICKER,
        PORTRAIT,
        LIGHTING,
        NONE
    }

    public static BaseOriginalFilter getFilterByType(FilterType filterType) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("getFilterByType: ");
        stringBuilder.append(filterType);
        stringBuilder.append("; ordinal = ");
        stringBuilder.append(filterType.ordinal());
        Log.d(str, stringBuilder.toString());
        switch (filterType) {
            case A1_DOC:
                return new ColorLookupFilter4x4(LOOKUP_TABLE_PATH_AI_SCENE_DOC);
            case A2_FLOWER:
                return new ColorLookupFilter4x4(LOOKUP_TABLE_PATH_AI_SCENE_FLOWER);
            case A3_FOOD:
                return new ColorLookupFilter4x4(LOOKUP_TABLE_PATH_AI_SCENE_FOOD);
            case A4_PPT:
                return new ColorLookupFilter4x4(LOOKUP_TABLE_PATH_AI_SCENE_PPT);
            case A5_SKY:
                return new ColorLookupFilter4x4(LOOKUP_TABLE_PATH_AI_SCENE_SKY);
            case A6_SUNRISE_SUNSET:
                return new ColorLookupFilter4x4(LOOKUP_TABLE_PATH_AI_SCENE_SUNRISE_SUNSET);
            case A7_CAT:
                return new ColorLookupFilter4x4(LOOKUP_TABLE_PATH_AI_SCENE_CAT);
            case A8_DOG:
                return new ColorLookupFilter4x4(LOOKUP_TABLE_PATH_AI_SCENE_DOG);
            case A9_GREEN_PLANTS:
                return new ColorLookupFilter4x4(LOOKUP_TABLE_PATH_AI_SCENE_GREEN_PLANTS);
            case A10_NIGHT:
                return new ColorLookupFilter4x4(LOOKUP_TABLE_PATH_AI_SCENE_NIGHT);
            case A11_SNOW:
                return new ColorLookupFilter4x4(LOOKUP_TABLE_PATH_AI_SCENE_SNOW);
            case A12_SEA:
                return new ColorLookupFilter4x4(LOOKUP_TABLE_PATH_AI_SCENE_SEA);
            case A13_AUTUMN:
                return new ColorLookupFilter4x4(LOOKUP_TABLE_PATH_AI_SCENE_AUTUMN);
            case A14_CANDLELIGHT:
                return new ColorLookupFilter4x4(LOOKUP_TABLE_PATH_AI_SCENE_CANDLELIGHT);
            case A15_CAR:
                return new ColorLookupFilter4x4(LOOKUP_TABLE_PATH_AI_SCENE_CAR);
            case A16_GRASS:
                return new ColorLookupFilter4x4(LOOKUP_TABLE_PATH_AI_SCENE_GRASS);
            case A17_MAPLE_LEAVES:
                return new ColorLookupFilter4x4(LOOKUP_TABLE_PATH_AI_SCENE_MAPLE_LEAVES);
            case A18_SUCCULENT:
                return new ColorLookupFilter4x4(LOOKUP_TABLE_PATH_AI_SCENE_SUCCULENT);
            case A19_BUILDING:
                return new ColorLookupFilter4x4(LOOKUP_TABLE_PATH_AI_SCENE_BUILDING);
            case A20_CITY:
                return new ColorLookupFilter4x4(LOOKUP_TABLE_PATH_AI_SCENE_CITY);
            case A21_CLOUD:
                return new ColorLookupFilter4x4(LOOKUP_TABLE_PATH_AI_SCENE_CLOUD);
            case A22_OVERCAST:
                return new ColorLookupFilter4x4(LOOKUP_TABLE_PATH_AI_SCENE_OVERCAST);
            case A23_BACKLIGHT:
                return new ColorLookupFilter4x4(LOOKUP_TABLE_PATH_AI_SCENE_BACKLIGHT);
            case A24_SILHOUETTE:
                return new ColorLookupFilter4x4(LOOKUP_TABLE_PATH_AI_SCENE_SILHOUETTE);
            case A25_HUMAN:
                return new ColorLookupFilter4x4(LOOKUP_TABLE_PATH_AI_SCENE_HUMAN);
            case A26_JEWELRY:
                return new ColorLookupFilter4x4(LOOKUP_TABLE_PATH_AI_SCENE_JEWELRY);
            case A27_BUDDHA:
                return new ColorLookupFilter4x4(LOOKUP_TABLE_PATH_AI_SCENE_BUDDHA);
            case A28_COW:
                return new ColorLookupFilter4x4(LOOKUP_TABLE_PATH_AI_SCENE_COW);
            case A29_CURRY:
                return new ColorLookupFilter4x4(LOOKUP_TABLE_PATH_AI_SCENE_CURRY);
            case A30_MOTORBIKE:
                return new ColorLookupFilter4x4(LOOKUP_TABLE_PATH_AI_SCENE_MOTORBIKE);
            case A31_TEMPLE:
                return new ColorLookupFilter4x4(LOOKUP_TABLE_PATH_AI_SCENE_TEMPLE);
            case A32_BEACH:
                return new ColorLookupFilter4x4(LOOKUP_TABLE_PATH_AI_SCENE_BEACH);
            case A33_DRIVING:
                return new ColorLookupFilter4x4(LOOKUP_TABLE_PATH_AI_SCENE_DRIVING);
            case L_NATURE:
                return new ColorLookupFilter4x4(LOOKUP_TABLE_PATH_LIGHTING_NATURE);
            case L_STAGE:
                return new ColorLookupFilter4x4(LOOKUP_TABLE_PATH_LIGHTING_STAGE);
            case L_MOVIE:
                return new ColorLookupFilter4x4(LOOKUP_TABLE_PATH_LIGHTING_MOVIE);
            case L_RAINBOW:
                return new ColorLookupFilter4x4(LOOKUP_TABLE_PATH_LIGHTING_RAINBOW);
            case L_SHUTTER:
                return new ColorLookupFilter4x4(LOOKUP_TABLE_PATH_LIGHTING_SHUTTER);
            case L_DOT:
                return new ColorLookupFilter4x4(LOOKUP_TABLE_PATH_LIGHTING_DOT);
            case L_LEAF:
                return new ColorLookupFilter4x4(LOOKUP_TABLE_PATH_LIGHTING_LEAF);
            case N_BERRY:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_NORMAL_BERRY);
            case N_COOKIE:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_NORMAL_COOKIE);
            case N_DELICACY:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_NORMAL_DELICACY);
            case N_FADE:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_NORMAL_FADE);
            case N_FILM:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_NORMAL_FILM);
            case N_KOIZORA:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_NORMAL_KOIZORA);
            case N_LATTE:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_NORMAL_LATTE);
            case N_LIGHT:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_NORMAL_LIGHT);
            case N_LIVELY:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_NORMAL_LIVELY);
            case N_QUIET:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_NORMAL_QUIET);
            case N_SODA:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_NORMAL_SODA);
            case N_WARM:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_NORMAL_WARM);
            case B_FAIRYTALE:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_BEAUTY_FAIRYTALE);
            case B_JAPANESE:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_BEAUTY_JAPANESE);
            case B_MINT:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_BEAUTY_MINT);
            case B_MOOD:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_BEAUTY_MOOD);
            case B_NATURE:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_BEAUTY_NATURE);
            case B_PINK:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_BEAUTY_PINK);
            case B_ROMANCE:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_BEAUTY_ROMANCE);
            case B_MAZE:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_BEAUTY_MAZE);
            case B_WHITEANDBLACK:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_BEAUTY_WHITEANDBLACK);
            case B_STORY:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_BEAUTY_STORY);
            case B_RIDDLE:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_BEAUTY_RIDDLE);
            case B_MOVIE:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_BEAUTY_MOVIE);
            case B_M_TEA:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_BEAUTY_M_TEA);
            case B_M_LILT:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_BEAUTY_M_LILT);
            case B_M_SEPIA:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_BEAUTY_M_SEPIA);
            case B_M_WHITEANDBLACK:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_BEAUTY_M_WHITEANDBLACK);
            case S_FILM:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_STICKER_FILM);
            case S_YEARS:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_STICKER_YEARS);
            case S_POLAROID:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_STICKER_POLAROID);
            case S_FOREST:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_STICKER_FOREST);
            case S_WHITEANDBLACK:
            case N_WHITEANDBLACK:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_COMMON_WHITEANDBLACK);
            case S_BYGONE:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_VIDEO_BYGONE);
            case BI_SUNNY:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_BEAUTY_INDIA_SUNNY);
            case BI_PINK:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_BEAUTY_INDIA_PINK);
            case BI_MEMORY:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_BEAUTY_INDIA_MEMORY);
            case BI_STRONG:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_BEAUTY_INDIA_STRONG);
            case BI_WARM:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_BEAUTY_INDIA_WARM);
            case BI_SWEET:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_BEAUTY_INDIA_SWEET);
            case BI_PORTRAIT:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_BEAUTY_INDIA_PORTRAIT);
            case BI_RETRO:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_BEAUTY_INDIA_RETRO);
            case BI_YOUNG:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_BEAUTY_INDIA_YOUNG);
            case BI_ROMANTIC:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_BEAUTY_INDIA_ROMANTIC);
            case BI_MONO:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_BEAUTY_INDIA_MONO);
            case BI_M_DUSK:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_BEAUTY_INDIA_M_DUSK);
            case BI_M_LILT:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_BEAUTY_INDIA_M_LILT);
            case BI_M_TEA:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_BEAUTY_INDIA_M_TEA);
            case BI_M_SEPIA:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_BEAUTY_INDIA_M_SEPIA);
            case BI_M_WHITEANDBLACK:
                return new ColorLookupFilter(LOOKUP_TABLE_PATH_BEAUTY_INDIA_M_WHITEANDBLACK);
            default:
                return null;
        }
    }

    public static FilterType[] getAllFilters() {
        return FilterType.values();
    }

    public static FilterType[] getFiltersByScene(FilterScene filterScene) {
        List arrayList = new ArrayList();
        for (FilterType filterType : FilterType.values()) {
            if (filterType.getFilterScene() == filterScene) {
                arrayList.add(filterType);
            }
        }
        return (FilterType[]) arrayList.toArray(new FilterType[arrayList.size()]);
    }

    public static int getAllFilterTypeCount() {
        return FilterType.values().length;
    }
}
