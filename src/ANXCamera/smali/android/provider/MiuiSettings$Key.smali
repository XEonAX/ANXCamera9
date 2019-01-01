.class public final Landroid/provider/MiuiSettings$Key;
.super Ljava/lang/Object;
.source "MiuiSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/provider/MiuiSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Key"
.end annotation


# static fields
.field public static final CLOSE_APP:Ljava/lang/String; = "close_app"

.field public static final CLOSE_TALKBACK:Ljava/lang/String; = "close_talkback"

.field public static final DOUBLE_CLICK_POWER_KEY:Ljava/lang/String; = "double_click_power_key"

.field public static final DUMP_LOG:Ljava/lang/String; = "dump_log"

.field public static final GO_TO_SLEEP:Ljava/lang/String; = "go_to_sleep"

.field public static final KEY_AI_BUTTON_SETTINGS:Ljava/lang/String; = "key_ai_button_settings"

.field public static final KEY_BANK_CARD:Ljava/lang/String; = "key_bank_card_in_ese"

.field public static final KEY_BANK_CARD_DISABLE:I = 0x0

.field public static final KEY_COMBINATION_POWER_BACK:Ljava/lang/String; = "key_combination_power_back"

.field public static final KEY_COMBINATION_POWER_HOME:Ljava/lang/String; = "key_combination_power_home"

.field public static final KEY_COMBINATION_POWER_MENU:Ljava/lang/String; = "key_combination_power_menu"

.field public static final KEY_DOUBLE_CLICK_AI_BUTTON_SETTINGS:Ljava/lang/String; = "key_double_click_ai_button_settings"

.field public static final KEY_LONG_PRESS_DOWN_AI_BUTTON_SETTINGS:Ljava/lang/String; = "key_long_press_down_ai_button_settings"

.field public static final KEY_LONG_PRESS_UP_AI_BUTTON_SETTINGS:Ljava/lang/String; = "key_long_press_up_ai_button_settings"

.field public static final KEY_NONE:Ljava/lang/String; = "key_none"

.field public static final KEY_SINGLE_CLICK_AI_BUTTON_SETTINGS:Ljava/lang/String; = "key_single_click_ai_button_settings"

.field public static final KEY_TRANS_CARD:Ljava/lang/String; = "key_trans_card_in_ese"

.field public static final KEY_TRANS_CARD_DISABLE:I = 0x0

.field public static final KEY_UPDATED:Ljava/lang/String; = "key_updated"

.field public static final LAUNCH_CAMERA:Ljava/lang/String; = "launch_camera"

.field public static final LAUNCH_GOOGLE_SEARCH:Ljava/lang/String; = "launch_google_search"

.field public static final LAUNCH_RECENTS:Ljava/lang/String; = "launch_recents"

.field public static final LAUNCH_VOICE_ASSISTANT:Ljava/lang/String; = "launch_voice_assistant"

.field public static final LONG_PRESS_BACK_KEY:Ljava/lang/String; = "long_press_back_key"

.field public static final LONG_PRESS_HOME_KEY:Ljava/lang/String; = "long_press_home_key"

.field public static final LONG_PRESS_MENU_KEY:Ljava/lang/String; = "long_press_menu_key"

.field public static final LONG_PRESS_MENU_KEY_WHEN_LOCK:Ljava/lang/String; = "long_press_menu_key_when_lock"

.field public static final LONG_PRESS_POWER_LAUNCH_XIAOAI:Ljava/lang/String; = "long_press_power_launch_xiaoai"

.field public static final LONG_PRESS_POWER_LAUNCH_XIAOAI_DISABLE:I = 0x0

.field public static final LONG_PRESS_POWER_LAUNCH_XIAOAI_ENABLE:I = 0x1

.field public static final LONG_PRESS_VOLUME_DOWN:Ljava/lang/String; = "key_long_press_volume_down"

.field public static final LONG_PRESS_VOLUME_DOWN_DEFAULT:Ljava/lang/String; = "none"

.field public static final LONG_PRESS_VOLUME_DOWN_PAY:Ljava/lang/String; = "public_transportation_shortcuts"

.field public static final LONG_PRESS_VOLUME_DOWN_STREET_SNAP:Ljava/lang/String; = "Street-snap"

.field public static final LONG_PRESS_VOLUME_DOWN_STREET_SNAP_MOVIE:Ljava/lang/String; = "Street-snap-movie"

.field public static final LONG_PRESS_VOLUME_DOWN_STREET_SNAP_PICTURE:Ljava/lang/String; = "Street-snap-picture"

.field public static final MI_PAY:Ljava/lang/String; = "mi_pay"

.field public static final NONE:Ljava/lang/String; = "none"

.field public static final SCREEN_SHOT:Ljava/lang/String; = "screen_shot"

.field public static final SEND_BACK_WHEN_XIAOAI_APPEAR:Ljava/lang/String; = "send_back_when_xiaoai_appear"

.field public static final SHOW_MENU:Ljava/lang/String; = "show_menu"

.field public static final SINGLE_KEY_USE_ACTION:Ljava/lang/String; = "single_key_use_enable"

.field public static final SINGLE_KEY_USE_DISABLE:I = 0x0

.field public static final SINGLE_KEY_USE_ENABLE:I = 0x1

.field public static final SPLIT_SCREEN:Ljava/lang/String; = "split_screen"

.field public static final THREE_GESTURE_DOWN:Ljava/lang/String; = "three_gesture_down"

.field public static final TURN_ON_TORCH:Ljava/lang/String; = "turn_on_torch"

.field public static final VOLUMEKEY_LAUNCH_CAMERA:Ljava/lang/String; = "volumekey_launch_camera"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 6372
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getKeyAndGestureShortcutFunction(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "action"    # Ljava/lang/String;

    .line 6527
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v1, -0x2

    invoke-static {v0, p1, v1}, Landroid/provider/Settings$System;->getStringForUser(Landroid/content/ContentResolver;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    .line 6529
    .local v0, "function":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 6530
    const-string v1, "double_click_power_key"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 6531
    const/4 v0, 0x0

    goto :goto_0

    .line 6533
    :cond_0
    const-string/jumbo v1, "three_gesture_down"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 6534
    const-string/jumbo v0, "screen_shot"

    goto :goto_0

    .line 6536
    :cond_1
    const-string/jumbo v1, "long_press_home_key"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 6537
    sget-boolean v1, Lmiui/os/Build;->IS_GLOBAL_BUILD:Z

    if-nez v1, :cond_2

    .line 6538
    const-string/jumbo v0, "launch_voice_assistant"

    goto :goto_0

    .line 6540
    :cond_2
    const-string/jumbo v0, "launch_google_search"

    goto :goto_0

    .line 6543
    :cond_3
    const-string/jumbo v1, "long_press_menu_key"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 6544
    const-string/jumbo v0, "show_menu"

    goto :goto_0

    .line 6546
    :cond_4
    const-string/jumbo v1, "long_press_menu_key_when_lock"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 6547
    const-string/jumbo v0, "turn_on_torch"

    goto :goto_0

    .line 6549
    :cond_5
    const-string/jumbo v1, "long_press_back_key"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 6550
    const/4 v0, 0x0

    goto :goto_0

    .line 6552
    :cond_6
    const-string/jumbo v1, "key_combination_power_home"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 6553
    const/4 v0, 0x0

    goto :goto_0

    .line 6555
    :cond_7
    const-string/jumbo v1, "key_combination_power_back"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 6556
    const/4 v0, 0x0

    goto :goto_0

    .line 6558
    :cond_8
    const-string/jumbo v1, "key_combination_power_menu"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 6559
    const/4 v0, 0x0

    .line 6562
    :cond_9
    :goto_0
    return-object v0
.end method

.method public static isTSMClientInstalled(Landroid/content/Context;)Z
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .line 6398
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 6399
    .local v0, "pm":Landroid/content/pm/PackageManager;
    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 6401
    :try_start_0
    const-string v2, "com.miui.tsmclient"

    invoke-virtual {v0, v2, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v2
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6402
    .local v2, "packageInfo":Landroid/content/pm/PackageInfo;
    if-eqz v2, :cond_0

    .line 6403
    const/4 v1, 0x1

    return v1

    .line 6407
    .end local v2    # "packageInfo":Landroid/content/pm/PackageInfo;
    :cond_0
    goto :goto_0

    .line 6405
    :catch_0
    move-exception v2

    .line 6409
    :cond_1
    :goto_0
    return v1
.end method

.method public static updateOldKeyFunctionToNew(Landroid/content/Context;)V
    .locals 7
    .param p0, "context"    # Landroid/content/Context;

    .line 6569
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string/jumbo v1, "key_updated"

    const/4 v2, -0x2

    const/4 v3, 0x0

    invoke-static {v0, v1, v3, v2}, Landroid/provider/Settings$System;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v0

    if-nez v0, :cond_6

    .line 6571
    const-string/jumbo v0, "screen_key_long_press_app_switch"

    invoke-static {p0, v0}, Landroid/provider/MiuiSettings$System;->getScreenKeyLongPressAction(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 6573
    .local v0, "menuAction":Ljava/lang/String;
    const-string/jumbo v1, "screen_key_long_press_home"

    invoke-static {p0, v1}, Landroid/provider/MiuiSettings$System;->getScreenKeyLongPressAction(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 6575
    .local v1, "homeAction":Ljava/lang/String;
    const-string/jumbo v3, "screen_key_long_press_back"

    invoke-static {p0, v3}, Landroid/provider/MiuiSettings$System;->getScreenKeyLongPressAction(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 6577
    .local v3, "backAction":Ljava/lang/String;
    const-string/jumbo v4, "voice_assistant"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 6578
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string/jumbo v5, "long_press_home_key"

    const-string/jumbo v6, "launch_voice_assistant"

    invoke-static {v4, v5, v6, v2}, Landroid/provider/Settings$System;->putStringForUser(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;I)Z

    goto :goto_0

    .line 6580
    :cond_0
    const-string/jumbo v4, "voice_assistant"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 6581
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string/jumbo v5, "long_press_back_key"

    const-string/jumbo v6, "launch_voice_assistant"

    invoke-static {v4, v5, v6, v2}, Landroid/provider/Settings$System;->putStringForUser(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;I)Z

    goto :goto_0

    .line 6583
    :cond_1
    const-string/jumbo v4, "voice_assistant"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 6584
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string/jumbo v5, "long_press_menu_key"

    const-string/jumbo v6, "launch_voice_assistant"

    invoke-static {v4, v5, v6, v2}, Landroid/provider/Settings$System;->putStringForUser(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;I)Z

    .line 6588
    :cond_2
    :goto_0
    const-string v4, "close_app"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 6589
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string/jumbo v5, "long_press_back_key"

    const-string v6, "close_app"

    invoke-static {v4, v5, v6, v2}, Landroid/provider/Settings$System;->putStringForUser(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;I)Z

    goto :goto_1

    .line 6591
    :cond_3
    const-string v4, "close_app"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 6592
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string/jumbo v5, "long_press_home_key"

    const-string v6, "close_app"

    invoke-static {v4, v5, v6, v2}, Landroid/provider/Settings$System;->putStringForUser(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;I)Z

    goto :goto_1

    .line 6594
    :cond_4
    const-string v4, "close_app"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 6595
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string/jumbo v5, "long_press_menu_key"

    const-string v6, "close_app"

    invoke-static {v4, v5, v6, v2}, Landroid/provider/Settings$System;->putStringForUser(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;I)Z

    .line 6599
    :cond_5
    :goto_1
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string/jumbo v5, "key_updated"

    const/4 v6, 0x1

    invoke-static {v4, v5, v6, v2}, Landroid/provider/Settings$System;->putIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)Z

    .line 6602
    .end local v0    # "menuAction":Ljava/lang/String;
    .end local v1    # "homeAction":Ljava/lang/String;
    .end local v3    # "backAction":Ljava/lang/String;
    :cond_6
    return-void
.end method
