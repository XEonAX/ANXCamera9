.class public final Landroid/provider/MiuiSettings$AntiSpam;
.super Ljava/lang/Object;
.source "MiuiSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/provider/MiuiSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "AntiSpam"
.end annotation


# static fields
.field public static ACTION_SOURCE_CALL:Ljava/lang/String; = null

.field public static ACTION_SOURCE_OTHER:Ljava/lang/String; = null

.field public static ACTION_SOURCE_SMS:Ljava/lang/String; = null

.field public static final AGENT:I = 0x2

.field public static final AGENT_NUM_STATE:Ljava/lang/String; = "agent_num_state"

.field public static final AGENT_NUM_STATE_SIM_2:Ljava/lang/String; = "agent_num_state_sim_2"

.field public static final ANTISPAM_ENABLE_FOR_SIM_1:Ljava/lang/String; = "antispam_enable_for_sim_1"

.field public static final ANTISPAM_ENABLE_FOR_SIM_2:Ljava/lang/String; = "antispam_enable_for_sim_2"

.field public static final ANTISPAM_MODE:Ljava/lang/String; = "antispam_mode_enable"

.field public static final ANTISPAM_PKG:Ljava/lang/String; = "com.miui.securitycenter"

.field public static final ANTISPAM_SETTINGS_SHARED_FOR_SIMS:Ljava/lang/String; = "antispam_settings_shared_for_sims"

.field public static final AUTO_TIMER_OF_QM_ENABLE:Ljava/lang/String; = "auto_timer_of_qm_enable"

.field public static final CALL_ACT_OF_REPEATED:Ljava/lang/String; = "call_act_of_repeated"

.field private static final CALL_ACT_OF_VIP:Ljava/lang/String; = "call_act_of_vip"

.field public static final CALL_TRANSFER_NUM_STATE:Ljava/lang/String; = "call_transfer_num_state"

.field public static final CONTACT_CALL_MODE:Ljava/lang/String; = "contact_call_mode"

.field public static final CONTACT_SMS_MODE:Ljava/lang/String; = "contact_sms_mode"

.field public static final DISABLE:I = 0x0

.field public static final EMPTY_CALL_MODE:Ljava/lang/String; = "empty_call_mode"

.field public static final ENABLE:I = 0x1

.field private static final END_TIME_OF_QM:Ljava/lang/String; = "end_time_of_qm"

.field public static final FRAUD:I = 0x1

.field public static final FRAUD_NUM_STATE:Ljava/lang/String; = "fraud_num_state"

.field public static final FRAUD_NUM_STATE_SIM_2:Ljava/lang/String; = "fraud_num_state_sim_2"

.field public static final GUIDE_TYPE_DECLINE:I = 0x1

.field public static final GUIDE_TYPE_END_CALL:I = 0x2

.field public static final GUIDE_TYPE_MANUAL_MARK:I = 0x3

.field public static final HARASS:I = 0xa

.field public static final HARASS_NUM_STATE:Ljava/lang/String; = "harass_num_state"

.field public static final HARASS_NUM_STATE_SIM_2:Ljava/lang/String; = "harass_num_state_sim_2"

.field private static final HAS_NEW_ANTISPAM:Ljava/lang/String; = "has_new_antispam"

.field public static final IS_BLACKLIST_NOTIFICATION:I = 0x0

.field public static KEY_ANTISPAM_ACTION_SOURCE:Ljava/lang/String; = null

.field public static final KEY_SIM_ID:Ljava/lang/String; = "key_sim_id"

.field public static final MARK_GUIDE_AGENT:Ljava/lang/String; = "mark_guide_agent"

.field public static final MARK_GUIDE_FRAUD:Ljava/lang/String; = "mark_guide_fraud"

.field public static final MARK_GUIDE_HARASS:Ljava/lang/String; = "mark_guide_harass"

.field public static final MARK_GUIDE_IS_SET:Ljava/lang/String; = "mark_guide_is_set"

.field public static final MARK_GUIDE_SELL:Ljava/lang/String; = "mark_guide_sell"

.field public static final MARK_GUIDE_TYPE:Ljava/lang/String; = "mark_guide_type"

.field public static final MARK_GUIDE_YELLOWPAGE_CID:Ljava/lang/String; = "mark_guide_yellowpage_cid"

.field public static final MARK_NUM_GUIDE_CLASS:Ljava/lang/String; = "com.miui.antispam.ui.activity.MarkNumGuideActivity"

.field public static final MARK_PROVIDER_ID_MIUI:I = 0x18e

.field public static final MARK_TIME_AGENT:Ljava/lang/String; = "mark_time_agent"

.field public static final MARK_TIME_AGENT_SIM_2:Ljava/lang/String; = "mark_time_agent_sim_2"

.field public static final MARK_TIME_DEFAULT:I = 0x32

.field public static final MARK_TIME_FRAUD:Ljava/lang/String; = "mark_time_fraud"

.field public static final MARK_TIME_FRAUD_SIM_2:Ljava/lang/String; = "mark_time_fraud_sim_2"

.field public static final MARK_TIME_HARASS:Ljava/lang/String; = "mark_time_harass"

.field public static final MARK_TIME_HARASS_SIM_2:Ljava/lang/String; = "mark_time_harass_sim_2"

.field public static final MARK_TIME_SELL:Ljava/lang/String; = "mark_time_sell"

.field public static final MARK_TIME_SELL_SIM_2:Ljava/lang/String; = "mark_time_sell_sim_2"

.field private static final NEXT_AUTO_END_TIME_OF_QM:Ljava/lang/String; = "next_auto_end_time_of_qm"

.field private static final NEXT_AUTO_START_TIME_OF_QM:Ljava/lang/String; = "next_auto_start_time_of_qm"

.field public static final NOTIFICATION_BLOCK_TYPE:Ljava/lang/String; = "notification_block_type"

.field public static final NOTIFICATION_INTERCEPT_NUMBER:Ljava/lang/String; = "notification_intercept_number"

.field public static final NOTIFICATION_SHOW_TYPE:Ljava/lang/String; = "notification_show_type"

.field public static final NOT_BLACKLIST_NOTIFICATION:I = 0x1

.field public static final OVERSEA_CALL_MODE:Ljava/lang/String; = "oversea_call_mode"

.field public static final QUIET_MODE_ENABLE:Ljava/lang/String; = "quiet_mode_enable"

.field private static final QUIET_REPEAT_TYPE:Ljava/lang/String; = "quiet_repeat_type"

.field public static final QUIET_WRISTBAND:Ljava/lang/String; = "quiet_wristband"

.field public static final REPEATED_MARK_NUM_PERMISSION:Ljava/lang/String; = "repeated_mark_num_permission"

.field public static final SELL:I = 0x3

.field public static final SELL_NUM_STATE:Ljava/lang/String; = "sell_num_state"

.field public static final SELL_NUM_STATE_SIM_2:Ljava/lang/String; = "sell_num_state_sim_2"

.field public static final SERVICE_SMS_MODE:Ljava/lang/String; = "service_sms_mode"

.field public static final SHOW_ALL:I = 0x0

.field public static final SHOW_NONE:I = 0x2

.field public static final SHOW_NOTIFICATION_TYPE:Ljava/lang/String; = "show_notification_type"

.field public static final SHOW_NOTIFICATION_TYPE_SIM_2:Ljava/lang/String; = "show_notification_type_sim_2"

.field public static final SHOW_NOT_BLACKLIST:I = 0x1

.field public static final SIM_ID_1:I = 0x1

.field public static final SIM_ID_2:I = 0x2

.field public static final SMS_CLASSIFIER_AUTO_UPDATE:Ljava/lang/String; = "sms_classifier_auto_update"

.field public static final SMS_CLASSIFIER_UPDATE_TIME:Ljava/lang/String; = "sms_classifier_update_time"

.field private static final START_TIME_OF_QM:Ljava/lang/String; = "start_time_of_qm"

.field public static final STRANGER_CALL_MODE:Ljava/lang/String; = "stranger_call_mode"

.field public static final STRANGER_SMS_MODE:Ljava/lang/String; = "stranger_sms_mode"

.field public static final VIP_ALL_CONTACTS:I = 0x0

.field public static final VIP_CUSTOM:I = 0x2

.field private static final VIP_LIST_FOR_QM:Ljava/lang/String; = "vip_list_for_qm"

.field public static final VIP_STAR_CONTACTS:I = 0x1

.field public static final mapIdToBlockType:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final mapIdToMarkTime:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final mapIdToState:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 3818
    const-string v0, "antispam_action_source"

    sput-object v0, Landroid/provider/MiuiSettings$AntiSpam;->KEY_ANTISPAM_ACTION_SOURCE:Ljava/lang/String;

    .line 3822
    const-string v0, "action_source_sms"

    sput-object v0, Landroid/provider/MiuiSettings$AntiSpam;->ACTION_SOURCE_SMS:Ljava/lang/String;

    .line 3826
    const-string v0, "action_source_call"

    sput-object v0, Landroid/provider/MiuiSettings$AntiSpam;->ACTION_SOURCE_CALL:Ljava/lang/String;

    .line 3830
    const-string v0, "action_source_other"

    sput-object v0, Landroid/provider/MiuiSettings$AntiSpam;->ACTION_SOURCE_OTHER:Ljava/lang/String;

    .line 3839
    new-instance v0, Landroid/provider/MiuiSettings$AntiSpam$1;

    invoke-direct {v0}, Landroid/provider/MiuiSettings$AntiSpam$1;-><init>()V

    sput-object v0, Landroid/provider/MiuiSettings$AntiSpam;->mapIdToState:Ljava/util/HashMap;

    .line 3860
    new-instance v0, Landroid/provider/MiuiSettings$AntiSpam$2;

    invoke-direct {v0}, Landroid/provider/MiuiSettings$AntiSpam$2;-><init>()V

    sput-object v0, Landroid/provider/MiuiSettings$AntiSpam;->mapIdToBlockType:Ljava/util/HashMap;

    .line 3870
    new-instance v0, Landroid/provider/MiuiSettings$AntiSpam$3;

    invoke-direct {v0}, Landroid/provider/MiuiSettings$AntiSpam$3;-><init>()V

    sput-object v0, Landroid/provider/MiuiSettings$AntiSpam;->mapIdToMarkTime:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 3557
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getEndTimeForQuietMode(Landroid/content/Context;)I
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .line 4319
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "end_time_of_qm"

    const/16 v2, 0x1a4

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static getMarkedNumberBlockType(I)I
    .locals 2
    .param p0, "cid"    # I

    .line 3922
    sget-object v0, Landroid/provider/MiuiSettings$AntiSpam;->mapIdToBlockType:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public static getMode(Landroid/content/Context;Ljava/lang/String;I)I
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "mode"    # Ljava/lang/String;
    .param p2, "def"    # I

    .line 3891
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-static {v0, p1, p2}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static getNextAutoEndTime(Landroid/content/Context;)J
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .line 4363
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string/jumbo v1, "next_auto_end_time_of_qm"

    const-wide/16 v2, 0x0

    invoke-static {v0, v1, v2, v3}, Landroid/provider/Settings$Secure;->getLong(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getNextAutoStartTime(Landroid/content/Context;)J
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .line 4347
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string/jumbo v1, "next_auto_start_time_of_qm"

    const-wide/16 v2, 0x0

    invoke-static {v0, v1, v2, v3}, Landroid/provider/Settings$Secure;->getLong(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getNotificationType(Landroid/content/Context;I)I
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "simId"    # I

    .line 4456
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 4457
    const/4 v1, 0x1

    if-ne p1, v1, :cond_0

    const-string/jumbo v1, "show_notification_type"

    goto :goto_0

    :cond_0
    const-string/jumbo v1, "show_notification_type_sim_2"

    :goto_0
    const/4 v2, 0x0

    .line 4456
    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static getQuietRepeatType(Landroid/content/Context;)I
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .line 4385
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string/jumbo v1, "quiet_repeat_type"

    const/16 v2, 0x7f

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static getSMSClassifierUpdateTime(Landroid/content/Context;)J
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .line 4028
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string/jumbo v1, "sms_classifier_update_time"

    const-wide/16 v2, 0x0

    invoke-static {v0, v1, v2, v3}, Landroid/provider/Settings$Secure;->getLong(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getStartTimeForQuietMode(Landroid/content/Context;)I
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .line 4298
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string/jumbo v1, "start_time_of_qm"

    const/16 v2, 0x564

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static getState(Landroid/content/Context;Ljava/lang/String;Z)Z
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "mode"    # Ljava/lang/String;
    .param p2, "def"    # Z

    .line 3906
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-static {v0, p1, p2}, Lmiui/provider/ExtraSettings$Secure;->getBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static getVipListForQuietMode(Landroid/content/Context;)I
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .line 4233
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string/jumbo v1, "vip_list_for_qm"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static hasNewAntispam(Landroid/content/Context;)Z
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .line 4471
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "has_new_antispam"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lmiui/provider/ExtraSettings$Secure;->getBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isAntiSpam(Landroid/content/Context;)Z
    .locals 6
    .param p0, "context"    # Landroid/content/Context;

    .line 4056
    invoke-static {p0}, Landroid/provider/MiuiSettings$AntiSpam;->isAntiSpamSettingsSharedForSims(Landroid/content/Context;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 4057
    invoke-static {p0, v1}, Landroid/provider/MiuiSettings$AntiSpam;->isAntiSpamEnableForSim(Landroid/content/Context;I)Z

    move-result v0

    return v0

    .line 4059
    :cond_0
    invoke-static {}, Lmiui/telephony/SubscriptionManager;->getDefault()Lmiui/telephony/SubscriptionManager;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lmiui/telephony/SubscriptionManager;->getSubscriptionInfoForSlot(I)Lmiui/telephony/SubscriptionInfo;

    move-result-object v0

    if-eqz v0, :cond_1

    move v0, v1

    goto :goto_0

    :cond_1
    move v0, v2

    .line 4060
    .local v0, "isSim1Active":Z
    :goto_0
    invoke-static {}, Lmiui/telephony/SubscriptionManager;->getDefault()Lmiui/telephony/SubscriptionManager;

    move-result-object v3

    invoke-virtual {v3, v1}, Lmiui/telephony/SubscriptionManager;->getSubscriptionInfoForSlot(I)Lmiui/telephony/SubscriptionInfo;

    move-result-object v3

    if-eqz v3, :cond_2

    move v3, v1

    goto :goto_1

    :cond_2
    move v3, v2

    .line 4061
    .local v3, "isSim2Active":Z
    :goto_1
    const/4 v4, 0x2

    if-nez v0, :cond_6

    if-eqz v3, :cond_3

    goto :goto_3

    .line 4065
    :cond_3
    invoke-static {p0, v1}, Landroid/provider/MiuiSettings$AntiSpam;->isAntiSpamEnableForSim(Landroid/content/Context;I)Z

    move-result v5

    if-nez v5, :cond_5

    invoke-static {p0, v4}, Landroid/provider/MiuiSettings$AntiSpam;->isAntiSpamEnableForSim(Landroid/content/Context;I)Z

    move-result v4

    if-eqz v4, :cond_4

    goto :goto_2

    :cond_4
    move v1, v2

    nop

    :cond_5
    :goto_2
    return v1

    .line 4062
    :cond_6
    :goto_3
    invoke-static {p0, v1}, Landroid/provider/MiuiSettings$AntiSpam;->isAntiSpamEnableForSim(Landroid/content/Context;I)Z

    move-result v5

    if-eqz v5, :cond_7

    if-nez v0, :cond_8

    .line 4063
    :cond_7
    invoke-static {p0, v4}, Landroid/provider/MiuiSettings$AntiSpam;->isAntiSpamEnableForSim(Landroid/content/Context;I)Z

    move-result v4

    if-eqz v4, :cond_9

    if-eqz v3, :cond_9

    :cond_8
    goto :goto_4

    .line 4062
    :cond_9
    move v1, v2

    :goto_4
    return v1
.end method

.method public static isAntiSpamEnableForSim(Landroid/content/Context;I)Z
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "simId"    # I

    .line 4078
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 4079
    const/4 v1, 0x1

    if-ne p1, v1, :cond_0

    const-string v2, "antispam_enable_for_sim_1"

    goto :goto_0

    :cond_0
    const-string v2, "antispam_enable_for_sim_2"

    .line 4078
    :goto_0
    invoke-static {v0, v2, v1}, Lmiui/provider/ExtraSettings$Secure;->getBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isAntiSpamSettingsSharedForSims(Landroid/content/Context;)Z
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .line 4102
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "antispam_settings_shared_for_sims"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Lmiui/provider/ExtraSettings$Secure;->getBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isAutoTimerOfQuietModeEnable(Landroid/content/Context;)Z
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .line 4258
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "auto_timer_of_qm_enable"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    move v1, v2

    :goto_0
    return v1
.end method

.method public static isMarkNumBlockOpen(Landroid/content/Context;I)Z
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "simId"    # I

    .line 3989
    const/4 v0, 0x0

    const/4 v1, 0x1

    if-ne p1, v1, :cond_2

    .line 3990
    const-string v2, "fraud_num_state"

    invoke-static {p0, v2, v1}, Landroid/provider/MiuiSettings$AntiSpam;->getMode(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v2

    if-eqz v2, :cond_1

    const-string v2, "agent_num_state"

    .line 3991
    invoke-static {p0, v2, v1}, Landroid/provider/MiuiSettings$AntiSpam;->getMode(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v2

    if-eqz v2, :cond_1

    const-string/jumbo v2, "sell_num_state"

    .line 3992
    invoke-static {p0, v2, v1}, Landroid/provider/MiuiSettings$AntiSpam;->getMode(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v2

    if-eqz v2, :cond_1

    const-string v2, "harass_num_state"

    .line 3993
    invoke-static {p0, v2, v1}, Landroid/provider/MiuiSettings$AntiSpam;->getMode(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v2

    if-nez v2, :cond_0

    goto :goto_0

    :cond_0
    goto :goto_1

    .line 3990
    :cond_1
    :goto_0
    move v0, v1

    :goto_1
    return v0

    .line 3994
    :cond_2
    const/4 v2, 0x2

    if-ne p1, v2, :cond_5

    .line 3995
    const-string v2, "fraud_num_state_sim_2"

    invoke-static {p0, v2, v1}, Landroid/provider/MiuiSettings$AntiSpam;->getMode(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v2

    if-eqz v2, :cond_4

    const-string v2, "agent_num_state_sim_2"

    .line 3996
    invoke-static {p0, v2, v1}, Landroid/provider/MiuiSettings$AntiSpam;->getMode(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v2

    if-eqz v2, :cond_4

    const-string/jumbo v2, "sell_num_state_sim_2"

    .line 3997
    invoke-static {p0, v2, v1}, Landroid/provider/MiuiSettings$AntiSpam;->getMode(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v2

    if-eqz v2, :cond_4

    const-string v2, "harass_num_state_sim_2"

    .line 3998
    invoke-static {p0, v2, v1}, Landroid/provider/MiuiSettings$AntiSpam;->getMode(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v2

    if-nez v2, :cond_3

    goto :goto_2

    :cond_3
    goto :goto_3

    .line 3995
    :cond_4
    :goto_2
    move v0, v1

    :goto_3
    return v0

    .line 4000
    :cond_5
    return v0
.end method

.method private static isMarkNumBlockSet(Landroid/content/Context;)Z
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .line 3950
    const-string/jumbo v0, "mark_guide_is_set"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/provider/MiuiSettings$AntiSpam;->getState(Landroid/content/Context;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isMarkingTypeGuided(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "markingType"    # Ljava/lang/String;

    .line 3969
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/provider/MiuiSettings$AntiSpam;->getState(Landroid/content/Context;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isQuietModeEnable(Landroid/content/Context;)Z
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .line 4137
    const/4 v0, -0x3

    invoke-static {p0, v0}, Landroid/app/ExtraNotificationManager;->isQuietModeEnable(Landroid/content/Context;I)Z

    move-result v0

    return v0
.end method

.method public static isQuietModeEnable(Landroid/content/Context;I)Z
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "userId"    # I

    .line 4146
    invoke-static {p0, p1}, Landroid/app/ExtraNotificationManager;->isQuietModeEnable(Landroid/content/Context;I)Z

    move-result v0

    return v0
.end method

.method public static isQuietModeEnableForCurrentUser(Landroid/content/Context;)Z
    .locals 7
    .param p0, "context"    # Landroid/content/Context;

    .line 4173
    const/4 v0, 0x0

    .line 4175
    .local v0, "cursor":Landroid/database/Cursor;
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "content://antispamCommon/zenmode"

    .line 4176
    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    const-string v3, "1"

    invoke-static {v2, v3}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    .line 4175
    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v0, v1

    .line 4178
    if-eqz v0, :cond_1

    .line 4179
    const/4 v1, 0x1

    .line 4184
    if-eqz v0, :cond_0

    .line 4185
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 4179
    :cond_0
    return v1

    .line 4184
    :cond_1
    if-eqz v0, :cond_2

    .line 4185
    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    goto :goto_1

    .line 4184
    :catchall_0
    move-exception v1

    goto :goto_2

    .line 4181
    :catch_0
    move-exception v1

    .line 4182
    .local v1, "e":Ljava/lang/Exception;
    :try_start_1
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 4184
    .end local v1    # "e":Ljava/lang/Exception;
    if-eqz v0, :cond_2

    goto :goto_0

    .line 4188
    :cond_2
    :goto_1
    const/4 v1, 0x0

    return v1

    .line 4184
    :goto_2
    if-eqz v0, :cond_3

    .line 4185
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :cond_3
    throw v1
.end method

.method public static isQuietWristband(Landroid/content/Context;)Z
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .line 4195
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string/jumbo v1, "quiet_wristband"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    move v1, v2

    :goto_0
    return v1
.end method

.method public static isRepeatedCallActionEnable(Landroid/content/Context;)Z
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .line 4419
    invoke-static {p0}, Landroid/app/ExtraNotificationManager;->isRepeatedCallEnable(Landroid/content/Context;)Z

    move-result v0

    return v0
.end method

.method public static isSMSClassifierAutoUpdate(Landroid/content/Context;)Z
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .line 4037
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string/jumbo v1, "sms_classifier_auto_update"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Lmiui/provider/ExtraSettings$Secure;->getBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isVipCallActionEnable(Landroid/content/Context;)Z
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .line 4399
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "call_act_of_vip"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    move v1, v2

    :goto_0
    return v1
.end method

.method public static mapIdToString(I)Ljava/lang/String;
    .locals 1
    .param p0, "id"    # I

    .line 3932
    const/16 v0, 0xa

    if-eq p0, v0, :cond_0

    packed-switch p0, :pswitch_data_0

    .line 3942
    const-string v0, ""

    return-object v0

    .line 3938
    :pswitch_0
    const-string/jumbo v0, "mark_guide_sell"

    return-object v0

    .line 3936
    :pswitch_1
    const-string/jumbo v0, "mark_guide_agent"

    return-object v0

    .line 3934
    :pswitch_2
    const-string/jumbo v0, "mark_guide_fraud"

    return-object v0

    .line 3940
    :cond_0
    const-string/jumbo v0, "mark_guide_harass"

    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static resetMarkedNumberBlockSettings(Landroid/content/Context;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .line 4122
    const-string v0, "fraud_num_state"

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/provider/MiuiSettings$AntiSpam;->setMode(Landroid/content/Context;Ljava/lang/String;I)V

    .line 4123
    const-string v0, "agent_num_state"

    invoke-static {p0, v0, v1}, Landroid/provider/MiuiSettings$AntiSpam;->setMode(Landroid/content/Context;Ljava/lang/String;I)V

    .line 4124
    const-string/jumbo v0, "sell_num_state"

    invoke-static {p0, v0, v1}, Landroid/provider/MiuiSettings$AntiSpam;->setMode(Landroid/content/Context;Ljava/lang/String;I)V

    .line 4125
    const-string v0, "harass_num_state"

    invoke-static {p0, v0, v1}, Landroid/provider/MiuiSettings$AntiSpam;->setMode(Landroid/content/Context;Ljava/lang/String;I)V

    .line 4127
    const-string v0, "fraud_num_state_sim_2"

    invoke-static {p0, v0, v1}, Landroid/provider/MiuiSettings$AntiSpam;->setMode(Landroid/content/Context;Ljava/lang/String;I)V

    .line 4128
    const-string v0, "agent_num_state_sim_2"

    invoke-static {p0, v0, v1}, Landroid/provider/MiuiSettings$AntiSpam;->setMode(Landroid/content/Context;Ljava/lang/String;I)V

    .line 4129
    const-string/jumbo v0, "sell_num_state_sim_2"

    invoke-static {p0, v0, v1}, Landroid/provider/MiuiSettings$AntiSpam;->setMode(Landroid/content/Context;Ljava/lang/String;I)V

    .line 4130
    const-string v0, "harass_num_state_sim_2"

    invoke-static {p0, v0, v1}, Landroid/provider/MiuiSettings$AntiSpam;->setMode(Landroid/content/Context;Ljava/lang/String;I)V

    .line 4131
    return-void
.end method

.method public static setAntiSpamEnableForSim(Landroid/content/Context;IZ)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "simId"    # I
    .param p2, "enable"    # Z

    .line 4091
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 4092
    const/4 v1, 0x1

    if-ne p1, v1, :cond_0

    const-string v1, "antispam_enable_for_sim_1"

    goto :goto_0

    :cond_0
    const-string v1, "antispam_enable_for_sim_2"

    .line 4091
    :goto_0
    invoke-static {v0, v1, p2}, Lmiui/provider/ExtraSettings$Secure;->putBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    .line 4093
    return-void
.end method

.method public static setAntiSpamSettingsSharedForSims(Landroid/content/Context;Z)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "value"    # Z

    .line 4113
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "antispam_settings_shared_for_sims"

    invoke-static {v0, v1, p1}, Lmiui/provider/ExtraSettings$Secure;->putBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    .line 4115
    return-void
.end method

.method public static setAutoTimerOfQuietMode(Landroid/content/Context;Z)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "enable"    # Z

    .line 4267
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "auto_timer_of_qm_enable"

    .line 4268
    nop

    .line 4267
    invoke-static {v0, v1, p1}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 4269
    return-void
.end method

.method public static setEndTimeForQuietMode(Landroid/content/Context;I)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "minute"    # I

    .line 4330
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "end_time_of_qm"

    invoke-static {v0, v1, p1}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 4332
    return-void
.end method

.method public static setHasNewAntispam(Landroid/content/Context;Z)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "value"    # Z

    .line 4479
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "has_new_antispam"

    invoke-static {v0, v1, p1}, Lmiui/provider/ExtraSettings$Secure;->putBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    .line 4481
    return-void
.end method

.method public static setMarkNumBlockSet(Landroid/content/Context;Z)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "value"    # Z

    .line 3957
    const-string/jumbo v0, "mark_guide_is_set"

    invoke-static {p0, v0, p1}, Landroid/provider/MiuiSettings$AntiSpam;->setState(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 3958
    return-void
.end method

.method public static setMarkingTypeGuided(Landroid/content/Context;Ljava/lang/String;Z)V
    .locals 0
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "markingType"    # Ljava/lang/String;
    .param p2, "value"    # Z

    .line 3981
    invoke-static {p0, p1, p2}, Landroid/provider/MiuiSettings$AntiSpam;->setState(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 3982
    return-void
.end method

.method public static setMode(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "MODE"    # Ljava/lang/String;
    .param p2, "value"    # I

    .line 3899
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-static {v0, p1, p2}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 3900
    return-void
.end method

.method public static setNextAutoEndTime(Landroid/content/Context;J)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "time"    # J

    .line 4355
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string/jumbo v1, "next_auto_end_time_of_qm"

    invoke-static {v0, v1, p1, p2}, Landroid/provider/Settings$Secure;->putLong(Landroid/content/ContentResolver;Ljava/lang/String;J)Z

    .line 4357
    return-void
.end method

.method public static setNextAutoStartTime(Landroid/content/Context;J)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "time"    # J

    .line 4339
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string/jumbo v1, "next_auto_start_time_of_qm"

    invoke-static {v0, v1, p1, p2}, Landroid/provider/Settings$Secure;->putLong(Landroid/content/ContentResolver;Ljava/lang/String;J)Z

    .line 4341
    return-void
.end method

.method public static setNotificationType(Landroid/content/Context;II)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "type"    # I
    .param p2, "simId"    # I

    .line 4447
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 4448
    const/4 v1, 0x1

    if-ne p2, v1, :cond_0

    const-string/jumbo v1, "show_notification_type"

    goto :goto_0

    :cond_0
    const-string/jumbo v1, "show_notification_type_sim_2"

    .line 4447
    :goto_0
    invoke-static {v0, v1, p1}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 4450
    return-void
.end method

.method public static setQuietMode(Landroid/content/Context;Z)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "enable"    # Z

    .line 4154
    const/4 v0, -0x3

    invoke-static {p0, p1, v0}, Landroid/app/ExtraNotificationManager;->setQuietMode(Landroid/content/Context;ZI)V

    .line 4156
    return-void
.end method

.method public static setQuietMode(Landroid/content/Context;ZI)V
    .locals 0
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "enable"    # Z
    .param p2, "userId"    # I

    .line 4163
    invoke-static {p0, p1, p2}, Landroid/app/ExtraNotificationManager;->setQuietMode(Landroid/content/Context;ZI)V

    .line 4164
    return-void
.end method

.method public static setQuietRepeatType(Landroid/content/Context;I)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "type"    # I

    .line 4374
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string/jumbo v1, "quiet_repeat_type"

    invoke-static {v0, v1, p1}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 4376
    return-void
.end method

.method public static setQuietWristband(Landroid/content/Context;Z)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "enable"    # Z

    .line 4203
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string/jumbo v1, "quiet_wristband"

    .line 4204
    nop

    .line 4203
    invoke-static {v0, v1, p1}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 4205
    return-void
.end method

.method public static setRepeatedCallActionEnable(Landroid/content/Context;Z)V
    .locals 0
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "enable"    # Z

    .line 4429
    invoke-static {p0, p1}, Landroid/app/ExtraNotificationManager;->setRepeatedCallEnable(Landroid/content/Context;Z)V

    .line 4430
    return-void
.end method

.method public static setSMSClassifierAutoUpdate(Landroid/content/Context;Z)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "autoUpdate"    # Z

    .line 4045
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string/jumbo v1, "sms_classifier_auto_update"

    invoke-static {v0, v1, p1}, Lmiui/provider/ExtraSettings$Secure;->putBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    .line 4047
    return-void
.end method

.method public static setSMSClassifierUpdateTime(Landroid/content/Context;J)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "time"    # J

    .line 4020
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string/jumbo v1, "sms_classifier_update_time"

    invoke-static {v0, v1, p1, p2}, Landroid/provider/Settings$Secure;->putLong(Landroid/content/ContentResolver;Ljava/lang/String;J)Z

    .line 4022
    return-void
.end method

.method public static setStartTimeForQuietMode(Landroid/content/Context;I)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "minute"    # I

    .line 4309
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string/jumbo v1, "start_time_of_qm"

    invoke-static {v0, v1, p1}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 4311
    return-void
.end method

.method public static setState(Landroid/content/Context;Ljava/lang/String;Z)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "mode"    # Ljava/lang/String;
    .param p2, "value"    # Z

    .line 3914
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-static {v0, p1, p2}, Lmiui/provider/ExtraSettings$Secure;->putBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    .line 3915
    return-void
.end method

.method public static setVipCallActionEnable(Landroid/content/Context;Z)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "enable"    # Z

    .line 4410
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "call_act_of_vip"

    .line 4411
    nop

    .line 4410
    invoke-static {v0, v1, p1}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 4412
    return-void
.end method

.method public static setVipListForQuietMode(Landroid/content/Context;I)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "action"    # I

    .line 4245
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string/jumbo v1, "vip_list_for_qm"

    invoke-static {v0, v1, p1}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 4246
    return-void
.end method

.method public static shouldShowGuidingDialog(Landroid/content/Context;I)Z
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "id"    # I

    .line 4008
    sget-object v0, Landroid/provider/MiuiSettings$AntiSpam;->mapIdToState:Ljava/util/HashMap;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 4009
    invoke-static {p0, v1}, Landroid/provider/MiuiSettings$AntiSpam;->isMarkNumBlockOpen(Landroid/content/Context;I)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x2

    .line 4010
    invoke-static {p0, v0}, Landroid/provider/MiuiSettings$AntiSpam;->isMarkNumBlockOpen(Landroid/content/Context;I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 4011
    invoke-static {p0}, Landroid/provider/MiuiSettings$AntiSpam;->isMarkNumBlockSet(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 4012
    invoke-static {p1}, Landroid/provider/MiuiSettings$AntiSpam;->mapIdToString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Landroid/provider/MiuiSettings$AntiSpam;->isMarkingTypeGuided(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 4008
    :goto_0
    return v1
.end method
