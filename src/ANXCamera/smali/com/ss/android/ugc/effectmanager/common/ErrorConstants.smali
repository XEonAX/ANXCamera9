.class public Lcom/ss/android/ugc/effectmanager/common/ErrorConstants;
.super Ljava/lang/Object;
.source "ErrorConstants.java"


# static fields
.field public static final CODE_CANCEL_DOWNLOAD:I = 0x2711

.field public static final CODE_DOWNLOAD_ERROR:I = 0x2712

.field public static final CODE_EFFECT_NULL:I = 0x2713

.field public static final CODE_INVALID_EFFECT_CACHE:I = 0x2714

.field public static final CODE_INVALID_EFFECT_ID:I = 0x271e

.field public static final CODE_IO_FAIL:I = 0x271c

.field public static final CODE_JSON_CONVERT_ERROR:I = 0x2718

.field public static final CODE_MD5_ERROR:I = 0x271a

.field public static final CODE_NO_DOWNLOADED_EFFECTS:I = 0x2716

.field public static final CODE_NO_LOCAL_TAG:I = 0x2719

.field public static final CODE_NO_NETWORK:I = 0x271b

.field public static final CODE_PANEL_NULL:I = 0x2717

.field public static final CODE_SDK_ERROR:I = 0x2715

.field public static final CODE_UNKNOW:I = 0x1

.field public static final CODE_UNZIP_FAIL:I = 0x271d

.field public static final CODE_URL_NOT_EXIST:I = 0x271f

.field public static final EFFECT_NOT_FOUND:I = 0x7d4

.field public static final EFFECT_NOT_IN_WHITE_LIST:I = 0x7d5

.field public static final EFFECT_NOT_SUPPORT:I = 0x7d3

.field public static final EFFECT_UNAVAILABLE:I = 0x7d2

.field public static final EXCEPTION_CANCEL_DOWNLOAD:Ljava/lang/String; = "Cancel download"

.field public static final EXCEPTION_DOWNLOAD_ERROR:Ljava/lang/String; = "Download error"

.field public static final EXCEPTION_DOWNLOAD_URL_ERROR:Ljava/lang/String; = "File url is empty"

.field public static final EXCEPTION_EFFECT_NULL:Ljava/lang/String; = "Sticker is null"

.field public static final EXCEPTION_INVALID_EFFECT_CACHE:Ljava/lang/String; = "Invalid effect list cache !!!"

.field public static final EXCEPTION_JSON_CONVERT:Ljava/lang/String; = "Json convert failse"

.field public static final EXCEPTION_MD5_ERROR:Ljava/lang/String; = "MD5 error"

.field public static final EXCEPTION_NO_DOWNLOADED_EFFECTS:Ljava/lang/String; = "No Downloaded Effects"

.field public static final EXCEPTION_NO_NETWORK:Ljava/lang/String; = "network unavailable"

.field public static final EXCEPTION_PANEL_NULL:Ljava/lang/String; = "panel is null"

.field public static final EXCEPTION_SDK_ERROR:Ljava/lang/String; = "SDK error"

.field public static final LOG_CACHE_DIR_NOT_SET:Ljava/lang/String; = "Cache directory error"

.field public static final LOG_CONFIGURATION_NOT_SET:Ljava/lang/String; = "Not set configuration"

.field public static final LOG_CONTEXT_NOT_SET:Ljava/lang/String; = "Not set net context"

.field public static final LOG_HOST_NOT_SET:Ljava/lang/String; = "Not set host !!!"

.field public static final LOG_JSON_CONCERT_NOT_SET:Ljava/lang/String; = "Not set json convert"

.field public static final LOG_NET_WORKER_NOT_SET:Ljava/lang/String; = "Not set net worker"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static APIErrorHandle(I)Ljava/lang/String;
    .locals 1

    .line 60
    nop

    .line 61
    const/4 v0, 0x1

    if-eq p0, v0, :cond_1

    const/16 v0, 0x271e

    if-eq p0, v0, :cond_0

    packed-switch p0, :pswitch_data_0

    packed-switch p0, :pswitch_data_1

    packed-switch p0, :pswitch_data_2

    packed-switch p0, :pswitch_data_3

    packed-switch p0, :pswitch_data_4

    .line 152
    const-string p0, "\u672a\u77e5\u9519\u8bef"

    goto/16 :goto_0

    .line 146
    :pswitch_0
    const-string p0, "io \u9519\u8bef"

    .line 147
    goto/16 :goto_0

    .line 149
    :pswitch_1
    const-string p0, "\u65e0\u7f51\u7edc"

    .line 150
    goto/16 :goto_0

    .line 115
    :pswitch_2
    const-string p0, "MD5 error"

    .line 116
    goto/16 :goto_0

    .line 140
    :pswitch_3
    const-string p0, "\u6ca1\u6709\u672c\u5730 TAG \u7f13\u5b58"

    .line 141
    goto :goto_0

    .line 137
    :pswitch_4
    const-string p0, "panel is null"

    .line 138
    goto :goto_0

    .line 134
    :pswitch_5
    const-string p0, "No Downloaded Effects"

    .line 135
    goto :goto_0

    .line 131
    :pswitch_6
    const-string p0, "SDK error"

    .line 132
    goto :goto_0

    .line 128
    :pswitch_7
    const-string p0, "Invalid effect list cache !!!"

    .line 129
    goto :goto_0

    .line 125
    :pswitch_8
    const-string p0, "Sticker is null"

    .line 126
    goto :goto_0

    .line 122
    :pswitch_9
    const-string p0, "Download error"

    .line 123
    goto :goto_0

    .line 119
    :pswitch_a
    const-string p0, "Cancel download"

    .line 120
    goto :goto_0

    .line 111
    :pswitch_b
    const-string p0, "\u4e0d\u5728\u767d\u540d\u5355"

    .line 112
    goto :goto_0

    .line 108
    :pswitch_c
    const-string p0, "\u5f53\u524d\u7279\u6548id\u4e0d\u5b58\u5728"

    .line 109
    goto :goto_0

    .line 105
    :pswitch_d
    const-string p0, "\u4e0d\u652f\u6301\u5f53\u524d\u8bbe\u5907"

    .line 106
    goto :goto_0

    .line 102
    :pswitch_e
    const-string p0, "Effect\u5df2\u4e0b\u7ebf"

    .line 103
    goto :goto_0

    .line 99
    :pswitch_f
    const-string p0, "\u5185\u5bb9\u6ca1\u6709\u53d1\u751f\u53d8\u5316"

    .line 100
    goto :goto_0

    .line 96
    :pswitch_10
    const-string p0, "access_key\u4e0d\u5b58\u5728"

    .line 97
    goto :goto_0

    .line 93
    :pswitch_11
    const-string p0, "\u5f53\u524d\u5e94\u7528\u4e0d\u662f\u6d4b\u8bd5\u5e94\u7528"

    .line 94
    goto :goto_0

    .line 90
    :pswitch_12
    const-string p0, "app_channel\u4e0d\u5408\u6cd5"

    .line 91
    goto :goto_0

    .line 87
    :pswitch_13
    const-string p0, "channel\u4e0d\u5408\u6cd5"

    .line 88
    goto :goto_0

    .line 84
    :pswitch_14
    const-string p0, "device_type\u4e0d\u5408\u6cd5"

    .line 85
    goto :goto_0

    .line 81
    :pswitch_15
    const-string p0, "device_platform\u4e0d\u5408\u6cd5"

    .line 82
    goto :goto_0

    .line 78
    :pswitch_16
    const-string p0, "device_id\u4e0d\u5408\u6cd5"

    .line 79
    goto :goto_0

    .line 75
    :pswitch_17
    const-string p0, "sdk_version\u4e0d\u5408\u6cd5"

    .line 76
    goto :goto_0

    .line 72
    :pswitch_18
    const-string p0, "app_version\u4e0d\u5408\u6cd5"

    .line 73
    goto :goto_0

    .line 69
    :pswitch_19
    const-string p0, "access_key\u4e0d\u5408\u6cd5"

    .line 70
    goto :goto_0

    .line 66
    :pswitch_1a
    const-string p0, "\u53c2\u6570\u4e0d\u5408\u6cd5\uff08\u53c2\u6570\u7f3a\u5931\u6216\u8005\u9519\u8bef\uff09"

    .line 67
    goto :goto_0

    .line 143
    :cond_0
    const-string p0, "\u65e0\u6548\u7684effect id"

    .line 144
    goto :goto_0

    .line 63
    :cond_1
    const-string p0, "\u672a\u77e5\u9519\u8bef"

    .line 64
    nop

    .line 155
    :goto_0
    return-object p0

    :pswitch_data_0
    .packed-switch 0x3e8
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x44c
        :pswitch_11
        :pswitch_10
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x7d1
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0x2711
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
    .end packed-switch

    :pswitch_data_4
    .packed-switch 0x2719
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
