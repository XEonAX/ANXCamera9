.class interface abstract Lcom/android/camera/FileCompat$FileCompatOperateImpl;
.super Ljava/lang/Object;
.source "FileCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/FileCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x608
    name = "FileCompatOperateImpl"
.end annotation


# virtual methods
.method public abstract copyFile(Ljava/lang/String;Ljava/lang/String;)Z
.end method

.method public abstract createNewFile(Ljava/lang/String;)Z
.end method

.method public abstract createNewFileFixPath(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract createNewFileWrapper(Ljava/lang/String;)Lcom/android/camera/FileCompat$FileWrapper;
.end method

.method public abstract deleteFile(Ljava/lang/String;)Z
.end method

.method public abstract exists(Ljava/lang/String;)Z
.end method

.method public abstract getFileOutputStream(Ljava/lang/String;Z)Ljava/io/OutputStream;
.end method

.method public abstract getParcelFileDescriptor(Ljava/lang/String;Z)Landroid/os/ParcelFileDescriptor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract mkdirs(Ljava/lang/String;)Z
.end method

.method public abstract renameFile(Ljava/lang/String;Ljava/lang/String;)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
