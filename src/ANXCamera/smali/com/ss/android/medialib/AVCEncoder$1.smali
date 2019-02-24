.class final Lcom/ss/android/medialib/AVCEncoder$1;
.super Ljava/lang/Object;
.source "AVCEncoder.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/android/medialib/AVCEncoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .line 75
    invoke-static {}, Landroid/media/MediaCodecList;->getCodecCount()I

    .line 76
    return-void
.end method
