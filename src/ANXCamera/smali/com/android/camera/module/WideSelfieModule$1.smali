.class Lcom/android/camera/module/WideSelfieModule$1;
.super Ljava/lang/Object;
.source "WideSelfieModule.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/WideSelfieModule;->onPreviewUpdate([BIILandroid/graphics/Rect;Landroid/graphics/Rect;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/WideSelfieModule;

.field final synthetic val$bmpRect:Landroid/graphics/Rect;

.field final synthetic val$currentRect:Landroid/graphics/Rect;

.field final synthetic val$result:Landroid/graphics/Bitmap;


# direct methods
.method constructor <init>(Lcom/android/camera/module/WideSelfieModule;Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/module/WideSelfieModule$1;->this$0:Lcom/android/camera/module/WideSelfieModule;

    iput-object p2, p0, Lcom/android/camera/module/WideSelfieModule$1;->val$result:Landroid/graphics/Bitmap;

    iput-object p3, p0, Lcom/android/camera/module/WideSelfieModule$1;->val$bmpRect:Landroid/graphics/Rect;

    iput-object p4, p0, Lcom/android/camera/module/WideSelfieModule$1;->val$currentRect:Landroid/graphics/Rect;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xd8

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$WideSelfieProtocol;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/android/camera/module/WideSelfieModule$1;->val$result:Landroid/graphics/Bitmap;

    iget-object v2, p0, Lcom/android/camera/module/WideSelfieModule$1;->val$bmpRect:Landroid/graphics/Rect;

    iget-object v3, p0, Lcom/android/camera/module/WideSelfieModule$1;->val$currentRect:Landroid/graphics/Rect;

    invoke-interface {v0, v1, v2, v3}, Lcom/android/camera/protocol/ModeProtocol$WideSelfieProtocol;->updatePreviewBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;)V

    :cond_0
    return-void
.end method
