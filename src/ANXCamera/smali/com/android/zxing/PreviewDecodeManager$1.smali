.class Lcom/android/zxing/PreviewDecodeManager$1;
.super Ljava/lang/Object;
.source "PreviewDecodeManager.java"

# interfaces
.implements Lcom/android/camera2/Camera2Proxy$PreviewCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/zxing/PreviewDecodeManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/zxing/PreviewDecodeManager;


# direct methods
.method constructor <init>(Lcom/android/zxing/PreviewDecodeManager;)V
    .locals 0

    .line 27
    iput-object p1, p0, Lcom/android/zxing/PreviewDecodeManager$1;->this$0:Lcom/android/zxing/PreviewDecodeManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreviewFrame(Landroid/media/Image;Lcom/android/camera2/Camera2Proxy;I)V
    .locals 4

    .line 31
    nop

    .line 32
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 33
    iget-object v0, p0, Lcom/android/zxing/PreviewDecodeManager$1;->this$0:Lcom/android/zxing/PreviewDecodeManager;

    invoke-static {v0}, Lcom/android/zxing/PreviewDecodeManager;->access$000(Lcom/android/zxing/PreviewDecodeManager;)Ljava/util/HashMap;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 34
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/zxing/Decoder;

    .line 35
    invoke-virtual {v2}, Lcom/android/zxing/Decoder;->needPreviewFrame()Z

    move-result v3

    .line 36
    if-eqz v3, :cond_0

    .line 37
    invoke-virtual {p2, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 38
    const/4 v1, 0x1

    .line 40
    :cond_0
    goto :goto_0

    .line 42
    :cond_1
    if-eqz v1, :cond_2

    .line 43
    new-instance v0, Lcom/android/zxing/PreviewImage;

    iget-object v1, p0, Lcom/android/zxing/PreviewDecodeManager$1;->this$0:Lcom/android/zxing/PreviewDecodeManager;

    invoke-static {v1}, Lcom/android/zxing/PreviewDecodeManager;->access$100(Lcom/android/zxing/PreviewDecodeManager;)I

    move-result v1

    iget-object v2, p0, Lcom/android/zxing/PreviewDecodeManager$1;->this$0:Lcom/android/zxing/PreviewDecodeManager;

    invoke-static {v2}, Lcom/android/zxing/PreviewDecodeManager;->access$200(Lcom/android/zxing/PreviewDecodeManager;)I

    move-result v2

    invoke-direct {v0, p1, v1, v2, p3}, Lcom/android/zxing/PreviewImage;-><init>(Landroid/media/Image;III)V

    .line 44
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/android/zxing/Decoder;

    .line 45
    invoke-virtual {p2, v0}, Lcom/android/zxing/Decoder;->onPreviewFrame(Lcom/android/zxing/PreviewImage;)V

    .line 46
    goto :goto_1

    .line 48
    :cond_2
    return-void
.end method
