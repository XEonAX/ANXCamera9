.class Lcom/android/camera/FileCompat$MarshmallowFileCompatImpl;
.super Lcom/android/camera/FileCompat$LollipopFileCompatImpl;
.source "FileCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/FileCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "MarshmallowFileCompatImpl"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 695
    invoke-direct {p0}, Lcom/android/camera/FileCompat$LollipopFileCompatImpl;-><init>()V

    return-void
.end method
