.class public Lcom/android/camera/data/data/extra/DataItemLive;
.super Lcom/android/camera/data/data/DataItemBase;
.source "DataItemLive.java"


# static fields
.field public static final DATA_LIVE_ACTIVATION:Ljava/lang/String; = "live_activation"

.field public static final DATA_LIVE_START_ORIENTATION:Ljava/lang/String; = "live_start_orientation"

.field private static final KEY:Ljava/lang/String; = "camera_settings_live"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Lcom/android/camera/data/data/DataItemBase;-><init>()V

    return-void
.end method


# virtual methods
.method public getActivation()Ljava/lang/String;
    .locals 2

    .line 22
    const-string v0, "live_activation"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/data/data/extra/DataItemLive;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLiveFilter()I
    .locals 2

    .line 41
    const-string v0, "key_live_filter"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/data/data/extra/DataItemLive;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public getLiveStartOrientation()I
    .locals 2

    .line 49
    const-string v0, "live_start_orientation"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/data/data/extra/DataItemLive;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public isTransient()Z
    .locals 1

    .line 33
    const/4 v0, 0x0

    return v0
.end method

.method public provideKey()Ljava/lang/String;
    .locals 1

    .line 28
    const-string v0, "camera_settings_live"

    return-object v0
.end method

.method public setActivation(Ljava/lang/String;)V
    .locals 2

    .line 17
    invoke-virtual {p0}, Lcom/android/camera/data/data/extra/DataItemLive;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string v1, "live_activation"

    invoke-interface {v0, v1, p1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object p1

    invoke-interface {p1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 18
    return-void
.end method

.method public setLiveFilter(I)V
    .locals 1

    .line 37
    const-string v0, "key_live_filter"

    invoke-virtual {p0, v0, p1}, Lcom/android/camera/data/data/extra/DataItemLive;->putInt(Ljava/lang/String;I)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 38
    return-void
.end method

.method public setLiveStartOrientation(I)V
    .locals 1

    .line 45
    const-string v0, "live_start_orientation"

    invoke-virtual {p0, v0, p1}, Lcom/android/camera/data/data/extra/DataItemLive;->putInt(Ljava/lang/String;I)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 46
    return-void
.end method
