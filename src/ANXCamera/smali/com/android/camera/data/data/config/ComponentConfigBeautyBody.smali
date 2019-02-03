.class public Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;
.super Lcom/android/camera/data/data/ComponentData;
.source "ComponentConfigBeautyBody.java"


# static fields
.field private static final DEF_BEAUTY_BODY_VALUE:I


# instance fields
.field private mIsClosed:Z


# direct methods
.method public constructor <init>(Lcom/android/camera/data/data/config/DataItemConfig;)V
    .locals 0

    .line 20
    invoke-direct {p0, p1}, Lcom/android/camera/data/data/ComponentData;-><init>(Lcom/android/camera/data/data/DataItemBase;)V

    .line 21
    return-void
.end method


# virtual methods
.method public getBeautyBodyValue(Ljava/lang/String;I)I
    .locals 1

    .line 57
    invoke-virtual {p0}, Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;->isClosed()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 58
    return p2

    .line 60
    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;->mParentDataItem:Lcom/android/camera/data/data/DataItemBase;

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/data/data/DataItemBase;->getInt(Ljava/lang/String;I)I

    move-result p1

    return p1
.end method

.method public getDefaultValue(I)Ljava/lang/String;
    .locals 0
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 43
    const/4 p1, 0x0

    return-object p1
.end method

.method public getDisplayTitleString()I
    .locals 1

    .line 25
    const/4 v0, 0x0

    return v0
.end method

.method public getItems()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/camera/data/data/ComponentDataItem;",
            ">;"
        }
    .end annotation

    .line 48
    const/4 v0, 0x0

    return-object v0
.end method

.method public getKey(I)Ljava/lang/String;
    .locals 0

    .line 30
    packed-switch p1, :pswitch_data_0

    .line 37
    const/4 p1, 0x0

    return-object p1

    .line 33
    :pswitch_0
    const-string p1, "_video"

    return-object p1

    :pswitch_data_0
    .packed-switch 0xa1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public isBeautyBodyKey(Ljava/lang/String;)Z
    .locals 5

    .line 78
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 79
    return v1

    .line 81
    :cond_0
    const/4 v0, -0x1

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v2

    const v3, -0x676e6ee1

    const/4 v4, 0x1

    if-eq v2, v3, :cond_4

    const v3, -0x8bc7263

    if-eq v2, v3, :cond_3

    const v3, 0x65e369e1

    if-eq v2, v3, :cond_2

    const v3, 0x73f08a21

    if-eq v2, v3, :cond_1

    goto :goto_0

    :cond_1
    const-string v2, "pref_beauty_head_slim_ratio"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    move p1, v1

    goto :goto_1

    :cond_2
    const-string v2, "pref_beauty_shoulder_slim_ratio"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    const/4 p1, 0x2

    goto :goto_1

    :cond_3
    const-string v2, "key_beauty_leg_slim_ratio"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    const/4 p1, 0x3

    goto :goto_1

    :cond_4
    const-string v2, "pref_beauty_body_slim_ratio"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    move p1, v4

    goto :goto_1

    :cond_5
    :goto_0
    move p1, v0

    :goto_1
    packed-switch p1, :pswitch_data_0

    .line 91
    return v1

    .line 89
    :pswitch_0
    return v4

    .line 87
    :pswitch_1
    return v4

    .line 85
    :pswitch_2
    return v4

    .line 83
    :pswitch_3
    return v4

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public isClosed()Z
    .locals 1

    .line 64
    iget-boolean v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;->mIsClosed:Z

    return v0
.end method

.method public resetBeautyBody(ILcom/android/camera/data/provider/DataProvider$ProviderEditor;)V
    .locals 5

    .line 97
    const-string p1, "pref_beauty_head_slim_ratio"

    .line 98
    const-string v0, "pref_beauty_body_slim_ratio"

    .line 99
    const-string v1, "pref_beauty_shoulder_slim_ratio"

    .line 100
    const-string v2, "key_beauty_leg_slim_ratio"

    .line 102
    iget-object v3, p0, Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;->mParentDataItem:Lcom/android/camera/data/data/DataItemBase;

    const/4 v4, 0x0

    invoke-virtual {v3, p1, v4}, Lcom/android/camera/data/data/DataItemBase;->getInt(Ljava/lang/String;I)I

    move-result v3

    .line 103
    if-lez v3, :cond_0

    .line 104
    invoke-interface {p2, p1, v4}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putInt(Ljava/lang/String;I)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 106
    :cond_0
    iget-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;->mParentDataItem:Lcom/android/camera/data/data/DataItemBase;

    invoke-virtual {p1, v0, v4}, Lcom/android/camera/data/data/DataItemBase;->getInt(Ljava/lang/String;I)I

    move-result p1

    .line 107
    if-lez p1, :cond_1

    .line 108
    invoke-interface {p2, v0, v4}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putInt(Ljava/lang/String;I)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 110
    :cond_1
    iget-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;->mParentDataItem:Lcom/android/camera/data/data/DataItemBase;

    invoke-virtual {p1, v1, v4}, Lcom/android/camera/data/data/DataItemBase;->getInt(Ljava/lang/String;I)I

    move-result p1

    .line 111
    if-lez p1, :cond_2

    .line 112
    invoke-interface {p2, v1, v4}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putInt(Ljava/lang/String;I)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 114
    :cond_2
    iget-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;->mParentDataItem:Lcom/android/camera/data/data/DataItemBase;

    invoke-virtual {p1, v2, v4}, Lcom/android/camera/data/data/DataItemBase;->getInt(Ljava/lang/String;I)I

    move-result p1

    .line 115
    if-lez p1, :cond_3

    .line 116
    invoke-interface {p2, v2, v4}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putInt(Ljava/lang/String;I)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 118
    :cond_3
    return-void
.end method

.method public setBeautyBodyValue(Ljava/lang/String;I)V
    .locals 1

    .line 52
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;->setClosed(Z)V

    .line 53
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;->mParentDataItem:Lcom/android/camera/data/data/DataItemBase;

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/data/data/DataItemBase;->putInt(Ljava/lang/String;I)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object p1

    invoke-interface {p1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 54
    return-void
.end method

.method public setClosed(Z)V
    .locals 0

    .line 68
    iput-boolean p1, p0, Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;->mIsClosed:Z

    .line 69
    return-void
.end method
