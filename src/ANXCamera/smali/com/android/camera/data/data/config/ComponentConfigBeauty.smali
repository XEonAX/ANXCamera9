.class public Lcom/android/camera/data/data/config/ComponentConfigBeauty;
.super Lcom/android/camera/data/data/ComponentData;
.source "ComponentConfigBeauty.java"

# interfaces
.implements Lcom/android/camera/constant/BeautyConstant;


# static fields
.field private static final SWITCHABLE_BEAUTY_LEVELS:[Ljava/lang/String;

.field private static final TAG:Ljava/lang/String;

.field private static final sIsLegacyFaceBeauty:Z


# instance fields
.field private mIsClosed:Landroid/util/SparseBooleanArray;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 27
    const-class v0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->TAG:Ljava/lang/String;

    .line 28
    invoke-static {}, Lcom/mi/config/b;->hP()Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->sIsLegacyFaceBeauty:Z

    .line 31
    sget-boolean v0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->sIsLegacyFaceBeauty:Z

    const/4 v1, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x3

    if-eqz v0, :cond_0

    .line 32
    new-array v0, v4, [Ljava/lang/String;

    sget-object v4, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->LEVEL_CLOSE:Ljava/lang/String;

    aput-object v4, v0, v3

    sget-object v3, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->LEVEL_LOW:Ljava/lang/String;

    aput-object v3, v0, v2

    sget-object v2, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->LEVEL_HIGH:Ljava/lang/String;

    aput-object v2, v0, v1

    sput-object v0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->SWITCHABLE_BEAUTY_LEVELS:[Ljava/lang/String;

    goto :goto_0

    .line 34
    :cond_0
    new-array v0, v4, [Ljava/lang/String;

    sget-object v4, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->LEVEL_CLOSE:Ljava/lang/String;

    aput-object v4, v0, v3

    sget-object v3, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->LEVEL_HIGH:Ljava/lang/String;

    aput-object v3, v0, v2

    sget-object v2, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->LEVEL_XXXHIGH:Ljava/lang/String;

    aput-object v2, v0, v1

    sput-object v0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->SWITCHABLE_BEAUTY_LEVELS:[Ljava/lang/String;

    .line 36
    :goto_0
    return-void
.end method

.method public constructor <init>(Lcom/android/camera/data/data/config/DataItemConfig;I)V
    .locals 4

    .line 42
    invoke-direct {p0, p1}, Lcom/android/camera/data/data/ComponentData;-><init>(Lcom/android/camera/data/data/DataItemBase;)V

    .line 43
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mItems:Ljava/util/List;

    .line 44
    iget-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mItems:Ljava/util/List;

    new-instance p2, Lcom/android/camera/data/data/ComponentDataItem;

    sget-object v0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->SWITCHABLE_BEAUTY_LEVELS:[Ljava/lang/String;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    const v1, 0x7f09017b

    const v2, 0x7f0200cf

    invoke-direct {p2, v2, v2, v1, v0}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 49
    iget-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mItems:Ljava/util/List;

    new-instance p2, Lcom/android/camera/data/data/ComponentDataItem;

    sget-object v0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->SWITCHABLE_BEAUTY_LEVELS:[Ljava/lang/String;

    const/4 v3, 0x1

    aget-object v0, v0, v3

    const v3, 0x7f0200ce

    invoke-direct {p2, v2, v3, v1, v0}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 54
    iget-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mItems:Ljava/util/List;

    new-instance p2, Lcom/android/camera/data/data/ComponentDataItem;

    sget-object v0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->SWITCHABLE_BEAUTY_LEVELS:[Ljava/lang/String;

    const/4 v1, 0x2

    aget-object v0, v0, v1

    const v1, 0x7f0200cd

    const v3, 0x7f09017c

    invoke-direct {p2, v2, v1, v3, v0}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 59
    return-void
.end method

.method private static final logd(Ljava/lang/String;ILjava/lang/String;)V
    .locals 5

    .line 193
    sget-object v0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->TAG:Ljava/lang/String;

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v2, "%s: legacy=%b, mode=%d, value=%s"

    const/4 v3, 0x4

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p0, v3, v4

    sget-boolean p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->sIsLegacyFaceBeauty:Z

    .line 194
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    const/4 v4, 0x1

    aput-object p0, v3, v4

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    const/4 p1, 0x2

    aput-object p0, v3, p1

    const/4 p0, 0x3

    aput-object p2, v3, p0

    .line 193
    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 195
    return-void
.end method


# virtual methods
.method public clearClosed()V
    .locals 1

    .line 187
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mIsClosed:Landroid/util/SparseBooleanArray;

    if-eqz v0, :cond_0

    .line 188
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mIsClosed:Landroid/util/SparseBooleanArray;

    invoke-virtual {v0}, Landroid/util/SparseBooleanArray;->clear()V

    .line 190
    :cond_0
    return-void
.end method

.method public getComponentValue(I)Ljava/lang/String;
    .locals 2

    .line 115
    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->isClosed(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 117
    const-string v0, "1: getComponentValue()"

    sget-object v1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->LEVEL_CLOSE:Ljava/lang/String;

    invoke-static {v0, p1, v1}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->logd(Ljava/lang/String;ILjava/lang/String;)V

    .line 118
    sget-object p1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->LEVEL_CLOSE:Ljava/lang/String;

    return-object p1

    .line 121
    :cond_0
    invoke-super {p0, p1}, Lcom/android/camera/data/data/ComponentData;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    .line 122
    const-string v1, "2: getComponentValue()"

    invoke-static {v1, p1, v0}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->logd(Ljava/lang/String;ILjava/lang/String;)V

    .line 124
    invoke-static {}, Lcom/android/camera/Util;->UI_DEBUG()Z

    move-result v1

    if-nez v1, :cond_7

    .line 125
    sget-boolean v1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->sIsLegacyFaceBeauty:Z

    if-eqz v1, :cond_3

    .line 127
    sget-object v1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->LEVEL_MEDIUM:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 128
    sget-object v0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->LEVEL_HIGH:Ljava/lang/String;

    goto :goto_1

    .line 129
    :cond_1
    sget-object v1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->LEVEL_XHIGH:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    sget-object v1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->LEVEL_XXHIGH:Ljava/lang/String;

    .line 130
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    sget-object v1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->LEVEL_XXXHIGH:Ljava/lang/String;

    .line 131
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 133
    :cond_2
    sget-object v0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->LEVEL_CLOSE:Ljava/lang/String;

    goto :goto_1

    .line 137
    :cond_3
    sget-object v1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->LEVEL_LOW:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    sget-object v1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->LEVEL_MEDIUM:Ljava/lang/String;

    .line 138
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    goto :goto_0

    .line 140
    :cond_4
    sget-object v1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->LEVEL_XHIGH:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    sget-object v1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->LEVEL_XXHIGH:Ljava/lang/String;

    .line 141
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 143
    :cond_5
    sget-object v0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->LEVEL_XXXHIGH:Ljava/lang/String;

    goto :goto_1

    .line 139
    :cond_6
    :goto_0
    sget-object v0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->LEVEL_HIGH:Ljava/lang/String;

    .line 147
    :cond_7
    :goto_1
    const-string v1, "3: getComponentValue()"

    invoke-static {v1, p1, v0}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->logd(Ljava/lang/String;ILjava/lang/String;)V

    .line 148
    return-object v0
.end method

.method public getDefaultValue(I)Ljava/lang/String;
    .locals 1

    .line 88
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v0

    .line 90
    if-eqz v0, :cond_3

    .line 96
    invoke-static {}, Lcom/mi/config/b;->hP()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 97
    sget-object p1, Lcom/android/camera/constant/BeautyConstant;->LEVEL_MEDIUM:Ljava/lang/String;

    goto :goto_1

    .line 98
    :cond_0
    const/16 v0, 0xa2

    if-eq p1, v0, :cond_2

    const/16 v0, 0xa1

    if-ne p1, v0, :cond_1

    goto :goto_0

    .line 102
    :cond_1
    sget-object p1, Lcom/android/camera/constant/BeautyConstant;->LEVEL_XHIGH:Ljava/lang/String;

    goto :goto_1

    .line 100
    :cond_2
    :goto_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p1

    invoke-virtual {p1}, Lcom/mi/config/a;->fU()Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    .line 92
    :cond_3
    sget-object p1, Lcom/android/camera/constant/BeautyConstant;->LEVEL_CLOSE:Ljava/lang/String;

    .line 93
    nop

    .line 106
    :goto_1
    return-object p1
.end method

.method public getDisplayTitleString()I
    .locals 1

    .line 63
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

    .line 159
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mItems:Ljava/util/List;

    return-object v0
.end method

.method public getKey(I)Ljava/lang/String;
    .locals 0

    .line 74
    packed-switch p1, :pswitch_data_0

    packed-switch p1, :pswitch_data_1

    .line 82
    const-string p1, "pref_camera_face_beauty_key"

    return-object p1

    .line 80
    :pswitch_0
    const-string p1, "pref_video_face_beauty_key"

    return-object p1

    :pswitch_data_0
    .packed-switch 0xa1
        :pswitch_0
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0xa8
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public getNextValue(I)Ljava/lang/String;
    .locals 4

    .line 163
    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    .line 164
    sget-object v1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->SWITCHABLE_BEAUTY_LEVELS:[Ljava/lang/String;

    array-length v1, v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    .line 165
    sget-object v3, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->SWITCHABLE_BEAUTY_LEVELS:[Ljava/lang/String;

    aget-object v3, v3, v2

    invoke-static {v3, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 166
    sget-object p1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->SWITCHABLE_BEAUTY_LEVELS:[Ljava/lang/String;

    add-int/lit8 v2, v2, 0x1

    rem-int/2addr v2, v1

    aget-object p1, p1, v2

    return-object p1

    .line 164
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 169
    :cond_1
    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->getDefaultValue(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getPersistValue(I)Ljava/lang/String;
    .locals 0

    .line 110
    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->getComponentValue(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public isClosed(I)Z
    .locals 1

    .line 173
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mIsClosed:Landroid/util/SparseBooleanArray;

    if-nez v0, :cond_0

    .line 174
    const/4 p1, 0x0

    return p1

    .line 176
    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mIsClosed:Landroid/util/SparseBooleanArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result p1

    return p1
.end method

.method public isSwitchOn(I)Z
    .locals 1

    .line 67
    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    .line 68
    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->getDefaultValue(I)Ljava/lang/String;

    move-result-object p1

    .line 69
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    return p1
.end method

.method public setClosed(ZI)V
    .locals 1

    .line 180
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mIsClosed:Landroid/util/SparseBooleanArray;

    if-nez v0, :cond_0

    .line 181
    new-instance v0, Landroid/util/SparseBooleanArray;

    invoke-direct {v0}, Landroid/util/SparseBooleanArray;-><init>()V

    iput-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mIsClosed:Landroid/util/SparseBooleanArray;

    .line 183
    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mIsClosed:Landroid/util/SparseBooleanArray;

    invoke-virtual {v0, p2, p1}, Landroid/util/SparseBooleanArray;->put(IZ)V

    .line 184
    return-void
.end method

.method public setComponentValue(ILjava/lang/String;)V
    .locals 1

    .line 153
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->setClosed(ZI)V

    .line 154
    invoke-super {p0, p1, p2}, Lcom/android/camera/data/data/ComponentData;->setComponentValue(ILjava/lang/String;)V

    .line 155
    return-void
.end method
