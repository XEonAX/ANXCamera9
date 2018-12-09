.class public Lcom/xiaomi/camera/parallelservice/util/ParallelExifUtil;
.super Ljava/lang/Object;
.source "ParallelExifUtil.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 26
    const-class v0, Lcom/xiaomi/camera/parallelservice/util/ParallelExifUtil;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/camera/parallelservice/util/ParallelExifUtil;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static updateExif(Ljava/lang/String;)V
    .locals 6

    .line 29
    sget-object v0, Lcom/xiaomi/camera/parallelservice/util/ParallelExifUtil;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "updateExif path:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 32
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 33
    sget-object v0, Lcom/xiaomi/camera/parallelservice/util/ParallelExifUtil;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "updateExif path not exist. "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    return-void

    .line 37
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ".tmp"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 38
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 40
    nop

    .line 41
    nop

    .line 43
    const/4 p0, 0x0

    :try_start_0
    invoke-virtual {v1}, Ljava/io/File;->createNewFile()Z

    .line 44
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 45
    :try_start_1
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 46
    :try_start_2
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v4

    long-to-int p0, v4

    new-array p0, p0, [B

    .line 47
    invoke-virtual {v2, p0}, Ljava/io/FileInputStream;->read([B)I

    .line 51
    invoke-static {p0}, Lcom/android/gallery3d/exif/ExifInterface;->removeParallelProcessComment([B)[B

    move-result-object p0

    .line 52
    invoke-virtual {v3, p0}, Ljava/io/FileOutputStream;->write([B)V

    .line 53
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V

    .line 54
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 55
    invoke-virtual {v1, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 60
    nop

    .line 61
    :try_start_3
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

    .line 63
    nop

    .line 64
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_5

    .line 56
    :catch_0
    move-exception p0

    goto :goto_2

    .line 59
    :catchall_0
    move-exception v0

    move-object v3, p0

    goto :goto_0

    .line 56
    :catch_1
    move-exception v0

    move-object v3, p0

    goto :goto_1

    .line 59
    :catchall_1
    move-exception v0

    move-object v2, p0

    move-object v3, v2

    :goto_0
    move-object p0, v0

    goto :goto_7

    .line 56
    :catch_2
    move-exception v0

    move-object v2, p0

    move-object v3, v2

    :goto_1
    move-object p0, v0

    .line 57
    :goto_2
    :try_start_4
    sget-object v0, Lcom/xiaomi/camera/parallelservice/util/ParallelExifUtil;->TAG:Ljava/lang/String;

    const-string v1, "process exif failed!"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 60
    if-eqz v2, :cond_1

    .line 61
    :try_start_5
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

    goto :goto_3

    .line 66
    :catch_3
    move-exception p0

    goto :goto_4

    .line 63
    :cond_1
    :goto_3
    if-eqz v3, :cond_2

    .line 64
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    goto :goto_5

    .line 66
    :goto_4
    nop

    .line 67
    sget-object v0, Lcom/xiaomi/camera/parallelservice/util/ParallelExifUtil;->TAG:Ljava/lang/String;

    const-string v1, "close image file failed!"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 69
    goto :goto_6

    .line 68
    :cond_2
    :goto_5
    nop

    .line 70
    :goto_6
    return-void

    .line 59
    :catchall_2
    move-exception p0

    .line 60
    :goto_7
    if-eqz v2, :cond_3

    .line 61
    :try_start_6
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

    goto :goto_8

    .line 66
    :catch_4
    move-exception v0

    goto :goto_9

    .line 63
    :cond_3
    :goto_8
    if-eqz v3, :cond_4

    .line 64
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    goto :goto_a

    .line 66
    :goto_9
    nop

    .line 67
    sget-object v1, Lcom/xiaomi/camera/parallelservice/util/ParallelExifUtil;->TAG:Ljava/lang/String;

    const-string v2, "close image file failed!"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    nop

    .line 68
    :cond_4
    :goto_a
    throw p0
.end method
