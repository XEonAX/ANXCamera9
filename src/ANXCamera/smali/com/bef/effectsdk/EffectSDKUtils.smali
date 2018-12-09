.class public Lcom/bef/effectsdk/EffectSDKUtils;
.super Ljava/lang/Object;
.source "EffectSDKUtils.java"


# static fields
.field private static assetFiles:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static localFiles:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static needRemoveFiles:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 16
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/bef/effectsdk/EffectSDKUtils;->localFiles:Ljava/util/Set;

    .line 17
    sget-object v0, Lcom/bef/effectsdk/ModelsList;->list:Ljava/util/List;

    sput-object v0, Lcom/bef/effectsdk/EffectSDKUtils;->assetFiles:Ljava/util/List;

    .line 18
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/bef/effectsdk/EffectSDKUtils;->needRemoveFiles:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static copyAssets(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;Z)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 104
    sget-object v0, Lcom/bef/effectsdk/EffectSDKUtils;->needRemoveFiles:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 105
    sget-object v0, Lcom/bef/effectsdk/EffectSDKUtils;->needRemoveFiles:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 107
    :cond_0
    sget-object v0, Lcom/bef/effectsdk/EffectSDKUtils;->localFiles:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 108
    sget-object v2, Lcom/bef/effectsdk/EffectSDKUtils;->needRemoveFiles:Ljava/util/Set;

    invoke-static {v1}, Lcom/bef/effectsdk/EffectSDKUtils;->getFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v2, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 109
    goto :goto_0

    .line 110
    :cond_1
    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 111
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "/"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 114
    :cond_2
    sget-object v0, Lcom/bef/effectsdk/EffectSDKUtils;->assetFiles:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_8

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 115
    invoke-static {v1}, Lcom/bef/effectsdk/EffectSDKUtils;->getFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 117
    nop

    .line 118
    sget-object v3, Lcom/bef/effectsdk/EffectSDKUtils;->needRemoveFiles:Ljava/util/Set;

    invoke-interface {v3, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz v3, :cond_3

    new-instance v3, Ljava/io/File;

    invoke-static {v1}, Lcom/bef/effectsdk/EffectSDKUtils;->getAssetRelativePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, p1, v6}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 119
    sget-object v3, Lcom/bef/effectsdk/EffectSDKUtils;->needRemoveFiles:Ljava/util/Set;

    invoke-interface {v3, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 120
    nop

    .line 123
    move v3, v4

    goto :goto_2

    :cond_3
    move v3, v5

    :goto_2
    if-eqz v3, :cond_7

    .line 124
    nop

    .line 125
    if-eqz p2, :cond_5

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_5

    .line 126
    array-length v3, p2

    move v6, v4

    :goto_3
    if-ge v6, v3, :cond_5

    aget-object v7, p2, v6

    .line 127
    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 128
    nop

    .line 129
    nop

    .line 133
    move v4, v5

    goto :goto_4

    .line 126
    :cond_4
    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    .line 133
    :cond_5
    :goto_4
    if-eqz v4, :cond_6

    if-eqz p3, :cond_6

    .line 134
    invoke-static {p0, v1, p1}, Lcom/bef/effectsdk/EffectSDKUtils;->copyFile(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 136
    :cond_6
    if-nez v4, :cond_7

    if-nez p3, :cond_7

    .line 137
    invoke-static {p0, v1, p1}, Lcom/bef/effectsdk/EffectSDKUtils;->copyFile(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 141
    :cond_7
    goto :goto_1

    .line 142
    :cond_8
    return-void
.end method

.method private static copyFile(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 145
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p0

    .line 147
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "model"

    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p2

    add-int/lit8 p2, p2, 0x6

    const-string v1, "/"

    invoke-virtual {p1, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p1, p2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 148
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 149
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 150
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 152
    :cond_0
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "/"

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Lcom/bef/effectsdk/EffectSDKUtils;->getFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 153
    new-instance p1, Ljava/io/FileOutputStream;

    invoke-direct {p1, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 154
    const/16 p2, 0x400

    new-array p2, p2, [B

    .line 156
    :goto_0
    invoke-virtual {p0, p2}, Ljava/io/InputStream;->read([B)I

    move-result v0

    if-lez v0, :cond_1

    .line 157
    const/4 v1, 0x0

    invoke-virtual {p1, p2, v1, v0}, Ljava/io/FileOutputStream;->write([BII)V

    goto :goto_0

    .line 159
    :cond_1
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 160
    invoke-virtual {p1}, Ljava/io/FileOutputStream;->close()V

    .line 162
    return-void
.end method

.method private static deleteNoUseModel()V
    .locals 4

    .line 194
    sget-object v0, Lcom/bef/effectsdk/EffectSDKUtils;->localFiles:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 195
    sget-object v2, Lcom/bef/effectsdk/EffectSDKUtils;->needRemoveFiles:Ljava/util/Set;

    invoke-static {v1}, Lcom/bef/effectsdk/EffectSDKUtils;->getFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 196
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 197
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 198
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 201
    :cond_0
    goto :goto_0

    .line 202
    :cond_1
    return-void
.end method

.method public static flushAlgorithmModelFiles(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 21
    sget-object v0, Lcom/bef/effectsdk/EffectSDKUtils;->localFiles:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 22
    sget-object v0, Lcom/bef/effectsdk/EffectSDKUtils;->localFiles:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 24
    :cond_0
    sget-object v0, Lcom/bef/effectsdk/EffectSDKUtils;->localFiles:Ljava/util/Set;

    invoke-static {p1, v0}, Lcom/bef/effectsdk/EffectSDKUtils;->scanRecursive(Ljava/lang/String;Ljava/util/Set;)V

    .line 25
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1}, Lcom/bef/effectsdk/EffectSDKUtils;->copyAssets(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;Z)V

    .line 26
    invoke-static {}, Lcom/bef/effectsdk/EffectSDKUtils;->deleteNoUseModel()V

    .line 27
    sget-object p0, Lcom/bef/effectsdk/EffectSDKUtils;->localFiles:Ljava/util/Set;

    invoke-interface {p0}, Ljava/util/Set;->clear()V

    .line 28
    return-void
.end method

.method public static flushAlgorithmModelFiles(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 38
    sget-object v0, Lcom/bef/effectsdk/EffectSDKUtils;->localFiles:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 39
    sget-object v0, Lcom/bef/effectsdk/EffectSDKUtils;->localFiles:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 41
    :cond_0
    sget-object v0, Lcom/bef/effectsdk/EffectSDKUtils;->localFiles:Ljava/util/Set;

    invoke-static {p1, v0}, Lcom/bef/effectsdk/EffectSDKUtils;->scanRecursive(Ljava/lang/String;Ljava/util/Set;)V

    .line 42
    invoke-static {p0, p1, p2, p3}, Lcom/bef/effectsdk/EffectSDKUtils;->copyAssets(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;Z)V

    .line 43
    invoke-static {}, Lcom/bef/effectsdk/EffectSDKUtils;->deleteNoUseModel()V

    .line 44
    sget-object p0, Lcom/bef/effectsdk/EffectSDKUtils;->localFiles:Ljava/util/Set;

    invoke-interface {p0}, Ljava/util/Set;->clear()V

    .line 45
    return-void
.end method

.method private static getAssetRelativePath(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 181
    nop

    .line 182
    const-string v0, "model/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 183
    if-ltz v0, :cond_0

    .line 184
    const-string v1, "model/"

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/2addr v0, v1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 187
    :cond_0
    return-object p0
.end method

.method private static getFileName(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 165
    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    .line 166
    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 167
    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 169
    :cond_0
    const-string p0, ""

    return-object p0
.end method

.method public static needUpdate(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 2

    .line 85
    sget-object p0, Lcom/bef/effectsdk/EffectSDKUtils;->localFiles:Ljava/util/Set;

    invoke-interface {p0}, Ljava/util/Set;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_0

    .line 86
    sget-object p0, Lcom/bef/effectsdk/EffectSDKUtils;->localFiles:Ljava/util/Set;

    invoke-interface {p0}, Ljava/util/Set;->clear()V

    .line 88
    :cond_0
    sget-object p0, Lcom/bef/effectsdk/EffectSDKUtils;->localFiles:Ljava/util/Set;

    invoke-static {p1, p0}, Lcom/bef/effectsdk/EffectSDKUtils;->scanNameRecursive(Ljava/lang/String;Ljava/util/Set;)V

    .line 90
    const/4 p0, 0x1

    :try_start_0
    sget-object p1, Lcom/bef/effectsdk/EffectSDKUtils;->assetFiles:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    sget-object v0, Lcom/bef/effectsdk/EffectSDKUtils;->localFiles:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    if-le p1, v0, :cond_1

    return p0

    .line 91
    :cond_1
    sget-object p1, Lcom/bef/effectsdk/EffectSDKUtils;->assetFiles:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 92
    sget-object v1, Lcom/bef/effectsdk/EffectSDKUtils;->localFiles:Ljava/util/Set;

    invoke-static {v0}, Lcom/bef/effectsdk/EffectSDKUtils;->getFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    if-nez v0, :cond_2

    .line 93
    return p0

    .line 95
    :cond_2
    goto :goto_0

    .line 99
    :cond_3
    nop

    .line 100
    const/4 p0, 0x0

    return p0

    .line 96
    :catch_0
    move-exception p1

    .line 97
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 98
    return p0
.end method

.method private static scanNameRecursive(Ljava/lang/String;Ljava/util/Set;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 48
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 49
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p0

    if-nez p0, :cond_0

    return-void

    .line 50
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object p0

    .line 51
    if-eqz p0, :cond_2

    .line 52
    array-length v0, p0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_2

    aget-object v2, p0, v1

    .line 53
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 54
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, p1}, Lcom/bef/effectsdk/EffectSDKUtils;->scanNameRecursive(Ljava/lang/String;Ljava/util/Set;)V

    goto :goto_1

    .line 56
    :cond_1
    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 52
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 60
    :cond_2
    return-void
.end method

.method private static scanRecursive(Ljava/lang/String;Ljava/util/Set;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 63
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 64
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p0

    if-nez p0, :cond_0

    return-void

    .line 65
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object p0

    .line 66
    if-eqz p0, :cond_2

    .line 67
    array-length v0, p0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_2

    aget-object v2, p0, v1

    .line 68
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 69
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, p1}, Lcom/bef/effectsdk/EffectSDKUtils;->scanRecursive(Ljava/lang/String;Ljava/util/Set;)V

    goto :goto_1

    .line 71
    :cond_1
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 67
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 75
    :cond_2
    return-void
.end method
