.class public Lcom/ss/android/medialib/player/EffectConfig;
.super Ljava/lang/Object;
.source "EffectConfig.java"


# annotations
.annotation build Landroid/support/annotation/Keep;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/medialib/player/EffectConfig$Effect;
    }
.end annotation


# instance fields
.field deviceName:Ljava/lang/String;

.field effect8File:Ljava/lang/String;

.field effect9File:Ljava/lang/String;

.field effectFileInfos:[Lcom/ss/android/medialib/player/EffectFileInfo;

.field effectModelDir:Ljava/lang/String;

.field effectModels:[Lcom/ss/android/medialib/player/EffectModel;

.field effectType:I

.field leftFilter:Ljava/lang/String;

.field pos:F

.field rightFilter:Ljava/lang/String;

.field snowflakeFile:Ljava/lang/String;

.field vertigoFile:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getDeviceName()Ljava/lang/String;
    .locals 1

    .line 215
    iget-object v0, p0, Lcom/ss/android/medialib/player/EffectConfig;->deviceName:Ljava/lang/String;

    return-object v0
.end method

.method public getEffect8File()Ljava/lang/String;
    .locals 1

    .line 178
    iget-object v0, p0, Lcom/ss/android/medialib/player/EffectConfig;->effect8File:Ljava/lang/String;

    return-object v0
.end method

.method public getEffect9File()Ljava/lang/String;
    .locals 1

    .line 186
    iget-object v0, p0, Lcom/ss/android/medialib/player/EffectConfig;->effect9File:Ljava/lang/String;

    return-object v0
.end method

.method public getEffectFileInfos()[Lcom/ss/android/medialib/player/EffectFileInfo;
    .locals 1

    .line 223
    iget-object v0, p0, Lcom/ss/android/medialib/player/EffectConfig;->effectFileInfos:[Lcom/ss/android/medialib/player/EffectFileInfo;

    return-object v0
.end method

.method public getEffectModelDir()Ljava/lang/String;
    .locals 1

    .line 211
    iget-object v0, p0, Lcom/ss/android/medialib/player/EffectConfig;->effectModelDir:Ljava/lang/String;

    return-object v0
.end method

.method public getEffectModels()[Lcom/ss/android/medialib/player/EffectModel;
    .locals 1

    .line 219
    iget-object v0, p0, Lcom/ss/android/medialib/player/EffectConfig;->effectModels:[Lcom/ss/android/medialib/player/EffectModel;

    return-object v0
.end method

.method public getEffectType()I
    .locals 1

    .line 37
    iget v0, p0, Lcom/ss/android/medialib/player/EffectConfig;->effectType:I

    return v0
.end method

.method public getLeftFilter()Ljava/lang/String;
    .locals 1

    .line 227
    iget-object v0, p0, Lcom/ss/android/medialib/player/EffectConfig;->leftFilter:Ljava/lang/String;

    return-object v0
.end method

.method public getPos()F
    .locals 1

    .line 235
    iget v0, p0, Lcom/ss/android/medialib/player/EffectConfig;->pos:F

    return v0
.end method

.method public getRightFilter()Ljava/lang/String;
    .locals 1

    .line 231
    iget-object v0, p0, Lcom/ss/android/medialib/player/EffectConfig;->rightFilter:Ljava/lang/String;

    return-object v0
.end method

.method public getSnowflakeFile()Ljava/lang/String;
    .locals 1

    .line 202
    iget-object v0, p0, Lcom/ss/android/medialib/player/EffectConfig;->snowflakeFile:Ljava/lang/String;

    return-object v0
.end method

.method public getVertigoFile()Ljava/lang/String;
    .locals 1

    .line 194
    iget-object v0, p0, Lcom/ss/android/medialib/player/EffectConfig;->vertigoFile:Ljava/lang/String;

    return-object v0
.end method

.method public setDeviceName(Ljava/lang/String;)Lcom/ss/android/medialib/player/EffectConfig;
    .locals 0

    .line 173
    iput-object p1, p0, Lcom/ss/android/medialib/player/EffectConfig;->deviceName:Ljava/lang/String;

    .line 174
    return-object p0
.end method

.method public setEffect8File(Ljava/lang/String;)V
    .locals 0

    .line 182
    iput-object p1, p0, Lcom/ss/android/medialib/player/EffectConfig;->effect8File:Ljava/lang/String;

    .line 183
    return-void
.end method

.method public setEffect9File(Ljava/lang/String;)V
    .locals 0

    .line 190
    iput-object p1, p0, Lcom/ss/android/medialib/player/EffectConfig;->effect9File:Ljava/lang/String;

    .line 191
    return-void
.end method

.method public setEffectFileInfos([Lcom/ss/android/medialib/player/EffectFileInfo;)Lcom/ss/android/medialib/player/EffectConfig;
    .locals 0

    .line 153
    iput-object p1, p0, Lcom/ss/android/medialib/player/EffectConfig;->effectFileInfos:[Lcom/ss/android/medialib/player/EffectFileInfo;

    .line 154
    return-object p0
.end method

.method public setEffectFiles(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/medialib/player/EffectConfig;
    .locals 0

    .line 83
    iput-object p1, p0, Lcom/ss/android/medialib/player/EffectConfig;->effect8File:Ljava/lang/String;

    .line 84
    iput-object p2, p0, Lcom/ss/android/medialib/player/EffectConfig;->effect9File:Ljava/lang/String;

    .line 85
    iput-object p3, p0, Lcom/ss/android/medialib/player/EffectConfig;->vertigoFile:Ljava/lang/String;

    .line 86
    iput-object p4, p0, Lcom/ss/android/medialib/player/EffectConfig;->snowflakeFile:Ljava/lang/String;

    .line 87
    return-object p0
.end method

.method public setEffectModelDir(Ljava/lang/String;)Lcom/ss/android/medialib/player/EffectConfig;
    .locals 0

    .line 163
    iput-object p1, p0, Lcom/ss/android/medialib/player/EffectConfig;->effectModelDir:Ljava/lang/String;

    .line 164
    return-object p0
.end method

.method public setEffectModels([III)Lcom/ss/android/medialib/player/EffectConfig;
    .locals 7

    .line 131
    if-nez p1, :cond_0

    return-object p0

    .line 132
    :cond_0
    array-length v0, p1

    const/4 v1, 0x3

    div-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    .line 133
    new-array v2, v0, [Lcom/ss/android/medialib/player/EffectModel;

    iput-object v2, p0, Lcom/ss/android/medialib/player/EffectConfig;->effectModels:[Lcom/ss/android/medialib/player/EffectModel;

    .line 134
    const/4 v2, 0x0

    :goto_0
    add-int/lit8 v3, v0, -0x1

    if-ge v2, v3, :cond_1

    .line 135
    new-instance v3, Lcom/ss/android/medialib/player/EffectModel;

    mul-int v4, v1, v2

    aget v5, p1, v4

    add-int/lit8 v6, v4, 0x1

    aget v6, p1, v6

    add-int/lit8 v4, v4, 0x2

    aget v4, p1, v4

    invoke-direct {v3, v5, v6, v4}, Lcom/ss/android/medialib/player/EffectModel;-><init>(III)V

    .line 139
    iget-object v4, p0, Lcom/ss/android/medialib/player/EffectConfig;->effectModels:[Lcom/ss/android/medialib/player/EffectModel;

    aput-object v3, v4, v2

    .line 134
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 141
    :cond_1
    iget-object p1, p0, Lcom/ss/android/medialib/player/EffectConfig;->effectModels:[Lcom/ss/android/medialib/player/EffectModel;

    new-instance v0, Lcom/ss/android/medialib/player/EffectModel;

    invoke-direct {v0, p2, p3, p3}, Lcom/ss/android/medialib/player/EffectModel;-><init>(III)V

    aput-object v0, p1, v3

    .line 142
    return-object p0
.end method

.method public setEffectModels([Lcom/ss/android/medialib/player/EffectModel;)Lcom/ss/android/medialib/player/EffectConfig;
    .locals 0

    .line 96
    iput-object p1, p0, Lcom/ss/android/medialib/player/EffectConfig;->effectModels:[Lcom/ss/android/medialib/player/EffectModel;

    .line 97
    return-object p0
.end method

.method public setEffectModels([Ljava/lang/String;)Lcom/ss/android/medialib/player/EffectConfig;
    .locals 7

    .line 106
    if-nez p1, :cond_0

    return-object p0

    .line 107
    :cond_0
    array-length v0, p1

    new-array v0, v0, [Lcom/ss/android/medialib/player/EffectModel;

    iput-object v0, p0, Lcom/ss/android/medialib/player/EffectConfig;->effectModels:[Lcom/ss/android/medialib/player/EffectModel;

    .line 108
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    array-length v2, p1

    if-ge v1, v2, :cond_2

    .line 109
    aget-object v2, p1, v1

    .line 110
    if-eqz v2, :cond_1

    .line 111
    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 112
    if-eqz v2, :cond_1

    array-length v3, v2

    const/4 v4, 0x3

    if-ne v3, v4, :cond_1

    .line 113
    new-instance v3, Lcom/ss/android/medialib/player/EffectModel;

    aget-object v4, v2, v0

    .line 114
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    const/4 v5, 0x1

    aget-object v5, v2, v5

    .line 115
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    const/4 v6, 0x2

    aget-object v2, v2, v6

    .line 116
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    invoke-direct {v3, v4, v5, v2}, Lcom/ss/android/medialib/player/EffectModel;-><init>(III)V

    .line 117
    iget-object v2, p0, Lcom/ss/android/medialib/player/EffectConfig;->effectModels:[Lcom/ss/android/medialib/player/EffectModel;

    aput-object v3, v2, v1

    .line 108
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 121
    :cond_2
    return-object p0
.end method

.method public setEffectType(I)Lcom/ss/android/medialib/player/EffectConfig;
    .locals 0

    .line 44
    iput p1, p0, Lcom/ss/android/medialib/player/EffectConfig;->effectType:I

    .line 45
    return-object p0
.end method

.method public setFilter(Ljava/lang/String;)Lcom/ss/android/medialib/player/EffectConfig;
    .locals 0

    .line 54
    iput-object p1, p0, Lcom/ss/android/medialib/player/EffectConfig;->leftFilter:Ljava/lang/String;

    .line 55
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/ss/android/medialib/player/EffectConfig;->rightFilter:Ljava/lang/String;

    .line 56
    const/high16 p1, 0x3f800000    # 1.0f

    iput p1, p0, Lcom/ss/android/medialib/player/EffectConfig;->pos:F

    .line 57
    return-object p0
.end method

.method public setFilter(Ljava/lang/String;Ljava/lang/String;F)Lcom/ss/android/medialib/player/EffectConfig;
    .locals 0

    .line 68
    iput-object p1, p0, Lcom/ss/android/medialib/player/EffectConfig;->leftFilter:Ljava/lang/String;

    .line 69
    iput-object p2, p0, Lcom/ss/android/medialib/player/EffectConfig;->rightFilter:Ljava/lang/String;

    .line 70
    iput p3, p0, Lcom/ss/android/medialib/player/EffectConfig;->pos:F

    .line 71
    return-object p0
.end method

.method public setSnowflakeFile(Ljava/lang/String;)V
    .locals 0

    .line 206
    iput-object p1, p0, Lcom/ss/android/medialib/player/EffectConfig;->snowflakeFile:Ljava/lang/String;

    .line 207
    return-void
.end method

.method public setVertigoFile(Ljava/lang/String;)V
    .locals 0

    .line 198
    iput-object p1, p0, Lcom/ss/android/medialib/player/EffectConfig;->vertigoFile:Ljava/lang/String;

    .line 199
    return-void
.end method
