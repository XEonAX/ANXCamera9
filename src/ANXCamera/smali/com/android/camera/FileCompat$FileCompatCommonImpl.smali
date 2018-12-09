.class interface abstract Lcom/android/camera/FileCompat$FileCompatCommonImpl;
.super Ljava/lang/Object;
.source "FileCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/FileCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x608
    name = "FileCompatCommonImpl"
.end annotation


# virtual methods
.method public abstract getSDPath(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract getStorageAccessForLOLLIPOP(Landroid/app/Activity;Ljava/lang/String;)Z
.end method

.method public abstract getTreeUri(Ljava/lang/String;)Landroid/net/Uri;
.end method

.method public abstract handleActivityResult(Landroid/app/Activity;IILandroid/content/Intent;)Z
.end method

.method public abstract hasStoragePermission(Ljava/lang/String;)Z
.end method

.method public abstract isExternalSDFile(Ljava/lang/String;)Z
.end method

.method public abstract updateSDPath()V
.end method
