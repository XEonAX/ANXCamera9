.class public Landroid/provider/MiuiSettings;
.super Ljava/lang/Object;
.source "MiuiSettings.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/provider/MiuiSettings$Privacy;,
        Landroid/provider/MiuiSettings$ScreenEffect;,
        Landroid/provider/MiuiSettings$Key;,
        Landroid/provider/MiuiSettings$ForceTouch;,
        Landroid/provider/MiuiSettings$Ad;,
        Landroid/provider/MiuiSettings$SettingsCloudData;,
        Landroid/provider/MiuiSettings$FrequentPhrases;,
        Landroid/provider/MiuiSettings$MiuiVoip;,
        Landroid/provider/MiuiSettings$VirtualSim;,
        Landroid/provider/MiuiSettings$Telephony;,
        Landroid/provider/MiuiSettings$AntiVirus;,
        Landroid/provider/MiuiSettings$XSpace;,
        Landroid/provider/MiuiSettings$AntiSpam;,
        Landroid/provider/MiuiSettings$SilenceMode;,
        Landroid/provider/MiuiSettings$Global;,
        Landroid/provider/MiuiSettings$Secure;,
        Landroid/provider/MiuiSettings$System;
    }
.end annotation


# static fields
.field public static final ACTION_ACCOUNT_LIST:Ljava/lang/String; = "android.settings.ACCOUNT_LIST"

.field public static APP_LOCK_USE_FACE_UNLOCK_STATE:Ljava/lang/String; = null

.field public static APP_LOCK_USE_FINGERPRINT_STATE:Ljava/lang/String; = null

.field public static final CROSS_PROFILE_SETTINGS:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final DISCOVER_AUTO_UPDATE_ENABLED:Ljava/lang/String; = "com.xiaomi.discover.auto_update_enabled"

.field private static final DISCOVER_METERED_SYSTEM_UPDATE_CONFIRM_NEEDED_BY_REGION:Ljava/lang/String; = "com.xiaomi.discover.metered_system_update_confirm_needed_by_region"

.field private static final DISCOVER_METERED_UPDATE_ANSWERED:Ljava/lang/String; = "com.xiaomi.discover.metered_update_answered"

.field private static final DISCOVER_METERED_UPDATE_CONFIRM_NEEDED_BY_REGION:Ljava/lang/String; = "com.xiaomi.discover.metered_update_confirm_needed_by_region"

.field private static final DOWNLOADMANAGER_DEBUG_DP_PATH:Ljava/lang/String; = "debug_dp_path"

.field private static final DOWNLOADMANAGER_DEBUG_SWITCH:Ljava/lang/String; = "debug_switch"

.field private static final DOWNLOADMANAGER_XUNLEI_USAGE_PERMISSION:Ljava/lang/String; = "xunlei_usage_permission"

.field private static final DOWNLOADMANAGER_XUNLEI_VIP_TOKEN:Ljava/lang/String; = "vip_token"

.field private static final DOWNLOADMANAGER__XUNLEI_TOKEN:Ljava/lang/String; = "xunlei_token"

.field private static final LAST_SYNC_TIME_ANTISPAM:Ljava/lang/String; = "setting_last_time_alert_antispam"

.field private static final LAST_SYNC_TIME_BROWSER:Ljava/lang/String; = "setting_last_time_alert_com.miui.browser"

.field private static final LAST_SYNC_TIME_CALENDER:Ljava/lang/String; = "setting_last_time_alert_com.android.calendar"

.field private static final LAST_SYNC_TIME_CALL_LOG:Ljava/lang/String; = "setting_last_time_alert_call_log"

.field private static final LAST_SYNC_TIME_CONTACT:Ljava/lang/String; = "setting_last_time_alert_com.android.contacts"

.field private static final LAST_SYNC_TIME_GALLERY:Ljava/lang/String; = "setting_last_time_alert_com.miui.gallery.cloud.provider"

.field private static final LAST_SYNC_TIME_MUSIC:Ljava/lang/String; = "setting_last_time_alert_com.miui.player"

.field private static final LAST_SYNC_TIME_NOTES:Ljava/lang/String; = "setting_last_time_alert_notes"

.field private static final LAST_SYNC_TIME_RECORDER:Ljava/lang/String; = "setting_last_time_alert_records"

.field private static final LAST_SYNC_TIME_SMS:Ljava/lang/String; = "setting_last_time_alert_sms"

.field private static final LAST_SYNC_TIME_WIFI:Ljava/lang/String; = "setting_last_time_alert_wifi"

.field private static final MARKET_CHOOSER_RECOMMENDED_ENABLE:Ljava/lang/String; = "com.xiaomi.market.enable_app_chooser_recommend"

.field private static final MARKET_ENABLE_SHARE_PROGRESS_STATUS:Ljava/lang/String; = "com.xiaomi.market.enable_share_progress_status"

.field private static final MARKET_ENABLE_SHARE_PROGRESS_STATUS_INTERNATIONAL:Ljava/lang/String; = "com.xiaomi.discover.enable_share_progress_status"

.field private static final MIAPPS_HOME_USER_GUIDE_SHOWN_CONTROL:Ljava/lang/String; = "com.xiaomi.mipicks.need_show_user_guide_status"

.field private static final MICLOUD_GDPR_PERMISSION_GRANTED:Ljava/lang/String; = "micloud_gdpr_permission_granted"

.field private static final MICLOUD_NETWORK_AVAILABILITY_KEY:Ljava/lang/String; = "micloud_network_availability"

.field private static final MIPICKS_ENABLE_SHARE_PROGRESS_STATUS:Ljava/lang/String; = "com.xiaomi.mipicks.enable_share_progress_status"

.field private static final MIUI_HOME_ENABLE_SHARE_PROGRESS_STATUS:Ljava/lang/String; = "com.miui.home.enable_share_progress_status"

.field private static final OPEN_PDC_HOST_KEY:Ljava/lang/String; = "com.xiaomi.opensdk.pdc.host"

.field private static final PREF_KEY_WALLPAPER_SCREEN_SPAN:Ljava/lang/String; = "pref_key_wallpaper_screen_span"

.field public static final PRIVACY_PASSWORD_BIND_XIAOMI_ACCOUNT:Ljava/lang/String; = "privacy_password_bind_xiaomi_account"

.field public static final PRIVACY_PASSWORD_FINGERPRINT_AUTHENTICATION_NUM:Ljava/lang/String; = "privacy_password_finger_authentication_num"

.field private static final SCREEN_RECORDER_SHOW_TOUCHES:Ljava/lang/String; = "show_touches"

.field private static final SETTING_MICLOUD_ACCOUNTNAME:Ljava/lang/String; = "micloud_accountname"

.field private static final SETTING_MICLOUD_ACCOUNTNAME_V2:Ljava/lang/String; = "micloud_accountname_v2"

.field private static final SETTING_MICLOUD_HOSTS:Ljava/lang/String; = "micloud_hosts"

.field private static final SETTING_MICLOUD_HOSTS_V2:Ljava/lang/String; = "micloud_hosts_v2"

.field private static final SETTING_MICLOUD_UPDATEHOSTS_THIRD_PARTY:Ljava/lang/String; = "micloud_updatehosts_third_party"

.field public static final SETTING_UPDATABLE_SYSTEM_APP_COUNT:Ljava/lang/String; = "updatable_system_app_count"

.field private static final SYNC_SETTING_ANTISPAM_0:Ljava/lang/String; = "sync_for_sim_com.xiaomi-antispam-0"

.field private static final SYNC_SETTING_ANTISPAM_1:Ljava/lang/String; = "sync_for_sim_com.xiaomi-antispam-1"

.field private static final SYNC_SETTING_BROWSER_0:Ljava/lang/String; = "sync_for_sim_com.xiaomi-com.miui.browser-0"

.field private static final SYNC_SETTING_BROWSER_1:Ljava/lang/String; = "sync_for_sim_com.xiaomi-com.miui.browser-1"

.field private static final SYNC_SETTING_CALENDER_0:Ljava/lang/String; = "sync_for_sim_com.xiaomi-com.android.calendar-0"

.field private static final SYNC_SETTING_CALENDER_1:Ljava/lang/String; = "sync_for_sim_com.xiaomi-com.android.calendar-1"

.field private static final SYNC_SETTING_CALL_LOG_0:Ljava/lang/String; = "sync_for_sim_com.xiaomi-call_log-0"

.field private static final SYNC_SETTING_CALL_LOG_1:Ljava/lang/String; = "sync_for_sim_com.xiaomi-call_log-1"

.field private static final SYNC_SETTING_CONTACT_0:Ljava/lang/String; = "sync_for_sim_com.xiaomi-com.android.contacts-0"

.field private static final SYNC_SETTING_CONTACT_1:Ljava/lang/String; = "sync_for_sim_com.xiaomi-com.android.contacts-1"

.field private static final SYNC_SETTING_GALLERY_0:Ljava/lang/String; = "sync_for_sim_com.xiaomi-com.miui.gallery.cloud.provider-0"

.field private static final SYNC_SETTING_GALLERY_1:Ljava/lang/String; = "sync_for_sim_com.xiaomi-com.miui.gallery.cloud.provider-1"

.field private static final SYNC_SETTING_MUSIC_0:Ljava/lang/String; = "sync_for_sim_com.xiaomi-com.miui.player-0"

.field private static final SYNC_SETTING_MUSIC_1:Ljava/lang/String; = "sync_for_sim_com.xiaomi-com.miui.player-1"

.field private static final SYNC_SETTING_NOTES_0:Ljava/lang/String; = "sync_for_sim_com.xiaomi-notes-0"

.field private static final SYNC_SETTING_NOTES_1:Ljava/lang/String; = "sync_for_sim_com.xiaomi-notes-1"

.field private static final SYNC_SETTING_RECORDER_0:Ljava/lang/String; = "sync_for_sim_com.xiaomi-records-0"

.field private static final SYNC_SETTING_RECORDER_1:Ljava/lang/String; = "sync_for_sim_com.xiaomi-records-1"

.field private static final SYNC_SETTING_SMS_0:Ljava/lang/String; = "sync_for_sim_com.xiaomi-sms-0"

.field private static final SYNC_SETTING_SMS_1:Ljava/lang/String; = "sync_for_sim_com.xiaomi-sms-1"

.field private static final SYNC_SETTING_WIFI_0:Ljava/lang/String; = "sync_for_sim_com.xiaomi-wifi-0"

.field private static final SYNC_SETTING_WIFI_1:Ljava/lang/String; = "sync_for_sim_com.xiaomi-wifi-1"


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 145
    const-string v0, "com_miui_applicatinlock_use_fingerprint_state"

    sput-object v0, Landroid/provider/MiuiSettings;->APP_LOCK_USE_FINGERPRINT_STATE:Ljava/lang/String;

    .line 151
    const-string v0, "com_miui_applicatinlock_use_face_unlock_state"

    sput-object v0, Landroid/provider/MiuiSettings;->APP_LOCK_USE_FACE_UNLOCK_STATE:Ljava/lang/String;

    .line 187
    new-instance v0, Landroid/util/ArraySet;

    invoke-direct {v0}, Landroid/util/ArraySet;-><init>()V

    sput-object v0, Landroid/provider/MiuiSettings;->CROSS_PROFILE_SETTINGS:Ljava/util/Set;

    .line 189
    sget-object v0, Landroid/provider/MiuiSettings;->CROSS_PROFILE_SETTINGS:Ljava/util/Set;

    const-string/jumbo v1, "ringtone"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 190
    sget-object v0, Landroid/provider/MiuiSettings;->CROSS_PROFILE_SETTINGS:Ljava/util/Set;

    const-string/jumbo v1, "notification_sound"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 191
    sget-object v0, Landroid/provider/MiuiSettings;->CROSS_PROFILE_SETTINGS:Ljava/util/Set;

    const-string v1, "alarm_alert"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 192
    sget-object v0, Landroid/provider/MiuiSettings;->CROSS_PROFILE_SETTINGS:Ljava/util/Set;

    const-string/jumbo v1, "user_rotation"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 193
    sget-object v0, Landroid/provider/MiuiSettings;->CROSS_PROFILE_SETTINGS:Ljava/util/Set;

    const-string v1, "accelerometer_rotation"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 194
    sget-object v0, Landroid/provider/MiuiSettings;->CROSS_PROFILE_SETTINGS:Ljava/util/Set;

    const-string v1, "hide_rotation_lock_toggle_for_accessibility"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 195
    sget-object v0, Landroid/provider/MiuiSettings;->CROSS_PROFILE_SETTINGS:Ljava/util/Set;

    const-string v1, "frequent_phrases"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 196
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getConfigurationForUser(Landroid/content/ContentResolver;Landroid/content/res/Configuration;I)V
    .registers 9
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "outConfig"    # Landroid/content/res/Configuration;
    .param p2, "userHandle"    # I

    .line 5826
    const-string/jumbo v0, "ui_mode_scale"

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .line 5827
    .local v0, "scaleMode":I
    const/16 v2, 0xf

    and-int/2addr v0, v2

    .line 5829
    const/4 v3, 0x0

    const/16 v4, 0xc

    if-eq v0, v4, :cond_21

    const/16 v4, 0xd

    if-eq v0, v4, :cond_21

    const/16 v4, 0xe

    if-eq v0, v4, :cond_21

    if-eq v0, v2, :cond_21

    const/16 v2, 0xb

    if-ne v0, v2, :cond_1f

    goto :goto_21

    :cond_1f
    move v2, v3

    goto :goto_22

    :cond_21
    :goto_21
    move v2, v1

    .line 5836
    .local v2, "isLargeUiMode":Z
    :goto_22
    if-eqz v2, :cond_47

    .line 5837
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 5838
    .local v4, "version":I
    const/16 v5, 0x1a

    if-eq v4, v5, :cond_31

    const/16 v5, 0x1b

    if-ne v4, v5, :cond_2f

    goto :goto_31

    :cond_2f
    move v1, v3

    nop

    .line 5840
    .local v1, "isAndroidO":Z
    :cond_31
    :goto_31
    if-nez v1, :cond_41

    sget-boolean v3, Lmiui/os/Build;->IS_TABLET:Z

    if-eqz v3, :cond_38

    goto :goto_41

    .line 5843
    :cond_38
    sget v3, Landroid/util/MiuiDisplayMetrics;->DENSITY_DEVICE:I

    .line 5844
    invoke-static {v0, v3}, Landroid/util/MiuiFontSizeUtils;->getFontScaleV2(II)F

    move-result v3

    iput v3, p1, Landroid/content/res/Configuration;->fontScale:F

    .line 5844
    .end local v1    # "isAndroidO":Z
    .end local v4    # "version":I
    goto :goto_47

    .line 5841
    .restart local v1    # "isAndroidO":Z
    .restart local v4    # "version":I
    :cond_41
    :goto_41
    invoke-static {v0}, Landroid/content/res/MiuiConfiguration;->getFontScale(I)F

    move-result v3

    iput v3, p1, Landroid/content/res/Configuration;->fontScale:F

    .line 5847
    .end local v1    # "isAndroidO":Z
    .end local v4    # "version":I
    :cond_47
    :goto_47
    return-void
.end method
