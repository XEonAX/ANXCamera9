.class public Lcom/android/camera/network/resource/DownloadState;
.super Ljava/lang/Object;
.source "DownloadState.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/network/resource/DownloadState$StateDownload;
    }
.end annotation


# static fields
.field public static final STATE_DOWNLOADING:I = 0x2

.field public static final STATE_DOWNLOAD_FAILED:I = 0x4

.field public static final STATE_DOWNLOAD_SUCCESS:I = 0x3

.field public static final STATE_EXIST:I = 0x1

.field public static final STATE_NEED_DOWNLOAD:I = 0x0

.field public static final STATE_VERIFIED:I = 0x5


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
