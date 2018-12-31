.class public Lcom/ss/android/ttve/common/TEFileUtils;
.super Ljava/lang/Object;
.source "TEFileUtils.java"


# static fields
.field private static final DEFAULT_FOLDER_NAME:Ljava/lang/String; = "BDMedia"

.field protected static msFolderPath:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getPath()Ljava/lang/String;
    .locals 2

    .line 16
    sget-object v0, Lcom/ss/android/ttve/common/TEFileUtils;->msFolderPath:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 17
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "BDMedia"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/ss/android/ttve/common/TEFileUtils;->msFolderPath:Ljava/lang/String;

    .line 18
    new-instance v0, Ljava/io/File;

    sget-object v1, Lcom/ss/android/ttve/common/TEFileUtils;->msFolderPath:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 19
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 20
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-nez v0, :cond_0

    .line 21
    const/4 v0, 0x0

    return-object v0

    .line 26
    :cond_0
    sget-object v0, Lcom/ss/android/ttve/common/TEFileUtils;->msFolderPath:Ljava/lang/String;

    return-object v0
.end method
