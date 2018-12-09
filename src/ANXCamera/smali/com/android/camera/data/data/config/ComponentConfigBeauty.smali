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

    .line 22
    const-class v0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->TAG:Ljava/lang/String;

    .line 23
    invoke-static {}, Lcom/mi/config/b;->hp()Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->sIsLegacyFaceBeauty:Z

    .line 26
    sget-boolean v0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->sIsLegacyFaceBeauty:Z

    const/4 v1, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x3

    if-eqz v0, :cond_0

    .line 27
    new-array v0, v4, [Ljava/lang/String;

    sget-object v4, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->LEVEL_CLOSE:Ljava/lang/String;

    aput-object v4, v0, v3

    sget-object v3, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->LEVEL_LOW:Ljava/lang/String;

    aput-object v3, v0, v2

    sget-object v2, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->LEVEL_HIGH:Ljava/lang/String;

    aput-object v2, v0, v1

    sput-object v0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->SWITCHABLE_BEAUTY_LEVELS:[Ljava/lang/String;

    goto :goto_0

    .line 29
    :cond_0
    new-array v0, v4, [Ljava/lang/String;

    sget-object v4, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->LEVEL_CLOSE:Ljava/lang/String;

    aput-object v4, v0, v3

    sget-object v3, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->LEVEL_HIGH:Ljava/lang/String;

    aput-object v3, v0, v2

    sget-object v2, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->LEVEL_XXXHIGH:Ljava/lang/String;

    aput-object v2, v0, v1

    sput-object v0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->SWITCHABLE_BEAUTY_LEVELS:[Ljava/lang/String;

    .line 31
    :goto_0
    return-void
.end method

.method public constructor <init>(Lcom/android/camera/data/data/config/DataItemConfig;)V
    .locals 5

    .line 36
    invoke-direct {p0, p1}, Lcom/android/camera/data/data/ComponentData;-><init>(Lcom/android/camera/data/data/DataItemBase;)V

    .line 37
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mItems:Ljava/util/List;

    .line 38
    iget-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mItems:Ljava/util/List;

    new-instance v0, Lcom/android/camera/data/data/ComponentDataItem;

    sget-object v1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->SWITCHABLE_BEAUTY_LEVELS:[Ljava/lang/String;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    const v2, 0x7f0b0174

    const v3, 0x7f0200bf

    invoke-direct {v0, v3, v3, v2, v1}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 43
    iget-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mItems:Ljava/util/List;

    new-instance v0, Lcom/android/camera/data/data/ComponentDataItem;

    sget-object v1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->SWITCHABLE_BEAUTY_LEVELS:[Ljava/lang/String;

    const/4 v4, 0x1

    aget-object v1, v1, v4

    const v4, 0x7f0200be

    invoke-direct {v0, v3, v4, v2, v1}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 48
    iget-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mItems:Ljava/util/List;

    new-instance v0, Lcom/android/camera/data/data/ComponentDataItem;

    sget-object v1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->SWITCHABLE_BEAUTY_LEVELS:[Ljava/lang/String;

    const/4 v2, 0x2

    aget-object v1, v1, v2

    const v2, 0x7f0200bd

    const v4, 0x7f0b0175

    invoke-direct {v0, v3, v2, v4, v1}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 53
    return-void
.end method

.method private static final logd(Ljava/lang/String;ILjava/lang/String;)V
    .locals 5

    .line 168
    sget-object v0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->TAG:Ljava/lang/String;

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v2, "%s: legacy=%b, mode=%d, value=%s"

    const/4 v3, 0x4

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p0, v3, v4

    sget-boolean p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->sIsLegacyFaceBeauty:Z

    .line 169
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

    .line 168
    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 170
    return-void
.end method


# virtual methods
.method public clearClosed()V
    .locals 1

    .line 162
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mIsClosed:Landroid/util/SparseBooleanArray;

    if-eqz v0, :cond_0

    .line 163
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mIsClosed:Landroid/util/SparseBooleanArray;

    invoke-virtual {v0}, Landroid/util/SparseBooleanArray;->clear()V

    .line 165
    :cond_0
    return-void
.end method

.method public getComponentValue(I)Ljava/lang/String;
    .locals 2

    .line 91
    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->isClosed(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 93
    const-string v0, "1: getComponentValue()"

    sget-object v1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->LEVEL_CLOSE:Ljava/lang/String;

    invoke-static {v0, p1, v1}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->logd(Ljava/lang/String;ILjava/lang/String;)V

    .line 94
    sget-object p1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->LEVEL_CLOSE:Ljava/lang/String;

    return-object p1

    .line 98
    :cond_0
    invoke-super {p0, p1}, Lcom/android/camera/data/data/ComponentData;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    .line 99
    const-string v1, "2: getComponentValue()"

    invoke-static {v1, p1, v0}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->logd(Ljava/lang/String;ILjava/lang/String;)V

    .line 100
    sget-boolean v1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->sIsLegacyFaceBeauty:Z

    if-eqz v1, :cond_3

    .line 102
    sget-object v1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->LEVEL_MEDIUM:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 103
    sget-object v0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->LEVEL_HIGH:Ljava/lang/String;

    goto :goto_1

    .line 104
    :cond_1
    sget-object v1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->LEVEL_XHIGH:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    sget-object v1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->LEVEL_XXHIGH:Ljava/lang/String;

    .line 105
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    sget-object v1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->LEVEL_XXXHIGH:Ljava/lang/String;

    .line 106
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 108
    :cond_2
    sget-object v0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->LEVEL_CLOSE:Ljava/lang/String;

    goto :goto_1

    .line 112
    :cond_3
    sget-object v1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->LEVEL_LOW:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    sget-object v1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->LEVEL_MEDIUM:Ljava/lang/String;

    .line 113
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    goto :goto_0

    .line 115
    :cond_4
    sget-object v1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->LEVEL_XHIGH:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    sget-object v1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->LEVEL_XXHIGH:Ljava/lang/String;

    .line 116
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 118
    :cond_5
    sget-object v0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->LEVEL_XXXHIGH:Ljava/lang/String;

    goto :goto_1

    .line 114
    :cond_6
    :goto_0
    sget-object v0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->LEVEL_HIGH:Ljava/lang/String;

    .line 122
    :cond_7
    :goto_1
    const-string v1, "3: getComponentValue()"

    invoke-static {v1, p1, v0}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->logd(Ljava/lang/String;ILjava/lang/String;)V

    .line 123
    return-object v0
.end method

.method public getDefaultValue(I)Ljava/lang/String;
    .locals 0

    .line 82
    sget-object p1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->LEVEL_CLOSE:Ljava/lang/String;

    return-object p1
.end method

.method public getDisplayTitleString()I
    .locals 1

    .line 57
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

    .line 134
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mItems:Ljava/util/List;

    return-object v0
.end method

.method public getKey(I)Ljava/lang/String;
    .locals 0

    .line 68
    packed-switch p1, :pswitch_data_0

    packed-switch p1, :pswitch_data_1

    .line 76
    const-string p1, "pref_camera_face_beauty_key"

    return-object p1

    .line 74
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

    .line 138
    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    .line 139
    sget-object v1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->SWITCHABLE_BEAUTY_LEVELS:[Ljava/lang/String;

    array-length v1, v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    .line 140
    sget-object v3, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->SWITCHABLE_BEAUTY_LEVELS:[Ljava/lang/String;

    aget-object v3, v3, v2

    invoke-static {v3, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 141
    sget-object p1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->SWITCHABLE_BEAUTY_LEVELS:[Ljava/lang/String;

    add-int/lit8 v2, v2, 0x1

    rem-int/2addr v2, v1

    aget-object p1, p1, v2

    return-object p1

    .line 139
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 144
    :cond_1
    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->getDefaultValue(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getPersistValue(I)Ljava/lang/String;
    .locals 0

    .line 86
    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->getComponentValue(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public isClosed(I)Z
    .locals 1

    .line 148
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mIsClosed:Landroid/util/SparseBooleanArray;

    if-nez v0, :cond_0

    .line 149
    const/4 p1, 0x0

    return p1

    .line 151
    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mIsClosed:Landroid/util/SparseBooleanArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result p1

    return p1
.end method

.method public isSwitchOn(I)Z
    .locals 1

    .line 61
    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    .line 62
    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->getDefaultValue(I)Ljava/lang/String;

    move-result-object p1

    .line 63
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    return p1
.end method

.method public setClosed(ZI)V
    .locals 1

    .line 155
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mIsClosed:Landroid/util/SparseBooleanArray;

    if-nez v0, :cond_0

    .line 156
    new-instance v0, Landroid/util/SparseBooleanArray;

    invoke-direct {v0}, Landroid/util/SparseBooleanArray;-><init>()V

    iput-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mIsClosed:Landroid/util/SparseBooleanArray;

    .line 158
    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mIsClosed:Landroid/util/SparseBooleanArray;

    invoke-virtual {v0, p2, p1}, Landroid/util/SparseBooleanArray;->put(IZ)V

    .line 159
    return-void
.end method

.method public setComponentValue(ILjava/lang/String;)V
    .locals 1

    .line 128
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->setClosed(ZI)V

    .line 129
    invoke-super {p0, p1, p2}, Lcom/android/camera/data/data/ComponentData;->setComponentValue(ILjava/lang/String;)V

    .line 130
    return-void
.end method
