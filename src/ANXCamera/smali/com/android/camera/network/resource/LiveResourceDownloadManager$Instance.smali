.class Lcom/android/camera/network/resource/LiveResourceDownloadManager$Instance;
.super Ljava/lang/Object;
.source "LiveResourceDownloadManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/network/resource/LiveResourceDownloadManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Instance"
.end annotation


# static fields
.field public static mInstance:Lcom/android/camera/network/resource/LiveResourceDownloadManager;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 21
    new-instance v0, Lcom/android/camera/network/resource/LiveResourceDownloadManager;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/android/camera/network/resource/LiveResourceDownloadManager;-><init>(Lcom/android/camera/network/resource/LiveResourceDownloadManager$1;)V

    sput-object v0, Lcom/android/camera/network/resource/LiveResourceDownloadManager$Instance;->mInstance:Lcom/android/camera/network/resource/LiveResourceDownloadManager;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
