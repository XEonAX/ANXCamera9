.class Lcom/android/camera/FileCompat$KitKatFileCompatCommonImpl;
.super Ljava/lang/Object;
.source "FileCompat.java"

# interfaces
.implements Lcom/android/camera/FileCompat$FileCompatCommonImpl;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/FileCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "KitKatFileCompatCommonImpl"
.end annotation


# instance fields
.field protected accessSDPath:Ljava/lang/String;

.field protected sdPaths:[Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 225
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 226
    invoke-virtual {p0}, Lcom/android/camera/FileCompat$KitKatFileCompatCommonImpl;->update()V

    .line 227
    return-void
.end method


# virtual methods
.method protected getExtSDCardPaths()[Ljava/lang/String;
    .locals 9
    .annotation build Landroid/annotation/TargetApi;
        value = 0x13
    .end annotation

    .line 236
    const/4 v0, 0x0

    new-array v1, v0, [Ljava/lang/String;

    .line 238
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "ExternalTest"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getExternalFilesDirs(Ljava/lang/String;)[Ljava/io/File;

    move-result-object v2

    .line 240
    if-nez v2, :cond_0

    .line 241
    return-object v1

    .line 244
    :cond_0
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    .line 245
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 246
    array-length v5, v2

    move v6, v0

    :goto_0
    if-ge v6, v5, :cond_4

    aget-object v7, v2, v6

    .line 247
    if-nez v7, :cond_1

    .line 248
    goto :goto_1

    .line 250
    :cond_1
    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    .line 251
    const-string v8, "/Android/data"

    invoke-virtual {v7, v8}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v8

    .line 252
    if-gtz v8, :cond_2

    .line 253
    goto :goto_1

    .line 255
    :cond_2
    invoke-virtual {v7, v0, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 256
    invoke-virtual {v3, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 257
    goto :goto_1

    .line 260
    :cond_3
    invoke-interface {v4, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 246
    :goto_1
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 263
    :cond_4
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_5

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-interface {v4, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, [Ljava/lang/String;

    :cond_5
    return-object v1
.end method

.method public getSDPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    .line 284
    iget-object v0, p0, Lcom/android/camera/FileCompat$KitKatFileCompatCommonImpl;->sdPaths:[Ljava/lang/String;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 285
    return-object v1

    .line 287
    :cond_0
    iget-object v0, p0, Lcom/android/camera/FileCompat$KitKatFileCompatCommonImpl;->sdPaths:[Ljava/lang/String;

    array-length v2, v0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_2

    aget-object v4, v0, v3

    .line 288
    invoke-virtual {p1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 289
    return-object v4

    .line 287
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 292
    :cond_2
    return-object v1
.end method

.method public getStorageAccessForLOLLIPOP(Landroid/app/Activity;Ljava/lang/String;)Z
    .locals 0

    .line 297
    const/4 p1, 0x0

    return p1
.end method

.method public getTreeUri(Ljava/lang/String;)Landroid/net/Uri;
    .locals 0

    .line 309
    const/4 p1, 0x0

    return-object p1
.end method

.method public handleActivityResult(Landroid/app/Activity;IILandroid/content/Intent;)Z
    .locals 0

    .line 303
    const/4 p1, 0x0

    return p1
.end method

.method public hasStoragePermission(Ljava/lang/String;)Z
    .locals 0

    .line 314
    const/4 p1, 0x1

    return p1
.end method

.method public isExternalSDFile(Ljava/lang/String;)Z
    .locals 5

    .line 269
    iget-object v0, p0, Lcom/android/camera/FileCompat$KitKatFileCompatCommonImpl;->sdPaths:[Ljava/lang/String;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 270
    return v1

    .line 273
    :cond_0
    iget-object v0, p0, Lcom/android/camera/FileCompat$KitKatFileCompatCommonImpl;->sdPaths:[Ljava/lang/String;

    array-length v2, v0

    move v3, v1

    :goto_0
    if-ge v3, v2, :cond_2

    aget-object v4, v0, v3

    .line 274
    invoke-virtual {p1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 275
    const/4 p1, 0x1

    return p1

    .line 273
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 278
    :cond_2
    return v1
.end method

.method protected update()V
    .locals 1

    .line 230
    invoke-virtual {p0}, Lcom/android/camera/FileCompat$KitKatFileCompatCommonImpl;->getExtSDCardPaths()[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/FileCompat$KitKatFileCompatCommonImpl;->sdPaths:[Ljava/lang/String;

    .line 231
    return-void
.end method

.method public updateSDPath()V
    .locals 0

    .line 321
    invoke-virtual {p0}, Lcom/android/camera/FileCompat$KitKatFileCompatCommonImpl;->update()V

    .line 322
    return-void
.end method
