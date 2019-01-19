.class public final Lcom/android/camera/Util;
.super Ljava/lang/Object;
.source "Util.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/Util$ImageFileNamer;
    }
.end annotation


# static fields
.field public static final ACTION_BIND_GALLERY_SERVICE:Ljava/lang/String; = "com.miui.gallery.action.BIND_SERVICE"

.field public static final ACTION_DISMISS_KEY_GUARD:Ljava/lang/String; = "xiaomi.intent.action.SHOW_SECURE_KEYGUARD"

.field public static final ACTION_KILL_CAMERA_SERVICE:Ljava/lang/String; = "com.android.camera.action.KILL_CAMERA_SERVICE"

.field public static final ALGORITHM_NAME_PORTRAIT:Ljava/lang/String; = "portrait"

.field public static final ALGORITHM_NAME_SOFT_PORTRAIT:Ljava/lang/String; = "soft-portrait"

.field public static final ALGORITHM_NAME_SOFT_PORTRAIT_ENCRYPTED:Ljava/lang/String; = "soft-portrait-enc"

.field private static ANTIBANDING_60_COUNTRY:Ljava/util/HashSet; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final ASPECT_TOLERANCE:D = 0.02

.field public static final BLUR_DURATION:I = 0x64

.field private static final COLOR_TEMPERATURE_LIST:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final COLOR_TEMPERATURE_MAP:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final DEBUG:Z

.field public static final EXTRAS_SKIP_LOCK:Ljava/lang/String; = "skip_interception"

.field private static final EXTRAS_START_WITH_EFFECT_RENDER:Ljava/lang/String; = "android.intent.extras.START_WITH_EFFECT_RENDER"

.field public static final FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS:I = -0x80000000

.field private static final FORCE_CAMERA_0_FILE:Ljava/lang/String; = "force_camera_0"

.field private static final FORCE_NAME_SUFFIX_FILE:Ljava/lang/String; = "force_name_suffix"

.field public static final GOING_TO_CROP:I = 0x5

.field public static final GOING_TO_DETAIL:I = 0x3

.field public static final GOING_TO_GALLERY:I = 0x1

.field public static final GOING_TO_PLAYBACK:I = 0x4

.field public static final GOING_TO_SETTING:I = 0x2

.field private static final INTERNAL_STORAGE_DIRECTORY:Ljava/io/File;

.field public static final KEYCODE_SLIDE_OFF:I = 0x2bd

.field public static final KEYCODE_SLIDE_ON:I = 0x2bc

.field public static final KEY_CAMERA_BRIGHTNESS:Ljava/lang/String; = "camera-brightness"

.field public static final KEY_CAMERA_BRIGHTNESS_AUTO:Ljava/lang/String; = "camera-brightness-auto"

.field public static final KEY_CAMERA_BRIGHTNESS_MANUAL:Ljava/lang/String; = "camera-brightness-manual"

.field public static final KEY_KILLED_MODULE_INDEX:Ljava/lang/String; = "killed-moduleIndex"

.field public static final KEY_REVIEW_FROM_MIUICAMERA:Ljava/lang/String; = "from_MiuiCamera"

.field public static final KEY_SECURE_ITEMS:Ljava/lang/String; = "SecureUri"

.field private static final LAB_OPTIONS_VISIBLE_FILE:Ljava/lang/String; = "lab_options_visible"

.field public static final LAST_FRAME_GAUSSIAN_FILE_NAME:Ljava/lang/String; = "blur.jpg"

.field public static final LIMIT_SURFACE_WIDTH:I = 0x2d0

.field public static final MAX_SECURE_SIZE:I = 0x64

.field private static final NONUI_MODE_PROPERTY:Ljava/lang/String; = "sys.power.nonui"

.field public static final ORIENTATION_HYSTERESIS:I = 0x5

.field public static final QRCODE_RECEIVER_ACTION:Ljava/lang/String; = "com.xiaomi.scanner.receiver.senderbarcodescanner"

.field public static final RATIO_16_9:F = 1.77f

.field public static final RATIO_18_9:F = 2.0f

.field public static final RATIO_19P5_9:F = 2.16f

.field public static final RATIO_1_1:F = 1.0f

.field public static final RATIO_4_3:F = 1.33f

.field public static final REVIEW_ACTION:Ljava/lang/String; = "com.android.camera.action.REVIEW"

.field public static final REVIEW_ACTIVITY_PACKAGE:Ljava/lang/String; = "com.miui.gallery"

.field public static final REVIEW_SCAN_RESULT_PACKAGE:Ljava/lang/String; = "com.xiaomi.scanner"

.field public static final SCREEN_EFFECT_CAMERA_STATE:I = 0xe

.field public static final SCREEN_SLIDE_STATUS_SETTING_URI:Landroid/net/Uri;

.field private static final SCREEN_VENDOR:Ljava/lang/String;

.field private static final TAG:Ljava/lang/String; = "CameraUtil"

.field private static final TEMP_SUFFIX:Ljava/lang/String; = ".tmp"

.field public static final WATERMARK_48M_FILE_NAME:Ljava/lang/String;

.field public static final WATERMARK_FILE_NAME:Ljava/lang/String;

.field private static final ZOOM_ANIMATION_PROPERTY:Ljava/lang/String; = "camera_zoom_animation"

.field public static isLongRatioScreen:Z

.field public static isNotchDevice:Z

.field private static mCountryIso:Ljava/lang/String;

.field private static mLockedOrientation:I

.field private static sClearMemoryLimit:Z

.field public static sFullScreenExtraMargin:I

.field private static sHasNavigationBar:Z

.field private static sImageFileNamer:Lcom/android/camera/Util$ImageFileNamer;

.field private static sIsAccessibilityEnable:Z

.field public static sIsDumpLog:Z

.field public static sIsDumpOrigJpg:Z

.field private static sIsForceNameSuffix:Ljava/lang/Boolean;

.field public static sIsFullScreenNavBarHidden:Z

.field public static sIsKillCameraService:Z

.field private static sIsLabOptionsVisible:Ljava/lang/Boolean;

.field public static sNavigationBarHeight:I

.field private static sPixelDensity:F

.field public static sStatusBarHeight:I

.field private static sTypefaces:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Landroid/graphics/Typeface;",
            ">;"
        }
    .end annotation
.end field

.field public static sWindowHeight:I

.field private static sWindowManager:Landroid/view/IWindowManager;

.field public static sWindowWidth:I


# direct methods
.method private static synthetic $closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V
    .locals 0

    .line 2783
    if-eqz p0, :cond_0

    :try_start_0
    invoke-interface {p1}, Ljava/lang/AutoCloseable;->close()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_0
    invoke-interface {p1}, Ljava/lang/AutoCloseable;->close()V

    :goto_0
    return-void
.end method

.method static constructor <clinit>()V
    .locals 10

    .line 210
    const-string v0, "sys.panel.display"

    invoke-static {v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/Util;->SCREEN_VENDOR:Ljava/lang/String;

    .line 211
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/android/camera/Util;->COLOR_TEMPERATURE_LIST:Ljava/util/List;

    .line 212
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/android/camera/Util;->COLOR_TEMPERATURE_MAP:Ljava/util/List;

    .line 220
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "_custom_watermark.png"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/Util;->WATERMARK_FILE_NAME:Ljava/lang/String;

    .line 221
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "_48m_custom_watermark.png"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/Util;->WATERMARK_48M_FILE_NAME:Ljava/lang/String;

    .line 224
    const/high16 v0, 0x3f800000    # 1.0f

    sput v0, Lcom/android/camera/Util;->sPixelDensity:F

    .line 225
    const/16 v0, 0x2d0

    sput v0, Lcom/android/camera/Util;->sWindowWidth:I

    .line 226
    const/16 v0, 0x438

    sput v0, Lcom/android/camera/Util;->sWindowHeight:I

    .line 234
    new-instance v0, Ljava/io/File;

    const-string v1, "/data/sdcard"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/android/camera/Util;->INTERNAL_STORAGE_DIRECTORY:Ljava/io/File;

    .line 236
    const-string v0, "sc_status"

    invoke-static {v0}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/android/camera/Util;->SCREEN_SLIDE_STATUS_SETTING_URI:Landroid/net/Uri;

    .line 239
    sget-boolean v0, Lmiui/os/Build;->IS_STABLE_VERSION:Z

    xor-int/lit8 v0, v0, 0x1

    sput-boolean v0, Lcom/android/camera/Util;->DEBUG:Z

    .line 243
    new-instance v0, Ljava/util/HashSet;

    const-string v1, "TW"

    const-string v2, "KR"

    const-string v3, "SA"

    const-string v4, "US"

    const-string v5, "CA"

    const-string v6, "BR"

    const-string v7, "CO"

    const-string v8, "MX"

    const-string v9, "PH"

    filled-new-array/range {v1 .. v9}, [Ljava/lang/String;

    move-result-object v1

    .line 244
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lcom/android/camera/Util;->ANTIBANDING_60_COUNTRY:Ljava/util/HashSet;

    .line 245
    const/4 v0, 0x0

    sput-object v0, Lcom/android/camera/Util;->mCountryIso:Ljava/lang/String;

    .line 246
    const/4 v0, -0x1

    sput v0, Lcom/android/camera/Util;->mLockedOrientation:I

    .line 1368
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/android/camera/Util;->sTypefaces:Ljava/util/HashMap;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 260
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 261
    return-void
.end method

.method public static Assert(Z)V
    .locals 0

    .line 563
    if-eqz p0, :cond_0

    .line 566
    return-void

    .line 564
    :cond_0
    new-instance p0, Ljava/lang/AssertionError;

    invoke-direct {p0}, Ljava/lang/AssertionError;-><init>()V

    throw p0
.end method

.method public static UI_DEBUG()Z
    .locals 1

    .line 3022
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fx()Z

    move-result v0

    .line 3023
    if-nez v0, :cond_1

    sget-boolean v0, Lcom/mi/config/b;->qP:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method private static addDebugInfo(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1672
    const-string v0, ""

    .line 1673
    if-eqz p0, :cond_0

    .line 1674
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\t "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 1675
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "\n"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1677
    :cond_0
    return-object v0
.end method

.method private static addProperties(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1663
    const-string v0, ""

    .line 1664
    invoke-static {p0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 1665
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\t "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 1666
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "\n"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1668
    :cond_0
    return-object v0
.end method

.method public static appendInApi26(Landroid/text/SpannableStringBuilder;Ljava/lang/CharSequence;Ljava/lang/Object;I)Landroid/text/SpannableStringBuilder;
    .locals 1

    .line 2005
    invoke-virtual {p0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v0

    .line 2006
    invoke-virtual {p0, p1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 2007
    invoke-virtual {p0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result p1

    invoke-virtual {p0, p2, v0, p1, p3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 2008
    return-object p0
.end method

.method public static binarySearchRightMost(Ljava/util/List;Ljava/lang/Object;)I
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "+",
            "Ljava/lang/Comparable<",
            "-TT;>;>;TT;)I"
        }
    .end annotation

    .line 1812
    nop

    .line 1813
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    .line 1815
    const/4 v1, 0x0

    :goto_0
    if-gt v1, v0, :cond_1

    .line 1816
    add-int v2, v1, v0

    div-int/lit8 v2, v2, 0x2

    .line 1817
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Comparable;

    invoke-interface {v3, p1}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v3

    .line 1818
    if-ltz v3, :cond_0

    .line 1819
    add-int/lit8 v2, v2, -0x1

    .line 1823
    move v0, v2

    goto :goto_1

    .line 1821
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 1823
    move v1, v2

    :goto_1
    goto :goto_0

    .line 1824
    :cond_1
    return v1
.end method

.method public static broadcastKillService(Landroid/content/Context;)V
    .locals 6

    .line 1175
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    .line 1176
    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->setBroadcastKillServiceTime(J)V

    .line 1177
    new-instance v2, Landroid/content/Intent;

    const-string v3, "com.android.camera.action.KILL_CAMERA_SERVICE"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1178
    const-string v3, "time"

    const-wide/16 v4, 0x7d0

    add-long/2addr v0, v4

    invoke-virtual {v2, v3, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 1179
    const-string v0, "process_name"

    const-string v1, "android.hardware.camera.provider@2.4-service"

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    .line 1180
    invoke-virtual {p0, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 1181
    invoke-static {}, Lcom/android/camera/statistic/CameraStatUtil;->trackBroadcastKillService()V

    .line 1182
    return-void
.end method

.method public static broadcastNewPicture(Landroid/content/Context;Landroid/net/Uri;)V
    .locals 2

    .line 1167
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    if-ge v0, v1, :cond_0

    .line 1168
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.hardware.action.NEW_PICTURE"

    invoke-direct {v0, v1, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 1170
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.android.camera.NEW_PICTURE"

    invoke-direct {v0, v1, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 1172
    :cond_0
    return-void
.end method

.method public static calcDualCameraWatermarkLocation(IIIIFFF)[I
    .locals 2

    .line 3078
    invoke-static {p0, p1}, Ljava/lang/Math;->min(II)I

    move-result p0

    .line 3079
    int-to-float p0, p0

    const/high16 p1, 0x44870000    # 1080.0f

    div-float/2addr p0, p1

    .line 3081
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p1

    invoke-virtual {p1}, Lcom/mi/config/a;->fE()Z

    move-result p1

    .line 3082
    const/high16 v0, 0x3f800000    # 1.0f

    if-eqz p1, :cond_0

    .line 3083
    const v1, 0x7f0a012e

    invoke-static {v1, v0}, Lcom/android/camera/CameraSettings;->getResourceFloat(IF)F

    move-result v1

    goto :goto_0

    .line 3084
    :cond_0
    nop

    .line 3085
    move v1, v0

    :goto_0
    mul-float/2addr p4, p0

    mul-float/2addr p4, v1

    invoke-static {p4}, Ljava/lang/Math;->round(F)I

    move-result p4

    and-int/lit8 p4, p4, -0x2

    .line 3086
    mul-int/2addr p2, p4

    div-int/2addr p2, p3

    and-int/lit8 p2, p2, -0x2

    .line 3087
    mul-float/2addr p5, p0

    invoke-static {p5}, Ljava/lang/Math;->round(F)I

    move-result p3

    and-int/lit8 p3, p3, -0x2

    .line 3089
    if-eqz p1, :cond_1

    .line 3090
    const p1, 0x7f0a012f

    invoke-static {p1, v0}, Lcom/android/camera/CameraSettings;->getResourceFloat(IF)F

    move-result v0

    goto :goto_1

    .line 3091
    :cond_1
    nop

    .line 3092
    :goto_1
    mul-float/2addr p6, p0

    mul-float/2addr p6, v0

    invoke-static {p6}, Ljava/lang/Math;->round(F)I

    move-result p0

    and-int/lit8 p0, p0, -0x2

    .line 3094
    const/4 p1, 0x4

    new-array p1, p1, [I

    const/4 p5, 0x0

    aput p2, p1, p5

    const/4 p2, 0x1

    aput p4, p1, p2

    const/4 p2, 0x2

    aput p3, p1, p2

    const/4 p2, 0x3

    aput p0, p1, p2

    return-object p1
.end method

.method public static calcNavigationBarHeight(Landroid/content/Context;)I
    .locals 3

    .line 1754
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    .line 1755
    const v0, 0x7f0a0055

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p0

    .line 1756
    sget v0, Lcom/android/camera/Util;->sWindowHeight:I

    sget v1, Lcom/android/camera/Util;->sWindowWidth:I

    mul-int/lit8 v1, v1, 0x10

    div-int/lit8 v1, v1, 0x9

    sub-int/2addr v0, v1

    .line 1757
    if-lez v0, :cond_0

    .line 1758
    sub-int/2addr v0, p0

    goto :goto_0

    .line 1760
    :cond_0
    const/4 v0, 0x0

    .line 1762
    :goto_0
    const-string p0, "CameraUtil"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "calculate navBarHeight="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1763
    return v0
.end method

.method public static final calculateDefaultPreviewEdgeSlop(Landroid/content/Context;)I
    .locals 3

    .line 1977
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 1978
    iget v1, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v1, v1

    iget v2, v0, Landroid/util/DisplayMetrics;->xdpi:F

    div-float/2addr v1, v2

    .line 1979
    iget v2, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v2, v2

    iget v0, v0, Landroid/util/DisplayMetrics;->ydpi:F

    div-float/2addr v2, v0

    .line 1980
    mul-float/2addr v1, v1

    mul-float/2addr v2, v2

    add-float/2addr v1, v2

    float-to-double v0, v1

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float v0, v0

    .line 1982
    const/high16 v1, 0x40a00000    # 5.0f

    cmpg-float v0, v0, v1

    if-gez v0, :cond_0

    .line 1984
    const v0, 0x7f0a00a8

    goto :goto_0

    .line 1986
    :cond_0
    const v0, 0x7f0a00a9

    .line 1988
    :goto_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p0

    return p0
.end method

.method public static checkDeviceHasNavigationBar(Landroid/content/Context;)Z
    .locals 1

    .line 1777
    sget-object p0, Lcom/android/camera/Util;->sWindowManager:Landroid/view/IWindowManager;

    if-nez p0, :cond_0

    .line 1778
    const-string p0, "window"

    .line 1779
    invoke-static {p0}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object p0

    .line 1778
    invoke-static {p0}, Landroid/view/IWindowManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/view/IWindowManager;

    move-result-object p0

    sput-object p0, Lcom/android/camera/Util;->sWindowManager:Landroid/view/IWindowManager;

    .line 1781
    :try_start_0
    sget-object p0, Lcom/android/camera/Util;->sWindowManager:Landroid/view/IWindowManager;

    invoke-interface {p0}, Landroid/view/IWindowManager;->hasNavigationBar()Z

    move-result p0

    sput-boolean p0, Lcom/android/camera/Util;->sHasNavigationBar:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1784
    goto :goto_0

    .line 1782
    :catch_0
    move-exception p0

    .line 1783
    const-string p0, "CameraUtil"

    const-string v0, "checkDeviceHasNavigationBar exception"

    invoke-static {p0, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1786
    :cond_0
    :goto_0
    sget-boolean p0, Lcom/android/camera/Util;->sHasNavigationBar:Z

    return p0
.end method

.method public static checkLockedOrientation(Landroid/app/Activity;)V
    .locals 2

    .line 691
    :try_start_0
    invoke-virtual {p0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "accelerometer_rotation"

    invoke-static {v0, v1}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I

    move-result v0

    .line 693
    if-nez v0, :cond_0

    .line 694
    invoke-virtual {p0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    const-string v0, "user_rotation"

    invoke-static {p0, v0}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I

    move-result p0

    sput p0, Lcom/android/camera/Util;->mLockedOrientation:I

    goto :goto_0

    .line 697
    :cond_0
    const/4 p0, -0x1

    sput p0, Lcom/android/camera/Util;->mLockedOrientation:I
    :try_end_0
    .catch Landroid/provider/Settings$SettingNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 701
    :goto_0
    goto :goto_1

    .line 699
    :catch_0
    move-exception p0

    .line 700
    const-string p0, "CameraUtil"

    const-string v0, "user rotation cannot found"

    invoke-static {p0, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 702
    :goto_1
    return-void
.end method

.method public static checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)TT;"
        }
    .end annotation

    .line 644
    if-eqz p0, :cond_0

    .line 647
    return-object p0

    .line 645
    :cond_0
    new-instance p0, Ljava/lang/NullPointerException;

    invoke-direct {p0}, Ljava/lang/NullPointerException;-><init>()V

    throw p0
.end method

.method public static clamp(FFF)F
    .locals 1

    .line 677
    cmpl-float v0, p0, p2

    if-lez v0, :cond_0

    return p2

    .line 678
    :cond_0
    cmpg-float p2, p0, p1

    if-gez p2, :cond_1

    return p1

    .line 679
    :cond_1
    return p0
.end method

.method public static clamp(III)I
    .locals 0

    .line 671
    if-le p0, p2, :cond_0

    return p2

    .line 672
    :cond_0
    if-ge p0, p1, :cond_1

    return p1

    .line 673
    :cond_1
    return p0
.end method

.method public static clamp(JJJ)J
    .locals 1

    .line 683
    cmp-long v0, p0, p4

    if-lez v0, :cond_0

    return-wide p4

    .line 684
    :cond_0
    cmp-long p4, p0, p2

    if-gez p4, :cond_1

    return-wide p2

    .line 685
    :cond_1
    return-wide p0
.end method

.method public static clearMemoryLimit()V
    .locals 7

    .line 354
    sget-boolean v0, Lcom/android/camera/Util;->sClearMemoryLimit:Z

    if-nez v0, :cond_0

    .line 355
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 356
    invoke-static {}, Ldalvik/system/VMRuntime;->getRuntime()Ldalvik/system/VMRuntime;

    move-result-object v2

    invoke-virtual {v2}, Ldalvik/system/VMRuntime;->clearGrowthLimit()V

    .line 357
    const/4 v2, 0x1

    sput-boolean v2, Lcom/android/camera/Util;->sClearMemoryLimit:Z

    .line 358
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 359
    const-string v4, "CameraUtil"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "clearMemoryLimit() consume:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sub-long/2addr v2, v0

    invoke-virtual {v5, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 361
    :cond_0
    return-void
.end method

.method public static closeSafely(Ljava/io/Closeable;)V
    .locals 0

    .line 2244
    if-eqz p0, :cond_0

    .line 2246
    :try_start_0
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2249
    goto :goto_0

    .line 2247
    :catch_0
    move-exception p0

    .line 2248
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 2251
    :cond_0
    :goto_0
    return-void
.end method

.method public static closeSilently(Ljava/io/Closeable;)V
    .locals 0

    .line 554
    if-nez p0, :cond_0

    return-void

    .line 556
    :cond_0
    :try_start_0
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 559
    goto :goto_0

    .line 557
    :catch_0
    move-exception p0

    .line 560
    :goto_0
    return-void
.end method

.method public static composeDepthMapPicture([B[B[BZILjava/lang/String;IIZZLcom/xiaomi/camera/core/PictureInfo;)[B
    .locals 19

    move-object/from16 v0, p2

    move-object/from16 v1, p5

    move/from16 v2, p6

    move/from16 v3, p7

    .line 2884
    const-string v4, "CameraUtil"

    const-string v5, "composeDepthMapPicture: process in portrait depth map picture"

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2885
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 2886
    new-instance v6, Lcom/android/camera2/ArcsoftDepthMap;

    move-object/from16 v7, p1

    invoke-direct {v6, v7}, Lcom/android/camera2/ArcsoftDepthMap;-><init>([B)V

    .line 2888
    nop

    .line 2889
    const/4 v7, 0x4

    new-array v10, v7, [I

    .line 2890
    const/4 v8, 0x0

    if-eqz p3, :cond_0

    .line 2891
    invoke-static {v2, v3, v10}, Lcom/android/camera/Util;->getDualCameraWatermarkData(II[I)[B

    move-result-object v9

    goto :goto_0

    .line 2894
    :cond_0
    move-object v9, v8

    .line 2895
    :goto_0
    new-array v12, v7, [I

    .line 2896
    if-eqz v1, :cond_1

    .line 2897
    const-string v7, "CameraUtil"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "generate a TimeWaterMarkData with :"

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v11, "x"

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2898
    invoke-static {v2, v3, v1, v12}, Lcom/android/camera/Util;->getTimeWaterMarkData(IILjava/lang/String;[I)[B

    move-result-object v1

    .line 2901
    move-object v11, v1

    goto :goto_1

    :cond_1
    move-object v11, v8

    :goto_1
    invoke-virtual {v6}, Lcom/android/camera2/ArcsoftDepthMap;->getDepthMapData()[B

    move-result-object v1

    .line 2902
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mi/config/a;->fK()I

    move-result v7

    .line 2903
    array-length v2, v0

    array-length v3, v1

    move-object/from16 v8, p0

    move/from16 v13, p4

    move/from16 v14, p8

    move/from16 v15, p9

    move-object/from16 v16, p10

    move/from16 v17, v2

    move/from16 v18, v3

    invoke-virtual/range {v6 .. v18}, Lcom/android/camera2/ArcsoftDepthMap;->writePortraitExif(I[B[B[I[B[IIZZLcom/xiaomi/camera/core/PictureInfo;II)[B

    move-result-object v2

    .line 2907
    array-length v3, v2

    array-length v6, v0

    add-int/2addr v3, v6

    array-length v6, v1

    add-int/2addr v3, v6

    new-array v3, v3, [B

    .line 2909
    array-length v6, v2

    const/4 v7, 0x0

    invoke-static {v2, v7, v3, v7, v6}, Ljava/lang/System;->arraycopy([BI[BII)V

    .line 2911
    array-length v6, v2

    array-length v8, v0

    invoke-static {v0, v7, v3, v6, v8}, Ljava/lang/System;->arraycopy([BI[BII)V

    .line 2914
    array-length v2, v2

    array-length v0, v0

    add-int/2addr v2, v0

    array-length v0, v1

    invoke-static {v1, v7, v3, v2, v0}, Ljava/lang/System;->arraycopy([BI[BII)V

    .line 2916
    const-string v0, "CameraUtil"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "composeDepthMapPicture: compose portrait picture cost: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2917
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long/2addr v6, v4

    invoke-virtual {v1, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 2916
    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2919
    return-object v3
.end method

.method public static composeLiveShotPicture([BII[BJZLjava/lang/String;)[B
    .locals 15

    move-object v1, p0

    move/from16 v0, p1

    move/from16 v2, p2

    move-object/from16 v3, p3

    .line 2739
    move-object/from16 v4, p7

    const-string v5, "CameraUtil"

    const-string v6, "composeLiveShotPicture(): E"

    invoke-static {v5, v6}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2740
    const/4 v5, 0x0

    if-eqz v1, :cond_f

    array-length v6, v1

    if-nez v6, :cond_0

    goto/16 :goto_f

    .line 2745
    :cond_0
    if-eqz v3, :cond_e

    array-length v6, v3

    if-nez v6, :cond_1

    goto/16 :goto_e

    .line 2750
    :cond_1
    nop

    .line 2751
    const/4 v6, 0x4

    new-array v7, v6, [I

    .line 2753
    nop

    .line 2754
    new-array v6, v6, [I

    .line 2757
    nop

    .line 2758
    const/4 v8, 0x1

    const/4 v9, 0x0

    :try_start_0
    new-instance v10, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v10}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_5

    .line 2759
    :try_start_1
    new-instance v11, Lcom/android/gallery3d/exif/ExifInterface;

    invoke-direct {v11}, Lcom/android/gallery3d/exif/ExifInterface;-><init>()V

    .line 2760
    invoke-virtual {v11, v1}, Lcom/android/gallery3d/exif/ExifInterface;->readExif([B)V

    .line 2763
    invoke-virtual {v11, v8}, Lcom/android/gallery3d/exif/ExifInterface;->addFileTypeLiveShot(Z)Z

    .line 2766
    if-eqz p6, :cond_2

    .line 2767
    invoke-static {v0, v2, v7}, Lcom/android/camera/Util;->getDualCameraWatermarkData(II[I)[B

    move-result-object v12
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 2768
    if-eqz v12, :cond_3

    :try_start_2
    array-length v13, v12

    if-lez v13, :cond_3

    .line 2769
    invoke-virtual {v11, v12}, Lcom/android/gallery3d/exif/ExifInterface;->addDulCameraWaterMark([B)Z

    goto :goto_0

    .line 2774
    :cond_2
    move-object v12, v9

    :cond_3
    :goto_0
    if-eqz v4, :cond_4

    invoke-virtual/range {p7 .. p7}, Ljava/lang/String;->isEmpty()Z

    move-result v13

    if-nez v13, :cond_4

    .line 2775
    invoke-static {v0, v2, v4, v6}, Lcom/android/camera/Util;->getTimeWaterMarkData(IILjava/lang/String;[I)[B

    move-result-object v2
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 2776
    if-eqz v2, :cond_5

    :try_start_3
    array-length v0, v2

    if-lez v0, :cond_5

    .line 2777
    invoke-virtual {v11, v2}, Lcom/android/gallery3d/exif/ExifInterface;->addTimeWaterMark([B)Z

    goto :goto_1

    .line 2783
    :catchall_0
    move-exception v0

    move-object v2, v9

    move-object v4, v2

    goto :goto_3

    .line 2758
    :catch_0
    move-exception v0

    move-object v2, v0

    move-object v4, v9

    goto :goto_2

    .line 2781
    :cond_4
    move-object v2, v9

    :cond_5
    :goto_1
    invoke-virtual {v11, v1, v10}, Lcom/android/gallery3d/exif/ExifInterface;->writeExif([BLjava/io/OutputStream;)V

    .line 2782
    invoke-virtual {v10}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v4
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 2783
    :try_start_4
    invoke-static {v9, v10}, Lcom/android/camera/Util;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    .line 2785
    goto :goto_5

    .line 2783
    :catch_1
    move-exception v0

    goto :goto_4

    :catchall_1
    move-exception v0

    move-object v4, v2

    move-object v2, v9

    goto :goto_3

    .line 2758
    :catch_2
    move-exception v0

    move-object v4, v2

    move-object v2, v0

    goto :goto_2

    .line 2783
    :catchall_2
    move-exception v0

    move-object v2, v9

    move-object v4, v2

    move-object v12, v4

    goto :goto_3

    .line 2758
    :catch_3
    move-exception v0

    move-object v2, v0

    move-object v4, v9

    move-object v12, v4

    :goto_2
    :try_start_5
    throw v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 2783
    :catchall_3
    move-exception v0

    :goto_3
    :try_start_6
    invoke-static {v2, v10}, Lcom/android/camera/Util;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V

    throw v0
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    :catch_4
    move-exception v0

    move-object v2, v4

    move-object v4, v9

    goto :goto_4

    :catch_5
    move-exception v0

    move-object v2, v9

    move-object v4, v2

    move-object v12, v4

    .line 2784
    :goto_4
    const-string v0, "CameraUtil"

    const-string v10, "composeLiveShotPicture(): Failed to insert xiaomi specific metadata"

    invoke-static {v0, v10}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2787
    :goto_5
    if-eqz v4, :cond_d

    array-length v0, v4

    array-length v10, v1

    if-gt v0, v10, :cond_6

    goto/16 :goto_d

    .line 2792
    :cond_6
    nop

    .line 2794
    :try_start_7
    invoke-static {}, Landroid/util/Xml;->newSerializer()Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v0

    .line 2795
    new-instance v10, Ljava/io/StringWriter;

    invoke-direct {v10}, Ljava/io/StringWriter;-><init>()V

    .line 2796
    invoke-interface {v0, v10}, Lorg/xmlpull/v1/XmlSerializer;->setOutput(Ljava/io/Writer;)V

    .line 2797
    const-string v11, "UTF-8"

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v13

    invoke-interface {v0, v11, v13}, Lorg/xmlpull/v1/XmlSerializer;->startDocument(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 2799
    const/4 v11, 0x3

    const/4 v13, 0x2

    if-eqz v12, :cond_7

    array-length v12, v12

    if-lez v12, :cond_7

    .line 2800
    const-string v12, "lenswatermark"

    invoke-interface {v0, v9, v12}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 2801
    const-string v12, "width"

    aget v14, v7, v5

    invoke-static {v14}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v14

    invoke-interface {v0, v9, v12, v14}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 2802
    const-string v12, "height"

    aget v14, v7, v8

    invoke-static {v14}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v14

    invoke-interface {v0, v9, v12, v14}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 2803
    const-string v12, "paddingx"

    aget v14, v7, v13

    invoke-static {v14}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v14

    invoke-interface {v0, v9, v12, v14}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 2804
    const-string v12, "paddingy"

    aget v7, v7, v11

    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v0, v9, v12, v7}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 2805
    const-string v7, "lenswatermark"

    invoke-interface {v0, v9, v7}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 2808
    :cond_7
    if-eqz v2, :cond_8

    array-length v2, v2

    if-lez v2, :cond_8

    .line 2809
    const-string v2, "timewatermark"

    invoke-interface {v0, v9, v2}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 2810
    const-string v2, "width"

    aget v7, v6, v5

    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v0, v9, v2, v7}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 2811
    const-string v2, "height"

    aget v7, v6, v8

    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v0, v9, v2, v7}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 2812
    const-string v2, "paddingx"

    aget v7, v6, v13

    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v0, v9, v2, v7}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 2813
    const-string v2, "paddingy"

    aget v6, v6, v11

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v0, v9, v2, v6}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 2814
    const-string v2, "timewatermark"

    invoke-interface {v0, v9, v2}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 2817
    :cond_8
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlSerializer;->endDocument()V

    .line 2818
    invoke-virtual {v10}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_6

    .line 2821
    goto :goto_6

    .line 2819
    :catch_6
    move-exception v0

    .line 2820
    const-string v0, "CameraUtil"

    const-string v2, "composeLiveShotPicture(): Failed to generate xiaomi xmp metadata"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2823
    move-object v0, v9

    :goto_6
    if-nez v0, :cond_9

    .line 2824
    const-string v0, "CameraUtil"

    const-string v2, "composeLiveShotPicture(): #2: return original jpeg"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2825
    return-object v1

    .line 2829
    :cond_9
    nop

    .line 2830
    :try_start_8
    new-instance v2, Ljava/io/ByteArrayInputStream;

    invoke-direct {v2, v4}, Ljava/io/ByteArrayInputStream;-><init>([B)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_b

    .line 2831
    :try_start_9
    new-instance v6, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v6}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_9
    .catch Ljava/lang/Throwable; {:try_start_9 .. :try_end_9} :catch_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_6

    .line 2830
    nop

    .line 2832
    :try_start_a
    invoke-static {}, Lcom/android/camera/XmpHelper;->createXMPMeta()Lcom/adobe/xmp/XMPMeta;

    move-result-object v7

    .line 2833
    const-string v10, "http://ns.google.com/photos/1.0/camera/"

    const-string v11, "MicroVideoVersion"

    invoke-interface {v7, v10, v11, v8}, Lcom/adobe/xmp/XMPMeta;->setPropertyInteger(Ljava/lang/String;Ljava/lang/String;I)V

    .line 2836
    const-string v10, "http://ns.google.com/photos/1.0/camera/"

    const-string v11, "MicroVideo"

    invoke-interface {v7, v10, v11, v8}, Lcom/adobe/xmp/XMPMeta;->setPropertyInteger(Ljava/lang/String;Ljava/lang/String;I)V

    .line 2839
    const-string v8, "http://ns.google.com/photos/1.0/camera/"

    const-string v10, "MicroVideoOffset"

    array-length v11, v3

    invoke-interface {v7, v8, v10, v11}, Lcom/adobe/xmp/XMPMeta;->setPropertyInteger(Ljava/lang/String;Ljava/lang/String;I)V

    .line 2842
    const-string v8, "http://ns.google.com/photos/1.0/camera/"

    const-string v10, "MicroVideoPresentationTimestampUs"

    move-wide/from16 v11, p4

    invoke-interface {v7, v8, v10, v11, v12}, Lcom/adobe/xmp/XMPMeta;->setPropertyLong(Ljava/lang/String;Ljava/lang/String;J)V

    .line 2845
    if-eqz v0, :cond_a

    .line 2846
    const-string v8, "http://ns.xiaomi.com/photos/1.0/camera/"

    const-string v10, "XMPMeta"

    invoke-interface {v7, v8, v10, v0}, Lcom/adobe/xmp/XMPMeta;->setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2851
    :cond_a
    invoke-static {v2, v6, v7}, Lcom/android/camera/XmpHelper;->writeXMPMeta(Ljava/io/InputStream;Ljava/io/OutputStream;Lcom/adobe/xmp/XMPMeta;)Z

    .line 2852
    invoke-virtual {v6}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v7
    :try_end_a
    .catch Ljava/lang/Throwable; {:try_start_a .. :try_end_a} :catch_8
    .catchall {:try_start_a .. :try_end_a} :catchall_4

    .line 2853
    :try_start_b
    invoke-static {v9, v6}, Lcom/android/camera/Util;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V
    :try_end_b
    .catch Ljava/lang/Throwable; {:try_start_b .. :try_end_b} :catch_7
    .catchall {:try_start_b .. :try_end_b} :catchall_7

    :try_start_c
    invoke-static {v9, v2}, Lcom/android/camera/Util;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_a

    .line 2855
    goto :goto_b

    .line 2830
    :catch_7
    move-exception v0

    goto :goto_8

    .line 2853
    :catchall_4
    move-exception v0

    move-object v7, v9

    goto :goto_7

    .line 2830
    :catch_8
    move-exception v0

    move-object v7, v0

    :try_start_d
    throw v7
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_5

    .line 2853
    :catchall_5
    move-exception v0

    :goto_7
    :try_start_e
    invoke-static {v7, v6}, Lcom/android/camera/Util;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V

    throw v0
    :try_end_e
    .catch Ljava/lang/Throwable; {:try_start_e .. :try_end_e} :catch_9
    .catchall {:try_start_e .. :try_end_e} :catchall_6

    :catchall_6
    move-exception v0

    move-object v7, v9

    goto :goto_9

    .line 2830
    :catch_9
    move-exception v0

    move-object v7, v9

    :goto_8
    move-object v9, v0

    :try_start_f
    throw v9
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_7

    .line 2853
    :catchall_7
    move-exception v0

    :goto_9
    :try_start_10
    invoke-static {v9, v2}, Lcom/android/camera/Util;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V

    throw v0
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_a

    :catch_a
    move-exception v0

    goto :goto_a

    :catch_b
    move-exception v0

    move-object v7, v9

    .line 2854
    :goto_a
    const-string v0, "CameraUtil"

    const-string v2, "composeLiveShotPicture(): failed to insert xmp metadata"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2857
    :goto_b
    if-eqz v7, :cond_c

    array-length v0, v7

    array-length v2, v4

    if-gt v0, v2, :cond_b

    goto :goto_c

    .line 2863
    :cond_b
    array-length v0, v7

    array-length v1, v3

    add-int/2addr v0, v1

    .line 2864
    const-string v1, "CameraUtil"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "composeLiveShotPicture(): file size = "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2865
    new-array v0, v0, [B

    .line 2866
    array-length v1, v7

    invoke-static {v7, v5, v0, v5, v1}, Ljava/lang/System;->arraycopy([BI[BII)V

    .line 2867
    array-length v1, v7

    array-length v2, v3

    invoke-static {v3, v5, v0, v1, v2}, Ljava/lang/System;->arraycopy([BI[BII)V

    .line 2869
    const-string v1, "CameraUtil"

    const-string v2, "composeLiveShotPicture(): X"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2870
    return-object v0

    .line 2858
    :cond_c
    :goto_c
    const-string v0, "CameraUtil"

    const-string v2, "composeLiveShotPicture(): #3: return original jpeg"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2859
    return-object v1

    .line 2788
    :cond_d
    :goto_d
    const-string v0, "CameraUtil"

    const-string v2, "composeLiveShotPicture(): #1: return original jpeg"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2789
    return-object v1

    .line 2746
    :cond_e
    :goto_e
    const-string v0, "CameraUtil"

    const-string v2, "composeLiveShotPicture(): The corresponding movie of LiveShot is empty"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2747
    return-object v1

    .line 2741
    :cond_f
    :goto_f
    const-string v0, "CameraUtil"

    const-string v1, "composeLiveShotPicture(): The primary photo of LiveShot is empty"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2742
    new-array v0, v5, [B

    return-object v0
.end method

.method private static computeInitialSampleSize(Landroid/graphics/BitmapFactory$Options;II)I
    .locals 8

    .line 448
    iget v0, p0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    int-to-double v0, v0

    .line 449
    iget p0, p0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    int-to-double v2, p0

    .line 451
    const/4 p0, 0x1

    if-gez p2, :cond_0

    .line 453
    move v4, p0

    goto :goto_0

    .line 452
    :cond_0
    mul-double v4, v0, v2

    int-to-double v6, p2

    div-double/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v4

    double-to-int v4, v4

    .line 453
    :goto_0
    if-gez p1, :cond_1

    const/16 v0, 0x80

    goto :goto_1

    .line 454
    :cond_1
    int-to-double v5, p1

    div-double/2addr v0, v5

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    div-double/2addr v2, v5

    .line 455
    invoke-static {v2, v3}, Ljava/lang/Math;->floor(D)D

    move-result-wide v2

    .line 454
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(DD)D

    move-result-wide v0

    double-to-int v0, v0

    .line 457
    :goto_1
    if-ge v0, v4, :cond_2

    .line 459
    return v4

    .line 462
    :cond_2
    if-gez p2, :cond_3

    if-gez p1, :cond_3

    .line 463
    return p0

    .line 464
    :cond_3
    if-gez p1, :cond_4

    .line 465
    return v4

    .line 467
    :cond_4
    return v0
.end method

.method public static computeSampleSize(Landroid/graphics/BitmapFactory$Options;II)I
    .locals 0

    .line 430
    invoke-static {p0, p1, p2}, Lcom/android/camera/Util;->computeInitialSampleSize(Landroid/graphics/BitmapFactory$Options;II)I

    move-result p0

    .line 434
    const/16 p1, 0x8

    if-gt p0, p1, :cond_0

    .line 435
    nop

    .line 436
    const/4 p1, 0x1

    :goto_0
    if-ge p1, p0, :cond_1

    .line 437
    shl-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 440
    :cond_0
    add-int/lit8 p0, p0, 0x7

    div-int/2addr p0, p1

    mul-int/2addr p1, p0

    .line 443
    :cond_1
    return p1
.end method

.method public static convertOutputFormatToFileExt(I)Ljava/lang/String;
    .locals 1

    .line 3121
    const/4 v0, 0x2

    if-ne p0, v0, :cond_0

    .line 3122
    const-string p0, ".mp4"

    return-object p0

    .line 3124
    :cond_0
    const-string p0, ".3gp"

    return-object p0
.end method

.method public static final convertOutputFormatToMimeType(I)Ljava/lang/String;
    .locals 1

    .line 3114
    const/4 v0, 0x2

    if-ne p0, v0, :cond_0

    .line 3115
    const-string p0, "video/mp4"

    return-object p0

    .line 3117
    :cond_0
    const-string p0, "video/3gpp"

    return-object p0
.end method

.method public static convertSizeToQuality(Lcom/android/camera/CameraSize;)I
    .locals 2

    .line 2475
    iget v0, p0, Lcom/android/camera/CameraSize;->width:I

    .line 2476
    iget v1, p0, Lcom/android/camera/CameraSize;->height:I

    .line 2477
    if-ge v0, v1, :cond_0

    .line 2478
    iget v0, p0, Lcom/android/camera/CameraSize;->height:I

    .line 2479
    iget v1, p0, Lcom/android/camera/CameraSize;->width:I

    .line 2482
    :cond_0
    const/16 p0, 0x780

    if-ne v0, p0, :cond_1

    const/16 p0, 0x438

    if-ne v1, p0, :cond_1

    .line 2483
    const/4 p0, 0x6

    return p0

    .line 2484
    :cond_1
    const/16 p0, 0xf00

    if-ne v0, p0, :cond_2

    const/16 p0, 0x870

    if-ne v1, p0, :cond_2

    .line 2485
    const/16 p0, 0x8

    return p0

    .line 2486
    :cond_2
    const/16 p0, 0x500

    if-ne v0, p0, :cond_3

    const/16 p0, 0x2d0

    if-ne v1, p0, :cond_3

    .line 2487
    const/4 p0, 0x5

    return p0

    .line 2488
    :cond_3
    const/16 p0, 0x280

    if-lt v0, p0, :cond_4

    const/16 p0, 0x1e0

    if-ne v1, p0, :cond_4

    .line 2489
    const/4 p0, 0x4

    return p0

    .line 2492
    :cond_4
    const/4 p0, -0x1

    return p0
.end method

.method public static createFile(Ljava/io/File;)Z
    .locals 3

    .line 1347
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1348
    const/4 p0, 0x0

    return p0

    .line 1351
    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v0

    .line 1352
    if-eqz v0, :cond_1

    .line 1353
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/16 v0, 0x1ff

    const/4 v2, -0x1

    invoke-static {v1, v0, v2, v2}, Lcom/android/camera/Util;->mkdirs(Ljava/io/File;III)Z

    .line 1356
    :cond_1
    :try_start_0
    invoke-virtual {p0}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1359
    goto :goto_0

    .line 1357
    :catch_0
    move-exception p0

    .line 1360
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method public static createGooglePhotosCompatibleLiveShot()Z
    .locals 2

    .line 3009
    const-string v0, "liveshotgpc"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    return v0
.end method

.method public static createJpegName(J)Ljava/lang/String;
    .locals 2

    .line 1142
    sget-object v0, Lcom/android/camera/Util;->sImageFileNamer:Lcom/android/camera/Util$ImageFileNamer;

    monitor-enter v0

    .line 1143
    :try_start_0
    sget-object v1, Lcom/android/camera/Util;->sImageFileNamer:Lcom/android/camera/Util$ImageFileNamer;

    invoke-virtual {v1, p0, p1}, Lcom/android/camera/Util$ImageFileNamer;->generateName(J)Ljava/lang/String;

    move-result-object p0

    monitor-exit v0

    return-object p0

    .line 1144
    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public static distance(FFFF)F
    .locals 0

    .line 665
    sub-float/2addr p0, p2

    .line 666
    sub-float/2addr p1, p3

    .line 667
    mul-float/2addr p0, p0

    mul-float/2addr p1, p1

    add-float/2addr p0, p1

    float-to-double p0, p0

    invoke-static {p0, p1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide p0

    double-to-float p0, p0

    return p0
.end method

.method public static dpToPixel(F)I
    .locals 1

    .line 364
    sget v0, Lcom/android/camera/Util;->sPixelDensity:F

    mul-float/2addr v0, p0

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result p0

    return p0
.end method

.method public static dumpBackTrace(Ljava/lang/String;)V
    .locals 7

    .line 292
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0}, Ljava/lang/RuntimeException;-><init>()V

    .line 294
    const-string v1, "CameraUtil"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "]\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 295
    const-string v1, "CameraUtil"

    const-string v2, "**********print backtrace start *************"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 296
    invoke-virtual {v0}, Ljava/lang/RuntimeException;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 297
    const-string v4, "CameraUtil"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "]:backtrace: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 298
    invoke-virtual {v3}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StackTraceElement;->getLineNumber()I

    move-result v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 297
    invoke-static {v4, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 296
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 300
    :cond_0
    const-string v0, "CameraUtil"

    const-string v1, "**********print backtrace end *************"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 301
    const-string v0, "CameraUtil"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "]\n"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 302
    return-void
.end method

.method public static dumpImageInfo(Ljava/lang/String;Landroid/media/Image;)V
    .locals 4

    .line 2973
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2974
    invoke-virtual {p1}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object p1

    .line 2975
    const/4 v1, 0x0

    :goto_0
    array-length v2, p1

    if-ge v1, v2, :cond_0

    .line 2976
    aget-object v2, p1, v1

    .line 2977
    const-string v3, "plane_"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ": "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2978
    invoke-virtual {v2}, Landroid/media/Image$Plane;->getPixelStride()I

    move-result v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "|"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2979
    invoke-virtual {v2}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "|"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2980
    invoke-virtual {v2}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2975
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 2983
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2984
    return-void
.end method

.method public static dumpMatrix([F)Ljava/lang/String;
    .locals 7

    .line 1116
    array-length v0, p0

    .line 1117
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "["

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1118
    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v0, :cond_1

    .line 1119
    const-string v4, "%f"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    aget v6, p0, v3

    invoke-static {v6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    aput-object v6, v5, v2

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1120
    add-int/lit8 v4, v0, -0x1

    if-eq v3, v4, :cond_0

    .line 1121
    const-string v4, " "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1118
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1124
    :cond_1
    const-string p0, "]"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1125
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static dumpRect(Landroid/graphics/RectF;Ljava/lang/String;)V
    .locals 2

    .line 1071
    const-string v0, "CameraUtil"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "=("

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, p0, Landroid/graphics/RectF;->left:F

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p1, ","

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, p0, Landroid/graphics/RectF;->top:F

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p1, ","

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, p0, Landroid/graphics/RectF;->right:F

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p1, ","

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p0, p0, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1073
    return-void
.end method

.method public static dumpToBitmap(IIIILjava/lang/String;)Ljava/nio/ByteBuffer;
    .locals 8

    .line 1129
    mul-int v0, p2, p3

    mul-int/lit8 v0, v0, 0x4

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 1130
    const/16 v5, 0x1908

    const/16 v6, 0x1401

    move v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move-object v7, v0

    invoke-static/range {v1 .. v7}, Landroid/opengl/GLES20;->glReadPixels(IIIIIILjava/nio/Buffer;)V

    .line 1131
    if-eqz v0, :cond_0

    .line 1132
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, "tex_"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Lcom/android/camera/Util;->createJpegName(J)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 1133
    const-string p1, ".jpg"

    invoke-static {p0, p1}, Lcom/android/camera/storage/Storage;->generateFilepath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 1134
    sget-object p1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, p2, p3, p1, p0}, Lcom/android/camera/Util;->saveBitmap(Ljava/nio/Buffer;IILandroid/graphics/Bitmap$Config;Ljava/lang/String;)Z

    .line 1135
    const-string p1, "CameraUtil"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "dump to "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1137
    :cond_0
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 1138
    return-object v0
.end method

.method public static enterLightsOutMode(Landroid/view/Window;)V
    .locals 2

    .line 1231
    invoke-virtual {p0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    .line 1232
    iget v1, v0, Landroid/view/WindowManager$LayoutParams;->systemUiVisibility:I

    or-int/lit8 v1, v1, 0x1

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->systemUiVisibility:I

    .line 1233
    invoke-virtual {p0, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 1234
    return-void
.end method

.method public static equals(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 0

    .line 651
    if-eq p0, p1, :cond_1

    if-eqz p0, :cond_0

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method public static execCommand(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 6

    .line 2670
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "sh"

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-string v1, "-c"

    const/4 v2, 0x1

    aput-object v1, v0, v2

    const/4 v1, 0x2

    aput-object p0, v0, v1

    .line 2671
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 2672
    const-string p0, ""

    .line 2673
    nop

    .line 2675
    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/Runtime;->exec([Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v0

    .line 2676
    invoke-virtual {v0}, Ljava/lang/Process;->waitFor()I

    move-result v3

    if-eqz v3, :cond_0

    .line 2677
    const-string p1, "CameraUtil"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "exit value = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Process;->exitValue()I

    move-result v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2678
    return-object p0

    .line 2680
    :cond_0
    new-instance v3, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/InputStreamReader;

    .line 2681
    invoke-virtual {v0}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-direct {v4, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v3, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 2682
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 2683
    nop

    .line 2684
    if-eqz p1, :cond_1

    .line 2685
    :goto_0
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 2686
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\r\n"

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 2689
    :cond_1
    :goto_1
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 2690
    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 2693
    :cond_2
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V

    .line 2694
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    .line 2695
    :try_start_1
    const-string p0, "CameraUtil"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "execCommand value="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " cost="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sub-long/2addr v3, v1

    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 2702
    nop

    .line 2703
    move-object p0, p1

    goto :goto_4

    .line 2699
    :catch_0
    move-exception p0

    move-object v5, p1

    move-object p1, p0

    move-object p0, v5

    goto :goto_2

    .line 2696
    :catch_1
    move-exception p0

    move-object v5, p1

    move-object p1, p0

    move-object p0, v5

    goto :goto_3

    .line 2699
    :catch_2
    move-exception p1

    .line 2700
    :goto_2
    const-string v0, "CameraUtil"

    const-string v1, "execCommand IOException"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2701
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_4

    .line 2696
    :catch_3
    move-exception p1

    .line 2697
    :goto_3
    const-string v0, "CameraUtil"

    const-string v1, "execCommand InterruptedException"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2698
    invoke-virtual {p1}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 2702
    nop

    .line 2703
    :goto_4
    return-object p0
.end method

.method public static expandViewTouchDelegate(Landroid/view/View;)V
    .locals 3

    .line 1449
    invoke-virtual {p0}, Landroid/view/View;->isShown()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1450
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 1451
    invoke-virtual {p0, v0}, Landroid/view/View;->getHitRect(Landroid/graphics/Rect;)V

    .line 1452
    const/high16 v1, 0x41200000    # 10.0f

    invoke-static {v1}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v1

    .line 1454
    iget v2, v0, Landroid/graphics/Rect;->top:I

    sub-int/2addr v2, v1

    iput v2, v0, Landroid/graphics/Rect;->top:I

    .line 1455
    iget v2, v0, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v2, v1

    iput v2, v0, Landroid/graphics/Rect;->bottom:I

    .line 1456
    iget v2, v0, Landroid/graphics/Rect;->left:I

    sub-int/2addr v2, v1

    iput v2, v0, Landroid/graphics/Rect;->left:I

    .line 1457
    iget v2, v0, Landroid/graphics/Rect;->right:I

    add-int/2addr v2, v1

    iput v2, v0, Landroid/graphics/Rect;->right:I

    .line 1459
    new-instance v1, Landroid/view/TouchDelegate;

    invoke-direct {v1, v0, p0}, Landroid/view/TouchDelegate;-><init>(Landroid/graphics/Rect;Landroid/view/View;)V

    .line 1460
    const-class v0, Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1461
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    invoke-virtual {p0, v1}, Landroid/view/View;->setTouchDelegate(Landroid/view/TouchDelegate;)V

    .line 1463
    :cond_0
    goto :goto_0

    .line 1464
    :cond_1
    const-class v0, Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1465
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/View;->setTouchDelegate(Landroid/view/TouchDelegate;)V

    .line 1468
    :cond_2
    :goto_0
    return-void
.end method

.method public static fadeIn(Landroid/view/View;)V
    .locals 1

    .line 1197
    const/16 v0, 0x190

    invoke-static {p0, v0}, Lcom/android/camera/Util;->fadeIn(Landroid/view/View;I)V

    .line 1198
    return-void
.end method

.method public static fadeIn(Landroid/view/View;I)V
    .locals 3

    .line 1185
    if-eqz p0, :cond_1

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 1189
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 1190
    new-instance v0, Landroid/view/animation/AlphaAnimation;

    const/4 v1, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v2}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 1191
    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 1192
    invoke-virtual {p0}, Landroid/view/View;->clearAnimation()V

    .line 1193
    invoke-virtual {p0, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 1194
    return-void

    .line 1186
    :cond_1
    :goto_0
    return-void
.end method

.method public static fadeOut(Landroid/view/View;)V
    .locals 1

    .line 1210
    const/16 v0, 0x190

    invoke-static {p0, v0}, Lcom/android/camera/Util;->fadeOut(Landroid/view/View;I)V

    .line 1211
    return-void
.end method

.method public static fadeOut(Landroid/view/View;I)V
    .locals 3

    .line 1201
    if-eqz p0, :cond_1

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 1202
    :cond_0
    new-instance v0, Landroid/view/animation/AlphaAnimation;

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 1203
    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 1204
    invoke-virtual {p0}, Landroid/view/View;->clearAnimation()V

    .line 1205
    invoke-virtual {p0, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 1206
    const/16 p1, 0x8

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 1207
    return-void

    .line 1201
    :cond_1
    :goto_0
    return-void
.end method

.method public static flipBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 8

    .line 2502
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 2503
    return-object v0

    .line 2505
    :cond_0
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    .line 2506
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    .line 2507
    new-instance v3, Landroid/graphics/Matrix;

    invoke-direct {v3}, Landroid/graphics/Matrix;-><init>()V

    .line 2508
    const/high16 v4, -0x40800000    # -1.0f

    const/high16 v5, 0x3f800000    # 1.0f

    div-int/lit8 v6, v1, 0x2

    int-to-float v6, v6

    div-int/lit8 v7, v2, 0x2

    int-to-float v7, v7

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 2509
    nop

    .line 2511
    :try_start_0
    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v2, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2518
    nop

    .line 2520
    move-object v0, v1

    goto :goto_0

    .line 2515
    :catch_0
    move-exception v1

    .line 2516
    nop

    .line 2517
    invoke-virtual {v1}, Ljava/lang/NullPointerException;->printStackTrace()V

    goto :goto_0

    .line 2512
    :catch_1
    move-exception v1

    .line 2513
    nop

    .line 2514
    invoke-virtual {v1}, Ljava/lang/OutOfMemoryError;->printStackTrace()V

    .line 2518
    nop

    .line 2520
    :goto_0
    if-nez v0, :cond_1

    .line 2521
    return-object p0

    .line 2523
    :cond_1
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 2524
    new-instance v2, Landroid/graphics/PaintFlagsDrawFilter;

    const/4 v4, 0x0

    const/4 v5, 0x3

    invoke-direct {v2, v4, v5}, Landroid/graphics/PaintFlagsDrawFilter;-><init>(II)V

    invoke-virtual {v1, v2}, Landroid/graphics/Canvas;->setDrawFilter(Landroid/graphics/DrawFilter;)V

    .line 2525
    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    .line 2526
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 2527
    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 2528
    invoke-virtual {v1, p0, v3, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    .line 2529
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    .line 2530
    return-object v0
.end method

.method public static flipYBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 8

    .line 2534
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 2535
    return-object v0

    .line 2537
    :cond_0
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    .line 2538
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    .line 2539
    new-instance v3, Landroid/graphics/Matrix;

    invoke-direct {v3}, Landroid/graphics/Matrix;-><init>()V

    .line 2540
    const/high16 v4, 0x3f800000    # 1.0f

    const/high16 v5, -0x40800000    # -1.0f

    div-int/lit8 v6, v1, 0x2

    int-to-float v6, v6

    div-int/lit8 v7, v2, 0x2

    int-to-float v7, v7

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 2541
    nop

    .line 2543
    :try_start_0
    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v2, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2547
    nop

    .line 2549
    move-object v0, v1

    goto :goto_0

    .line 2544
    :catch_0
    move-exception v1

    .line 2545
    nop

    .line 2546
    const-string v2, "CameraUtil"

    const-string v4, "flip_y_bitmp:"

    invoke-static {v2, v4, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 2549
    :goto_0
    if-nez v0, :cond_1

    .line 2550
    return-object p0

    .line 2552
    :cond_1
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 2553
    new-instance v2, Landroid/graphics/PaintFlagsDrawFilter;

    const/4 v4, 0x0

    const/4 v5, 0x3

    invoke-direct {v2, v4, v5}, Landroid/graphics/PaintFlagsDrawFilter;-><init>(II)V

    invoke-virtual {v1, v2}, Landroid/graphics/Canvas;->setDrawFilter(Landroid/graphics/DrawFilter;)V

    .line 2554
    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    .line 2555
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 2556
    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 2557
    invoke-virtual {v1, p0, v3, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    .line 2558
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    .line 2559
    return-object v0
.end method

.method public static generate48MWatermark2File()Landroid/graphics/Bitmap;
    .locals 5

    .line 2593
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 2594
    const/4 v1, 0x0

    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inScaled:Z

    .line 2595
    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inPurgeable:Z

    .line 2596
    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inPremultiplied:Z

    .line 2597
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    sget-object v3, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-static {v2, v0, v3}, Lcom/android/camera/Util;->loadAppCameraWatermark(Landroid/content/Context;Landroid/graphics/BitmapFactory$Options;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 2598
    if-nez v2, :cond_0

    .line 2599
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "common"

    invoke-static {v2, v0, v3}, Lcom/android/camera/Util;->loadAppCameraWatermark(Landroid/content/Context;Landroid/graphics/BitmapFactory$Options;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 2601
    :cond_0
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v3, 0x7f100008

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    .line 2602
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f100009

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v3

    .line 2603
    int-to-float v0, v0

    int-to-float v3, v3

    const v4, 0x7f090286

    invoke-static {v4}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v0, v3, v4}, Lcom/android/camera/effect/renders/CustomTextWaterMark;->newInstance(Landroid/graphics/Bitmap;FFLjava/lang/String;)Lcom/android/camera/effect/renders/CustomTextWaterMark;

    move-result-object v0

    .line 2604
    invoke-virtual {v0}, Lcom/android/camera/effect/renders/CustomTextWaterMark;->drawToBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 2605
    invoke-static {v0, v1}, Lcom/android/camera/Util;->saveCustomWatermark2File(Landroid/graphics/Bitmap;Z)V

    .line 2606
    return-object v0
.end method

.method public static generateCustomWatermark2File()Landroid/graphics/Bitmap;
    .locals 7

    .line 2563
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 2564
    new-instance v2, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v2}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 2565
    const/4 v3, 0x0

    iput-boolean v3, v2, Landroid/graphics/BitmapFactory$Options;->inScaled:Z

    .line 2566
    const/4 v4, 0x1

    iput-boolean v4, v2, Landroid/graphics/BitmapFactory$Options;->inPurgeable:Z

    .line 2567
    iput-boolean v4, v2, Landroid/graphics/BitmapFactory$Options;->inPremultiplied:Z

    .line 2568
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v4

    invoke-virtual {v4}, Lcom/mi/config/a;->fe()Z

    move-result v4

    .line 2569
    if-eqz v4, :cond_2

    .line 2571
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v4

    sget-object v5, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-static {v4, v2, v5}, Lcom/android/camera/Util;->loadAppCameraWatermark(Landroid/content/Context;Landroid/graphics/BitmapFactory$Options;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v4

    .line 2572
    if-nez v4, :cond_0

    .line 2573
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v4

    const-string v5, "common"

    invoke-static {v4, v2, v5}, Lcom/android/camera/Util;->loadAppCameraWatermark(Landroid/content/Context;Landroid/graphics/BitmapFactory$Options;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v4

    .line 2577
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mi/config/a;->fE()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 2578
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v5, 0x7f100008

    invoke-virtual {v2, v5}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v2

    .line 2579
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f100009

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v5

    .line 2580
    int-to-float v2, v2

    int-to-float v5, v5

    invoke-static {}, Lcom/android/camera/CameraSettings;->getCustomWatermark()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v2, v5, v6}, Lcom/android/camera/effect/renders/CustomTextWaterMark;->newInstance(Landroid/graphics/Bitmap;FFLjava/lang/String;)Lcom/android/camera/effect/renders/CustomTextWaterMark;

    move-result-object v2

    .line 2581
    invoke-virtual {v2}, Lcom/android/camera/effect/renders/CustomTextWaterMark;->drawToBitmap()Landroid/graphics/Bitmap;

    move-result-object v4

    .line 2582
    goto :goto_0

    .line 2583
    :cond_1
    nop

    .line 2585
    :goto_0
    invoke-static {v4, v3}, Lcom/android/camera/Util;->saveCustomWatermark2File(Landroid/graphics/Bitmap;Z)V

    .line 2586
    const-string v2, "CameraUtil"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "generateCustomWatermark2File cost time = "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    sub-long/2addr v5, v0

    invoke-virtual {v3, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, "ms"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2587
    return-object v4

    .line 2589
    :cond_2
    const/4 v0, 0x0

    return-object v0
.end method

.method public static getArrayIndex([II)I
    .locals 3

    .line 1261
    const/4 v0, -0x1

    if-nez p0, :cond_0

    .line 1262
    return v0

    .line 1264
    :cond_0
    const/4 v1, 0x0

    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_2

    .line 1265
    aget v2, p0, v1

    if-ne v2, p1, :cond_1

    .line 1266
    return v1

    .line 1264
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1269
    :cond_2
    return v0
.end method

.method public static getArrayIndex([Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;TT;)I"
        }
    .end annotation

    .line 1245
    const/4 v0, -0x1

    if-nez p0, :cond_0

    .line 1246
    return v0

    .line 1249
    :cond_0
    nop

    .line 1250
    array-length v1, p0

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v2, v1, :cond_2

    aget-object v4, p0, v2

    .line 1251
    invoke-static {v4, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1252
    return v3

    .line 1254
    :cond_1
    add-int/lit8 v3, v3, 0x1

    .line 1250
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1257
    :cond_2
    return v0
.end method

.method private static getAttributeIntValue(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I
    .locals 3

    .line 2254
    const/4 v0, 0x0

    invoke-interface {p0, v0, p1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 2255
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2256
    return p2

    .line 2259
    :cond_0
    :try_start_0
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    .line 2260
    :catch_0
    move-exception p0

    .line 2261
    const-string v0, "CameraUtil"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "get attribute "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " failed"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1, p0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 2264
    return p2
.end method

.method public static getBitmapData(Landroid/graphics/Bitmap;)[B
    .locals 3

    .line 2496
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 2497
    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v2, 0x57

    invoke-virtual {p0, v1, v2, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 2498
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0

    return-object p0
.end method

.method public static getBottomHeight(Landroid/content/res/Resources;)I
    .locals 1

    .line 1892
    const v0, 0x7f0a0020

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p0

    .line 1894
    sget-boolean v0, Lcom/android/camera/Util;->isNotchDevice:Z

    if-eqz v0, :cond_0

    sget-boolean v0, Lcom/android/camera/Util;->sIsFullScreenNavBarHidden:Z

    if-eqz v0, :cond_0

    sget-boolean v0, Lcom/android/camera/Util;->isLongRatioScreen:Z

    if-nez v0, :cond_0

    .line 1895
    sget v0, Lcom/android/camera/Util;->sFullScreenExtraMargin:I

    sub-int/2addr p0, v0

    .line 1897
    :cond_0
    return p0
.end method

.method private static getCaller([Ljava/lang/StackTraceElement;I)Ljava/lang/String;
    .locals 1

    .line 2305
    const/4 v0, 0x4

    add-int/2addr v0, p1

    array-length p1, p0

    if-lt v0, p1, :cond_0

    .line 2306
    const-string p0, "<bottom of call stack>"

    return-object p0

    .line 2308
    :cond_0
    aget-object p0, p0, v0

    .line 2309
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "."

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ":"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StackTraceElement;->getLineNumber()I

    move-result p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getCallers(I)Ljava/lang/String;
    .locals 4

    .line 2313
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v0

    .line 2314
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 2315
    const/4 v2, 0x0

    :goto_0
    if-ge v2, p0, :cond_0

    .line 2316
    invoke-static {v0, v2}, Lcom/android/camera/Util;->getCaller([Ljava/lang/StackTraceElement;I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v3, " "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 2315
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2318
    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getCenterFocusDepthIndex([BII)I
    .locals 11

    .line 1402
    const/4 v0, 0x1

    if-eqz p0, :cond_6

    array-length v1, p0

    const/16 v2, 0x19

    if-ge v1, v2, :cond_0

    goto/16 :goto_3

    .line 1409
    :cond_0
    array-length v1, p0

    sub-int/2addr v1, v2

    .line 1411
    add-int/lit8 v2, v1, 0x1

    aget-byte v1, p0, v1

    if-eqz v1, :cond_1

    .line 1412
    return v0

    .line 1414
    :cond_1
    add-int/lit8 v1, v2, 0x1

    aget-byte v2, p0, v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x18

    add-int/lit8 v3, v1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v1, v2

    add-int/lit8 v2, v3, 0x1

    aget-byte v3, p0, v3

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v3, v3, 0x8

    or-int/2addr v1, v3

    add-int/lit8 v3, v2, 0x1

    aget-byte v2, p0, v2

    and-int/lit16 v2, v2, 0xff

    or-int/2addr v1, v2

    .line 1418
    add-int/lit8 v2, v3, 0x1

    aget-byte v3, p0, v3

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v3, v3, 0x18

    add-int/lit8 v4, v2, 0x1

    aget-byte v2, p0, v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x10

    or-int/2addr v2, v3

    add-int/lit8 v3, v4, 0x1

    aget-byte v4, p0, v4

    and-int/lit16 v4, v4, 0xff

    shl-int/lit8 v4, v4, 0x8

    or-int/2addr v2, v4

    aget-byte v3, p0, v3

    and-int/lit16 v3, v3, 0xff

    or-int/2addr v2, v3

    .line 1422
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 1423
    const v4, 0x7f0a0008

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    .line 1424
    const v5, 0x7f0a0009

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    .line 1425
    mul-int/2addr v4, v1

    sget v5, Lcom/android/camera/Util;->sWindowWidth:I

    div-int/2addr v4, v5

    .line 1426
    mul-int/2addr v3, v2

    int-to-float v3, v3

    sget v5, Lcom/android/camera/Util;->sWindowWidth:I

    int-to-float v5, v5

    int-to-float p2, p2

    mul-float/2addr v5, p2

    int-to-float p1, p1

    div-float/2addr v5, p1

    div-float/2addr v3, v5

    float-to-int p1, v3

    .line 1427
    sub-int/2addr v2, p1

    div-int/lit8 v2, v2, 0x2

    .line 1428
    const/4 p2, 0x5

    new-array v3, p2, [I

    .line 1429
    const/4 v5, 0x0

    move v6, v2

    move v2, v5

    :goto_0
    if-ge v2, p1, :cond_3

    .line 1430
    add-int/lit8 v7, v6, 0x1

    mul-int/2addr v6, v1

    sub-int v8, v1, v4

    div-int/lit8 v8, v8, 0x2

    add-int/2addr v6, v8

    .line 1431
    move v8, v6

    move v6, v5

    :goto_1
    if-ge v6, v4, :cond_2

    .line 1432
    add-int/lit8 v9, v8, 0x1

    aget-byte v8, p0, v8

    aget v10, v3, v8

    add-int/2addr v10, v0

    aput v10, v3, v8

    .line 1431
    add-int/lit8 v6, v6, 0x1

    move v8, v9

    goto :goto_1

    .line 1429
    :cond_2
    add-int/lit8 v2, v2, 0x1

    move v6, v7

    goto :goto_0

    .line 1436
    :cond_3
    nop

    .line 1437
    :goto_2
    if-ge v0, p2, :cond_5

    .line 1438
    aget p0, v3, v5

    aget p1, v3, v0

    if-ge p0, p1, :cond_4

    .line 1439
    nop

    .line 1437
    move v5, v0

    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 1442
    :cond_5
    return v5

    .line 1404
    :cond_6
    :goto_3
    return v0
.end method

.method public static getChildMeasureWidth(Landroid/view/View;)I
    .locals 2

    .line 2085
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 2086
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iget v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    add-int/2addr v1, v0

    .line 2088
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    .line 2089
    if-lez v0, :cond_0

    .line 2090
    add-int/2addr v0, v1

    return v0

    .line 2092
    :cond_0
    const/4 v0, 0x0

    invoke-static {v0, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    .line 2093
    invoke-virtual {p0, v0, v0}, Landroid/view/View;->measure(II)V

    .line 2094
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    move-result p0

    add-int/2addr p0, v1

    return p0
.end method

.method private static getColorMapXmlMapFile()Ljava/io/File;
    .locals 2

    .line 2153
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_1

    .line 2154
    new-instance v0, Ljava/io/File;

    const-string v1, "/vendor/etc/screen_light.xml"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 2155
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2156
    return-object v0

    .line 2158
    :cond_0
    const-string v0, "CameraUtil"

    const-string v1, "screen_light.xml do not found under /vendor/etc, roll back to /system/etc"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2162
    :cond_1
    new-instance v0, Ljava/io/File;

    const-string v1, "/system/etc/screen_light.xml"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 2164
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 2165
    return-object v0

    .line 2167
    :cond_2
    const-string v0, "CameraUtil"

    const-string v1, "screen_light.xml do not found under /system/etc"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2168
    const/4 v0, 0x0

    return-object v0
.end method

.method public static getDebugInfo()Ljava/lang/String;
    .locals 3

    .line 1608
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1612
    const-string v1, "1"

    const-string v2, "persist.camera.debug.show_af"

    invoke-static {v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "1"

    const-string v2, "persist.camera.debug.enable"

    .line 1613
    invoke-static {v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1614
    :cond_0
    const-string v1, "persist.camera.debug.param0"

    invoke-static {v1}, Lcom/android/camera/Util;->addProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1615
    const-string v1, "persist.camera.debug.param1"

    invoke-static {v1}, Lcom/android/camera/Util;->addProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1616
    const-string v1, "persist.camera.debug.param2"

    invoke-static {v1}, Lcom/android/camera/Util;->addProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1617
    const-string v1, "persist.camera.debug.param3"

    invoke-static {v1}, Lcom/android/camera/Util;->addProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1618
    const-string v1, "persist.camera.debug.param4"

    invoke-static {v1}, Lcom/android/camera/Util;->addProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1619
    const-string v1, "persist.camera.debug.param5"

    invoke-static {v1}, Lcom/android/camera/Util;->addProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1620
    const-string v1, "persist.camera.debug.param6"

    invoke-static {v1}, Lcom/android/camera/Util;->addProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1621
    const-string v1, "persist.camera.debug.param7"

    invoke-static {v1}, Lcom/android/camera/Util;->addProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1622
    const-string v1, "persist.camera.debug.param8"

    invoke-static {v1}, Lcom/android/camera/Util;->addProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1623
    const-string v1, "persist.camera.debug.param9"

    invoke-static {v1}, Lcom/android/camera/Util;->addProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1626
    :cond_1
    const-string v1, "1"

    const-string v2, "persist.camera.debug.show_awb"

    invoke-static {v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1627
    const-string v1, "persist.camera.debug.param10"

    invoke-static {v1}, Lcom/android/camera/Util;->addProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1628
    const-string v1, "persist.camera.debug.param11"

    invoke-static {v1}, Lcom/android/camera/Util;->addProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1629
    const-string v1, "persist.camera.debug.param12"

    invoke-static {v1}, Lcom/android/camera/Util;->addProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1630
    const-string v1, "persist.camera.debug.param13"

    invoke-static {v1}, Lcom/android/camera/Util;->addProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1631
    const-string v1, "persist.camera.debug.param14"

    invoke-static {v1}, Lcom/android/camera/Util;->addProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1632
    const-string v1, "persist.camera.debug.param15"

    invoke-static {v1}, Lcom/android/camera/Util;->addProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1633
    const-string v1, "persist.camera.debug.param16"

    invoke-static {v1}, Lcom/android/camera/Util;->addProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1634
    const-string v1, "persist.camera.debug.param17"

    invoke-static {v1}, Lcom/android/camera/Util;->addProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1635
    const-string v1, "persist.camera.debug.param18"

    invoke-static {v1}, Lcom/android/camera/Util;->addProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1636
    const-string v1, "persist.camera.debug.param19"

    invoke-static {v1}, Lcom/android/camera/Util;->addProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1639
    :cond_2
    const-string v1, "1"

    const-string v2, "persist.camera.debug.show_aec"

    invoke-static {v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1640
    const-string v1, "persist.camera.debug.param20"

    invoke-static {v1}, Lcom/android/camera/Util;->addProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1641
    const-string v1, "persist.camera.debug.param21"

    invoke-static {v1}, Lcom/android/camera/Util;->addProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1642
    const-string v1, "persist.camera.debug.param22"

    invoke-static {v1}, Lcom/android/camera/Util;->addProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1643
    const-string v1, "persist.camera.debug.param23"

    invoke-static {v1}, Lcom/android/camera/Util;->addProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1644
    const-string v1, "persist.camera.debug.param24"

    invoke-static {v1}, Lcom/android/camera/Util;->addProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1645
    const-string v1, "persist.camera.debug.param25"

    invoke-static {v1}, Lcom/android/camera/Util;->addProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1646
    const-string v1, "persist.camera.debug.param26"

    invoke-static {v1}, Lcom/android/camera/Util;->addProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1647
    const-string v1, "persist.camera.debug.param27"

    invoke-static {v1}, Lcom/android/camera/Util;->addProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1648
    const-string v1, "persist.camera.debug.param28"

    invoke-static {v1}, Lcom/android/camera/Util;->addProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1649
    const-string v1, "persist.camera.debug.param29"

    invoke-static {v1}, Lcom/android/camera/Util;->addProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1651
    :cond_3
    const-string v1, "persist.camera.debug.checkerf"

    invoke-static {v1}, Lcom/android/camera/Util;->addProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1652
    const-string v1, "persist.camera.debug.fc"

    invoke-static {v1}, Lcom/android/camera/Util;->addProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1653
    const-string v1, "1"

    const-string v2, "persist.camera.debug.hht"

    invoke-static {v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 1654
    const-string v1, "camera.debug.hht.luma"

    invoke-static {v1}, Lcom/android/camera/Util;->addProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1656
    :cond_4
    const-string v1, "1"

    const-string v2, "persist.camera.debug.autoscene"

    invoke-static {v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 1657
    const-string v1, "camera.debug.hht.iso"

    invoke-static {v1}, Lcom/android/camera/Util;->addProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1659
    :cond_5
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getDebugInformation(Landroid/hardware/camera2/CaptureResult;)Ljava/lang/String;
    .locals 7

    .line 1541
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1542
    invoke-static {p0}, Lcom/android/camera2/CaptureResultParser;->getAECFrameControl(Landroid/hardware/camera2/CaptureResult;)Lcom/android/camera2/AECFrameControl;

    move-result-object v1

    .line 1543
    invoke-static {p0}, Lcom/android/camera2/CaptureResultParser;->getAFFrameControl(Landroid/hardware/camera2/CaptureResult;)Lcom/android/camera2/AFFrameControl;

    move-result-object v2

    .line 1544
    const-string v3, "1"

    const-string v4, "camera.preview.debug.show_shortGain"

    invoke-static {v4}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_0

    .line 1545
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/android/camera2/AECFrameControl;->getAecExposureDatas()[Lcom/android/camera2/AECFrameControl$AECExposureData;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 1546
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "short gain : "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lcom/android/camera2/AECFrameControl;->getAecExposureDatas()[Lcom/android/camera2/AECFrameControl$AECExposureData;

    move-result-object v5

    aget-object v5, v5, v4

    invoke-virtual {v5}, Lcom/android/camera2/AECFrameControl$AECExposureData;->getLinearGain()F

    move-result v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/android/camera/Util;->addDebugInfo(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1549
    :cond_0
    const-string v3, "1"

    const-string v5, "camera.preview.debug.show_adrcGain"

    invoke-static {v5}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1550
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lcom/android/camera2/AECFrameControl;->getAecExposureDatas()[Lcom/android/camera2/AECFrameControl$AECExposureData;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 1551
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "adrc gain : "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lcom/android/camera2/AECFrameControl;->getAecExposureDatas()[Lcom/android/camera2/AECFrameControl$AECExposureData;

    move-result-object v5

    const/4 v6, 0x2

    aget-object v5, v5, v6

    invoke-virtual {v5}, Lcom/android/camera2/AECFrameControl$AECExposureData;->getSensitivity()F

    move-result v5

    .line 1552
    invoke-virtual {v1}, Lcom/android/camera2/AECFrameControl;->getAecExposureDatas()[Lcom/android/camera2/AECFrameControl$AECExposureData;

    move-result-object v1

    aget-object v1, v1, v4

    invoke-virtual {v1}, Lcom/android/camera2/AECFrameControl$AECExposureData;->getSensitivity()F

    move-result v1

    div-float/2addr v5, v1

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1551
    invoke-static {v1}, Lcom/android/camera/Util;->addDebugInfo(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1555
    :cond_1
    const-string v1, "1"

    const-string v3, "camera.preview.debug.show_afRegion"

    invoke-static {v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1556
    sget-object v1, Landroid/hardware/camera2/CaptureResult;->CONTROL_AF_REGIONS:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p0, v1}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Landroid/hardware/camera2/params/MeteringRectangle;

    .line 1557
    if-eqz v1, :cond_2

    .line 1558
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "af region : "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v1, v1, v4

    invoke-virtual {v1}, Landroid/hardware/camera2/params/MeteringRectangle;->getRect()Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/Rect;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/android/camera/Util;->addDebugInfo(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1561
    :cond_2
    const-string v1, "1"

    const-string v3, "camera.preview.debug.show_afMode"

    invoke-static {v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1562
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "af mode : "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Landroid/hardware/camera2/CaptureResult;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p0, v3}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/android/camera/Util;->addDebugInfo(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1564
    :cond_3
    const-string v1, "1"

    const-string v3, "camera.preview.debug.show_afStatus"

    invoke-static {v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 1565
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "af state : "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Landroid/hardware/camera2/CaptureResult;->CONTROL_AF_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p0, v3}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/android/camera/Util;->addDebugInfo(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1567
    :cond_4
    const-string v1, "1"

    const-string v3, "camera.preview.debug.show_afLensPosition"

    invoke-static {v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 1568
    if-eqz v2, :cond_6

    .line 1569
    const-string v1, ""

    .line 1570
    invoke-virtual {v2}, Lcom/android/camera2/AFFrameControl;->getUseDACValue()I

    move-result v3

    if-nez v3, :cond_5

    .line 1571
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Lcom/android/camera2/AFFrameControl;->getTargetLensPosition()I

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ""

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1573
    :cond_5
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "af lens position : "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/android/camera/Util;->addDebugInfo(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1576
    :cond_6
    const-string v1, "1"

    const-string v3, "camera.preview.debug.show_distance"

    invoke-static {v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 1577
    sget-object v1, Landroid/hardware/camera2/CaptureResult;->LENS_FOCUS_DISTANCE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p0, v1}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_7

    .line 1578
    sget-object v1, Landroid/hardware/camera2/CaptureResult;->LENS_FOCUS_DISTANCE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p0, v1}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Float;

    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    move-result p0

    .line 1579
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "distance : "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/android/camera/Util;->addDebugInfo(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1580
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "distance(m) : "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/high16 v3, 0x3f800000    # 1.0f

    div-float/2addr v3, p0

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/android/camera/Util;->addDebugInfo(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1584
    :cond_7
    const-string p0, "1"

    const-string v1, "camera.preview.debug.show_gyro"

    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_8

    .line 1585
    if-eqz v2, :cond_8

    .line 1586
    :goto_0
    invoke-virtual {v2}, Lcom/android/camera2/AFFrameControl;->getAFGyroData()Lcom/android/camera2/AFFrameControl$AFGyroData;

    move-result-object p0

    invoke-virtual {p0}, Lcom/android/camera2/AFFrameControl$AFGyroData;->getSampleCount()I

    move-result p0

    if-ge v4, p0, :cond_8

    .line 1587
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "gyro : x: "

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1588
    invoke-virtual {v2}, Lcom/android/camera2/AFFrameControl;->getAFGyroData()Lcom/android/camera2/AFFrameControl$AFGyroData;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera2/AFFrameControl$AFGyroData;->getpAngularVelocityX()[F

    move-result-object v1

    aget v1, v1, v4

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, ", y: "

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1589
    invoke-virtual {v2}, Lcom/android/camera2/AFFrameControl;->getAFGyroData()Lcom/android/camera2/AFFrameControl$AFGyroData;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera2/AFFrameControl$AFGyroData;->getpAngularVelocityY()[F

    move-result-object v1

    aget v1, v1, v4

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, ", z: "

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1590
    invoke-virtual {v2}, Lcom/android/camera2/AFFrameControl;->getAFGyroData()Lcom/android/camera2/AFFrameControl$AFGyroData;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera2/AFFrameControl$AFGyroData;->getpAngularVelocityZ()[F

    move-result-object v1

    aget v1, v1, v4

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 1587
    invoke-static {p0}, Lcom/android/camera/Util;->addDebugInfo(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1586
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 1595
    :cond_8
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getDialogTopMargin(I)I
    .locals 1

    .line 1901
    sget-boolean v0, Lcom/android/camera/Util;->isNotchDevice:Z

    if-eqz v0, :cond_0

    .line 1902
    sget v0, Lcom/android/camera/Util;->sStatusBarHeight:I

    sub-int/2addr p0, v0

    return p0

    .line 1904
    :cond_0
    return p0
.end method

.method public static getDisplayOrientation(II)I
    .locals 1

    .line 749
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getCapabilities(I)Lcom/android/camera2/CameraCapabilities;

    move-result-object p1

    .line 750
    if-eqz p1, :cond_1

    .line 751
    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->getSensorOrientation()I

    move-result v0

    .line 753
    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->getFacing()I

    move-result p1

    if-nez p1, :cond_0

    .line 754
    add-int/2addr v0, p0

    rem-int/lit16 v0, v0, 0x168

    .line 755
    rsub-int p0, v0, 0x168

    rem-int/lit16 p0, p0, 0x168

    goto :goto_0

    .line 757
    :cond_0
    sub-int/2addr v0, p0

    add-int/lit16 v0, v0, 0x168

    rem-int/lit16 p0, v0, 0x168

    .line 759
    :goto_0
    return p0

    .line 761
    :cond_1
    const/16 p0, 0x5a

    return p0
.end method

.method public static getDisplayRect(Landroid/content/Context;)Landroid/graphics/Rect;
    .locals 1

    .line 1846
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->getUiStyle()I

    move-result v0

    .line 1847
    invoke-static {p0, v0}, Lcom/android/camera/Util;->getDisplayRect(Landroid/content/Context;I)Landroid/graphics/Rect;

    move-result-object p0

    return-object p0
.end method

.method public static getDisplayRect(Landroid/content/Context;I)Landroid/graphics/Rect;
    .locals 3

    .line 1857
    nop

    .line 1858
    nop

    .line 1860
    const/high16 v0, 0x40400000    # 3.0f

    if-eqz p1, :cond_2

    const/4 v1, 0x3

    if-eq p1, v1, :cond_1

    .line 1863
    sget p1, Lcom/android/camera/Util;->sWindowWidth:I

    mul-int/lit8 p1, p1, 0x10

    int-to-float p1, p1

    const/high16 v1, 0x41100000    # 9.0f

    div-float/2addr p1, v1

    float-to-int p1, p1

    .line 1864
    sget-boolean v1, Lcom/android/camera/Util;->isLongRatioScreen:Z

    if-eqz v1, :cond_0

    .line 1865
    sget v1, Lcom/android/camera/Util;->sWindowWidth:I

    mul-int/lit8 v1, v1, 0x4

    int-to-float v1, v1

    div-float/2addr v1, v0

    float-to-int v0, v1

    .line 1866
    sget v1, Lcom/android/camera/Util;->sWindowHeight:I

    sub-int/2addr v1, v0

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-static {p0}, Lcom/android/camera/Util;->getBottomHeight(Landroid/content/res/Resources;)I

    move-result p0

    sub-int/2addr v1, p0

    .line 1867
    goto :goto_0

    .line 1868
    :cond_0
    sget p0, Lcom/android/camera/Util;->sWindowHeight:I

    sub-int/2addr p0, p1

    sget v0, Lcom/android/camera/Util;->sNavigationBarHeight:I

    sub-int v1, p0, v0

    .line 1870
    goto :goto_0

    .line 1873
    :cond_1
    sget p1, Lcom/android/camera/Util;->sWindowHeight:I

    .line 1874
    sget v1, Lcom/android/camera/Util;->sStatusBarHeight:I

    .line 1875
    goto :goto_0

    .line 1878
    :cond_2
    sget p1, Lcom/android/camera/Util;->sWindowWidth:I

    mul-int/lit8 p1, p1, 0x4

    int-to-float p1, p1

    div-float/2addr p1, v0

    float-to-int p1, p1

    .line 1879
    sget v0, Lcom/android/camera/Util;->sWindowHeight:I

    sub-int/2addr v0, p1

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-static {p0}, Lcom/android/camera/Util;->getBottomHeight(Landroid/content/res/Resources;)I

    move-result p0

    sub-int v1, v0, p0

    .line 1883
    :goto_0
    const/4 p0, 0x2

    const/4 v0, 0x0

    if-gt v1, p0, :cond_3

    .line 1884
    nop

    .line 1887
    move v1, v0

    :cond_3
    new-instance p0, Landroid/graphics/Rect;

    sget v2, Lcom/android/camera/Util;->sWindowWidth:I

    add-int/2addr p1, v1

    invoke-direct {p0, v0, v1, v2, p1}, Landroid/graphics/Rect;-><init>(IIII)V

    return-object p0
.end method

.method public static getDisplayRotation(Landroid/app/Activity;)I
    .locals 3

    .line 721
    nop

    .line 723
    invoke-static {}, Lcom/mi/config/b;->hw()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 724
    invoke-virtual {p0}, Landroid/app/Activity;->getRequestedOrientation()I

    move-result v0

    const/4 v2, 0x7

    if-ne v0, v2, :cond_0

    .line 725
    invoke-virtual {p0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object p0

    invoke-interface {p0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/Display;->getRotation()I

    move-result p0

    goto :goto_1

    .line 726
    :cond_0
    sget p0, Lcom/android/camera/Util;->mLockedOrientation:I

    if-eqz p0, :cond_2

    sget p0, Lcom/android/camera/Util;->mLockedOrientation:I

    const/4 v0, 0x2

    if-ne p0, v0, :cond_1

    goto :goto_0

    .line 730
    :cond_1
    move p0, v1

    goto :goto_1

    .line 727
    :cond_2
    :goto_0
    sget p0, Lcom/android/camera/Util;->mLockedOrientation:I

    .line 730
    :goto_1
    packed-switch p0, :pswitch_data_0

    .line 740
    return v1

    .line 738
    :pswitch_0
    const/16 p0, 0x10e

    return p0

    .line 736
    :pswitch_1
    const/16 p0, 0xb4

    return p0

    .line 734
    :pswitch_2
    const/16 p0, 0x5a

    return p0

    .line 732
    :pswitch_3
    return v1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static getDualCameraWatermarkData(II[I)[B
    .locals 13

    .line 3027
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fe()Z

    move-result v0

    .line 3029
    if-eqz v0, :cond_1

    .line 3030
    new-instance v0, Ljava/io/File;

    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    sget-object v2, Lcom/android/camera/Util;->WATERMARK_FILE_NAME:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    .line 3031
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 3032
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 3033
    invoke-static {}, Lcom/android/camera/Util;->generateCustomWatermark2File()Landroid/graphics/Bitmap;

    .line 3035
    :cond_0
    goto :goto_0

    .line 3036
    :cond_1
    invoke-static {}, Lcom/android/camera/CameraSettings;->getDualCameraWaterMarkFilePathVendor()Ljava/lang/String;

    move-result-object v0

    .line 3039
    :goto_0
    nop

    .line 3040
    const/4 v1, 0x0

    :try_start_0
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, v0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    .line 3041
    :try_start_1
    invoke-static {v2}, Lmiui/util/IOUtils;->toByteArray(Ljava/io/InputStream;)[B

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 3042
    :try_start_2
    invoke-static {v1, v2}, Lcom/android/camera/Util;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 3044
    goto :goto_3

    .line 3042
    :catch_0
    move-exception v1

    move-object v12, v1

    move-object v1, v0

    move-object v0, v12

    goto :goto_2

    :catchall_0
    move-exception v0

    move-object v3, v1

    goto :goto_1

    .line 3040
    :catch_1
    move-exception v0

    :try_start_3
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 3042
    :catchall_1
    move-exception v3

    move-object v12, v3

    move-object v3, v0

    move-object v0, v12

    :goto_1
    :try_start_4
    invoke-static {v3, v2}, Lcom/android/camera/Util;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V

    throw v0
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    :catch_2
    move-exception v0

    .line 3043
    :goto_2
    const-string v2, "CameraUtil"

    const-string v3, "Failed to load dual camera water mark"

    invoke-static {v2, v3, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 3046
    move-object v0, v1

    :goto_3
    if-eqz v0, :cond_2

    if-eqz p2, :cond_2

    array-length v1, p2

    const/4 v2, 0x4

    if-lt v1, v2, :cond_2

    .line 3048
    array-length v1, v0

    const/4 v2, 0x0

    invoke-static {v0, v2, v1}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 3049
    if-eqz v1, :cond_2

    .line 3050
    const v3, 0x7f0a00ad

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-static {v3, v4}, Lcom/android/camera/CameraSettings;->getResourceFloat(IF)F

    move-result v9

    .line 3051
    const v3, 0x7f0a00ae

    invoke-static {v3, v4}, Lcom/android/camera/CameraSettings;->getResourceFloat(IF)F

    move-result v10

    .line 3052
    const v3, 0x7f0a00af

    invoke-static {v3, v4}, Lcom/android/camera/CameraSettings;->getResourceFloat(IF)F

    move-result v11

    .line 3053
    nop

    .line 3055
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    .line 3053
    move v5, p0

    move v6, p1

    invoke-static/range {v5 .. v11}, Lcom/android/camera/Util;->calcDualCameraWatermarkLocation(IIIIFFF)[I

    move-result-object p0

    .line 3057
    array-length p1, p0

    invoke-static {p0, v2, p2, v2, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 3061
    :cond_2
    return-object v0
.end method

.method public static getDuration(Ljava/io/FileDescriptor;)J
    .locals 3

    .line 2355
    new-instance v0, Landroid/media/MediaMetadataRetriever;

    invoke-direct {v0}, Landroid/media/MediaMetadataRetriever;-><init>()V

    .line 2357
    :try_start_0
    invoke-virtual {v0, p0}, Landroid/media/MediaMetadataRetriever;->setDataSource(Ljava/io/FileDescriptor;)V

    .line 2358
    const/16 p0, 0x9

    invoke-virtual {v0, p0}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2363
    invoke-virtual {v0}, Landroid/media/MediaMetadataRetriever;->release()V

    .line 2358
    return-wide v1

    .line 2363
    :catchall_0
    move-exception p0

    goto :goto_0

    .line 2360
    :catch_0
    move-exception p0

    .line 2361
    :try_start_1
    const-string v1, "CameraUtil"

    invoke-virtual {p0}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, p0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2363
    invoke-virtual {v0}, Landroid/media/MediaMetadataRetriever;->release()V

    .line 2364
    nop

    .line 2365
    const-wide/16 v0, 0x0

    return-wide v0

    .line 2363
    :goto_0
    invoke-virtual {v0}, Landroid/media/MediaMetadataRetriever;->release()V

    throw p0
.end method

.method public static getDuration(Ljava/lang/String;)J
    .locals 3

    .line 2341
    new-instance v0, Landroid/media/MediaMetadataRetriever;

    invoke-direct {v0}, Landroid/media/MediaMetadataRetriever;-><init>()V

    .line 2343
    :try_start_0
    invoke-virtual {v0, p0}, Landroid/media/MediaMetadataRetriever;->setDataSource(Ljava/lang/String;)V

    .line 2344
    const/16 p0, 0x9

    invoke-virtual {v0, p0}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2349
    invoke-virtual {v0}, Landroid/media/MediaMetadataRetriever;->release()V

    .line 2344
    return-wide v1

    .line 2349
    :catchall_0
    move-exception p0

    goto :goto_0

    .line 2346
    :catch_0
    move-exception p0

    .line 2347
    :try_start_1
    const-string v1, "CameraUtil"

    invoke-virtual {p0}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, p0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2349
    invoke-virtual {v0}, Landroid/media/MediaMetadataRetriever;->release()V

    .line 2350
    nop

    .line 2351
    const-wide/16 v0, 0x0

    return-wide v0

    .line 2349
    :goto_0
    invoke-virtual {v0}, Landroid/media/MediaMetadataRetriever;->release()V

    throw p0
.end method

.method public static getExif(Ljava/lang/String;)Lcom/android/gallery3d/exif/ExifInterface;
    .locals 2

    .line 2062
    new-instance v0, Lcom/android/gallery3d/exif/ExifInterface;

    invoke-direct {v0}, Lcom/android/gallery3d/exif/ExifInterface;-><init>()V

    .line 2064
    :try_start_0
    invoke-virtual {v0, p0}, Lcom/android/gallery3d/exif/ExifInterface;->readExif(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2067
    goto :goto_0

    .line 2065
    :catch_0
    move-exception p0

    .line 2066
    const-string v1, "CameraUtil"

    invoke-virtual {p0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2068
    :goto_0
    return-object v0
.end method

.method public static getExif([B)Lcom/android/gallery3d/exif/ExifInterface;
    .locals 2

    .line 2052
    new-instance v0, Lcom/android/gallery3d/exif/ExifInterface;

    invoke-direct {v0}, Lcom/android/gallery3d/exif/ExifInterface;-><init>()V

    .line 2054
    :try_start_0
    invoke-virtual {v0, p0}, Lcom/android/gallery3d/exif/ExifInterface;->readExif([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2057
    goto :goto_0

    .line 2055
    :catch_0
    move-exception p0

    .line 2056
    const-string v1, "CameraUtil"

    invoke-virtual {p0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2058
    :goto_0
    return-object v0
.end method

.method public static getFileTitleFromPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1149
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 1150
    return-object v1

    .line 1153
    :cond_0
    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    .line 1154
    if-ltz v0, :cond_4

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-lt v0, v2, :cond_1

    goto :goto_1

    .line 1158
    :cond_1
    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 1159
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1160
    return-object v1

    .line 1162
    :cond_2
    const-string v0, "."

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 1163
    if-gez v0, :cond_3

    goto :goto_0

    :cond_3
    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    :goto_0
    return-object p0

    .line 1156
    :cond_4
    :goto_1
    return-object v1
.end method

.method public static getFirstPlane(Landroid/media/Image;)[B
    .locals 1

    .line 2463
    invoke-virtual {p0}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object p0

    .line 2464
    array-length v0, p0

    if-lez v0, :cond_0

    .line 2465
    const/4 v0, 0x0

    aget-object p0, p0, v0

    invoke-virtual {p0}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object p0

    .line 2466
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    new-array v0, v0, [B

    .line 2467
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 2468
    return-object v0

    .line 2470
    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static getIntField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)I
    .locals 1

    .line 1682
    :try_start_0
    invoke-static {p0, p2, p3}, Lmiui/reflect/Field;->of(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lmiui/reflect/Field;

    move-result-object p2

    .line 1683
    invoke-virtual {p2, p1}, Lmiui/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result p1
    :try_end_0
    .catch Lmiui/reflect/NoSuchClassException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lmiui/reflect/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    .line 1686
    :catch_0
    move-exception p0

    .line 1687
    const-string p1, "CameraUtil"

    const-string p2, "no field "

    invoke-static {p1, p2, p0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 1684
    :catch_1
    move-exception p1

    .line 1685
    const-string p2, "CameraUtil"

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "no class "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p2, p0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1688
    nop

    .line 1689
    :goto_0
    const/high16 p0, -0x80000000

    return p0
.end method

.method public static getJpegRotation(II)I
    .locals 2

    .line 1214
    nop

    .line 1215
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getCapabilities(I)Lcom/android/camera2/CameraCapabilities;

    move-result-object p0

    .line 1216
    invoke-virtual {p0}, Lcom/android/camera2/CameraCapabilities;->getSensorOrientation()I

    move-result v0

    .line 1217
    const/4 v1, -0x1

    if-eq p1, v1, :cond_1

    .line 1218
    invoke-virtual {p0}, Lcom/android/camera2/CameraCapabilities;->getFacing()I

    move-result p0

    if-nez p0, :cond_0

    .line 1219
    sub-int/2addr v0, p1

    add-int/lit16 v0, v0, 0x168

    rem-int/lit16 v0, v0, 0x168

    goto :goto_0

    .line 1221
    :cond_0
    add-int/2addr v0, p1

    rem-int/lit16 v0, v0, 0x168

    goto :goto_0

    .line 1224
    :cond_1
    nop

    .line 1225
    const-string p0, "CameraUtil"

    const-string p1, "getJpegRotation: orientation UNKNOWN!!! return sensorOrientation..."

    invoke-static {p0, p1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1227
    :goto_0
    return v0
.end method

.method public static getLanTineGBTypeface(Landroid/content/Context;)Landroid/graphics/Typeface;
    .locals 1

    .line 1383
    const-string v0, "fonts/MI+LanTing_GB+Outside+YS_V2.3_20160322.ttf"

    invoke-static {p0, v0}, Lcom/android/camera/Util;->getTypeface(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object p0

    return-object p0
.end method

.method public static getMFYueYuanTypeface(Landroid/content/Context;)Landroid/graphics/Typeface;
    .locals 1

    .line 1379
    const-string v0, "fonts/MFYueYuan-Regular.ttf"

    invoke-static {p0, v0}, Lcom/android/camera/Util;->getTypeface(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object p0

    return-object p0
.end method

.method public static getMethod([Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)Lmiui/reflect/Method;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lmiui/reflect/Method;"
        }
    .end annotation

    .line 1496
    nop

    .line 1498
    const/4 v0, 0x0

    if-eqz p0, :cond_0

    const/4 v1, 0x0

    :try_start_0
    array-length v2, p0

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    .line 1499
    aget-object v2, p0, v1

    invoke-static {v2, p1, p2}, Lmiui/reflect/Method;->of(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)Lmiui/reflect/Method;

    move-result-object v2
    :try_end_0
    .catch Lmiui/reflect/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1507
    move-object v0, v2

    goto :goto_0

    .line 1501
    :catch_0
    move-exception v2

    .line 1502
    aget-object v2, p0, v1

    invoke-virtual {v2}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 1503
    aget-object v0, p0, v1

    invoke-virtual {v0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    aput-object v0, p0, v1

    .line 1504
    invoke-static {p0, p1, p2}, Lcom/android/camera/Util;->getMethod([Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)Lmiui/reflect/Method;

    move-result-object v0

    goto :goto_1

    .line 1507
    :cond_0
    :goto_0
    nop

    .line 1508
    :cond_1
    :goto_1
    if-nez v0, :cond_2

    .line 1509
    const-string p0, "CameraUtil"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getMethod fail, "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "["

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "]"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1511
    :cond_2
    return-object v0
.end method

.method public static getMiuiBoldTypeface(Landroid/content/Context;)Landroid/graphics/Typeface;
    .locals 1

    .line 1375
    const-string v0, "fonts/MIUI_Bold.ttf"

    invoke-static {p0, v0}, Lcom/android/camera/Util;->getTypeface(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object p0

    return-object p0
.end method

.method public static getMiuiTimeTypeface(Landroid/content/Context;)Landroid/graphics/Typeface;
    .locals 1

    .line 1387
    const-string v0, "fonts/MIUI_Time.ttf"

    invoke-static {p0, v0}, Lcom/android/camera/Util;->getTypeface(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object p0

    return-object p0
.end method

.method public static getMiuiTypeface(Landroid/content/Context;)Landroid/graphics/Typeface;
    .locals 1

    .line 1371
    const-string v0, "fonts/MIUI_Normal.ttf"

    invoke-static {p0, v0}, Lcom/android/camera/Util;->getTypeface(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object p0

    return-object p0
.end method

.method public static getNavigationBarHeight(Landroid/content/Context;)I
    .locals 3

    .line 1746
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    .line 1747
    const-string v0, "navigation_bar_height"

    const-string v1, "dimen"

    const-string v2, "android"

    invoke-virtual {p0, v0, v1, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 1748
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p0

    .line 1749
    const-string v0, "CameraUtil"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "navBarHeight="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1750
    return p0
.end method

.method public static getOptimalJpegThumbnailSize(Ljava/util/List;D)Lcom/android/camera/CameraSize;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/camera/CameraSize;",
            ">;D)",
            "Lcom/android/camera/CameraSize;"
        }
    .end annotation

    .line 915
    nop

    .line 916
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 917
    const-string p0, "CameraUtil"

    const-string p1, "null thumbnail size list"

    invoke-static {p0, p1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 918
    return-object v0

    .line 921
    :cond_0
    nop

    .line 923
    const-wide/16 v1, 0x0

    .line 925
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/camera/CameraSize;

    .line 926
    invoke-virtual {v4}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v5

    if-eqz v5, :cond_1

    invoke-virtual {v4}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v5

    if-nez v5, :cond_2

    .line 927
    goto :goto_0

    .line 929
    :cond_2
    invoke-virtual {v4}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v5

    int-to-double v5, v5

    invoke-virtual {v4}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v7

    int-to-double v7, v7

    div-double/2addr v5, v7

    .line 930
    sub-double v7, v5, p1

    invoke-static {v7, v8}, Ljava/lang/Math;->abs(D)D

    move-result-wide v7

    .line 931
    sub-double v9, v1, p1

    invoke-static {v9, v10}, Ljava/lang/Math;->abs(D)D

    move-result-wide v11

    cmpl-double v11, v7, v11

    if-lez v11, :cond_3

    const-wide v11, 0x3f50624dd2f1a9fcL    # 0.001

    cmpl-double v11, v7, v11

    if-lez v11, :cond_3

    .line 932
    goto :goto_0

    .line 934
    :cond_3
    if-eqz v0, :cond_4

    invoke-static {v9, v10}, Ljava/lang/Math;->abs(D)D

    move-result-wide v9

    cmpg-double v7, v7, v9

    if-ltz v7, :cond_4

    .line 935
    invoke-virtual {v4}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v7

    invoke-virtual {v0}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v8

    if-le v7, v8, :cond_5

    .line 936
    :cond_4
    nop

    .line 937
    nop

    .line 939
    move-object v0, v4

    move-wide v1, v5

    :cond_5
    goto :goto_0

    .line 943
    :cond_6
    if-nez v0, :cond_9

    .line 944
    const-string p1, "CameraUtil"

    const-string p2, "No thumbnail size match the aspect ratio"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 945
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_9

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/camera/CameraSize;

    .line 946
    if-eqz v0, :cond_7

    invoke-virtual {p1}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result p2

    invoke-virtual {v0}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v1

    if-le p2, v1, :cond_8

    .line 947
    :cond_7
    nop

    .line 949
    move-object v0, p1

    :cond_8
    goto :goto_1

    .line 951
    :cond_9
    return-object v0
.end method

.method public static getOptimalPreviewSize(IILjava/util/List;D)Lcom/android/camera/CameraSize;
    .locals 21
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ljava/util/List<",
            "Lcom/android/camera/CameraSize;",
            ">;D)",
            "Lcom/android/camera/CameraSize;"
        }
    .end annotation

    move/from16 v0, p0

    .line 801
    const/4 v1, 0x0

    if-nez p2, :cond_0

    .line 802
    const-string v0, "CameraUtil"

    const-string v2, "null preview size list"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 803
    return-object v1

    .line 806
    :cond_0
    nop

    .line 807
    nop

    .line 808
    nop

    .line 809
    nop

    .line 810
    nop

    .line 817
    const-string v3, "camera_reduce_preview_flag"

    const/4 v4, 0x0

    invoke-static {v3, v4}, Lcom/mi/config/d;->getInteger(Ljava/lang/String;I)I

    move-result v3

    .line 823
    const/16 v5, 0x438

    const/4 v7, 0x1

    if-eqz v3, :cond_6

    .line 824
    nop

    .line 825
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v8

    invoke-virtual {v8}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getFrontCameraId()I

    move-result v8

    move/from16 v9, p1

    if-ne v9, v8, :cond_1

    .line 828
    move v8, v7

    goto :goto_0

    .line 825
    :cond_1
    nop

    .line 828
    move v8, v4

    :goto_0
    sget v9, Lcom/android/camera/Util;->sWindowWidth:I

    if-ge v9, v5, :cond_2

    .line 829
    and-int/lit8 v3, v3, -0xf

    .line 831
    :cond_2
    if-eqz v8, :cond_3

    const/4 v8, 0x2

    goto :goto_1

    :cond_3
    move v8, v7

    :goto_1
    const/16 v9, 0xa2

    if-eq v0, v9, :cond_4

    const/16 v9, 0xa9

    if-eq v0, v9, :cond_4

    const/16 v9, 0xa8

    if-eq v0, v9, :cond_4

    const/16 v9, 0xaa

    if-eq v0, v9, :cond_4

    const/16 v9, 0xae

    if-eq v0, v9, :cond_4

    .line 835
    move v0, v4

    goto :goto_2

    :cond_4
    const/4 v0, 0x2

    :goto_2
    shl-int v0, v8, v0

    or-int/2addr v0, v4

    .line 836
    and-int/2addr v0, v3

    if-eqz v0, :cond_5

    .line 844
    move v0, v7

    goto :goto_3

    .line 836
    :cond_5
    nop

    .line 844
    :cond_6
    move v0, v4

    :goto_3
    new-instance v3, Landroid/graphics/Point;

    sget v8, Lcom/android/camera/Util;->sWindowWidth:I

    if-eqz v0, :cond_7

    sget v9, Lcom/android/camera/Util;->sWindowHeight:I

    const/16 v10, 0x780

    invoke-static {v9, v10}, Ljava/lang/Math;->min(II)I

    move-result v9

    goto :goto_4

    :cond_7
    sget v9, Lcom/android/camera/Util;->sWindowHeight:I

    :goto_4
    invoke-direct {v3, v8, v9}, Landroid/graphics/Point;-><init>(II)V

    .line 847
    invoke-static {}, Lcom/mi/config/b;->gW()Z

    move-result v8

    if-nez v8, :cond_8

    .line 848
    invoke-static {}, Lcom/mi/config/b;->gQ()Z

    move-result v8

    if-eqz v8, :cond_8

    const/16 v5, 0x2d0

    nop

    .line 849
    :cond_8
    iget v8, v3, Landroid/graphics/Point;->x:I

    if-le v8, v5, :cond_9

    .line 850
    iget v8, v3, Landroid/graphics/Point;->y:I

    mul-int/2addr v8, v5

    iget v9, v3, Landroid/graphics/Point;->x:I

    div-int/2addr v8, v9

    iput v8, v3, Landroid/graphics/Point;->y:I

    .line 851
    iput v5, v3, Landroid/graphics/Point;->x:I

    .line 855
    :cond_9
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    move-object v10, v1

    const-wide v11, 0x7fefffffffffffffL    # Double.MAX_VALUE

    const-wide v13, 0x7fefffffffffffffL    # Double.MAX_VALUE

    :goto_5
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_10

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/android/camera/CameraSize;

    .line 856
    iget v8, v15, Lcom/android/camera/CameraSize;->width:I

    int-to-double v8, v8

    iget v6, v15, Lcom/android/camera/CameraSize;->height:I

    move-object/from16 v18, v5

    int-to-double v4, v6

    div-double/2addr v8, v4

    .line 858
    sub-double v8, v8, p3

    invoke-static {v8, v9}, Ljava/lang/Math;->abs(D)D

    move-result-wide v8

    const-wide v19, 0x3f947ae147ae147bL    # 0.02

    cmpl-double v6, v8, v19

    if-lez v6, :cond_a

    .line 859
    goto :goto_6

    .line 861
    :cond_a
    if-eqz v0, :cond_c

    iget v6, v3, Landroid/graphics/Point;->x:I

    iget v8, v15, Lcom/android/camera/CameraSize;->height:I

    if-le v6, v8, :cond_b

    iget v6, v3, Landroid/graphics/Point;->y:I

    iget v8, v15, Lcom/android/camera/CameraSize;->width:I

    if-gt v6, v8, :cond_c

    .line 862
    :cond_b
    const-string v6, "CameraUtil"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "getOptimalPreviewSize: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Lcom/android/camera/CameraSize;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, " | "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Landroid/graphics/Point;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v8}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 863
    nop

    .line 855
    :goto_6
    move-object/from16 v5, v18

    const/4 v4, 0x0

    goto :goto_5

    .line 865
    :cond_c
    iget v6, v3, Landroid/graphics/Point;->x:I

    iget v8, v15, Lcom/android/camera/CameraSize;->height:I

    sub-int/2addr v6, v8

    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    move-result v6

    iget v8, v3, Landroid/graphics/Point;->y:I

    iget v9, v15, Lcom/android/camera/CameraSize;->width:I

    sub-int/2addr v8, v9

    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    move-result v8

    add-int/2addr v6, v8

    .line 866
    if-nez v6, :cond_d

    .line 867
    nop

    .line 868
    nop

    .line 869
    nop

    .line 885
    move-object v10, v15

    goto :goto_7

    .line 871
    :cond_d
    iget v8, v15, Lcom/android/camera/CameraSize;->height:I

    iget v9, v3, Landroid/graphics/Point;->x:I

    if-gt v8, v9, :cond_e

    iget v8, v15, Lcom/android/camera/CameraSize;->width:I

    iget v9, v3, Landroid/graphics/Point;->y:I

    if-gt v8, v9, :cond_e

    .line 872
    int-to-double v8, v6

    cmpg-double v19, v8, v11

    if-gez v19, :cond_e

    .line 873
    nop

    .line 874
    nop

    .line 877
    move-wide v11, v8

    move-object v10, v15

    :cond_e
    int-to-double v8, v6

    cmpg-double v6, v8, v13

    if-gez v6, :cond_f

    .line 878
    nop

    .line 879
    nop

    .line 882
    move-wide v13, v8

    move-object v1, v15

    :cond_f
    goto :goto_6

    .line 885
    :cond_10
    move-object v15, v1

    :goto_7
    if-eqz v10, :cond_11

    .line 886
    goto :goto_8

    .line 891
    :cond_11
    move-object v10, v15

    :goto_8
    if-nez v10, :cond_13

    .line 892
    const-string v0, "CameraUtil"

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v6, "no preview size match the aspect ratio: %.2f"

    new-array v8, v7, [Ljava/lang/Object;

    .line 893
    invoke-static/range {p3 .. p4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v8, v5

    .line 892
    invoke-static {v1, v6, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 894
    nop

    .line 895
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const-wide v16, 0x7fefffffffffffffL    # Double.MAX_VALUE

    :goto_9
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_13

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/CameraSize;

    .line 896
    iget v2, v3, Landroid/graphics/Point;->x:I

    invoke-virtual {v1}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v4

    sub-int/2addr v2, v4

    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    move-result v2

    iget v4, v3, Landroid/graphics/Point;->y:I

    invoke-virtual {v1}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v5

    sub-int/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    move-result v4

    add-int/2addr v2, v4

    .line 897
    int-to-double v4, v2

    cmpg-double v2, v4, v16

    if-gez v2, :cond_12

    .line 898
    nop

    .line 899
    nop

    .line 901
    move-object v10, v1

    move-wide/from16 v16, v4

    :cond_12
    goto :goto_9

    .line 904
    :cond_13
    if-eqz v10, :cond_14

    .line 905
    const-string v0, "CameraUtil"

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v2, "best preview size: %dx%d"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    .line 906
    invoke-virtual {v10}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v10}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v7

    .line 905
    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 908
    :cond_14
    return-object v10
.end method

.method public static getOptimalVideoSnapshotPictureSize(Ljava/util/List;DII)Lcom/android/camera/CameraSize;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/camera/CameraSize;",
            ">;DII)",
            "Lcom/android/camera/CameraSize;"
        }
    .end annotation

    .line 958
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 959
    const-string p0, "CameraUtil"

    const-string p1, "null size list"

    invoke-static {p0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 960
    return-object v0

    .line 963
    :cond_0
    nop

    .line 966
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/camera/CameraSize;

    .line 967
    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v3

    int-to-double v3, v3

    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v5

    int-to-double v5, v5

    div-double/2addr v3, v5

    .line 968
    sub-double/2addr v3, p1

    invoke-static {v3, v4}, Ljava/lang/Math;->abs(D)D

    move-result-wide v3

    const-wide v5, 0x3f947ae147ae147bL    # 0.02

    cmpl-double v3, v3, v5

    if-lez v3, :cond_1

    .line 969
    goto :goto_0

    .line 971
    :cond_1
    if-eqz v0, :cond_2

    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v3

    invoke-virtual {v0}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v4

    if-le v3, v4, :cond_3

    .line 972
    :cond_2
    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v3

    if-gt v3, p3, :cond_3

    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v3

    if-gt v3, p4, :cond_3

    .line 973
    nop

    .line 975
    move-object v0, v2

    :cond_3
    goto :goto_0

    .line 979
    :cond_4
    if-nez v0, :cond_7

    .line 980
    const-string p1, "CameraUtil"

    const-string p2, "No picture size match the aspect ratio"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 981
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_7

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/camera/CameraSize;

    .line 982
    if-eqz v0, :cond_5

    invoke-virtual {p1}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result p2

    invoke-virtual {v0}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result p3

    if-le p2, p3, :cond_6

    .line 983
    :cond_5
    nop

    .line 985
    move-object v0, p1

    :cond_6
    goto :goto_1

    .line 987
    :cond_7
    return-object v0
.end method

.method public static getRatio(Ljava/lang/String;)F
    .locals 1

    .line 2716
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v0, "19.5x9"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x4

    goto :goto_1

    :sswitch_1
    const-string v0, "18x9"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x3

    goto :goto_1

    :sswitch_2
    const-string v0, "16x9"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_1

    :sswitch_3
    const-string v0, "4x3"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x0

    goto :goto_1

    :sswitch_4
    const-string v0, "1x1"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x2

    goto :goto_1

    :cond_0
    :goto_0
    const/4 p0, -0x1

    :goto_1
    const v0, 0x3faa3d71    # 1.33f

    packed-switch p0, :pswitch_data_0

    .line 2728
    return v0

    .line 2726
    :pswitch_0
    const p0, 0x400a3d71    # 2.16f

    return p0

    .line 2724
    :pswitch_1
    const/high16 p0, 0x40000000    # 2.0f

    return p0

    .line 2722
    :pswitch_2
    const/high16 p0, 0x3f800000    # 1.0f

    return p0

    .line 2720
    :pswitch_3
    const p0, 0x3fe28f5c    # 1.77f

    return p0

    .line 2718
    :pswitch_4
    return v0

    nop

    :sswitch_data_0
    .sparse-switch
        0xc6aa -> :sswitch_4
        0xd1ef -> :sswitch_3
        0x171fa6 -> :sswitch_2
        0x172728 -> :sswitch_1
        0x56d670f0 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static getRelativeLocation(Landroid/view/View;Landroid/view/View;)[I
    .locals 4

    .line 1026
    const/4 v0, 0x2

    new-array v0, v0, [I

    .line 1027
    invoke-virtual {p0, v0}, Landroid/view/View;->getLocationInWindow([I)V

    .line 1028
    const/4 p0, 0x0

    aget v1, v0, p0

    .line 1029
    const/4 v2, 0x1

    aget v3, v0, v2

    .line 1030
    invoke-virtual {p1, v0}, Landroid/view/View;->getLocationInWindow([I)V

    .line 1031
    aget p1, v0, p0

    sub-int/2addr p1, v1

    aput p1, v0, p0

    .line 1032
    aget p0, v0, v2

    sub-int/2addr p0, v3

    aput p0, v0, v2

    .line 1033
    return-object v0
.end method

.method public static getScreenInches(Landroid/content/Context;)D
    .locals 7

    .line 1693
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    .line 1694
    const-string v1, "window"

    .line 1695
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/WindowManager;

    .line 1696
    invoke-interface {p0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 1698
    sget p0, Lcom/android/camera/Util;->sWindowWidth:I

    int-to-float p0, p0

    iget v1, v0, Landroid/util/DisplayMetrics;->xdpi:F

    div-float/2addr p0, v1

    float-to-double v1, p0

    const-wide/high16 v3, 0x4000000000000000L    # 2.0

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v1

    .line 1699
    sget p0, Lcom/android/camera/Util;->sWindowHeight:I

    int-to-float p0, p0

    iget v0, v0, Landroid/util/DisplayMetrics;->ydpi:F

    div-float/2addr p0, v0

    float-to-double v5, p0

    invoke-static {v5, v6, v3, v4}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v3

    .line 1700
    add-double/2addr v1, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    .line 1701
    const-string p0, "CameraUtil"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getScreenInches="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1702
    return-wide v0
.end method

.method public static getScreenLightColor(I)I
    .locals 4

    .line 2285
    invoke-static {}, Lcom/android/camera/Util;->initScreenLightColorMap()V

    .line 2286
    sget-object v0, Lcom/android/camera/Util;->COLOR_TEMPERATURE_LIST:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-eqz v0, :cond_3

    sget-object v0, Lcom/android/camera/Util;->COLOR_TEMPERATURE_MAP:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    .line 2290
    :cond_0
    sget-object v0, Lcom/android/camera/Util;->COLOR_TEMPERATURE_LIST:Ljava/util/List;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/Util;->binarySearchRightMost(Ljava/util/List;Ljava/lang/Object;)I

    move-result v0

    .line 2291
    sget-object v1, Lcom/android/camera/Util;->COLOR_TEMPERATURE_LIST:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lt v0, v1, :cond_1

    .line 2292
    sget-object v0, Lcom/android/camera/Util;->COLOR_TEMPERATURE_LIST:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 2293
    :cond_1
    if-lez v0, :cond_2

    .line 2294
    sget-object v1, Lcom/android/camera/Util;->COLOR_TEMPERATURE_LIST:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sub-int/2addr v1, p0

    sget-object v2, Lcom/android/camera/Util;->COLOR_TEMPERATURE_LIST:Ljava/util/List;

    add-int/lit8 v3, v0, -0x1

    .line 2295
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    sub-int v2, p0, v2

    if-le v1, v2, :cond_2

    .line 2296
    nop

    .line 2299
    move v0, v3

    :cond_2
    :goto_0
    const-string v1, "CameraUtil"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getScreenLightColor "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, "K -> "

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p0, Lcom/android/camera/Util;->COLOR_TEMPERATURE_LIST:Ljava/util/List;

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, "K"

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2300
    sget-object p0, Lcom/android/camera/Util;->COLOR_TEMPERATURE_MAP:Ljava/util/List;

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    return p0

    .line 2287
    :cond_3
    :goto_1
    const-string p0, "CameraUtil"

    const-string v0, "color temperature list empty!"

    invoke-static {p0, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2288
    const/4 p0, -0x1

    return p0
.end method

.method public static getSensorOrientation(I)I
    .locals 1

    .line 765
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getCapabilities(I)Lcom/android/camera2/CameraCapabilities;

    move-result-object p0

    .line 766
    invoke-virtual {p0}, Lcom/android/camera2/CameraCapabilities;->getSensorOrientation()I

    move-result p0

    return p0
.end method

.method public static getShootOrientation(Landroid/app/Activity;I)I
    .locals 0

    .line 705
    invoke-static {p0}, Lcom/android/camera/Util;->getDisplayRotation(Landroid/app/Activity;)I

    move-result p0

    sub-int/2addr p1, p0

    add-int/lit16 p1, p1, 0x168

    rem-int/lit16 p1, p1, 0x168

    return p1
.end method

.method public static getShootRotation(Landroid/app/Activity;F)F
    .locals 1

    .line 709
    invoke-static {p0}, Lcom/android/camera/Util;->getDisplayRotation(Landroid/app/Activity;)I

    move-result p0

    int-to-float p0, p0

    sub-float/2addr p1, p0

    .line 710
    :goto_0
    const/4 p0, 0x0

    cmpg-float p0, p1, p0

    const/high16 v0, 0x43b40000    # 360.0f

    if-gez p0, :cond_0

    .line 711
    add-float/2addr p1, v0

    goto :goto_0

    .line 713
    :cond_0
    :goto_1
    cmpl-float p0, p1, v0

    if-lez p0, :cond_1

    .line 714
    sub-float/2addr p1, v0

    goto :goto_1

    .line 716
    :cond_1
    return p1
.end method

.method private static getStaticObjectField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchFieldException;,
            Ljava/lang/SecurityException;,
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .line 2448
    invoke-virtual {p0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p0

    .line 2449
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 2450
    invoke-virtual {p0, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static getStatusBarHeight(Landroid/content/Context;)I
    .locals 4

    .line 1767
    nop

    .line 1768
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "status_bar_height"

    const-string v2, "dimen"

    const-string v3, "android"

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 1769
    if-lez v0, :cond_0

    .line 1770
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p0

    goto :goto_0

    .line 1772
    :cond_0
    const/4 p0, 0x0

    :goto_0
    const-string v0, "CameraUtil"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "StatusBarHeight="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1773
    return p0
.end method

.method public static getStorageDirectory()Ljava/io/File;
    .locals 1

    .line 1327
    invoke-static {}, Lcom/android/camera/Util;->isExternalStorageMounted()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1328
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v0

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/android/camera/Util;->INTERNAL_STORAGE_DIRECTORY:Ljava/io/File;

    .line 1327
    :goto_0
    return-object v0
.end method

.method public static getTimeWaterMarkData(IILjava/lang/String;[I)[B
    .locals 2

    .line 2329
    new-instance v0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;

    const/4 v1, 0x0

    invoke-direct {v0, p2, p0, p1, v1}, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;-><init>(Ljava/lang/String;III)V

    .line 2330
    if-eqz p3, :cond_0

    array-length p0, p3

    const/4 p1, 0x4

    if-lt p0, p1, :cond_0

    .line 2331
    invoke-virtual {v0}, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->getWidth()I

    move-result p0

    aput p0, p3, v1

    .line 2332
    const/4 p0, 0x1

    invoke-virtual {v0}, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->getHeight()I

    move-result p1

    aput p1, p3, p0

    .line 2333
    const/4 p0, 0x2

    invoke-virtual {v0}, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->getPaddingX()I

    move-result p1

    aput p1, p3, p0

    .line 2334
    const/4 p0, 0x3

    invoke-virtual {v0}, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->getPaddingY()I

    move-result p1

    aput p1, p3, p0

    .line 2336
    :cond_0
    invoke-virtual {v0}, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->getTexture()Lcom/android/gallery3d/ui/BasicTexture;

    move-result-object p0

    check-cast p0, Lcom/android/gallery3d/ui/StringTexture;

    sget-object p1, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    invoke-virtual {p0, p1}, Lcom/android/gallery3d/ui/StringTexture;->getBitmapData(Landroid/graphics/Bitmap$CompressFormat;)[B

    move-result-object p0

    .line 2337
    return-object p0
.end method

.method public static getTimeWatermark()Ljava/lang/String;
    .locals 1

    .line 1471
    invoke-static {}, Lcom/mi/config/b;->gf()Z

    move-result v0

    invoke-static {v0}, Lcom/android/camera/Util;->getTimeWatermark(Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getTimeWatermark(Z)Ljava/lang/String;
    .locals 7

    .line 1475
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1476
    if-eqz p0, :cond_0

    .line 1477
    new-instance p0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy/M/d"

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-direct {p0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    .line 1478
    invoke-virtual {p0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object p0

    .line 1479
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 1480
    goto :goto_0

    .line 1481
    :cond_0
    new-instance p0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-M-d"

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-direct {p0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    .line 1482
    invoke-virtual {p0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object p0

    .line 1483
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 1485
    :goto_0
    const-string p0, " "

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1486
    new-instance p0, Landroid/text/format/Time;

    invoke-direct {p0}, Landroid/text/format/Time;-><init>()V

    .line 1487
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {p0, v1, v2}, Landroid/text/format/Time;->set(J)V

    .line 1488
    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v2, "%02d"

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Object;

    iget v5, p0, Landroid/text/format/Time;->hour:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, v4, v6

    invoke-static {v1, v2, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1489
    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1490
    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v2, "%02d"

    new-array v3, v3, [Ljava/lang/Object;

    iget p0, p0, Landroid/text/format/Time;->minute:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    aput-object p0, v3, v6

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1492
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static declared-synchronized getTypeface(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Typeface;
    .locals 2

    const-class v0, Lcom/android/camera/Util;

    monitor-enter v0

    .line 1391
    :try_start_0
    sget-object v1, Lcom/android/camera/Util;->sTypefaces:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1392
    sget-object v1, Lcom/android/camera/Util;->sTypefaces:Ljava/util/HashMap;

    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p0

    invoke-static {p0, p1}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object p0

    invoke-virtual {v1, p1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1394
    :cond_0
    sget-object p0, Lcom/android/camera/Util;->sTypefaces:Ljava/util/HashMap;

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/graphics/Typeface;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    .line 1390
    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method private static initScreenLightColorMap()V
    .locals 9

    .line 2173
    sget-object v0, Lcom/android/camera/Util;->COLOR_TEMPERATURE_LIST:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-gtz v0, :cond_b

    sget-object v0, Lcom/android/camera/Util;->COLOR_TEMPERATURE_MAP:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    goto/16 :goto_6

    .line 2177
    :cond_0
    invoke-static {}, Lcom/android/camera/Util;->getColorMapXmlMapFile()Ljava/io/File;

    move-result-object v0

    .line 2178
    nop

    .line 2179
    nop

    .line 2180
    const/4 v1, 0x0

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    .line 2182
    :try_start_0
    new-instance v3, Ljava/io/FileReader;

    invoke-direct {v3, v0}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_2

    .line 2183
    :try_start_1
    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    move-result-object v0

    .line 2184
    invoke-virtual {v0, v2}, Lorg/xmlpull/v1/XmlPullParserFactory;->setNamespaceAware(Z)V

    .line 2185
    invoke-virtual {v0}, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v0
    :try_end_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    .line 2186
    :try_start_2
    invoke-interface {v0, v3}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/Reader;)V
    :try_end_2
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_0

    .line 2189
    goto :goto_1

    .line 2187
    :catch_0
    move-exception v4

    goto :goto_0

    :catch_1
    move-exception v4

    move-object v0, v1

    goto :goto_0

    :catch_2
    move-exception v4

    move-object v0, v1

    move-object v3, v0

    .line 2188
    :goto_0
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 2192
    :cond_1
    move-object v0, v1

    move-object v3, v0

    :goto_1
    if-nez v0, :cond_3

    .line 2193
    const-string v0, "CameraUtil"

    const-string v4, "Cannot find screen color map in system, try local resource."

    invoke-static {v0, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2194
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v4, "screen_light"

    const-string v5, "xml"

    .line 2195
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    .line 2194
    invoke-virtual {v0, v4, v5, v6}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 2196
    if-gtz v0, :cond_2

    .line 2197
    const-string v0, "CameraUtil"

    const-string v1, "res/xml/screen_light.xml not found!"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2198
    return-void

    .line 2200
    :cond_2
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, v0}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    move-result-object v0

    .line 2204
    :cond_3
    :goto_2
    :try_start_3
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v4

    const/4 v5, 0x3

    if-eq v4, v5, :cond_8

    .line 2205
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v4

    const/4 v5, 0x2

    if-eq v4, v5, :cond_4

    .line 2206
    goto :goto_2

    .line 2209
    :cond_4
    const-string v4, "screen"

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 2210
    sget-object v4, Lcom/android/camera/Util;->SCREEN_VENDOR:Ljava/lang/String;

    const-string v6, "vendor"

    invoke-interface {v0, v1, v6}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_5

    .line 2211
    invoke-static {v0}, Lcom/android/camera/Util;->skip(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_2

    .line 2213
    :cond_5
    const-string v1, "CameraUtil"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "load screen light parameters for "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v6, Lcom/android/camera/Util;->SCREEN_VENDOR:Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2214
    :goto_3
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    const/4 v4, 0x1

    if-eq v1, v4, :cond_8

    .line 2215
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v1

    if-eq v1, v5, :cond_6

    .line 2216
    goto :goto_3

    .line 2218
    :cond_6
    const-string v1, "light"

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    .line 2219
    goto :goto_4

    .line 2221
    :cond_7
    const-string v1, "CCT"

    invoke-static {v0, v1, v2}, Lcom/android/camera/Util;->getAttributeIntValue(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    move-result v1

    .line 2222
    const-string v4, "R"

    invoke-static {v0, v4, v2}, Lcom/android/camera/Util;->getAttributeIntValue(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    move-result v4

    .line 2223
    const-string v6, "G"

    invoke-static {v0, v6, v2}, Lcom/android/camera/Util;->getAttributeIntValue(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    move-result v6

    .line 2224
    const-string v7, "B"

    invoke-static {v0, v7, v2}, Lcom/android/camera/Util;->getAttributeIntValue(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    move-result v7

    .line 2225
    sget-object v8, Lcom/android/camera/Util;->COLOR_TEMPERATURE_LIST:Ljava/util/List;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v8, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2226
    sget-object v1, Lcom/android/camera/Util;->COLOR_TEMPERATURE_MAP:Ljava/util/List;

    invoke-static {v4, v6, v7}, Landroid/graphics/Color;->rgb(III)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_3
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_3 .. :try_end_3} :catch_4
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 2227
    goto :goto_3

    .line 2236
    :cond_8
    :goto_4
    invoke-static {v3}, Lcom/android/camera/Util;->closeSafely(Ljava/io/Closeable;)V

    .line 2237
    instance-of v1, v0, Landroid/content/res/XmlResourceParser;

    if-eqz v1, :cond_a

    goto :goto_5

    .line 2236
    :catchall_0
    move-exception v1

    invoke-static {v3}, Lcom/android/camera/Util;->closeSafely(Ljava/io/Closeable;)V

    .line 2237
    instance-of v2, v0, Landroid/content/res/XmlResourceParser;

    if-eqz v2, :cond_9

    .line 2238
    check-cast v0, Landroid/content/res/XmlResourceParser;

    invoke-interface {v0}, Landroid/content/res/XmlResourceParser;->close()V

    :cond_9
    throw v1

    .line 2234
    :catch_3
    move-exception v1

    .line 2236
    invoke-static {v3}, Lcom/android/camera/Util;->closeSafely(Ljava/io/Closeable;)V

    .line 2237
    instance-of v1, v0, Landroid/content/res/XmlResourceParser;

    if-eqz v1, :cond_a

    goto :goto_5

    .line 2233
    :catch_4
    move-exception v1

    .line 2236
    invoke-static {v3}, Lcom/android/camera/Util;->closeSafely(Ljava/io/Closeable;)V

    .line 2237
    instance-of v1, v0, Landroid/content/res/XmlResourceParser;

    if-eqz v1, :cond_a

    .line 2238
    :goto_5
    check-cast v0, Landroid/content/res/XmlResourceParser;

    invoke-interface {v0}, Landroid/content/res/XmlResourceParser;->close()V

    .line 2241
    :cond_a
    return-void

    .line 2174
    :cond_b
    :goto_6
    return-void
.end method

.method public static initialize(Landroid/content/Context;)V
    .locals 7

    .line 305
    const-string v0, "ro.miui.notch"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    sput-boolean v0, Lcom/android/camera/Util;->isNotchDevice:Z

    .line 306
    invoke-static {p0}, Lcom/android/camera/Util;->isFullScreenNavBarHidden(Landroid/content/Context;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Util;->sIsFullScreenNavBarHidden:Z

    .line 307
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    .line 308
    const-string v3, "window"

    .line 309
    invoke-virtual {p0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/WindowManager;

    .line 310
    invoke-interface {v3}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v4

    invoke-virtual {v4, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 311
    iget v0, v0, Landroid/util/DisplayMetrics;->noncompatDensity:F

    sput v0, Lcom/android/camera/Util;->sPixelDensity:F

    .line 312
    new-instance v0, Lcom/android/camera/Util$ImageFileNamer;

    const v4, 0x7f0900c8

    .line 313
    invoke-virtual {p0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Lcom/android/camera/Util$ImageFileNamer;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/android/camera/Util;->sImageFileNamer:Lcom/android/camera/Util$ImageFileNamer;

    .line 315
    const-string v0, "accessibility"

    .line 316
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/accessibility/AccessibilityManager;

    .line 317
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityManager;->isEnabled()Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Util;->sIsAccessibilityEnable:Z

    .line 319
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 320
    invoke-interface {v3}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/view/Display;->getRealSize(Landroid/graphics/Point;)V

    .line 324
    iget v3, v0, Landroid/graphics/Point;->x:I

    iget v4, v0, Landroid/graphics/Point;->y:I

    if-ge v3, v4, :cond_1

    .line 325
    iget v3, v0, Landroid/graphics/Point;->x:I

    sput v3, Lcom/android/camera/Util;->sWindowWidth:I

    .line 326
    iget v0, v0, Landroid/graphics/Point;->y:I

    sput v0, Lcom/android/camera/Util;->sWindowHeight:I

    goto :goto_1

    .line 328
    :cond_1
    iget v3, v0, Landroid/graphics/Point;->y:I

    sput v3, Lcom/android/camera/Util;->sWindowWidth:I

    .line 329
    iget v0, v0, Landroid/graphics/Point;->x:I

    sput v0, Lcom/android/camera/Util;->sWindowHeight:I

    .line 331
    :goto_1
    sget v0, Lcom/android/camera/Util;->sWindowWidth:I

    sget v3, Lcom/android/camera/Util;->sWindowHeight:I

    invoke-static {v0, v3}, Lcom/android/camera/Util;->isFind19_5_9LongRatioScreen(II)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Util;->isLongRatioScreen:Z

    .line 332
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v3, 0x7f0a00be

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    sput v0, Lcom/android/camera/Util;->sFullScreenExtraMargin:I

    .line 333
    invoke-static {p0}, Lcom/android/camera/Util;->checkDeviceHasNavigationBar(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 334
    invoke-static {p0}, Lcom/android/camera/Util;->getNavigationBarHeight(Landroid/content/Context;)I

    move-result v0

    goto :goto_2

    :cond_2
    invoke-static {p0}, Lcom/android/camera/Util;->calcNavigationBarHeight(Landroid/content/Context;)I

    move-result v0

    :goto_2
    sput v0, Lcom/android/camera/Util;->sNavigationBarHeight:I

    .line 335
    sget-boolean v0, Lcom/android/camera/Util;->isNotchDevice:Z

    const/4 v3, 0x2

    if-eqz v0, :cond_4

    .line 336
    sget-boolean v0, Lcom/android/camera/Util;->isLongRatioScreen:Z

    if-eqz v0, :cond_3

    .line 337
    invoke-static {p0}, Lcom/android/camera/Util;->getStatusBarHeight(Landroid/content/Context;)I

    move-result v0

    sput v0, Lcom/android/camera/Util;->sStatusBarHeight:I

    goto :goto_3

    .line 339
    :cond_3
    sget v0, Lcom/android/camera/Util;->sWindowHeight:I

    sget v4, Lcom/android/camera/Util;->sWindowWidth:I

    mul-int/2addr v4, v3

    sub-int/2addr v0, v4

    sput v0, Lcom/android/camera/Util;->sStatusBarHeight:I

    .line 342
    :goto_3
    sget-boolean v0, Lcom/android/camera/Util;->sIsFullScreenNavBarHidden:Z

    if-eqz v0, :cond_4

    sget-boolean v0, Lcom/android/camera/Util;->isLongRatioScreen:Z

    if-nez v0, :cond_4

    .line 343
    sget v0, Lcom/android/camera/Util;->sNavigationBarHeight:I

    sget v4, Lcom/android/camera/Util;->sFullScreenExtraMargin:I

    sub-int/2addr v0, v4

    sput v0, Lcom/android/camera/Util;->sNavigationBarHeight:I

    .line 344
    sget v0, Lcom/android/camera/Util;->sStatusBarHeight:I

    sget v4, Lcom/android/camera/Util;->sFullScreenExtraMargin:I

    div-int/2addr v4, v3

    add-int/2addr v0, v4

    sput v0, Lcom/android/camera/Util;->sStatusBarHeight:I

    .line 347
    :cond_4
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-static {p0}, Lcom/android/camera/Util;->getBottomHeight(Landroid/content/res/Resources;)I

    move-result p0

    sput p0, Lcom/android/camera/CameraSettings;->BOTTOM_CONTROL_HEIGHT:I

    .line 349
    const-string p0, "CameraUtil"

    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v4, "windowSize=%dx%d density=%.2f"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    sget v6, Lcom/android/camera/Util;->sWindowWidth:I

    .line 350
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v1

    sget v1, Lcom/android/camera/Util;->sWindowHeight:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v5, v2

    sget v1, Lcom/android/camera/Util;->sPixelDensity:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    aput-object v1, v5, v3

    .line 349
    invoke-static {v0, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 351
    return-void
.end method

.method public static installPackage(Landroid/content/Context;Ljava/lang/String;Lcom/android/camera/lib/compatibility/util/CompatibilityUtils$PackageInstallerListener;ZZ)V
    .locals 7

    .line 1945
    if-eqz p0, :cond_4

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_2

    .line 1951
    :cond_0
    const/4 v0, 0x0

    :try_start_0
    invoke-static {p2}, Lcom/android/camera/lib/compatibility/util/CompatibilityUtils;->getPackageInstallObserver(Lcom/android/camera/lib/compatibility/util/CompatibilityUtils$PackageInstallerListener;)Ljava/lang/Object;

    move-result-object v1

    .line 1953
    const-string v2, "miui.content.pm.PreloadedAppPolicy"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 1954
    const-string v3, "installPreloadedDataApp"

    .line 1955
    invoke-static {}, Lcom/android/camera/lib/compatibility/util/CompatibilityUtils;->getInstallMethodDescription()Ljava/lang/String;

    move-result-object v4

    .line 1954
    invoke-static {v2, v3, v4}, Lmiui/reflect/Method;->of(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)Lmiui/reflect/Method;

    move-result-object v3

    .line 1957
    nop

    .line 1958
    const/4 v4, 0x2

    const/4 v5, 0x1

    if-eqz p3, :cond_1

    .line 1960
    nop

    .line 1965
    move p3, v5

    goto :goto_0

    .line 1961
    :cond_1
    if-eqz p4, :cond_2

    .line 1963
    nop

    .line 1965
    move p3, v4

    goto :goto_0

    :cond_2
    move p3, v0

    :goto_0
    const/4 p4, 0x0

    const/4 v6, 0x4

    new-array v6, v6, [Ljava/lang/Object;

    aput-object p0, v6, v0

    aput-object p1, v6, v5

    aput-object v1, v6, v4

    const/4 p0, 0x3

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    aput-object p3, v6, p0

    invoke-virtual {v3, v2, p4, v6}, Lmiui/reflect/Method;->invokeBoolean(Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result p0

    .line 1966
    const-string p3, "CameraUtil"

    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "installPackage: result="

    invoke-virtual {p4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p3, p0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1972
    goto :goto_1

    .line 1967
    :catch_0
    move-exception p0

    .line 1968
    const-string p3, "CameraUtil"

    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p4

    invoke-static {p3, p4, p0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1969
    if-eqz p2, :cond_3

    .line 1970
    invoke-interface {p2, p1, v0}, Lcom/android/camera/lib/compatibility/util/CompatibilityUtils$PackageInstallerListener;->onPackageInstalled(Ljava/lang/String;Z)V

    .line 1973
    :cond_3
    :goto_1
    return-void

    .line 1946
    :cond_4
    :goto_2
    const-string p0, "CameraUtil"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "invalid params. pkgName="

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1947
    return-void
.end method

.method private static isAccessibilityEnable()Z
    .locals 1

    .line 2381
    sget-boolean v0, Lcom/android/camera/Util;->sIsAccessibilityEnable:Z

    return v0
.end method

.method public static isAccessible()Z
    .locals 2

    .line 2373
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_0

    invoke-static {}, Lcom/android/camera/Util;->isAccessibilityEnable()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2374
    const/4 v0, 0x1

    return v0

    .line 2376
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public static isActivityInvert(Landroid/app/Activity;)Z
    .locals 1

    .line 744
    invoke-static {p0}, Lcom/android/camera/Util;->getDisplayRotation(Landroid/app/Activity;)I

    move-result p0

    const/16 v0, 0xb4

    if-ne p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static isAntibanding60()Z
    .locals 2

    .line 264
    sget-object v0, Lcom/android/camera/Util;->ANTIBANDING_60_COUNTRY:Ljava/util/HashSet;

    sget-object v1, Lcom/android/camera/Util;->mCountryIso:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static final isAppLocked(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 3

    .line 1992
    nop

    .line 1993
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "access_control_lock_enabled"

    const/4 v2, -0x1

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    .line 1995
    move v0, v2

    goto :goto_0

    .line 1993
    :cond_0
    nop

    .line 1995
    move v0, v1

    :goto_0
    if-eqz v0, :cond_2

    .line 1996
    const-string v0, "security"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lmiui/security/SecurityManager;

    .line 1997
    invoke-virtual {p0, p1}, Lmiui/security/SecurityManager;->getApplicationAccessControlEnabled(Ljava/lang/String;)Z

    move-result v0

    .line 1998
    invoke-virtual {p0, p1}, Lmiui/security/SecurityManager;->checkAccessControlPass(Ljava/lang/String;)Z

    move-result p0

    .line 1999
    if-eqz v0, :cond_1

    if-nez p0, :cond_1

    move v1, v2

    nop

    :cond_1
    return v1

    .line 2001
    :cond_2
    return v1
.end method

.method public static isContains(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z
    .locals 3

    .line 1707
    const/4 v0, 0x0

    if-eqz p0, :cond_2

    if-nez p1, :cond_0

    goto :goto_0

    .line 1710
    :cond_0
    iget v1, p0, Landroid/graphics/RectF;->left:F

    iget v2, p0, Landroid/graphics/RectF;->right:F

    cmpg-float v1, v1, v2

    if-gez v1, :cond_1

    iget v1, p0, Landroid/graphics/RectF;->top:F

    iget v2, p0, Landroid/graphics/RectF;->bottom:F

    cmpg-float v1, v1, v2

    if-gez v1, :cond_1

    iget v1, p0, Landroid/graphics/RectF;->left:F

    iget v2, p1, Landroid/graphics/RectF;->left:F

    cmpg-float v1, v1, v2

    if-gtz v1, :cond_1

    iget v1, p0, Landroid/graphics/RectF;->top:F

    iget v2, p1, Landroid/graphics/RectF;->top:F

    cmpg-float v1, v1, v2

    if-gtz v1, :cond_1

    iget v1, p0, Landroid/graphics/RectF;->right:F

    iget v2, p1, Landroid/graphics/RectF;->right:F

    cmpl-float v1, v1, v2

    if-ltz v1, :cond_1

    iget p0, p0, Landroid/graphics/RectF;->bottom:F

    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    cmpl-float p0, p0, p1

    if-ltz p0, :cond_1

    const/4 v0, 0x1

    nop

    :cond_1
    return v0

    .line 1708
    :cond_2
    :goto_0
    return v0
.end method

.method public static isDebugOsBuild()Z
    .locals 2

    .line 2025
    const-string v0, "userdebug"

    sget-object v1, Landroid/os/Build;->TYPE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "eng"

    sget-object v1, Landroid/os/Build;->TYPE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-boolean v0, Lcom/android/camera/Util;->sIsDumpLog:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method private static isDevices(Ljava/lang/String;)Z
    .locals 3

    .line 2431
    const/4 v0, 0x0

    :try_start_0
    const-string v1, "miui.os.Build"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 2432
    if-eqz v1, :cond_1

    .line 2433
    invoke-static {v1, p0}, Lcom/android/camera/Util;->getStaticObjectField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    .line 2434
    if-nez p0, :cond_0

    .line 2435
    return v0

    .line 2437
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    .line 2441
    :cond_1
    goto :goto_0

    .line 2439
    :catch_0
    move-exception p0

    .line 2440
    const-string v1, "CameraUtil"

    const-string v2, "getClass error"

    invoke-static {v1, v2, p0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 2442
    :goto_0
    return v0
.end method

.method public static isEqualsZero(D)Z
    .locals 2

    .line 3001
    invoke-static {p0, p1}, Ljava/lang/Math;->abs(D)D

    move-result-wide p0

    const-wide v0, 0x3e45798ee2308c3aL    # 1.0E-8

    cmpg-double p0, p0, v0

    if-gez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static isExternalStorageMounted()Z
    .locals 2

    .line 1323
    const-string v0, "mounted"

    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private static isFind19_5_9LongRatioScreen(II)Z
    .locals 2

    .line 3105
    int-to-float p1, p1

    int-to-float p0, p0

    div-float/2addr p1, p0

    .line 3106
    const p0, 0x400a3d71    # 2.16f

    sub-float/2addr p1, p0

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p0

    float-to-double p0, p0

    const-wide v0, 0x3f947ae147ae147bL    # 0.02

    cmpg-double p0, p0, v0

    if-gez p0, :cond_0

    .line 3107
    const/4 p0, 0x1

    return p0

    .line 3109
    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static isFingerPrintKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 2

    .line 1797
    if-eqz p0, :cond_0

    const/16 v0, 0x1b

    invoke-virtual {p0}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 1798
    invoke-virtual {p0}, Landroid/view/KeyEvent;->getDevice()Landroid/view/InputDevice;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1799
    invoke-static {}, Lcom/mi/config/b;->hp()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {p0}, Landroid/view/KeyEvent;->getDevice()Landroid/view/InputDevice;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/InputDevice;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    .line 1797
    :goto_0
    return p0
.end method

.method public static isForceNameSuffix()Z
    .locals 2

    .line 1832
    sget-object v0, Lcom/android/camera/Util;->sIsForceNameSuffix:Ljava/lang/Boolean;

    if-nez v0, :cond_0

    .line 1833
    new-instance v0, Ljava/io/File;

    const-string v1, "force_name_suffix"

    invoke-static {v1}, Lcom/android/camera/storage/Storage;->generatePrimaryFilepath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lcom/android/camera/Util;->sIsForceNameSuffix:Ljava/lang/Boolean;

    .line 1835
    :cond_0
    sget-object v0, Lcom/android/camera/Util;->sIsForceNameSuffix:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method public static isFullScreenNavBarHidden(Landroid/content/Context;)Z
    .locals 1

    .line 1909
    # invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    # move-result-object p0

    # const-string v0, "force_fsg_nav_bar"

    # invoke-static {p0, v0}, Landroid/provider/MiuiSettings$Global;->getBoolean(Landroid/content/ContentResolver;Ljava/lang/String;)Z

    # move-result p0

    # return p0
    const/4 v0, 0x0
 
    return v0
.end method

.method public static isGlobalVersion()Z
    .locals 2

    .line 2410
    const-string v0, "ro.product.mod_device"

    const-string v1, ""

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "_global"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    return v0
.end method

.method public static isInVideoCall(Landroid/app/Activity;)Z
    .locals 1

    .line 1790
    invoke-static {}, Lcom/mi/config/b;->isMTKPlatform()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0}, Lcom/android/camera/permission/PermissionManager;->checkPhoneStatePermission(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1791
    invoke-static {p0}, Lcom/android/camera/lib/compatibility/util/CompatibilityUtils;->isInVideoCall(Landroid/content/Context;)Z

    move-result p0

    return p0

    .line 1793
    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static isInternationalBuild()Z
    .locals 2

    .line 2422
    const-string v0, "ro.product.mod_device"

    const-string v1, ""

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "_global"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static isLabOptionsVisible()Z
    .locals 2

    .line 1839
    sget-object v0, Lcom/android/camera/Util;->sIsLabOptionsVisible:Ljava/lang/Boolean;

    if-nez v0, :cond_0

    .line 1840
    new-instance v0, Ljava/io/File;

    const-string v1, "lab_options_visible"

    invoke-static {v1}, Lcom/android/camera/storage/Storage;->generatePrimaryFilepath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lcom/android/camera/Util;->sIsLabOptionsVisible:Ljava/lang/Boolean;

    .line 1842
    :cond_0
    sget-object v0, Lcom/android/camera/Util;->sIsLabOptionsVisible:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method public static isLayoutRTL(Landroid/content/Context;)Z
    .locals 2

    .line 1285
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 1286
    return v0

    .line 1288
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Configuration;->getLayoutDirection()I

    move-result p0

    const/4 v1, 0x1

    if-ne p0, v1, :cond_1

    move v0, v1

    nop

    :cond_1
    return v0
.end method

.method public static isMemoryRich(Landroid/content/Context;)Z
    .locals 4

    .line 1804
    const-string v0, "activity"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/ActivityManager;

    .line 1805
    new-instance v0, Landroid/app/ActivityManager$MemoryInfo;

    invoke-direct {v0}, Landroid/app/ActivityManager$MemoryInfo;-><init>()V

    .line 1806
    invoke-virtual {p0, v0}, Landroid/app/ActivityManager;->getMemoryInfo(Landroid/app/ActivityManager$MemoryInfo;)V

    .line 1808
    iget-wide v0, v0, Landroid/app/ActivityManager$MemoryInfo;->availMem:J

    const-wide/32 v2, 0x19000000

    cmp-long p0, v0, v2

    if-lez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static isNonUI()Z
    .locals 2

    .line 2077
    const-string v0, "sys.power.nonui"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isNonUIEnabled()Z
    .locals 2

    .line 2081
    const-string v0, "sys.power.nonui"

    invoke-static {v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public static isPackageAvailable(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 3

    .line 1913
    const/4 v0, 0x0

    if-eqz p0, :cond_3

    if-eqz p1, :cond_3

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_2

    .line 1918
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    .line 1920
    :try_start_0
    invoke-virtual {p0, p1}, Landroid/content/pm/PackageManager;->getApplicationEnabledSetting(Ljava/lang/String;)I

    move-result p0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1921
    const/4 p1, 0x1

    if-eqz p0, :cond_2

    if-ne p0, p1, :cond_1

    goto :goto_0

    :cond_1
    move p1, v0

    nop

    :cond_2
    :goto_0
    return p1

    .line 1925
    :catch_0
    move-exception p0

    .line 1926
    const-string p1, "CameraUtil"

    invoke-virtual {p0}, Ljava/lang/NullPointerException;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 1923
    :catch_1
    move-exception p0

    .line 1924
    const-string p1, "CameraUtil"

    invoke-virtual {p0}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1927
    nop

    .line 1928
    :goto_1
    return v0

    .line 1914
    :cond_3
    :goto_2
    const-string p0, "CameraUtil"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invalid params. packageName="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1915
    return v0
.end method

.method public static isPathExist(Ljava/lang/String;)Z
    .locals 1

    .line 2048
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static isProduceFocusInfoSuccess([B)Z
    .locals 2

    .line 1398
    if-eqz p0, :cond_0

    array-length v0, p0

    const/16 v1, 0x19

    if-ge v1, v0, :cond_0

    array-length v0, p0

    sub-int/2addr v0, v1

    aget-byte p0, p0, v0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static isQuotaExceeded(Ljava/lang/Exception;)Z
    .locals 3

    .line 2395
    if-eqz p0, :cond_0

    instance-of v0, p0, Ljava/io/FileNotFoundException;

    if-eqz v0, :cond_0

    .line 2396
    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p0

    .line 2397
    const-string v0, "CameraUtil"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "isQuotaExceeded: msg="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2398
    if-eqz p0, :cond_0

    .line 2399
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    const-string v0, "quota exceeded"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    return p0

    .line 2403
    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static isScreenSlideOff(Landroid/content/Context;)Z
    .locals 2

    .line 2997
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    const-string v0, "sc_status"

    const/4 v1, -0x1

    invoke-static {p0, v0, v1}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result p0

    const/4 v0, 0x1

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static isSetContentDesc()Z
    .locals 2

    .line 2369
    const-string v0, "1"

    const-string v1, "camera.content.description.debug"

    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static isShowAfRegionView()Z
    .locals 2

    .line 1537
    const-string v0, "1"

    const-string v1, "camera.preview.debug.afRegion_view"

    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static isShowDebugInfo()Z
    .locals 2

    .line 1599
    const-string v0, "1"

    const-string v1, "persist.camera.enable.log"

    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "1"

    const-string v1, "persist.camera.debug.show_af"

    .line 1600
    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "1"

    const-string v1, "persist.camera.debug.show_awb"

    .line 1601
    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "1"

    const-string v1, "persist.camera.debug.show_aec"

    .line 1602
    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "1"

    const-string v1, "persist.camera.debug.autoscene"

    .line 1603
    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "1"

    const-string v1, "persist.camera.debug.hht"

    .line 1604
    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 1599
    :goto_1
    return v0
.end method

.method public static isShowDebugInfoView()Z
    .locals 2

    .line 1533
    const-string v0, "1"

    const-string v1, "camera.preview.debug.debugInfo_view"

    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static isShowPreviewDebugInfo()Z
    .locals 2

    .line 1529
    const-string v0, "1"

    const-string v1, "camera.preview.enable.log"

    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static isStringValueContained(Ljava/lang/Object;I)Z
    .locals 1

    .line 1717
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object p1

    .line 1718
    invoke-static {p0, p1}, Lcom/android/camera/Util;->isStringValueContained(Ljava/lang/Object;[Ljava/lang/CharSequence;)Z

    move-result p0

    return p0
.end method

.method public static isStringValueContained(Ljava/lang/Object;Ljava/util/List;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/List<",
            "+",
            "Ljava/lang/CharSequence;",
            ">;)Z"
        }
    .end annotation

    .line 1734
    const/4 v0, 0x0

    if-eqz p1, :cond_3

    if-nez p0, :cond_0

    goto :goto_1

    .line 1737
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    .line 1738
    invoke-virtual {v1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1739
    const/4 p0, 0x1

    return p0

    .line 1741
    :cond_1
    goto :goto_0

    .line 1742
    :cond_2
    return v0

    .line 1735
    :cond_3
    :goto_1
    return v0
.end method

.method public static isStringValueContained(Ljava/lang/Object;[Ljava/lang/CharSequence;)Z
    .locals 4

    .line 1722
    const/4 v0, 0x0

    if-eqz p1, :cond_3

    if-nez p0, :cond_0

    goto :goto_1

    .line 1725
    :cond_0
    array-length v1, p1

    move v2, v0

    :goto_0
    if-ge v2, v1, :cond_2

    aget-object v3, p1, v2

    .line 1726
    invoke-virtual {v3, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1727
    const/4 p0, 0x1

    return p0

    .line 1725
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1730
    :cond_2
    return v0

    .line 1723
    :cond_3
    :goto_1
    return v0
.end method

.method public static isSupported(I[I)Z
    .locals 0

    .line 1281
    invoke-static {p1, p0}, Lcom/android/camera/Util;->getArrayIndex([II)I

    move-result p0

    const/4 p1, -0x1

    if-eq p0, p1, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static isSupported(Ljava/lang/Object;[Ljava/lang/Object;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;[TT;)Z"
        }
    .end annotation

    .line 1277
    invoke-static {p1, p0}, Lcom/android/camera/Util;->getArrayIndex([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p0

    const/4 p1, -0x1

    if-eq p0, p1, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static isSupported(Ljava/lang/String;Ljava/util/List;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .line 1273
    if-eqz p1, :cond_0

    invoke-interface {p1, p0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result p0

    if-ltz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static isTimeout(JJJ)Z
    .locals 1

    .line 1365
    cmp-long v0, p0, p2

    if-ltz v0, :cond_1

    sub-long/2addr p0, p2

    cmp-long p0, p0, p4

    if-lez p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method public static isUriValid(Landroid/net/Uri;Landroid/content/ContentResolver;)Z
    .locals 3

    .line 1037
    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    .line 1040
    :cond_0
    :try_start_0
    const-string v1, "r"

    invoke-virtual {p1, p0, v1}, Landroid/content/ContentResolver;->openFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;

    move-result-object p1

    .line 1041
    if-nez p1, :cond_1

    .line 1042
    const-string p1, "CameraUtil"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Fail to open URI. URI="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1043
    return v0

    .line 1045
    :cond_1
    invoke-virtual {p1}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1049
    nop

    .line 1050
    const/4 p0, 0x1

    return p0

    .line 1046
    :catch_0
    move-exception p0

    .line 1047
    const-string p1, "CameraUtil"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "IOException occurs when opening URI: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1, p0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1048
    return v0
.end method

.method public static isValidValue(Ljava/lang/String;)Z
    .locals 1

    .line 2993
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "^[0-9]+$"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static isViewIntersectWindow(Landroid/view/View;)Z
    .locals 5

    .line 1017
    const/4 v0, 0x2

    new-array v0, v0, [I

    .line 1018
    invoke-virtual {p0, v0}, Landroid/view/View;->getLocationInWindow([I)V

    .line 1019
    const/4 v1, 0x0

    aget v2, v0, v1

    sget v3, Lcom/android/camera/Util;->sWindowWidth:I

    const/4 v4, 0x1

    if-ge v2, v3, :cond_0

    aget v2, v0, v1

    .line 1020
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v3

    add-int/2addr v2, v3

    if-ltz v2, :cond_0

    aget v2, v0, v4

    sget v3, Lcom/android/camera/Util;->sWindowHeight:I

    if-ge v2, v3, :cond_0

    aget v0, v0, v4

    .line 1022
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p0

    add-int/2addr v0, p0

    if-ltz v0, :cond_0

    .line 1019
    move v1, v4

    goto :goto_0

    .line 1022
    :cond_0
    nop

    .line 1019
    :goto_0
    return v1
.end method

.method public static isZoomAnimationEnabled()Z
    .locals 2

    .line 2073
    const-string v0, "camera_zoom_animation"

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mi/config/a;->fq()Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static join(Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 2098
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 2099
    const/4 v1, 0x0

    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 2100
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ne v1, v2, :cond_0

    .line 2101
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 2103
    :cond_0
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 2099
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 2107
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method protected static loadAppCameraWatermark(Landroid/content/Context;Landroid/graphics/BitmapFactory$Options;Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 3

    .line 2610
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p0

    .line 2612
    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "watermarks/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, ".png"

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p0

    invoke-static {p0, v0, p1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 2613
    :catch_0
    move-exception p0

    .line 2614
    const-string p1, "CameraUtil"

    const-string p2, "Failed to load app camera watermark "

    invoke-static {p1, p2, p0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 2617
    return-object v0
.end method

.method public static makeBitmap([BI)Landroid/graphics/Bitmap;
    .locals 5

    .line 473
    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 474
    const/4 v2, 0x1

    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 475
    array-length v2, p0

    const/4 v3, 0x0

    invoke-static {p0, v3, v2, v1}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 476
    iget-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->mCancel:Z

    if-nez v2, :cond_1

    iget v2, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    const/4 v4, -0x1

    if-eq v2, v4, :cond_1

    iget v2, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    if-ne v2, v4, :cond_0

    goto :goto_0

    .line 481
    :cond_0
    invoke-static {v1, v4, p1}, Lcom/android/camera/Util;->computeSampleSize(Landroid/graphics/BitmapFactory$Options;II)I

    move-result p1

    iput p1, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 482
    iput-boolean v3, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 483
    iput-boolean v3, v1, Landroid/graphics/BitmapFactory$Options;->inDither:Z

    .line 484
    sget-object p1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    iput-object p1, v1, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 485
    array-length p1, p0

    invoke-static {p0, v3, p1, v1}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 478
    :cond_1
    :goto_0
    return-object v0

    .line 486
    :catch_0
    move-exception p0

    .line 487
    const-string p1, "CameraUtil"

    const-string v1, "Got oom exception "

    invoke-static {p1, v1, p0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 488
    return-object v0
.end method

.method public static md5(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .line 3170
    nop

    .line 3173
    :try_start_0
    const-string v0, "MD5"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 3174
    const-string v1, "UTF8"

    invoke-virtual {p0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/security/MessageDigest;->update([B)V

    .line 3175
    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object p0

    .line 3176
    const-string v0, ""

    .line 3177
    const/4 v1, 0x0

    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_0

    .line 3178
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v0, 0xff

    aget-byte v3, p0, v1

    and-int/2addr v0, v3

    or-int/lit16 v0, v0, -0x100

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v3, 0x6

    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 3177
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 3180
    :cond_0
    return-object v0

    .line 3181
    :catch_0
    move-exception p0

    .line 3182
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 3184
    const/4 p0, 0x0

    return-object p0
.end method

.method public static final millisecondToTimeString(JZ)Ljava/lang/String;
    .locals 18

    .line 3128
    const-wide/16 v2, 0x3e8

    div-long v4, p0, v2

    .line 3129
    const-wide/16 v6, 0x3c

    div-long v8, v4, v6

    .line 3130
    div-long v10, v8, v6

    .line 3131
    mul-long v12, v10, v6

    sub-long v12, v8, v12

    .line 3132
    mul-long/2addr v8, v6

    sub-long v6, v4, v8

    .line 3134
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 3137
    const-wide/16 v14, 0x0

    cmp-long v9, v10, v14

    const/16 v14, 0x3a

    const/16 v15, 0x30

    const-wide/16 v16, 0xa

    if-lez v9, :cond_1

    .line 3138
    cmp-long v9, v10, v16

    if-gez v9, :cond_0

    .line 3139
    invoke-virtual {v8, v15}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 3141
    :cond_0
    invoke-virtual {v8, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 3145
    :cond_1
    cmp-long v9, v12, v16

    if-gez v9, :cond_2

    .line 3146
    invoke-virtual {v8, v15}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 3148
    :cond_2
    invoke-virtual {v8, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 3151
    cmp-long v9, v6, v16

    if-gez v9, :cond_3

    .line 3152
    invoke-virtual {v8, v15}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 3154
    :cond_3
    invoke-virtual {v8, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 3157
    if-eqz p2, :cond_5

    .line 3158
    const/16 v6, 0x2e

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 3159
    mul-long/2addr v4, v2

    sub-long v0, p0, v4

    div-long v0, v0, v16

    .line 3160
    cmp-long v2, v0, v16

    if-gez v2, :cond_4

    .line 3161
    invoke-virtual {v8, v15}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 3163
    :cond_4
    invoke-virtual {v8, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 3166
    :cond_5
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static mkdirs(Ljava/io/File;III)Z
    .locals 2

    .line 1333
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1334
    const/4 p0, 0x0

    return p0

    .line 1338
    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v0

    .line 1339
    if-eqz v0, :cond_1

    .line 1340
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v1, p1, p2, p3}, Lcom/android/camera/Util;->mkdirs(Ljava/io/File;III)Z

    .line 1343
    :cond_1
    invoke-virtual {p0}, Ljava/io/File;->mkdir()Z

    move-result p0

    return p0
.end method

.method public static nextPowerOf2(I)I
    .locals 1

    .line 655
    add-int/lit8 p0, p0, -0x1

    .line 656
    ushr-int/lit8 v0, p0, 0x10

    or-int/2addr p0, v0

    .line 657
    ushr-int/lit8 v0, p0, 0x8

    or-int/2addr p0, v0

    .line 658
    ushr-int/lit8 v0, p0, 0x4

    or-int/2addr p0, v0

    .line 659
    ushr-int/lit8 v0, p0, 0x2

    or-int/2addr p0, v0

    .line 660
    ushr-int/lit8 v0, p0, 0x1

    or-int/2addr p0, v0

    .line 661
    add-int/lit8 p0, p0, 0x1

    return p0
.end method

.method public static parseInt(Ljava/lang/String;I)I
    .locals 2

    .line 2112
    :try_start_0
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    .line 2113
    :catch_0
    move-exception p0

    .line 2114
    const-string v0, "CameraUtil"

    invoke-virtual {p0}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 2115
    invoke-static {}, Lcom/android/camera/Util;->isDebugOsBuild()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2120
    return p1

    .line 2116
    :cond_0
    throw p0
.end method

.method public static pointInView(FFLandroid/view/View;)Z
    .locals 5

    .line 1009
    const/4 v0, 0x0

    if-nez p2, :cond_0

    return v0

    .line 1010
    :cond_0
    const/4 v1, 0x2

    new-array v1, v1, [I

    .line 1011
    invoke-virtual {p2, v1}, Landroid/view/View;->getLocationInWindow([I)V

    .line 1012
    aget v2, v1, v0

    int-to-float v2, v2

    cmpl-float v2, p0, v2

    const/4 v3, 0x1

    if-ltz v2, :cond_1

    aget v2, v1, v0

    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    move-result v4

    add-int/2addr v2, v4

    int-to-float v2, v2

    cmpg-float p0, p0, v2

    if-gez p0, :cond_1

    aget p0, v1, v3

    int-to-float p0, p0

    cmpl-float p0, p1, p0

    if-ltz p0, :cond_1

    aget p0, v1, v3

    .line 1013
    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result p2

    add-int/2addr p0, p2

    int-to-float p0, p0

    cmpg-float p0, p1, p0

    if-gez p0, :cond_1

    .line 1012
    move v0, v3

    goto :goto_0

    .line 1013
    :cond_1
    nop

    .line 1012
    :goto_0
    return v0
.end method

.method public static prepareMatrix(Landroid/graphics/Matrix;ZIIIIIII)V
    .locals 1

    .line 1099
    const/high16 v0, 0x3f800000    # 1.0f

    if-eqz p1, :cond_0

    const/high16 p1, -0x40800000    # -1.0f

    goto :goto_0

    :cond_0
    move p1, v0

    :goto_0
    invoke-virtual {p0, p1, v0}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 1101
    int-to-float p1, p2

    invoke-virtual {p0, p1}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 1102
    const/16 p1, 0x5a

    if-eq p2, p1, :cond_2

    const/16 p1, 0x10e

    if-ne p2, p1, :cond_1

    goto :goto_1

    .line 1105
    :cond_1
    int-to-float p1, p3

    int-to-float p2, p7

    div-float/2addr p1, p2

    int-to-float p2, p4

    int-to-float p3, p8

    div-float/2addr p2, p3

    invoke-virtual {p0, p1, p2}, Landroid/graphics/Matrix;->postScale(FF)Z

    goto :goto_2

    .line 1103
    :cond_2
    :goto_1
    int-to-float p1, p3

    int-to-float p2, p8

    div-float/2addr p1, p2

    int-to-float p2, p4

    int-to-float p3, p7

    div-float/2addr p2, p3

    invoke-virtual {p0, p1, p2}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 1107
    :goto_2
    int-to-float p1, p5

    int-to-float p2, p6

    invoke-virtual {p0, p1, p2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 1108
    return-void
.end method

.method public static varargs printLog(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 3

    .line 770
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 771
    const/4 v1, 0x0

    :goto_0
    array-length v2, p1

    if-ge v1, v2, :cond_0

    .line 772
    aget-object v2, p1, v1

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 773
    const-string v2, " = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 774
    add-int/lit8 v2, v1, 0x1

    aget-object v2, p1, v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 775
    const-string v2, " "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 771
    add-int/lit8 v1, v1, 0x2

    goto :goto_0

    .line 777
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 778
    return-void
.end method

.method public static rectFToRect(Landroid/graphics/RectF;Landroid/graphics/Rect;)V
    .locals 1

    .line 1076
    iget v0, p0, Landroid/graphics/RectF;->left:F

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    iput v0, p1, Landroid/graphics/Rect;->left:I

    .line 1077
    iget v0, p0, Landroid/graphics/RectF;->top:F

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    iput v0, p1, Landroid/graphics/Rect;->top:I

    .line 1078
    iget v0, p0, Landroid/graphics/RectF;->right:F

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    iput v0, p1, Landroid/graphics/Rect;->right:I

    .line 1079
    iget p0, p0, Landroid/graphics/RectF;->bottom:F

    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    iput p0, p1, Landroid/graphics/Rect;->bottom:I

    .line 1080
    return-void
.end method

.method public static replaceStartEffectRender(Landroid/app/Activity;)I
    .locals 4

    .line 992
    invoke-static {}, Lcom/mi/config/b;->fV()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 993
    nop

    .line 994
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "android.intent.extras.START_WITH_EFFECT_RENDER"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 995
    if-eqz v0, :cond_0

    .line 996
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "integer"

    .line 997
    invoke-virtual {p0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 998
    if-eqz v0, :cond_0

    .line 999
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p0

    .line 1000
    invoke-static {p0}, Lcom/android/camera/CameraSettings;->setShaderEffect(I)V

    .line 1001
    return p0

    .line 1005
    :cond_0
    sget p0, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    return p0
.end method

.method public static reverseAnimatorSet(Landroid/animation/AnimatorSet;)V
    .locals 2

    .line 2014
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->getChildAnimations()Ljava/util/ArrayList;

    move-result-object p0

    .line 2015
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/animation/Animator;

    .line 2016
    instance-of v1, v0, Landroid/animation/ValueAnimator;

    if-eqz v1, :cond_0

    .line 2017
    check-cast v0, Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->reverse()V

    goto :goto_1

    .line 2018
    :cond_0
    instance-of v1, v0, Landroid/animation/AnimatorSet;

    if-eqz v1, :cond_1

    .line 2019
    check-cast v0, Landroid/animation/AnimatorSet;

    invoke-static {v0}, Lcom/android/camera/Util;->reverseAnimatorSet(Landroid/animation/AnimatorSet;)V

    .line 2021
    :cond_1
    :goto_1
    goto :goto_0

    .line 2022
    :cond_2
    return-void
.end method

.method public static rotate(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    .locals 1

    .line 370
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/android/camera/Util;->rotateAndMirror(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method

.method public static rotateAndMirror(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;
    .locals 7

    .line 376
    if-nez p1, :cond_0

    if-eqz p2, :cond_8

    :cond_0
    if-eqz p0, :cond_8

    .line 377
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 380
    if-eqz p2, :cond_5

    .line 381
    const/high16 p2, -0x40800000    # -1.0f

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {v5, p2, v0}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 382
    add-int/lit16 p1, p1, 0x168

    rem-int/lit16 p1, p1, 0x168

    .line 383
    const/4 p2, 0x0

    if-eqz p1, :cond_4

    const/16 v0, 0xb4

    if-ne p1, v0, :cond_1

    goto :goto_1

    .line 385
    :cond_1
    const/16 v0, 0x5a

    if-eq p1, v0, :cond_3

    const/16 v0, 0x10e

    if-ne p1, v0, :cond_2

    goto :goto_0

    .line 388
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Invalid degrees="

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 386
    :cond_3
    :goto_0
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {v5, v0, p2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    goto :goto_2

    .line 384
    :cond_4
    :goto_1
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {v5, v0, p2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 391
    :cond_5
    :goto_2
    if-eqz p1, :cond_6

    .line 393
    int-to-float p1, p1

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p2

    int-to-float p2, p2

    const/high16 v0, 0x40000000    # 2.0f

    div-float/2addr p2, v0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v1, v0

    invoke-virtual {v5, p1, p2, v1}, Landroid/graphics/Matrix;->postRotate(FFF)Z

    .line 397
    :cond_6
    const/4 v1, 0x0

    const/4 v2, 0x0

    :try_start_0
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    const/4 v6, 0x1

    move-object v0, p0

    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 398
    if-eq p0, p1, :cond_7

    .line 399
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    .line 400
    nop

    .line 404
    move-object p0, p1

    :cond_7
    goto :goto_3

    .line 402
    :catch_0
    move-exception p1

    .line 406
    :cond_8
    :goto_3
    return-object p0
.end method

.method public static roundOrientation(II)I
    .locals 3

    .line 782
    const/4 v0, 0x1

    const/4 v1, -0x1

    if-ne p1, v1, :cond_0

    .line 783
    goto :goto_0

    .line 785
    :cond_0
    sub-int v1, p0, p1

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    .line 786
    rsub-int v2, v1, 0x168

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 787
    const/16 v2, 0x32

    if-lt v1, v2, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 789
    :goto_0
    if-eqz v0, :cond_2

    .line 790
    add-int/lit8 p0, p0, 0x2d

    div-int/lit8 p0, p0, 0x5a

    mul-int/lit8 p0, p0, 0x5a

    rem-int/lit16 p0, p0, 0x168

    .line 791
    const-string p1, "CameraUtil"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onOrientationChanged: orientation = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 792
    return p0

    .line 794
    :cond_2
    return p1
.end method

.method public static safeDelete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 4

    .line 1515
    nop

    .line 1517
    const/4 v0, -0x1

    :try_start_0
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 1518
    invoke-virtual {v1, p0, p1, p2}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 1519
    :try_start_1
    const-string v0, "CameraUtil"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "safeDelete url="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, " where="

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " selectionArgs="

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, " result="

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 1524
    goto :goto_1

    .line 1522
    :catch_0
    move-exception p0

    goto :goto_0

    :catch_1
    move-exception p0

    move v1, v0

    .line 1523
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 1525
    :goto_1
    return v1
.end method

.method public static saveBitmap(Ljava/nio/Buffer;IILandroid/graphics/Bitmap$Config;Ljava/lang/String;)Z
    .locals 1

    .line 493
    nop

    .line 494
    if-eqz p0, :cond_2

    .line 495
    invoke-static {p1, p2, p3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 496
    invoke-virtual {p1, p0}, Landroid/graphics/Bitmap;->copyPixelsFromBuffer(Ljava/nio/Buffer;)V

    .line 498
    const/4 p0, 0x0

    .line 500
    :try_start_0
    new-instance p2, Ljava/io/FileOutputStream;

    new-instance p3, Ljava/io/File;

    invoke-direct {p3, p4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {p2, p3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 501
    :try_start_1
    sget-object p0, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 p3, 0x64

    invoke-virtual {p1, p0, p3, p2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 502
    const/4 p0, 0x1

    .line 506
    nop

    .line 508
    :try_start_2
    invoke-virtual {p2}, Ljava/io/FileOutputStream;->flush()V

    .line 509
    invoke-virtual {p2}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 512
    goto :goto_0

    .line 510
    :catch_0
    move-exception p2

    .line 511
    invoke-virtual {p2}, Ljava/lang/Exception;->printStackTrace()V

    .line 514
    :goto_0
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    .line 515
    goto :goto_6

    .line 506
    :catchall_0
    move-exception p0

    move-object v0, p2

    move-object p2, p0

    move-object p0, v0

    goto :goto_3

    .line 503
    :catch_1
    move-exception p0

    move-object v0, p2

    move-object p2, p0

    move-object p0, v0

    goto :goto_1

    .line 506
    :catchall_1
    move-exception p2

    goto :goto_3

    .line 503
    :catch_2
    move-exception p2

    .line 504
    :goto_1
    :try_start_3
    const-string p3, "CameraUtil"

    const-string p4, "saveBitmap failed!"

    invoke-static {p3, p4, p2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 506
    if-eqz p0, :cond_0

    .line 508
    :try_start_4
    invoke-virtual {p0}, Ljava/io/FileOutputStream;->flush()V

    .line 509
    invoke-virtual {p0}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    .line 512
    goto :goto_2

    .line 510
    :catch_3
    move-exception p0

    .line 511
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 514
    :cond_0
    :goto_2
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    .line 515
    goto :goto_5

    .line 506
    :goto_3
    if-eqz p0, :cond_1

    .line 508
    :try_start_5
    invoke-virtual {p0}, Ljava/io/FileOutputStream;->flush()V

    .line 509
    invoke-virtual {p0}, Ljava/io/FileOutputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_4

    .line 512
    goto :goto_4

    .line 510
    :catch_4
    move-exception p0

    .line 511
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 514
    :cond_1
    :goto_4
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    throw p2

    .line 517
    :cond_2
    :goto_5
    const/4 p0, 0x0

    :goto_6
    return p0
.end method

.method private static saveCameraCalibrationToFile([BLjava/lang/String;)Z
    .locals 3

    .line 527
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    .line 528
    nop

    .line 529
    const/4 v1, 0x0

    if-eqz p0, :cond_1

    if-eqz v0, :cond_1

    .line 530
    const/4 v2, 0x0

    .line 532
    :try_start_0
    invoke-virtual {v0, p1, v1}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 533
    :try_start_1
    invoke-virtual {p1, p0}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 534
    const/4 v1, 0x1

    .line 540
    if-eqz p1, :cond_1

    .line 542
    :try_start_2
    invoke-virtual {p1}, Ljava/io/FileOutputStream;->flush()V

    .line 543
    invoke-virtual {p1}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 544
    :catch_0
    move-exception p0

    .line 545
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 546
    :goto_0
    goto :goto_5

    .line 540
    :catchall_0
    move-exception p0

    move-object v2, p1

    goto :goto_3

    .line 537
    :catch_1
    move-exception p0

    move-object v2, p1

    goto :goto_1

    .line 535
    :catch_2
    move-exception p0

    move-object v2, p1

    goto :goto_2

    .line 540
    :catchall_1
    move-exception p0

    goto :goto_3

    .line 537
    :catch_3
    move-exception p0

    .line 538
    :goto_1
    :try_start_3
    const-string p1, "CameraUtil"

    const-string v0, "saveCameraCalibrationToFile: IOException"

    invoke-static {p1, v0, p0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 540
    if-eqz v2, :cond_1

    .line 542
    :try_start_4
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->flush()V

    .line 543
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_0

    .line 535
    :catch_4
    move-exception p0

    .line 536
    :goto_2
    :try_start_5
    const-string p1, "CameraUtil"

    const-string v0, "saveCameraCalibrationToFile: FileNotFoundException"

    invoke-static {p1, v0, p0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 540
    if-eqz v2, :cond_1

    .line 542
    :try_start_6
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->flush()V

    .line 543
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0

    goto :goto_0

    .line 540
    :goto_3
    if-eqz v2, :cond_0

    .line 542
    :try_start_7
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->flush()V

    .line 543
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_5

    .line 546
    goto :goto_4

    .line 544
    :catch_5
    move-exception p1

    .line 545
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 546
    :cond_0
    :goto_4
    throw p0

    .line 550
    :cond_1
    :goto_5
    return v1
.end method

.method public static saveCameraCalibrationToFile([BZ)Z
    .locals 0

    .line 521
    if-eqz p1, :cond_0

    const-string p1, "front_dual_camera_caldata.bin"

    goto :goto_0

    .line 522
    :cond_0
    const-string p1, "back_dual_camera_caldata.bin"

    .line 523
    :goto_0
    invoke-static {p0, p1}, Lcom/android/camera/Util;->saveCameraCalibrationToFile([BLjava/lang/String;)Z

    move-result p0

    return p0
.end method

.method protected static saveCustomWatermark2File(Landroid/graphics/Bitmap;Z)V
    .locals 7

    .line 2621
    const-string v0, "CameraUtil"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "saveLastFrameGaussian2File: start... watermarkBitmap = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2622
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 2623
    nop

    .line 2624
    if-eqz p1, :cond_0

    sget-object p1, Lcom/android/camera/Util;->WATERMARK_48M_FILE_NAME:Ljava/lang/String;

    goto :goto_0

    :cond_0
    sget-object p1, Lcom/android/camera/Util;->WATERMARK_FILE_NAME:Ljava/lang/String;

    .line 2625
    :goto_0
    if-eqz p0, :cond_1

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v2

    if-nez v2, :cond_1

    .line 2626
    const/4 v2, 0x0

    .line 2628
    :try_start_0
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v3

    .line 2629
    new-instance v4, Ljava/io/File;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ".tmp"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v3, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 2630
    new-instance v5, Ljava/io/FileOutputStream;

    invoke-direct {v5, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 2631
    :try_start_1
    sget-object v2, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v6, 0x5a

    invoke-virtual {p0, v2, v6, v5}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 2632
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->flush()V

    .line 2633
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v3, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result p1
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2637
    invoke-static {v5}, Lcom/android/camera/Util;->closeSilently(Ljava/io/Closeable;)V

    .line 2638
    goto :goto_4

    .line 2637
    :catchall_0
    move-exception p0

    move-object v2, v5

    goto :goto_2

    .line 2634
    :catch_0
    move-exception p1

    move-object v2, v5

    goto :goto_1

    .line 2637
    :catchall_1
    move-exception p0

    goto :goto_2

    .line 2634
    :catch_1
    move-exception p1

    .line 2635
    :goto_1
    :try_start_2
    const-string v3, "CameraUtil"

    const-string v4, "saveCustomWatermark2File Failed to write image"

    invoke-static {v3, v4, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 2637
    invoke-static {v2}, Lcom/android/camera/Util;->closeSilently(Ljava/io/Closeable;)V

    .line 2638
    goto :goto_3

    .line 2637
    :goto_2
    invoke-static {v2}, Lcom/android/camera/Util;->closeSilently(Ljava/io/Closeable;)V

    throw p0

    .line 2640
    :cond_1
    :goto_3
    const/4 p1, 0x0

    :goto_4
    const-string v2, "CameraUtil"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "saveCustomWatermark2File: watermarkBitmap = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ", save result = "

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string p0, ", cost time = "

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2642
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p0

    sub-long/2addr p0, v0

    invoke-virtual {v3, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p0, "ms"

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 2640
    invoke-static {v2, p0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2643
    return-void
.end method

.method public static saveImageToJpeg(Landroid/media/Image;)V
    .locals 11

    .line 2959
    invoke-virtual {p0}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v0

    .line 2960
    const/4 v1, 0x0

    aget-object v2, v0, v1

    invoke-virtual {v2}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 2961
    const/4 v3, 0x2

    aget-object v4, v0, v3

    invoke-virtual {v4}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 2962
    new-array v8, v3, [I

    aget-object v5, v0, v1

    invoke-virtual {v5}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v5

    aput v5, v8, v1

    aget-object v0, v0, v3

    invoke-virtual {v0}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v0

    const/4 v3, 0x1

    aput v0, v8, v3

    .line 2963
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->limit()I

    move-result v0

    .line 2964
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->limit()I

    move-result v3

    .line 2965
    add-int v5, v0, v3

    new-array v5, v5, [B

    .line 2966
    invoke-virtual {v2, v5, v1, v0}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 2967
    invoke-virtual {v4, v5, v0, v3}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 2968
    invoke-virtual {p0}, Landroid/media/Image;->getWidth()I

    move-result v6

    invoke-virtual {p0}, Landroid/media/Image;->getHeight()I

    move-result v7

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    invoke-static/range {v5 .. v10}, Lcom/android/camera/Util;->saveYuvToJpg([BII[IJ)V

    .line 2969
    const-string p0, "CameraUtil"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "saveImageToJpeg: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "|"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2970
    return-void
.end method

.method public static saveLastFrameGaussian2File(Landroid/graphics/Bitmap;)V
    .locals 7

    .line 2646
    const-string v0, "CameraUtil"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "saveLastFrameGaussian2File: start... blurBitmap = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2647
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 2648
    nop

    .line 2649
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v2

    if-nez v2, :cond_0

    .line 2650
    const/4 v2, 0x0

    .line 2652
    :try_start_0
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v3

    .line 2653
    new-instance v4, Ljava/io/File;

    const-string v5, "blur.jpg.tmp"

    invoke-direct {v4, v3, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 2654
    new-instance v5, Ljava/io/FileOutputStream;

    invoke-direct {v5, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2655
    :try_start_1
    sget-object v2, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v6, 0x5a

    invoke-virtual {p0, v2, v6, v5}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 2656
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->flush()V

    .line 2657
    new-instance v2, Ljava/io/File;

    const-string v6, "blur.jpg"

    invoke-direct {v2, v3, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v2
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 2661
    invoke-static {v5}, Lcom/android/camera/Util;->closeSilently(Ljava/io/Closeable;)V

    .line 2662
    goto :goto_3

    .line 2658
    :catch_0
    move-exception v2

    goto :goto_0

    .line 2661
    :catchall_0
    move-exception p0

    move-object v5, v2

    goto :goto_1

    .line 2658
    :catch_1
    move-exception v3

    move-object v5, v2

    move-object v2, v3

    .line 2659
    :goto_0
    :try_start_2
    const-string v3, "CameraUtil"

    const-string v4, "saveLastFrameGaussian2File Failed to write image"

    invoke-static {v3, v4, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 2661
    invoke-static {v5}, Lcom/android/camera/Util;->closeSilently(Ljava/io/Closeable;)V

    .line 2662
    goto :goto_2

    .line 2661
    :catchall_1
    move-exception p0

    :goto_1
    invoke-static {v5}, Lcom/android/camera/Util;->closeSilently(Ljava/io/Closeable;)V

    throw p0

    .line 2664
    :cond_0
    :goto_2
    const/4 v2, 0x0

    :goto_3
    const-string v3, "CameraUtil"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "saveLastFrameGaussian2File: blurBitmap = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ", save result = "

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string p0, ", cost time = "

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2666
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    sub-long/2addr v5, v0

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p0, "ms"

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 2664
    invoke-static {v3, p0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2667
    return-void
.end method

.method public static saveLiveShotMicroVideoInSdcard()Z
    .locals 2

    .line 3017
    const-string v0, "liveshotsmv"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    return v0
.end method

.method public static saveYuv([BI)V
    .locals 4

    .line 2923
    nop

    .line 2925
    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Ljava/io/FileOutputStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "sdcard/DCIM/Camera/dump_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ".yuv"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 2926
    :try_start_1
    invoke-virtual {v1, p0}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2931
    nop

    .line 2932
    :try_start_2
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->flush()V

    .line 2933
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_1

    .line 2930
    :catchall_0
    move-exception p0

    move-object v0, v1

    goto :goto_3

    .line 2927
    :catch_0
    move-exception p0

    move-object v0, v1

    goto :goto_0

    .line 2930
    :catchall_1
    move-exception p0

    goto :goto_3

    .line 2927
    :catch_1
    move-exception p0

    .line 2928
    :goto_0
    :try_start_3
    const-string p1, "CameraUtil"

    const-string v1, "Failed to write image"

    invoke-static {p1, v1, p0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 2931
    if-eqz v0, :cond_0

    .line 2932
    :try_start_4
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->flush()V

    .line 2933
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_1

    .line 2935
    :catch_2
    move-exception p0

    .line 2936
    const-string p1, "CameraUtil"

    const-string v0, "Failed to flush/close stream"

    invoke-static {p1, v0, p0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 2938
    goto :goto_2

    .line 2937
    :cond_0
    :goto_1
    nop

    .line 2939
    :goto_2
    return-void

    .line 2930
    :goto_3
    nop

    .line 2931
    if-eqz v0, :cond_1

    .line 2932
    :try_start_5
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->flush()V

    .line 2933
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    goto :goto_4

    .line 2935
    :catch_3
    move-exception p1

    .line 2936
    const-string v0, "CameraUtil"

    const-string v1, "Failed to flush/close stream"

    invoke-static {v0, v1, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    nop

    .line 2937
    :cond_1
    :goto_4
    throw p0
.end method

.method public static saveYuvToJpg([BII[IJ)V
    .locals 7

    .line 2942
    if-nez p0, :cond_0

    .line 2943
    const-string p0, "CameraUtil"

    const-string p1, "saveYuvToJpg: null data"

    invoke-static {p0, p1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 2944
    return-void

    .line 2947
    :cond_0
    new-instance v6, Landroid/graphics/YuvImage;

    const/16 v2, 0x11

    move-object v0, v6

    move-object v1, p0

    move v3, p1

    move v4, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Landroid/graphics/YuvImage;-><init>([BIII[I)V

    .line 2948
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "sdcard/DCIM/Camera/dump_"

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p4, p5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p3, ".jpg"

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 2949
    const-string p3, "CameraUtil"

    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    const-string p5, "dump jpeg to: "

    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-static {p3, p4}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2951
    :try_start_0
    new-instance p3, Landroid/graphics/Rect;

    const/4 p4, 0x0

    invoke-direct {p3, p4, p4, p1, p2}, Landroid/graphics/Rect;-><init>(IIII)V

    const/16 p1, 0x64

    new-instance p2, Ljava/io/FileOutputStream;

    invoke-direct {p2, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, p3, p1, p2}, Landroid/graphics/YuvImage;->compressToJpeg(Landroid/graphics/Rect;ILjava/io/OutputStream;)Z
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2955
    goto :goto_0

    .line 2953
    :catch_0
    move-exception p0

    .line 2954
    const-string p1, "CameraUtil"

    invoke-virtual {p0}, Ljava/io/FileNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2, p0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 2956
    :goto_0
    return-void
.end method

.method public static scaleCamera2Matrix(Landroid/graphics/Matrix;Landroid/graphics/Rect;F)V
    .locals 1

    .line 1111
    invoke-virtual {p0, p2, p2}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 1112
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result p2

    neg-int p2, p2

    int-to-float p2, p2

    const/high16 v0, 0x40000000    # 2.0f

    div-float/2addr p2, v0

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result p1

    neg-int p1, p1

    int-to-float p1, p1

    div-float/2addr p1, v0

    invoke-virtual {p0, p2, p1}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 1113
    return-void
.end method

.method public static setAccessibilityFocusable(Landroid/view/View;Z)V
    .locals 2

    .line 2385
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_1

    .line 2386
    if-eqz p1, :cond_0

    .line 2387
    const/4 p1, 0x1

    invoke-static {p0, p1}, Landroid/support/v4/view/ViewCompat;->setImportantForAccessibility(Landroid/view/View;I)V

    goto :goto_0

    .line 2389
    :cond_0
    const/4 p1, 0x2

    invoke-static {p0, p1}, Landroid/support/v4/view/ViewCompat;->setImportantForAccessibility(Landroid/view/View;I)V

    .line 2392
    :cond_1
    :goto_0
    return-void
.end method

.method public static setBrightnessRampRate(I)V
    .locals 1

    .line 2124
    const-string v0, "power"

    invoke-static {v0}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    invoke-static {v0}, Landroid/os/IPowerManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/os/IPowerManager;

    move-result-object v0

    .line 2125
    invoke-static {v0, p0}, Lcom/android/camera/lib/compatibility/util/CompatibilityUtils;->setBrightnessRampRate(Landroid/os/IPowerManager;I)V

    .line 2126
    return-void
.end method

.method public static setScreenEffect(Z)V
    .locals 2

    .line 2129
    invoke-static {}, Lcom/mi/config/b;->hF()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2138
    :try_start_0
    invoke-static {}, Lmiui/hardware/display/DisplayFeatureManager;->getInstance()Lmiui/hardware/display/DisplayFeatureManager;

    move-result-object v0

    const/16 v1, 0xe

    invoke-virtual {v0, v1, p0}, Lmiui/hardware/display/DisplayFeatureManager;->setScreenEffect(II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2141
    goto :goto_0

    .line 2139
    :catch_0
    move-exception p0

    .line 2140
    const-string v0, "CameraUtil"

    const-string v1, "Meet Exception when calling DisplayFeatureManager#setScreenEffect()"

    invoke-static {v0, v1, p0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 2143
    :cond_0
    :goto_0
    return-void
.end method

.method public static showErrorAndFinish(Landroid/app/Activity;I)V
    .locals 10

    .line 579
    new-instance v0, Lcom/android/camera/Util$1;

    invoke-direct {v0, p0}, Lcom/android/camera/Util$1;-><init>(Landroid/app/Activity;)V

    .line 587
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 588
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 589
    const v3, 0x1010355

    invoke-virtual {v1, v3}, Landroid/app/AlertDialog$Builder;->setIconAttribute(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 590
    const v3, 0x7f090005

    invoke-virtual {v1, v3}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 591
    invoke-virtual {v1, p1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 592
    const v3, 0x7f0900c4

    invoke-virtual {v1, v3, v0}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 593
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v0

    .line 594
    const v1, 0x7f090007

    if-eq p1, v1, :cond_1

    const v1, 0x7f090006

    if-ne p1, v1, :cond_0

    goto :goto_0

    .line 596
    :cond_0
    move p1, v2

    goto :goto_1

    .line 594
    :cond_1
    :goto_0
    const/4 p1, 0x1

    .line 596
    :goto_1
    if-eqz p1, :cond_2

    .line 597
    invoke-static {}, Lcom/android/camera/statistic/CameraStatUtil;->trackCameraErrorDialogShow()V

    .line 600
    :cond_2
    sget-boolean v1, Lcom/android/camera/Util;->sIsKillCameraService:Z

    if-eqz v1, :cond_4

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1a

    if-lt v1, v3, :cond_4

    .line 601
    invoke-static {}, Lcom/mi/config/b;->gk()Z

    move-result v1

    if-eqz v1, :cond_4

    if-eqz p1, :cond_4

    .line 604
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    invoke-static {}, Lcom/android/camera/CameraSettings;->getBroadcastKillServiceTime()J

    move-result-wide v5

    sub-long/2addr v3, v5

    .line 605
    const-wide/32 v5, 0xea60

    cmp-long p1, v3, v5

    if-lez p1, :cond_3

    .line 606
    invoke-static {p0}, Lcom/android/camera/Util;->broadcastKillService(Landroid/content/Context;)V

    .line 610
    :cond_3
    const/4 p1, -0x3

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v9

    .line 611
    sget p1, Lmiui/R$style;->Widget_Button_Dialog:I

    invoke-virtual {v9, p1}, Landroid/widget/Button;->setTextAppearance(I)V

    .line 612
    invoke-virtual {v9, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 613
    new-instance p1, Lcom/android/camera/Util$2;

    const-wide/16 v4, 0x1388

    const-wide/16 v6, 0x3e8

    move-object v3, p1

    move-object v8, p0

    invoke-direct/range {v3 .. v9}, Lcom/android/camera/Util$2;-><init>(JJLandroid/app/Activity;Landroid/widget/Button;)V

    .line 628
    invoke-virtual {p1}, Lcom/android/camera/Util$2;->start()Landroid/os/CountDownTimer;

    move-result-object p1

    .line 631
    new-instance v1, Lcom/android/camera/Util$3;

    invoke-direct {v1, p1}, Lcom/android/camera/Util$3;-><init>(Landroid/os/CountDownTimer;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 640
    :cond_4
    check-cast p0, Lcom/android/camera/ActivityBase;

    invoke-virtual {p0, v0}, Lcom/android/camera/ActivityBase;->setErrorDialog(Landroid/app/AlertDialog;)V

    .line 641
    return-void
.end method

.method private static skip(Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 2268
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 2271
    nop

    .line 2272
    const/4 v0, 0x1

    :goto_0
    if-eqz v0, :cond_0

    .line 2273
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    goto :goto_1

    .line 2275
    :pswitch_0
    add-int/lit8 v0, v0, -0x1

    .line 2276
    goto :goto_1

    .line 2278
    :pswitch_1
    add-int/lit8 v0, v0, 0x1

    .line 2279
    :goto_1
    goto :goto_0

    .line 2282
    :cond_0
    return-void

    .line 2269
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    invoke-direct {p0}, Ljava/lang/IllegalStateException;-><init>()V

    throw p0

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static startScreenSlideAlphaInAnimation(Landroid/view/View;)V
    .locals 2

    .line 2707
    const/4 v0, 0x0

    invoke-static {p0, v0}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 2708
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p0

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p0, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p0

    .line 2709
    const-wide/16 v0, 0x15e

    invoke-virtual {p0, v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p0

    .line 2710
    const-wide/16 v0, 0x190

    invoke-virtual {p0, v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setStartDelay(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p0

    new-instance v0, Lmiui/view/animation/SineEaseInOutInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/SineEaseInOutInterpolator;-><init>()V

    .line 2711
    invoke-virtual {p0, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p0

    .line 2712
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 2713
    return-void
.end method

.method public static stringSparseArraysIndexOf(Landroid/util/SparseArray;Ljava/lang/String;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")I"
        }
    .end annotation

    .line 2037
    if-eqz p1, :cond_1

    .line 2038
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0}, Landroid/util/SparseArray;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 2039
    invoke-virtual {p0, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2040
    return v0

    .line 2038
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2044
    :cond_1
    const/4 p0, -0x1

    return p0
.end method

.method public static updateCountryIso(Landroid/content/Context;)V
    .locals 2

    .line 268
    nop

    .line 272
    const-string v0, "phone"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 273
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSimState()I

    move-result v0

    .line 274
    const/4 v1, 0x5

    if-eq v0, v1, :cond_0

    .line 275
    const-string v0, "ro.miui.region"

    invoke-static {v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 277
    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 278
    const-string v1, "country_detector"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/location/CountryDetector;

    .line 279
    invoke-virtual {p0}, Landroid/location/CountryDetector;->detectCountry()Landroid/location/Country;

    move-result-object p0

    .line 280
    if-eqz p0, :cond_1

    .line 281
    invoke-virtual {p0}, Landroid/location/Country;->getCountryIso()Ljava/lang/String;

    move-result-object v0

    .line 284
    :cond_1
    sput-object v0, Lcom/android/camera/Util;->mCountryIso:Ljava/lang/String;

    .line 285
    const-string p0, "CameraUtil"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "antiBanding mCountryIso="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/android/camera/Util;->mCountryIso:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 286
    const-string p0, "camera_dump_parameters"

    sget-boolean v0, Lcom/android/camera/Util;->DEBUG:Z

    invoke-static {p0, v0}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    sput-boolean p0, Lcom/android/camera/Util;->sIsDumpLog:Z

    .line 287
    const-string p0, "camera_dump_orig_jpg"

    const/4 v0, 0x0

    invoke-static {p0, v0}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    sput-boolean p0, Lcom/android/camera/Util;->sIsDumpOrigJpg:Z

    .line 288
    const-string p0, "kill_camera_service_enable"

    const/4 v0, 0x1

    invoke-static {p0, v0}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    sput-boolean p0, Lcom/android/camera/Util;->sIsKillCameraService:Z

    .line 289
    return-void
.end method

.method public static verifyAssetZip(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 3285
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p0

    .line 3286
    const/4 p1, 0x0

    :try_start_0
    invoke-static {p0, p2, p3}, Lcom/android/camera/Util;->verifyZip(Ljava/io/InputStream;Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3287
    if-eqz p0, :cond_0

    invoke-static {p1, p0}, Lcom/android/camera/Util;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V

    .line 3288
    :cond_0
    return-void

    .line 3287
    :catchall_0
    move-exception p2

    goto :goto_0

    .line 3285
    :catch_0
    move-exception p1

    :try_start_1
    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 3287
    :goto_0
    if-eqz p0, :cond_1

    invoke-static {p1, p0}, Lcom/android/camera/Util;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V

    :cond_1
    throw p2
.end method

.method public static verifyZip(Ljava/io/InputStream;Ljava/lang/String;I)V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 3238
    new-instance v0, Ljava/util/zip/ZipInputStream;

    invoke-direct {v0, p0}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V

    .line 3239
    const/4 p0, 0x0

    :try_start_0
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 3240
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 3241
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 3244
    :cond_0
    :goto_0
    invoke-virtual {v0}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v1

    if-eqz v1, :cond_8

    .line 3245
    new-instance v2, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 3247
    nop

    .line 3248
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-nez v3, :cond_2

    .line 3249
    invoke-virtual {v1}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 3250
    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    goto :goto_1

    .line 3252
    :cond_1
    invoke-virtual {v2}, Ljava/io/File;->createNewFile()Z

    .line 3253
    goto :goto_2

    .line 3255
    :cond_2
    invoke-virtual {v1}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 3256
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-nez v3, :cond_5

    .line 3257
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 3258
    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    goto :goto_1

    .line 3261
    :cond_3
    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result v3

    if-nez v3, :cond_4

    .line 3262
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 3263
    invoke-virtual {v2}, Ljava/io/File;->createNewFile()Z

    .line 3265
    :cond_4
    invoke-static {v2, p2}, Lcom/android/camera/network/download/Verifier;->crc32(Ljava/io/File;I)J

    move-result-wide v6

    .line 3266
    invoke-virtual {v1}, Ljava/util/zip/ZipEntry;->getCrc()J

    move-result-wide v8

    cmp-long v3, v6, v8

    if-eqz v3, :cond_5

    .line 3267
    goto :goto_2

    .line 3270
    :cond_5
    :goto_1
    move v4, v5

    :goto_2
    if-eqz v4, :cond_7

    .line 3271
    const-string v3, "CameraUtil"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "corrupted "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 3272
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 3274
    :try_start_1
    new-array v2, p2, [B

    .line 3275
    :goto_3
    invoke-virtual {v0, v2}, Ljava/util/zip/ZipInputStream;->read([B)I

    move-result v3

    if-lez v3, :cond_6

    .line 3276
    invoke-virtual {v1, v2, v5, v3}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_3

    .line 3278
    :cond_6
    :try_start_2
    invoke-static {p0, v1}, Lcom/android/camera/Util;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    goto :goto_5

    :catchall_0
    move-exception p1

    move-object p2, p0

    goto :goto_4

    .line 3272
    :catch_0
    move-exception p1

    :try_start_3
    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 3278
    :catchall_1
    move-exception p2

    move-object v10, p2

    move-object p2, p1

    move-object p1, v10

    :goto_4
    :try_start_4
    invoke-static {p2, v1}, Lcom/android/camera/Util;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V

    throw p1
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 3280
    :cond_7
    :goto_5
    goto/16 :goto_0

    .line 3281
    :cond_8
    invoke-static {p0, v0}, Lcom/android/camera/Util;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V

    .line 3282
    return-void

    .line 3281
    :catchall_2
    move-exception p1

    goto :goto_6

    .line 3238
    :catch_1
    move-exception p0

    :try_start_5
    throw p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 3281
    :goto_6
    invoke-static {p0, v0}, Lcom/android/camera/Util;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V

    throw p1
.end method

.method public static verifyZip(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 3188
    new-instance v0, Ljava/util/zip/ZipFile;

    invoke-direct {v0, p0}, Ljava/util/zip/ZipFile;-><init>(Ljava/lang/String;)V

    .line 3189
    const/4 p0, 0x0

    :try_start_0
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 3190
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 3191
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 3193
    :cond_0
    invoke-virtual {v0}, Ljava/util/zip/ZipFile;->entries()Ljava/util/Enumeration;

    move-result-object v1

    .line 3194
    :goto_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_9

    .line 3195
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/zip/ZipEntry;

    .line 3196
    new-instance v3, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 3198
    nop

    .line 3199
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v4

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-nez v4, :cond_2

    .line 3200
    invoke-virtual {v2}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 3201
    invoke-virtual {v3}, Ljava/io/File;->mkdirs()Z

    goto :goto_1

    .line 3203
    :cond_1
    invoke-virtual {v3}, Ljava/io/File;->createNewFile()Z

    .line 3204
    goto :goto_2

    .line 3206
    :cond_2
    invoke-virtual {v2}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 3207
    invoke-virtual {v3}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-nez v4, :cond_5

    .line 3208
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 3209
    invoke-virtual {v3}, Ljava/io/File;->mkdirs()Z

    goto :goto_1

    .line 3212
    :cond_3
    invoke-virtual {v3}, Ljava/io/File;->isFile()Z

    move-result v4

    if-nez v4, :cond_4

    .line 3213
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 3214
    invoke-virtual {v3}, Ljava/io/File;->createNewFile()Z

    .line 3216
    :cond_4
    invoke-static {v3, p2}, Lcom/android/camera/network/download/Verifier;->crc32(Ljava/io/File;I)J

    move-result-wide v7

    .line 3217
    invoke-virtual {v2}, Ljava/util/zip/ZipEntry;->getCrc()J

    move-result-wide v9

    cmp-long v4, v7, v9

    if-eqz v4, :cond_5

    .line 3218
    goto :goto_2

    .line 3221
    :cond_5
    :goto_1
    move v5, v6

    :goto_2
    if-eqz v5, :cond_8

    .line 3222
    const-string v4, "CameraUtil"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "corrupted "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 3223
    invoke-virtual {v0, v2}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    .line 3224
    :try_start_1
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 3223
    nop

    .line 3226
    :try_start_2
    new-array v3, p2, [B

    .line 3227
    :goto_3
    invoke-virtual {v2, v3}, Ljava/io/InputStream;->read([B)I

    move-result v5

    if-lez v5, :cond_6

    .line 3228
    invoke-virtual {v4, v3, v6, v5}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_3

    .line 3230
    :cond_6
    :try_start_3
    invoke-static {p0, v4}, Lcom/android/camera/Util;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    if-eqz v2, :cond_8

    :try_start_4
    invoke-static {p0, v2}, Lcom/android/camera/Util;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    goto :goto_6

    :catchall_0
    move-exception p1

    move-object p2, p0

    goto :goto_4

    .line 3223
    :catch_0
    move-exception p1

    :try_start_5
    throw p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 3230
    :catchall_1
    move-exception p2

    move-object v11, p2

    move-object p2, p1

    move-object p1, v11

    :goto_4
    :try_start_6
    invoke-static {p2, v4}, Lcom/android/camera/Util;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V

    throw p1
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    :catchall_2
    move-exception p1

    move-object p2, p0

    goto :goto_5

    .line 3223
    :catch_1
    move-exception p1

    :try_start_7
    throw p1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 3230
    :catchall_3
    move-exception p2

    move-object v11, p2

    move-object p2, p1

    move-object p1, v11

    :goto_5
    if-eqz v2, :cond_7

    :try_start_8
    invoke-static {p2, v2}, Lcom/android/camera/Util;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V

    :cond_7
    throw p1
    :try_end_8
    .catch Ljava/lang/Throwable; {:try_start_8 .. :try_end_8} :catch_2
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    .line 3232
    :cond_8
    :goto_6
    goto/16 :goto_0

    .line 3233
    :cond_9
    invoke-static {p0, v0}, Lcom/android/camera/Util;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V

    .line 3234
    return-void

    .line 3233
    :catchall_4
    move-exception p1

    goto :goto_7

    .line 3188
    :catch_2
    move-exception p0

    :try_start_9
    throw p0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_4

    .line 3233
    :goto_7
    invoke-static {p0, v0}, Lcom/android/camera/Util;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V

    throw p1
.end method

.method public static viewUri(Landroid/net/Uri;Landroid/content/Context;)V
    .locals 3

    .line 1054
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/android/camera/Util;->isUriValid(Landroid/net/Uri;Landroid/content/ContentResolver;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1055
    const-string p1, "CameraUtil"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Uri invalid. uri="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1056
    return-void

    .line 1060
    :cond_0
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.android.camera.action.REVIEW"

    invoke-direct {v0, v1, p0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1067
    goto :goto_0

    .line 1061
    :catch_0
    move-exception v0

    .line 1063
    :try_start_1
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1, p0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_1
    .catch Landroid/content/ActivityNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    .line 1066
    goto :goto_0

    .line 1064
    :catch_1
    move-exception p1

    .line 1065
    const-string v0, "CameraUtil"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "review image fail. uri="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1068
    :goto_0
    return-void
.end method
