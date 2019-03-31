.class final Lcom/xiaomi/camera/liveshot/util/HandlerHelper$ObjectX;
.super Ljava/lang/Object;
.source "HandlerHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/camera/liveshot/util/HandlerHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ObjectX"
.end annotation


# instance fields
.field private final handler:Landroid/os/Handler;

.field private final object:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Landroid/os/Handler;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/xiaomi/camera/liveshot/util/HandlerHelper$ObjectX;->object:Ljava/lang/Object;

    iput-object p2, p0, Lcom/xiaomi/camera/liveshot/util/HandlerHelper$ObjectX;->handler:Landroid/os/Handler;

    return-void
.end method
