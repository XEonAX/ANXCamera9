.class public Lcom/android/camera/data/data/config/ComponentConfigHdr;
.super Lcom/android/camera/data/data/ComponentData;
.source "ComponentConfigHdr.java"


# static fields
.field public static final HDR_VALUE_AUTO:Ljava/lang/String; = "auto"

.field public static final HDR_VALUE_LIVE:Ljava/lang/String; = "live"

.field public static final HDR_VALUE_NORMAL:Ljava/lang/String; = "normal"

.field public static final HDR_VALUE_OFF:Ljava/lang/String; = "off"

.field public static final HDR_VALUE_ON:Ljava/lang/String; = "on"


# instance fields
.field private mAutoSupported:Z

.field private mIsClosed:Z


# direct methods
.method public constructor <init>(Lcom/android/camera/data/data/config/DataItemConfig;)V
    .locals 5

    .line 43
    invoke-direct {p0, p1}, Lcom/android/camera/data/data/ComponentData;-><init>(Lcom/android/camera/data/data/DataItemBase;)V

    .line 44
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigHdr;->mItems:Ljava/util/List;

    .line 45
    iget-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigHdr;->mItems:Ljava/util/List;

    new-instance v0, Lcom/android/camera/data/data/ComponentDataItem;

    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getConfigHDROffRes()I

    move-result v1

    .line 46
    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getConfigHDROffRes()I

    move-result v2

    const-string v3, "off"

    const v4, 0x7f090171

    invoke-direct {v0, v1, v2, v4, v3}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    .line 45
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 48
    return-void
.end method

.method private getConfigHDRAutoRes()I
    .locals 1

    .line 246
    const v0, 0x7f020131

    return v0
.end method

.method private getConfigHDRLiveRes()I
    .locals 1

    .line 238
    const v0, 0x7f020132

    return v0
.end method

.method private getConfigHDRNormalRes()I
    .locals 1

    .line 242
    const v0, 0x7f020133

    return v0
.end method

.method private getConfigHDROffRes()I
    .locals 1

    .line 250
    const v0, 0x7f020134

    return v0
.end method


# virtual methods
.method public clearClosed()V
    .locals 1

    .line 254
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/data/data/config/ComponentConfigHdr;->mIsClosed:Z

    .line 255
    return-void
.end method

.method public getComponentValue(I)Ljava/lang/String;
    .locals 1

    .line 110
    invoke-virtual {p0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->isClosed()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 111
    const-string p1, "off"

    return-object p1

    .line 113
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 114
    const-string p1, "off"

    return-object p1

    .line 116
    :cond_1
    invoke-super {p0, p1}, Lcom/android/camera/data/data/ComponentData;->getComponentValue(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getDefaultValue(I)Ljava/lang/String;
    .locals 3

    .line 75
    invoke-virtual {p0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->isClosed()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 76
    const-string p1, "off"

    return-object p1

    .line 78
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 79
    const-string p1, "off"

    return-object p1

    .line 83
    :cond_1
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 84
    const-string p1, "off"

    return-object p1

    .line 87
    :cond_2
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p1

    invoke-virtual {p1}, Lcom/mi/config/a;->fu()Ljava/lang/String;

    move-result-object p1

    .line 88
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_8

    .line 89
    const/4 v0, -0x1

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v1

    const/16 v2, 0xddf

    if-eq v1, v2, :cond_5

    const v2, 0x1ad6f

    if-eq v1, v2, :cond_4

    const v2, 0x2dddaf

    if-eq v1, v2, :cond_3

    goto :goto_0

    :cond_3
    const-string v1, "auto"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_6

    const/4 v0, 0x0

    goto :goto_0

    :cond_4
    const-string v1, "off"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_6

    const/4 v0, 0x2

    goto :goto_0

    :cond_5
    const-string v1, "on"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_6

    const/4 v0, 0x1

    :cond_6
    :goto_0
    packed-switch v0, :pswitch_data_0

    goto :goto_2

    .line 95
    :pswitch_0
    const-string p1, "off"

    return-object p1

    .line 93
    :pswitch_1
    const-string p1, "on"

    return-object p1

    .line 91
    :pswitch_2
    iget-boolean p1, p0, Lcom/android/camera/data/data/config/ComponentConfigHdr;->mAutoSupported:Z

    if-eqz p1, :cond_7

    const-string p1, "auto"

    goto :goto_1

    :cond_7
    const-string p1, "off"

    :goto_1
    return-object p1

    .line 101
    :cond_8
    :goto_2
    iget-boolean p1, p0, Lcom/android/camera/data/data/config/ComponentConfigHdr;->mAutoSupported:Z

    if-eqz p1, :cond_9

    .line 102
    const-string p1, "auto"

    return-object p1

    .line 105
    :cond_9
    const-string p1, "off"

    return-object p1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getDisplayTitleString()I
    .locals 1

    .line 52
    const v0, 0x7f090131

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

    .line 136
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigHdr;->mItems:Ljava/util/List;

    return-object v0
.end method

.method public getKey(I)Ljava/lang/String;
    .locals 1

    .line 57
    const/16 v0, 0xa0

    if-eq p1, v0, :cond_1

    const/16 v0, 0xa2

    if-eq p1, v0, :cond_0

    packed-switch p1, :pswitch_data_0

    .line 60
    const-string p1, "pref_camera_hdr_key"

    return-object p1

    .line 66
    :cond_0
    :pswitch_0
    const-string p1, "pref_video_hdr_key"

    return-object p1

    .line 69
    :cond_1
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "unspecified hdr"

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    nop

    :pswitch_data_0
    .packed-switch 0xa8
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public getPersistValue(I)Ljava/lang/String;
    .locals 0

    .line 125
    invoke-super {p0, p1}, Lcom/android/camera/data/data/ComponentData;->getComponentValue(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getValueSelectedDrawableIgnoreClose(I)I
    .locals 1

    .line 221
    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getComponentValue(I)Ljava/lang/String;

    move-result-object p1

    .line 222
    const-string v0, "off"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 223
    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getConfigHDROffRes()I

    move-result p1

    return p1

    .line 224
    :cond_0
    const-string v0, "auto"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 225
    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getConfigHDRAutoRes()I

    move-result p1

    return p1

    .line 226
    :cond_1
    const-string v0, "normal"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 227
    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getConfigHDRNormalRes()I

    move-result p1

    return p1

    .line 228
    :cond_2
    const-string v0, "live"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 229
    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getConfigHDRLiveRes()I

    move-result p1

    return p1

    .line 230
    :cond_3
    const-string v0, "on"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 231
    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getConfigHDRNormalRes()I

    move-result p1

    return p1

    .line 234
    :cond_4
    const/4 p1, -0x1

    return p1
.end method

.method public getValueSelectedStringIdIgnoreClose(I)I
    .locals 2

    .line 263
    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getComponentValue(I)Ljava/lang/String;

    move-result-object p1

    .line 264
    const-string v0, "off"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 265
    const p1, 0x7f0900e1

    return p1

    .line 266
    :cond_0
    const-string v0, "auto"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 267
    const p1, 0x7f0900e2

    return p1

    .line 268
    :cond_1
    const-string v0, "normal"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const v1, 0x7f0900e5

    if-eqz v0, :cond_2

    .line 269
    return v1

    .line 270
    :cond_2
    const-string v0, "live"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 271
    const p1, 0x7f0900e4

    return p1

    .line 272
    :cond_3
    const-string v0, "on"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 273
    return v1

    .line 276
    :cond_4
    const/4 p1, -0x1

    return p1
.end method

.method public isClosed()Z
    .locals 1

    .line 35
    iget-boolean v0, p0, Lcom/android/camera/data/data/config/ComponentConfigHdr;->mIsClosed:Z

    return v0
.end method

.method public reInit(IILcom/android/camera2/CameraCapabilities;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Lcom/android/camera2/CameraCapabilities;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/camera/data/data/ComponentDataItem;",
            ">;"
        }
    .end annotation

    .line 141
    iget-object p2, p0, Lcom/android/camera/data/data/config/ComponentConfigHdr;->mItems:Ljava/util/List;

    if-nez p2, :cond_0

    .line 142
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/android/camera/data/data/config/ComponentConfigHdr;->mItems:Ljava/util/List;

    goto :goto_0

    .line 144
    :cond_0
    iget-object p2, p0, Lcom/android/camera/data/data/config/ComponentConfigHdr;->mItems:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->clear()V

    .line 147
    :goto_0
    const/4 p2, 0x0

    iput-boolean p2, p0, Lcom/android/camera/data/data/config/ComponentConfigHdr;->mAutoSupported:Z

    .line 149
    invoke-virtual {p3}, Lcom/android/camera2/CameraCapabilities;->isSupportHdr()Z

    move-result p2

    if-nez p2, :cond_1

    .line 150
    iget-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigHdr;->mItems:Ljava/util/List;

    return-object p1

    .line 153
    :cond_1
    const/16 p2, 0xa3

    if-eq p1, p2, :cond_2

    const/16 p2, 0xa5

    if-eq p1, p2, :cond_2

    goto/16 :goto_2

    .line 157
    :cond_2
    iget-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigHdr;->mItems:Ljava/util/List;

    new-instance p2, Lcom/android/camera/data/data/ComponentDataItem;

    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getConfigHDROffRes()I

    move-result v0

    .line 158
    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getConfigHDROffRes()I

    move-result v1

    const v2, 0x7f090171

    const-string v3, "off"

    invoke-direct {p2, v0, v1, v2, v3}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    .line 157
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 161
    invoke-virtual {p3}, Lcom/android/camera2/CameraCapabilities;->isSupportAutoHdr()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 162
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/camera/data/data/config/ComponentConfigHdr;->mAutoSupported:Z

    .line 163
    iget-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigHdr;->mItems:Ljava/util/List;

    new-instance p2, Lcom/android/camera/data/data/ComponentDataItem;

    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getConfigHDRAutoRes()I

    move-result p3

    .line 164
    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getConfigHDRAutoRes()I

    move-result v0

    const v1, 0x7f090170

    const-string v2, "auto"

    invoke-direct {p2, p3, v0, v1, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    .line 163
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 169
    :cond_3
    sget-boolean p1, Lcom/mi/config/b;->pM:Z

    if-nez p1, :cond_6

    invoke-static {}, Lcom/mi/config/b;->gp()Z

    move-result p1

    if-nez p1, :cond_4

    goto :goto_1

    .line 174
    :cond_4
    sget-boolean p1, Lcom/mi/config/b;->IS_MI2A:Z

    if-nez p1, :cond_5

    .line 175
    iget-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigHdr;->mItems:Ljava/util/List;

    new-instance p2, Lcom/android/camera/data/data/ComponentDataItem;

    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getConfigHDRNormalRes()I

    move-result p3

    .line 176
    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getConfigHDRNormalRes()I

    move-result v0

    const v1, 0x7f090172

    const-string v2, "normal"

    invoke-direct {p2, p3, v0, v1, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    .line 175
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 180
    :cond_5
    iget-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigHdr;->mItems:Ljava/util/List;

    new-instance p2, Lcom/android/camera/data/data/ComponentDataItem;

    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getConfigHDRLiveRes()I

    move-result p3

    .line 181
    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getConfigHDRLiveRes()I

    move-result v0

    const v1, 0x7f090173

    const-string v2, "live"

    invoke-direct {p2, p3, v0, v1, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    .line 180
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 185
    goto :goto_2

    .line 170
    :cond_6
    :goto_1
    iget-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigHdr;->mItems:Ljava/util/List;

    new-instance p2, Lcom/android/camera/data/data/ComponentDataItem;

    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getConfigHDRNormalRes()I

    move-result p3

    .line 171
    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getConfigHDRNormalRes()I

    move-result v0

    const v1, 0x7f090175

    const-string v2, "normal"

    invoke-direct {p2, p3, v0, v1, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    .line 170
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 211
    :goto_2
    iget-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigHdr;->mItems:Ljava/util/List;

    return-object p1
.end method

.method public setClosed(Z)V
    .locals 0

    .line 39
    iput-boolean p1, p0, Lcom/android/camera/data/data/config/ComponentConfigHdr;->mIsClosed:Z

    .line 40
    return-void
.end method

.method public setComponentValue(ILjava/lang/String;)V
    .locals 1

    .line 130
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->setClosed(Z)V

    .line 131
    invoke-super {p0, p1, p2}, Lcom/android/camera/data/data/ComponentData;->setComponentValue(ILjava/lang/String;)V

    .line 132
    return-void
.end method
