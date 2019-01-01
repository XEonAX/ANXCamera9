.class public Landroid/provider/SystemSettings$System;
.super Ljava/lang/Object;
.source "SystemSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/provider/SystemSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "System"
.end annotation


# static fields
.field private static final E10_DEVICE:Ljava/lang/String; = "beryllium"

.field private static final INDIA:Ljava/lang/String; = "INDIA"

.field public static final LOCK_WALLPAPER_PROVIDER_AUTHORITY:Ljava/lang/String; = "lock_wallpaper_provider_authority"

.field public static final PERSIST_SYS_DEVICE_NAME:Ljava/lang/String; = "persist.sys.device_name"

.field public static final STATUS_BAR_WINDOW_LOADED:Ljava/lang/String; = "status_bar_window_loaded"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z
    .locals 1
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "defValue"    # Z

    .line 97
    invoke-static {p0, p1, p2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private static getByteCount(B)I
    .locals 4
    .param p0, "b"    # B

    .line 160
    const/4 v0, 0x0

    .line 161
    .local v0, "count":I
    const/4 v1, 0x7

    .local v1, "i":I
    :goto_0
    const/4 v2, 0x4

    if-lt v1, v2, :cond_1

    .line 162
    shr-int v2, p0, v1

    int-to-byte v2, v2

    .line 163
    .local v2, "shifted":B
    and-int/lit8 v3, v2, 0x1

    if-nez v3, :cond_0

    .line 164
    goto :goto_1

    .line 166
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 161
    .end local v2    # "shifted":B
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 168
    .end local v1    # "i":I
    :cond_1
    :goto_1
    return v0
.end method

.method public static getDeviceName(Landroid/content/Context;)Ljava/lang/String;
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .line 44
    const-string v0, ""

    .line 45
    .local v0, "defaultName":Ljava/lang/String;
    const/4 v1, -0x1

    .line 46
    .local v1, "deviceNameRes":I
    const-string v2, "is_hongmi"

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 47
    sget v1, Lcom/miui/system/internal/R$string;->device_hongmi:I

    goto :goto_1

    .line 48
    :cond_0
    const-string v2, "is_xiaomi"

    invoke-static {v2, v3}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 49
    const-string v2, "beryllium"

    const-string v3, "ro.product.device"

    invoke-static {v3}, Lmiui/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 50
    const-string v2, "ro.boot.hwc"

    const-string v3, ""

    invoke-static {v2, v3}, Lmiui/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 51
    .local v2, "hwc":Ljava/lang/String;
    const-string v3, "INDIA"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 52
    sget v1, Lcom/miui/system/internal/R$string;->device_poco_india:I

    goto :goto_0

    .line 54
    :cond_1
    sget v1, Lcom/miui/system/internal/R$string;->device_poco_global:I

    .line 56
    .end local v2    # "hwc":Ljava/lang/String;
    :goto_0
    goto :goto_1

    .line 57
    :cond_2
    sget v1, Lcom/miui/system/internal/R$string;->device_xiaomi:I

    goto :goto_1

    .line 59
    :cond_3
    const-string v2, "is_pad"

    invoke-static {v2, v3}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 60
    sget v1, Lcom/miui/system/internal/R$string;->device_pad:I

    goto :goto_1

    .line 62
    :cond_4
    sget v1, Lcom/miui/system/internal/R$string;->miui_device_name:I

    .line 64
    :goto_1
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 65
    const-string v2, "persist.sys.device_name"

    invoke-static {v2, v0}, Lmiui/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private static getNameInMaxLength(Ljava/lang/String;)Ljava/lang/String;
    .locals 11
    .param p0, "newHostName"    # Ljava/lang/String;

    .line 101
    const/16 v0, 0x14

    move v1, v0

    .line 103
    .local v1, "MAX_HOSTNAME_LENGTH":I
    const/4 v2, 0x0

    :try_start_0
    const-string v3, "UTF-8"

    invoke-virtual {p0, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    .line 104
    .local v3, "bytes":[B
    invoke-static {v3}, Landroid/provider/SystemSettings$System;->isValidUtf8Str([B)Z

    move-result v4

    if-nez v4, :cond_0

    .line 105
    const-string v0, "SystemSettings"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "invalid string, encoding error, "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 106
    return-object v2

    .line 108
    :cond_0
    array-length v4, v3

    .line 109
    .local v4, "length":I
    :goto_0
    if-le v4, v0, :cond_3

    .line 110
    add-int/lit8 v5, v4, -0x1

    .line 111
    .local v5, "curIndex":I
    aget-byte v6, v3, v5

    .line 112
    .local v6, "b":B
    invoke-static {v6}, Landroid/provider/SystemSettings$System;->getByteCount(B)I

    move-result v7

    .line 113
    .local v7, "count":I
    if-nez v7, :cond_1

    .line 114
    add-int/lit8 v4, v4, -0x1

    goto :goto_2

    .line 116
    :cond_1
    const/4 v8, 0x1

    move v9, v7

    move v7, v8

    .line 117
    .local v7, "offset":I
    .local v9, "count":I
    :goto_1
    if-ne v9, v8, :cond_2

    .line 118
    sub-int v10, v5, v7

    aget-byte v10, v3, v10

    invoke-static {v10}, Landroid/provider/SystemSettings$System;->getByteCount(B)I

    move-result v10

    move v9, v10

    .line 119
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 121
    :cond_2
    sub-int/2addr v4, v7

    .line 123
    .end local v5    # "curIndex":I
    .end local v6    # "b":B
    .end local v7    # "offset":I
    .end local v9    # "count":I
    :goto_2
    goto :goto_0

    .line 124
    :cond_3
    array-length v0, v3

    if-ge v4, v0, :cond_4

    .line 125
    new-array v0, v4, [B

    .line 126
    .local v0, "newBytes":[B
    const/4 v5, 0x0

    invoke-static {v3, v5, v0, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 127
    new-instance v5, Ljava/lang/String;

    const-string v6, "UTF-8"

    invoke-direct {v5, v0, v6}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v5

    .line 129
    .end local v0    # "newBytes":[B
    :cond_4
    return-object p0

    .line 130
    .end local v3    # "bytes":[B
    .end local v4    # "length":I
    :catch_0
    move-exception v0

    .line 131
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    const-string v3, "SystemSettings"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "failed to get bytes of UTF-8 from "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 132
    return-object v2
.end method

.method private static isValidUtf8Str([B)Z
    .locals 6
    .param p0, "bytes"    # [B

    .line 137
    const/4 v0, 0x0

    .local v0, "byteCount":I
    const/4 v1, 0x0

    .line 138
    .local v1, "count":I
    const/4 v2, 0x0

    move v3, v0

    move v0, v2

    .local v0, "i":I
    .local v3, "byteCount":I
    :goto_0
    const/4 v4, 0x1

    array-length v5, p0

    if-ge v0, v5, :cond_7

    .line 139
    aget-byte v5, p0, v0

    invoke-static {v5}, Landroid/provider/SystemSettings$System;->getByteCount(B)I

    move-result v5

    .line 140
    .local v5, "prefixCount":I
    if-le v5, v4, :cond_2

    .line 141
    if-eqz v3, :cond_1

    if-ne v1, v3, :cond_0

    goto :goto_1

    .line 145
    :cond_0
    return v2

    .line 142
    :cond_1
    :goto_1
    move v3, v5

    .line 143
    const/4 v1, 0x1

    goto :goto_3

    .line 147
    :cond_2
    if-ne v5, v4, :cond_5

    .line 148
    if-eqz v3, :cond_4

    if-ne v1, v3, :cond_3

    goto :goto_2

    .line 151
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 149
    :cond_4
    :goto_2
    return v2

    .line 152
    :cond_5
    if-ge v1, v3, :cond_6

    .line 153
    return v2

    .line 138
    .end local v5    # "prefixCount":I
    :cond_6
    :goto_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 156
    .end local v0    # "i":I
    :cond_7
    if-ne v1, v3, :cond_8

    move v2, v4

    nop

    :cond_8
    return v2
.end method

.method public static setDeviceName(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "deviceName"    # Ljava/lang/String;

    .line 69
    const-string v0, "persist.sys.device_name"

    invoke-static {v0, p1}, Lmiui/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    invoke-static {p0}, Landroid/provider/SystemSettings$System;->setNetHostName(Landroid/content/Context;)V

    .line 71
    return-void
.end method

.method public static setNetHostName(Landroid/content/Context;)V
    .locals 7
    .param p0, "context"    # Landroid/content/Context;

    .line 77
    const-string v0, "net.hostname"

    .line 78
    .local v0, "NET_HOSTNAME_PROPERTY":Ljava/lang/String;
    const-string v1, "net.hostname"

    invoke-static {v1}, Lmiui/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 80
    .local v1, "netHostName":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 81
    .local v2, "nameBuilder":Ljava/lang/StringBuilder;
    sget-object v3, Lmiui/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    const-string v3, "-"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    invoke-static {}, Lmiui/text/ChinesePinyinConverter;->getInstance()Lmiui/text/ChinesePinyinConverter;

    move-result-object v3

    invoke-static {p0}, Landroid/provider/SystemSettings$System;->getDeviceName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lmiui/text/ChinesePinyinConverter;->get(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v3

    .line 84
    .local v3, "tokenList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lmiui/text/ChinesePinyinConverter$Token;>;"
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lmiui/text/ChinesePinyinConverter$Token;

    .line 85
    .local v5, "token":Lmiui/text/ChinesePinyinConverter$Token;
    iget-object v6, v5, Lmiui/text/ChinesePinyinConverter$Token;->target:Ljava/lang/String;

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .end local v5    # "token":Lmiui/text/ChinesePinyinConverter$Token;
    goto :goto_0

    .line 87
    :cond_0
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, " "

    const-string v6, ""

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    .line 88
    .local v4, "newNetHostName":Ljava/lang/String;
    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 89
    invoke-static {v4}, Landroid/provider/SystemSettings$System;->getNameInMaxLength(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 90
    .local v5, "hostName":Ljava/lang/String;
    if-eqz v5, :cond_1

    .line 91
    const-string v6, "net.hostname"

    invoke-static {v6, v5}, Lmiui/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    .end local v5    # "hostName":Ljava/lang/String;
    :cond_1
    return-void
.end method
