.class public Lcom/android/camera/sticker/FileUtils;
.super Ljava/lang/Object;
.source "FileUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static copyFileIfNeed(Landroid/content/Context;Ljava/io/File;Ljava/lang/String;)Z
    .locals 3

    .line 16
    if-eqz p1, :cond_a

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_a

    .line 17
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    .line 18
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 19
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 21
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_a

    .line 22
    nop

    .line 23
    nop

    .line 25
    const/4 v0, 0x0

    const/4 v1, 0x0

    :try_start_0
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 26
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 28
    :cond_1
    invoke-virtual {p1}, Ljava/io/File;->createNewFile()Z

    .line 29
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_5
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 30
    if-nez p0, :cond_3

    .line 31
    nop

    .line 45
    if-eqz p0, :cond_2

    .line 47
    :try_start_1
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 50
    goto :goto_0

    .line 48
    :catch_0
    move-exception p0

    .line 49
    invoke-virtual {p0}, Ljava/io/IOException;->printStackTrace()V

    .line 52
    :cond_2
    :goto_0
    nop

    .line 31
    return v1

    .line 33
    :cond_3
    :try_start_2
    new-instance p2, Ljava/io/FileOutputStream;

    invoke-direct {p2, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_4
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 34
    const/16 v0, 0x1000

    :try_start_3
    new-array v0, v0, [B

    .line 36
    :goto_1
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v2

    if-lez v2, :cond_4

    .line 37
    invoke-virtual {p2, v0, v1, v2}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_1

    .line 39
    :cond_4
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 40
    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 45
    if-eqz p0, :cond_5

    .line 47
    :try_start_4
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    .line 50
    goto :goto_2

    .line 48
    :catch_1
    move-exception p0

    .line 49
    invoke-virtual {p0}, Ljava/io/IOException;->printStackTrace()V

    .line 52
    :cond_5
    :goto_2
    nop

    .line 54
    :try_start_5
    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    .line 57
    :goto_3
    goto :goto_c

    .line 55
    :catch_2
    move-exception p0

    .line 56
    invoke-virtual {p0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_3

    .line 45
    :catchall_0
    move-exception p1

    goto :goto_8

    .line 41
    :catch_3
    move-exception v0

    goto :goto_4

    .line 45
    :catchall_1
    move-exception p1

    goto :goto_9

    .line 41
    :catch_4
    move-exception p2

    move-object p2, v0

    :goto_4
    move-object v0, p0

    goto :goto_5

    .line 45
    :catchall_2
    move-exception p0

    move-object p1, p0

    move-object p0, v0

    goto :goto_9

    .line 41
    :catch_5
    move-exception p0

    move-object p2, v0

    .line 42
    :goto_5
    :try_start_6
    invoke-virtual {p1}, Ljava/io/File;->delete()Z
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 43
    nop

    .line 45
    if-eqz v0, :cond_6

    .line 47
    :try_start_7
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_6

    .line 50
    goto :goto_6

    .line 48
    :catch_6
    move-exception p0

    .line 49
    invoke-virtual {p0}, Ljava/io/IOException;->printStackTrace()V

    .line 52
    :cond_6
    :goto_6
    if-eqz p2, :cond_7

    .line 54
    :try_start_8
    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_7

    .line 57
    goto :goto_7

    .line 55
    :catch_7
    move-exception p0

    .line 56
    invoke-virtual {p0}, Ljava/io/IOException;->printStackTrace()V

    .line 43
    :cond_7
    :goto_7
    return v1

    .line 45
    :catchall_3
    move-exception p0

    move-object p1, p0

    move-object p0, v0

    :goto_8
    move-object v0, p2

    :goto_9
    if-eqz p0, :cond_8

    .line 47
    :try_start_9
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_8

    .line 50
    goto :goto_a

    .line 48
    :catch_8
    move-exception p0

    .line 49
    invoke-virtual {p0}, Ljava/io/IOException;->printStackTrace()V

    .line 52
    :cond_8
    :goto_a
    if-eqz v0, :cond_9

    .line 54
    :try_start_a
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_9

    .line 57
    goto :goto_b

    .line 55
    :catch_9
    move-exception p0

    .line 56
    invoke-virtual {p0}, Ljava/io/IOException;->printStackTrace()V

    .line 57
    :cond_9
    :goto_b
    throw p1

    .line 62
    :cond_a
    :goto_c
    const/4 p0, 0x1

    return p0
.end method
