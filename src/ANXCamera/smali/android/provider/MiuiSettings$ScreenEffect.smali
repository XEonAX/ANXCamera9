.class public final Landroid/provider/MiuiSettings$ScreenEffect;
.super Ljava/lang/Object;
.source "MiuiSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/provider/MiuiSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ScreenEffect"
.end annotation


# static fields
.field public static final DEFALUT_SCREEN_COLOR:I = 0x2

.field public static final DEFAULT_PAPER_MODE_LEVEL:I

.field public static final DEFAULT_SCREEN_OPTIMIZE_MODE:I

.field public static final DEFAULT_SCREEN_SATURATION:I

.field public static final FLAG_SUPPORT_ADAPT_MODE:I = 0x1

.field public static final FLAG_SUPPORT_ENHANCE_MODE:I = 0x2

.field public static final FLAG_SUPPORT_MONOCHROME_MODE:I = 0x8

.field public static final FLAG_SUPPORT_STANDARD_MODE:I = 0x4

.field public static final GAME_MODE:Ljava/lang/String; = "screen_game_mode"

.field public static final GAME_MODE_DISABLE_EYECARE:I = 0x1

.field public static final GAME_MODE_ENABLE_HDR:I = 0x2

.field public static final MONOCHROME_MODE_DEFAULT:I = 0x2

.field public static final MONOCHROME_MODE_GLOBAL:I = 0x1

.field public static final MONOCHROME_MODE_LOCAL:I = 0x2

.field public static final NIGHT_LIGHT_LEVEL:Ljava/lang/String; = "night_light_level"

.field public static final PAPER_MODE_AUTO_TWILIGHT:I = 0x1

.field public static final PAPER_MODE_CUSTOMIZE_TIME:I = 0x2

.field public static final PAPER_MODE_DEFAULT:I = 0x1

.field public static final PAPER_MODE_GLOBAL:I = 0x1

.field public static final PAPER_MODE_LOCAL:I = 0x2

.field public static final PAPER_MODE_MAX_LEVEL:I

.field public static final PAPER_MODE_SCHEDULER_TYPE:Ljava/lang/String; = "paper_mode_scheduler_type"

.field public static final PAPER_MODE_TIME_CANCEL:I = 0x0

.field public static final PROPERTY_SCREEN_PAPER_MODE_LEVEL:Ljava/lang/String; = "persist.sys.eyecare_cache"

.field public static final SCREEN_COLOR_COOL:I = 0x3

.field public static final SCREEN_COLOR_LEVEL:Ljava/lang/String; = "screen_color_level"

.field public static final SCREEN_COLOR_NATURE:I = 0x2

.field public static final SCREEN_COLOR_SELECTED:Ljava/lang/String; = "screen_color_selected"

.field public static final SCREEN_COLOR_WARM:I = 0x1

.field public static final SCREEN_EFFECT_SUPPORTED:I

.field public static final SCREEN_MONOCHROME_MODE:Ljava/lang/String; = "screen_monochrome_mode"

.field public static final SCREEN_MONOCHROME_MODE_ENABLED:Ljava/lang/String; = "screen_monochrome_mode_enabled"

.field public static final SCREEN_MONOCHROME_MODE_ENABLED_DEFAULT:Z = false

.field public static final SCREEN_MONOCHROME_MODE_WHITE_LIST:Ljava/lang/String; = "screen_monochrome_mode_white_list"

.field public static final SCREEN_OPTIMIZE_ADAPT:I = 0x1

.field public static final SCREEN_OPTIMIZE_ENHANCE:I = 0x2

.field public static final SCREEN_OPTIMIZE_MODE:Ljava/lang/String; = "screen_optimize_mode"

.field public static final SCREEN_OPTIMIZE_STANDARD:I = 0x3

.field public static final SCREEN_PAPER_MODE:Ljava/lang/String; = "screen_paper_mode"

.field public static final SCREEN_PAPER_MODE_ENABLED:Ljava/lang/String; = "screen_paper_mode_enabled"

.field public static final SCREEN_PAPER_MODE_ENABLED_DEFAULT:Z = false

.field public static final SCREEN_PAPER_MODE_LEVEL:Ljava/lang/String; = "screen_paper_mode_level"

.field public static final SCREEN_PAPER_MODE_TIME_ENABLED:Ljava/lang/String; = "screen_paper_mode_time_enabled"

.field public static final SCREEN_PAPER_MODE_TIME_ENABLED_DEFAULT:Z = false

.field public static final SCREEN_PAPER_MODE_TIME_END:Ljava/lang/String; = "screen_paper_mode_time_end"

.field public static final SCREEN_PAPER_MODE_TIME_START:Ljava/lang/String; = "screen_paper_mode_time_start"

.field public static final SCREEN_PAPER_MODE_TWILIGHT_END:Ljava/lang/String; = "screen_paper_mode_twilight_end"

.field public static final SCREEN_PAPER_MODE_TWILIGHT_END_DEAULT:I = 0x438

.field public static final SCREEN_PAPER_MODE_TWILIGHT_START:Ljava/lang/String; = "screen_paper_mode_twilight_start"

.field public static final SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT:I = 0x168

.field public static final SCREEN_PAPER_MODE_WHITE_LIST:Ljava/lang/String; = "screen_paper_mode_white_list"

.field public static final SCREEN_SATURATION_STANDARD:I = 0xa

.field public static final SCREEN_SATURATION_VIVID:I = 0xb

.field public static final isScreenPaperModeSupported:Z


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .line 6645
    const-string/jumbo v0, "screen_effect_supported"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getInteger(Ljava/lang/String;I)I

    move-result v0

    sput v0, Landroid/provider/MiuiSettings$ScreenEffect;->SCREEN_EFFECT_SUPPORTED:I

    .line 6675
    invoke-static {}, Landroid/provider/MiuiSettings$ScreenEffect;->getDefaultScreenOptimizeMode()I

    move-result v0

    sput v0, Landroid/provider/MiuiSettings$ScreenEffect;->DEFAULT_SCREEN_OPTIMIZE_MODE:I

    .line 6677
    const-string/jumbo v0, "support_screen_paper_mode"

    .line 6678
    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Landroid/provider/MiuiSettings$ScreenEffect;->isScreenPaperModeSupported:Z

    .line 6689
    invoke-static {}, Landroid/provider/MiuiSettings$ScreenEffect;->getDefaultSaturation()I

    move-result v0

    sput v0, Landroid/provider/MiuiSettings$ScreenEffect;->DEFAULT_SCREEN_SATURATION:I

    .line 6713
    const-string/jumbo v0, "sys.paper_mode_max_level"

    const-string/jumbo v1, "paper_mode_max_level"

    .line 6714
    const/high16 v2, 0x41000000    # 8.0f

    invoke-static {v1, v2}, Lmiui/util/FeatureParser;->getFloat(Ljava/lang/String;F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 6713
    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    sput v0, Landroid/provider/MiuiSettings$ScreenEffect;->PAPER_MODE_MAX_LEVEL:I

    .line 6716
    const-string/jumbo v0, "sys.paper_mode_default_level"

    sget v1, Landroid/provider/MiuiSettings$ScreenEffect;->PAPER_MODE_MAX_LEVEL:I

    div-int/lit8 v1, v1, 0x8

    mul-int/lit8 v1, v1, 0x5

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    sput v0, Landroid/provider/MiuiSettings$ScreenEffect;->DEFAULT_PAPER_MODE_LEVEL:I

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 6625
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getDefaultSaturation()I
    .registers 3

    .line 6692
    const/16 v0, 0xa

    .line 6693
    .local v0, "defaultSaturation":I
    const-string v1, "is_hongmi"

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_d

    .line 6694
    const/16 v0, 0xb

    .line 6696
    :cond_d
    const-string v1, "display_ce"

    invoke-static {v1, v0}, Lmiui/util/FeatureParser;->getInteger(Ljava/lang/String;I)I

    move-result v1

    return v1
.end method

.method private static getDefaultScreenOptimizeMode()I
    .registers 2

    .line 6681
    sget v0, Landroid/provider/MiuiSettings$ScreenEffect;->SCREEN_EFFECT_SUPPORTED:I

    const/4 v1, 0x1

    and-int/2addr v0, v1

    if-nez v0, :cond_8

    .line 6682
    const/4 v1, 0x2

    nop

    .line 6681
    :cond_8
    return v1
.end method

.method public static getScreenModePkgList(Landroid/content/Context;Ljava/lang/String;)Ljava/util/HashMap;
    .registers 12
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "screenModePkgList"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 6730
    nop

    .line 6731
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 6730
    const/4 v1, -0x2

    invoke-static {v0, p1, v1}, Landroid/provider/Settings$System;->getStringForUser(Landroid/content/ContentResolver;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    .line 6733
    .local v0, "packageList":Ljava/lang/String;
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 6734
    .local v1, "pkg2PaperMode":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Boolean;>;"
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_3e

    .line 6735
    const-string v2, ","

    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 6736
    .local v2, "packageArr":[Ljava/lang/String;
    if-eqz v2, :cond_3e

    .line 6737
    const/4 v3, 0x0

    move v4, v3

    .local v4, "i":I
    :goto_1f
    array-length v5, v2

    if-ge v4, v5, :cond_3e

    .line 6738
    aget-object v5, v2, v4

    .line 6739
    .local v5, "pair":Ljava/lang/String;
    const/16 v6, 0x3d

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    .line 6740
    .local v6, "equalIndex":I
    invoke-virtual {v5, v3, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 6741
    .local v7, "pairKey":Ljava/lang/String;
    add-int/lit8 v8, v6, 0x1

    invoke-virtual {v5, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    .line 6742
    .local v8, "pairValue":Ljava/lang/String;
    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v9

    invoke-virtual {v1, v7, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6737
    .end local v5    # "pair":Ljava/lang/String;
    .end local v6    # "equalIndex":I
    .end local v7    # "pairKey":Ljava/lang/String;
    .end local v8    # "pairValue":Ljava/lang/String;
    add-int/lit8 v4, v4, 0x1

    goto :goto_1f

    .line 6746
    .end local v2    # "packageArr":[Ljava/lang/String;
    .end local v4    # "i":I
    :cond_3e
    return-object v1
.end method

.method public static isInPaperModeTimeSchedule(Landroid/content/Context;II)Z
    .registers 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "startTime"    # I
    .param p2, "endTime"    # I

    .line 6790
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 6791
    .local v0, "calendar":Ljava/util/Calendar;
    const/16 v1, 0xb

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v1

    .line 6792
    .local v1, "hour":I
    const/16 v2, 0xc

    invoke-virtual {v0, v2}, Ljava/util/Calendar;->get(I)I

    move-result v2

    .line 6793
    .local v2, "minute":I
    mul-int/lit8 v3, v1, 0x3c

    add-int/2addr v3, v2

    .line 6794
    .local v3, "now":I
    const/4 v4, 0x0

    .line 6796
    .local v4, "isIn":Z
    if-le p1, p2, :cond_1e

    .line 6798
    if-lt v3, p2, :cond_1c

    if-ge v3, p1, :cond_1c

    .line 6800
    const/4 v4, 0x0

    goto :goto_27

    .line 6803
    :cond_1c
    const/4 v4, 0x1

    goto :goto_27

    .line 6805
    :cond_1e
    if-ge p1, p2, :cond_27

    .line 6806
    if-lt v3, p1, :cond_26

    if-ge v3, p2, :cond_26

    .line 6808
    const/4 v4, 0x1

    goto :goto_27

    .line 6811
    :cond_26
    const/4 v4, 0x0

    .line 6816
    :cond_27
    :goto_27
    return v4
.end method

.method public static isScreenPaperMode()Z
    .registers 1

    .line 6631
    invoke-static {}, Lmiui/hareware/display/DisplayFeatureManager;->getInstance()Lmiui/hareware/display/DisplayFeatureManager;

    move-result-object v0

    invoke-virtual {v0}, Lmiui/hareware/display/DisplayFeatureManager;->getEyeCare()I

    move-result v0

    if-lez v0, :cond_c

    const/4 v0, 0x1

    goto :goto_d

    :cond_c
    const/4 v0, 0x0

    :goto_d
    return v0
.end method

.method public static setScreenModePkgList(Landroid/content/Context;Ljava/util/HashMap;Ljava/lang/String;)V
    .registers 9
    .param p0, "context"    # Landroid/content/Context;
    .param p2, "screenModePkgList"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 6750
    .local p1, "pkg2PaperMode":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Boolean;>;"
    if-eqz p1, :cond_51

    invoke-virtual {p1}, Ljava/util/HashMap;->size()I

    move-result v0

    if-nez v0, :cond_9

    goto :goto_51

    .line 6754
    :cond_9
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 6755
    .local v0, "buffer":Ljava/lang/StringBuilder;
    invoke-virtual {p1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 6756
    .local v1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Boolean;>;>;"
    :goto_16
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_45

    .line 6757
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 6758
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Boolean;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 6759
    .local v3, "key":Ljava/lang/String;
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 6761
    const/16 v4, 0x3d

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 6762
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    .line 6763
    .local v4, "value":Ljava/lang/Boolean;
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 6765
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_44

    .line 6766
    const-string v5, ","

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 6768
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Boolean;>;"
    .end local v3    # "key":Ljava/lang/String;
    .end local v4    # "value":Ljava/lang/Boolean;
    :cond_44
    goto :goto_16

    .line 6769
    :cond_45
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    .line 6770
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 6769
    invoke-static {v2, p2, v3}, Landroid/provider/Settings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 6771
    return-void

    .line 6751
    .end local v0    # "buffer":Ljava/lang/StringBuilder;
    .end local v1    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Boolean;>;>;"
    :cond_51
    :goto_51
    return-void
.end method

.method public static setScreenPaperMode(Z)V
    .registers 3
    .param p0, "isScreenPaperMode"    # Z

    .line 6636
    if-eqz p0, :cond_13

    .line 6637
    const-string/jumbo v0, "persist.sys.eyecare_cache"

    sget v1, Landroid/provider/MiuiSettings$ScreenEffect;->DEFAULT_PAPER_MODE_LEVEL:I

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 6639
    .local v0, "level":I
    invoke-static {}, Lmiui/hareware/display/DisplayFeatureManager;->getInstance()Lmiui/hareware/display/DisplayFeatureManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Lmiui/hareware/display/DisplayFeatureManager;->setEyeCare(I)V

    .line 6640
    .end local v0    # "level":I
    goto :goto_1b

    .line 6641
    :cond_13
    invoke-static {}, Lmiui/hareware/display/DisplayFeatureManager;->getInstance()Lmiui/hareware/display/DisplayFeatureManager;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lmiui/hareware/display/DisplayFeatureManager;->setEyeCare(I)V

    .line 6643
    :goto_1b
    return-void
.end method
