.class Lcom/xiaomi/camera/imagecodec/JpegEncoder$JpegEncoderHolder;
.super Ljava/lang/Object;
.source "JpegEncoder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/camera/imagecodec/JpegEncoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "JpegEncoderHolder"
.end annotation


# static fields
.field static sInstance:Lcom/xiaomi/camera/imagecodec/JpegEncoder;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 89
    new-instance v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;-><init>(Lcom/xiaomi/camera/imagecodec/JpegEncoder$1;)V

    sput-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$JpegEncoderHolder;->sInstance:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
