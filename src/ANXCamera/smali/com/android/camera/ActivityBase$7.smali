.class Lcom/android/camera/ActivityBase$7;
.super Ljava/lang/Object;
.source "ActivityBase.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/ActivityBase;->onDestroy()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/ActivityBase;

.field final synthetic val$bitmap:Landroid/graphics/Bitmap;


# direct methods
.method constructor <init>(Lcom/android/camera/ActivityBase;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 607
    iput-object p1, p0, Lcom/android/camera/ActivityBase$7;->this$0:Lcom/android/camera/ActivityBase;

    iput-object p2, p0, Lcom/android/camera/ActivityBase$7;->val$bitmap:Landroid/graphics/Bitmap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 610
    iget-object v0, p0, Lcom/android/camera/ActivityBase$7;->val$bitmap:Landroid/graphics/Bitmap;

    invoke-static {v0}, Lcom/android/camera/Util;->saveLastFrameGaussian2File(Landroid/graphics/Bitmap;)V

    .line 611
    return-void
.end method
