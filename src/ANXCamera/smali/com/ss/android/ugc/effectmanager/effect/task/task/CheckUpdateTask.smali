.class public Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;
.super Lcom/ss/android/ugc/effectmanager/common/task/NormalTask;
.source "CheckUpdateTask.java"


# static fields
.field private static final APP_VERSION:Ljava/lang/String; = "app_version"

.field private static final VERSION:Ljava/lang/String; = "version"


# instance fields
.field private mCachedChannelModel:Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;

.field private mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

.field private mCurCnt:I

.field private mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

.field private mPanel:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/ss/android/ugc/effectmanager/context/EffectContext;Ljava/lang/String;Landroid/os/Handler;Ljava/lang/String;)V
    .locals 1

    .line 56
    const-string v0, "NETWORK"

    invoke-direct {p0, p3, p2, v0}, Lcom/ss/android/ugc/effectmanager/common/task/NormalTask;-><init>(Landroid/os/Handler;Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    .line 58
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    .line 59
    iput-object p4, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mPanel:Ljava/lang/String;

    .line 60
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getRetryCount()I

    move-result p1

    iput p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mCurCnt:I

    .line 61
    return-void
.end method

.method private buildRequest()Lcom/ss/android/ugc/effectmanager/common/EffectRequest;
    .locals 5

    .line 105
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 107
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getLinkSelector()Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    move-result-object v1

    .line 108
    nop

    .line 109
    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 110
    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v3, "version"

    invoke-virtual {v1, v3, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 112
    const-string v2, "app_version"

    const-string v3, ""

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v3}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getAppVersion()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 113
    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_0

    .line 114
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 115
    const-string v3, "app_version"

    iget-object v4, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v4}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getAppVersion()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 116
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 120
    :cond_0
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getAccessKey()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 121
    const-string v1, "access_key"

    iget-object v3, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v3}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getAccessKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    :cond_1
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getAppVersion()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 124
    const-string v1, "app_version"

    iget-object v3, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v3}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getAppVersion()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    :cond_2
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getSdkVersion()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 127
    const-string v1, "sdk_version"

    iget-object v3, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v3}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getSdkVersion()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    :cond_3
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getChannel()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 130
    const-string v1, "channel"

    iget-object v3, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v3}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getChannel()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 133
    :cond_4
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getPlatform()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_5

    .line 134
    const-string v1, "device_platform"

    iget-object v3, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v3}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getPlatform()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    :cond_5
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getDeviceId()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_6

    .line 137
    const-string v1, "device_id"

    iget-object v3, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v3}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getDeviceId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    :cond_6
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getRegion()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_7

    .line 140
    const-string v1, "region"

    iget-object v3, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v3}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getRegion()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    :cond_7
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getDeviceType()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_8

    .line 143
    const-string v1, "device_type"

    iget-object v3, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v3}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getDeviceType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 145
    :cond_8
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getAppID()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_9

    .line 146
    const-string v1, "aid"

    iget-object v3, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v3}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getAppID()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    :cond_9
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getAppLanguage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_a

    .line 149
    const-string v1, "app_language"

    iget-object v3, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v3}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getAppLanguage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    :cond_a
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getSysLanguage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_b

    .line 152
    const-string v1, "language"

    iget-object v3, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v3}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getSysLanguage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    :cond_b
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mPanel:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_c

    .line 156
    const-string v1, "panel"

    iget-object v3, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mPanel:Ljava/lang/String;

    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 158
    :cond_c
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mCachedChannelModel:Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;

    if-eqz v1, :cond_e

    .line 159
    if-eqz v2, :cond_d

    .line 160
    const-string v1, "version"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 162
    :cond_d
    const-string v1, "version"

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mCachedChannelModel:Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;

    invoke-virtual {v2}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->getVersion()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 166
    :cond_e
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v2}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getLinkSelector()Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    move-result-object v2

    invoke-virtual {v2}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->getBestHostUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v2}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getApiAdress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/checkUpdate"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ss/android/ugc/effectmanager/common/utils/NetworkUtils;->buildRequestUrl(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 167
    new-instance v1, Lcom/ss/android/ugc/effectmanager/common/EffectRequest;

    const-string v2, "GET"

    invoke-direct {v1, v2, v0}, Lcom/ss/android/ugc/effectmanager/common/EffectRequest;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1
.end method

.method private checkedChannelCache()Z
    .locals 3

    .line 95
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getCache()Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "effectchannel"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mPanel:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/ss/android/ugc/effectmanager/common/listener/ICache;->queryToStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 96
    if-nez v0, :cond_0

    .line 97
    const/4 v0, 0x0

    return v0

    .line 99
    :cond_0
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getJsonConverter()Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;

    move-result-object v1

    const-class v2, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;

    invoke-interface {v1, v0, v2}, Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;->convertJsonToObj(Ljava/io/InputStream;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mCachedChannelModel:Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;

    .line 100
    const/4 v0, 0x1

    return v0
.end method


# virtual methods
.method public execute()V
    .locals 8

    .line 65
    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->checkedChannelCache()Z

    move-result v0

    const/4 v1, 0x0

    const/16 v2, 0xd

    if-eqz v0, :cond_2

    .line 66
    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->buildRequest()Lcom/ss/android/ugc/effectmanager/common/EffectRequest;

    move-result-object v0

    .line 67
    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->isCanceled()Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_0

    .line 68
    new-instance v3, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectCheckUpdateResult;

    iget-object v5, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mPanel:Ljava/lang/String;

    new-instance v6, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    const/16 v7, 0x2711

    invoke-direct {v6, v7}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(I)V

    invoke-direct {v3, v5, v4, v6}, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectCheckUpdateResult;-><init>(Ljava/lang/String;ZLcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    invoke-virtual {p0, v2, v3}, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->sendMessage(ILcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;)V

    .line 71
    :cond_0
    :try_start_0
    iget-object v3, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v3}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getEffectNetWorker()Lcom/ss/android/ugc/effectmanager/network/EffectNetWorkerWrapper;

    move-result-object v3

    iget-object v5, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v5}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getJsonConverter()Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;

    move-result-object v5

    const-class v6, Lcom/ss/android/ugc/effectmanager/effect/model/net/EffectCheckUpdateResponse;

    invoke-virtual {v3, v0, v5, v6}, Lcom/ss/android/ugc/effectmanager/network/EffectNetWorkerWrapper;->execute(Lcom/ss/android/ugc/effectmanager/common/EffectRequest;Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;Ljava/lang/Class;)Lcom/ss/android/ugc/effectmanager/common/model/BaseNetResponse;

    move-result-object v0

    check-cast v0, Lcom/ss/android/ugc/effectmanager/effect/model/net/EffectCheckUpdateResponse;

    .line 72
    if-eqz v0, :cond_1

    .line 73
    new-instance v3, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectCheckUpdateResult;

    iget-object v5, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mPanel:Ljava/lang/String;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/effect/model/net/EffectCheckUpdateResponse;->isUpdated()Z

    move-result v0

    invoke-direct {v3, v5, v0, v1}, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectCheckUpdateResult;-><init>(Ljava/lang/String;ZLcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    invoke-virtual {p0, v2, v3}, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->sendMessage(ILcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;)V

    goto :goto_0

    .line 75
    :cond_1
    new-instance v0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectCheckUpdateResult;

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mPanel:Ljava/lang/String;

    new-instance v3, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    const/16 v5, 0x2712

    invoke-direct {v3, v5}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(I)V

    invoke-direct {v0, v1, v4, v3}, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectCheckUpdateResult;-><init>(Ljava/lang/String;ZLcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    invoke-virtual {p0, v2, v0}, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->sendMessage(ILcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 80
    :goto_0
    goto :goto_1

    .line 77
    :catch_0
    move-exception v0

    .line 78
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 79
    new-instance v1, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectCheckUpdateResult;

    iget-object v3, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mPanel:Ljava/lang/String;

    new-instance v5, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    invoke-direct {v5, v0}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(Ljava/lang/Exception;)V

    invoke-direct {v1, v3, v4, v5}, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectCheckUpdateResult;-><init>(Ljava/lang/String;ZLcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    invoke-virtual {p0, v2, v1}, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->sendMessage(ILcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;)V

    .line 81
    :goto_1
    goto :goto_2

    .line 82
    :cond_2
    new-instance v0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectCheckUpdateResult;

    iget-object v3, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->mPanel:Ljava/lang/String;

    const/4 v4, 0x1

    invoke-direct {v0, v3, v4, v1}, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectCheckUpdateResult;-><init>(Ljava/lang/String;ZLcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    invoke-virtual {p0, v2, v0}, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;->sendMessage(ILcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;)V

    .line 85
    :goto_2
    return-void
.end method
