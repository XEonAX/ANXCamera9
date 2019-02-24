.class Lcom/android/camera/FileCompat$FileWrapper;
.super Ljava/lang/Object;
.source "FileCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/FileCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "FileWrapper"
.end annotation


# instance fields
.field documentFile:Landroid/support/v4/provider/DocumentFile;

.field legacyFile:Ljava/io/File;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getLength()J
    .locals 2

    .line 100
    iget-object v0, p0, Lcom/android/camera/FileCompat$FileWrapper;->legacyFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v0

    return-wide v0
.end method
