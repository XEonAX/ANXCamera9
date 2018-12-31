.class public Lcom/android/camera/FileCompat;
.super Ljava/lang/Object;
.source "FileCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/FileCompat$MarshmallowFileCompatImpl;,
        Lcom/android/camera/FileCompat$LollipopFileCompatImpl;,
        Lcom/android/camera/FileCompat$BaseFileCompatImpl;,
        Lcom/android/camera/FileCompat$KitKatFileCompatCommonImpl;,
        Lcom/android/camera/FileCompat$LollipopFileCompatCommonImpl;,
        Lcom/android/camera/FileCompat$FileWrapper;,
        Lcom/android/camera/FileCompat$FileCompatOperateImpl;,
        Lcom/android/camera/FileCompat$FileCompatCommonImpl;
    }
.end annotation


# static fields
.field static final IMPL_COMMON:Lcom/android/camera/FileCompat$FileCompatCommonImpl;

.field static final IMPL_OPERATE:Lcom/android/camera/FileCompat$FileCompatOperateImpl;

.field public static final REQUEST_CODE_OPEN_EXTERNAL_DOCUMENT_PERMISSION:I = 0xa1

.field public static final TAG:Ljava/lang/String; = "FileCompat"


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 44
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 46
    const/16 v1, 0x1c

    if-lt v0, v1, :cond_0

    .line 47
    new-instance v0, Lcom/android/camera/FileCompat$LollipopFileCompatCommonImpl;

    invoke-direct {v0}, Lcom/android/camera/FileCompat$LollipopFileCompatCommonImpl;-><init>()V

    sput-object v0, Lcom/android/camera/FileCompat;->IMPL_COMMON:Lcom/android/camera/FileCompat$FileCompatCommonImpl;

    .line 48
    new-instance v0, Lcom/android/camera/FileCompat$MarshmallowFileCompatImpl;

    invoke-direct {v0}, Lcom/android/camera/FileCompat$MarshmallowFileCompatImpl;-><init>()V

    sput-object v0, Lcom/android/camera/FileCompat;->IMPL_OPERATE:Lcom/android/camera/FileCompat$FileCompatOperateImpl;

    goto :goto_0

    .line 50
    :cond_0
    new-instance v0, Lcom/android/camera/FileCompat$KitKatFileCompatCommonImpl;

    invoke-direct {v0}, Lcom/android/camera/FileCompat$KitKatFileCompatCommonImpl;-><init>()V

    sput-object v0, Lcom/android/camera/FileCompat;->IMPL_COMMON:Lcom/android/camera/FileCompat$FileCompatCommonImpl;

    .line 51
    new-instance v0, Lcom/android/camera/FileCompat$BaseFileCompatImpl;

    invoke-direct {v0}, Lcom/android/camera/FileCompat$BaseFileCompatImpl;-><init>()V

    sput-object v0, Lcom/android/camera/FileCompat;->IMPL_OPERATE:Lcom/android/camera/FileCompat$FileCompatOperateImpl;

    .line 53
    :goto_0
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 35
    invoke-static {p0}, Lcom/android/camera/FileCompat;->getSDPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Ljava/lang/String;)Landroid/net/Uri;
    .locals 0

    .line 35
    invoke-static {p0}, Lcom/android/camera/FileCompat;->getTreeUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$200(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 35
    invoke-static {p0}, Lcom/android/camera/FileCompat;->getMimeTypeFromPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static copyFile(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1

    .line 732
    sget-object v0, Lcom/android/camera/FileCompat;->IMPL_OPERATE:Lcom/android/camera/FileCompat$FileCompatOperateImpl;

    invoke-interface {v0, p0, p1}, Lcom/android/camera/FileCompat$FileCompatOperateImpl;->copyFile(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static createNewFile(Ljava/lang/String;)Z
    .locals 1

    .line 705
    sget-object v0, Lcom/android/camera/FileCompat;->IMPL_OPERATE:Lcom/android/camera/FileCompat$FileCompatOperateImpl;

    invoke-interface {v0, p0}, Lcom/android/camera/FileCompat$FileCompatOperateImpl;->createNewFile(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static createNewFileFixPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 701
    sget-object v0, Lcom/android/camera/FileCompat;->IMPL_OPERATE:Lcom/android/camera/FileCompat$FileCompatOperateImpl;

    invoke-interface {v0, p0}, Lcom/android/camera/FileCompat$FileCompatOperateImpl;->createNewFileFixPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static deleteFile(Ljava/lang/String;)Z
    .locals 1

    .line 709
    sget-object v0, Lcom/android/camera/FileCompat;->IMPL_OPERATE:Lcom/android/camera/FileCompat$FileCompatOperateImpl;

    invoke-interface {v0, p0}, Lcom/android/camera/FileCompat$FileCompatOperateImpl;->deleteFile(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static exists(Ljava/lang/String;)Z
    .locals 1

    .line 696
    sget-object v0, Lcom/android/camera/FileCompat;->IMPL_OPERATE:Lcom/android/camera/FileCompat$FileCompatOperateImpl;

    invoke-interface {v0, p0}, Lcom/android/camera/FileCompat$FileCompatOperateImpl;->exists(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static getFileOutputStream(Ljava/lang/String;Z)Ljava/io/OutputStream;
    .locals 1

    .line 722
    sget-object v0, Lcom/android/camera/FileCompat;->IMPL_OPERATE:Lcom/android/camera/FileCompat$FileCompatOperateImpl;

    invoke-interface {v0, p0, p1}, Lcom/android/camera/FileCompat$FileCompatOperateImpl;->getFileOutputStream(Ljava/lang/String;Z)Ljava/io/OutputStream;

    move-result-object p0

    return-object p0
.end method

.method private static getMimeTypeFromPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 748
    const-string v0, "."

    invoke-virtual {p0, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    .line 749
    const/4 v1, 0x0

    if-gez v0, :cond_0

    .line 750
    return-object v1

    .line 752
    :cond_0
    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    .line 755
    const-string v0, "jpg"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    const-string v0, "jpeg"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 757
    :cond_1
    const-string v0, "png"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 758
    const-string p0, "image/png"

    return-object p0

    .line 759
    :cond_2
    const-string v0, "mp4"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3

    .line 760
    const-string p0, "video/mp4"

    return-object p0

    .line 763
    :cond_3
    return-object v1

    .line 756
    :cond_4
    :goto_0
    const-string p0, "image/jpeg"

    return-object p0
.end method

.method public static getParcelFileDescriptor(Ljava/lang/String;Z)Landroid/os/ParcelFileDescriptor;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 728
    sget-object v0, Lcom/android/camera/FileCompat;->IMPL_OPERATE:Lcom/android/camera/FileCompat$FileCompatOperateImpl;

    invoke-interface {v0, p0, p1}, Lcom/android/camera/FileCompat$FileCompatOperateImpl;->getParcelFileDescriptor(Ljava/lang/String;Z)Landroid/os/ParcelFileDescriptor;

    move-result-object p0

    return-object p0
.end method

.method private static getSDPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 740
    sget-object v0, Lcom/android/camera/FileCompat;->IMPL_COMMON:Lcom/android/camera/FileCompat$FileCompatCommonImpl;

    invoke-interface {v0, p0}, Lcom/android/camera/FileCompat$FileCompatCommonImpl;->getSDPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getStorageAccessForLOLLIPOP(Landroid/app/Activity;Ljava/lang/String;)Z
    .locals 1
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .line 780
    sget-object v0, Lcom/android/camera/FileCompat;->IMPL_COMMON:Lcom/android/camera/FileCompat$FileCompatCommonImpl;

    invoke-interface {v0, p0, p1}, Lcom/android/camera/FileCompat$FileCompatCommonImpl;->getStorageAccessForLOLLIPOP(Landroid/app/Activity;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method private static getTreeUri(Ljava/lang/String;)Landroid/net/Uri;
    .locals 1

    .line 744
    sget-object v0, Lcom/android/camera/FileCompat;->IMPL_COMMON:Lcom/android/camera/FileCompat$FileCompatCommonImpl;

    invoke-interface {v0, p0}, Lcom/android/camera/FileCompat$FileCompatCommonImpl;->getTreeUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method public static handleActivityResult(Landroid/app/Activity;IILandroid/content/Intent;)Z
    .locals 1
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .line 785
    sget-object v0, Lcom/android/camera/FileCompat;->IMPL_COMMON:Lcom/android/camera/FileCompat$FileCompatCommonImpl;

    invoke-interface {v0, p0, p1, p2, p3}, Lcom/android/camera/FileCompat$FileCompatCommonImpl;->handleActivityResult(Landroid/app/Activity;IILandroid/content/Intent;)Z

    move-result p0

    return p0
.end method

.method public static hasStoragePermission(Ljava/lang/String;)Z
    .locals 1
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .line 775
    sget-object v0, Lcom/android/camera/FileCompat;->IMPL_COMMON:Lcom/android/camera/FileCompat$FileCompatCommonImpl;

    invoke-interface {v0, p0}, Lcom/android/camera/FileCompat$FileCompatCommonImpl;->hasStoragePermission(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static isSDFile(Ljava/lang/String;)Z
    .locals 1
    .annotation build Landroid/annotation/TargetApi;
        value = 0x13
    .end annotation

    .line 769
    sget-object v0, Lcom/android/camera/FileCompat;->IMPL_COMMON:Lcom/android/camera/FileCompat$FileCompatCommonImpl;

    invoke-interface {v0, p0}, Lcom/android/camera/FileCompat$FileCompatCommonImpl;->isExternalSDFile(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static mkdirs(Ljava/lang/String;)Z
    .locals 1

    .line 717
    sget-object v0, Lcom/android/camera/FileCompat;->IMPL_OPERATE:Lcom/android/camera/FileCompat$FileCompatOperateImpl;

    invoke-interface {v0, p0}, Lcom/android/camera/FileCompat$FileCompatOperateImpl;->mkdirs(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static renameFile(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 713
    sget-object v0, Lcom/android/camera/FileCompat;->IMPL_OPERATE:Lcom/android/camera/FileCompat$FileCompatOperateImpl;

    invoke-interface {v0, p0, p1}, Lcom/android/camera/FileCompat$FileCompatOperateImpl;->renameFile(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static updateSDPath()V
    .locals 1
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .line 790
    sget-object v0, Lcom/android/camera/FileCompat;->IMPL_COMMON:Lcom/android/camera/FileCompat$FileCompatCommonImpl;

    invoke-interface {v0}, Lcom/android/camera/FileCompat$FileCompatCommonImpl;->updateSDPath()V

    .line 791
    return-void
.end method
