.class Lcom/android/volley/toolbox/ImageLoader$4;
.super Ljava/lang/Object;
.source "ImageLoader.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/volley/toolbox/ImageLoader;->batchResponse(Ljava/lang/String;Lcom/android/volley/toolbox/ImageLoader$BatchedImageRequest;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/volley/toolbox/ImageLoader;


# direct methods
.method constructor <init>(Lcom/android/volley/toolbox/ImageLoader;)V
    .registers 2

    .line 436
    iput-object p1, p0, Lcom/android/volley/toolbox/ImageLoader$4;->this$0:Lcom/android/volley/toolbox/ImageLoader;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 7

    .line 439
    iget-object v0, p0, Lcom/android/volley/toolbox/ImageLoader$4;->this$0:Lcom/android/volley/toolbox/ImageLoader;

    # getter for: Lcom/android/volley/toolbox/ImageLoader;->mBatchedResponses:Ljava/util/HashMap;
    invoke-static {v0}, Lcom/android/volley/toolbox/ImageLoader;->access$400(Lcom/android/volley/toolbox/ImageLoader;)Ljava/util/HashMap;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_58

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/volley/toolbox/ImageLoader$BatchedImageRequest;

    .line 440
    .local v1, "bir":Lcom/android/volley/toolbox/ImageLoader$BatchedImageRequest;
    # getter for: Lcom/android/volley/toolbox/ImageLoader$BatchedImageRequest;->mContainers:Ljava/util/LinkedList;
    invoke-static {v1}, Lcom/android/volley/toolbox/ImageLoader$BatchedImageRequest;->access$500(Lcom/android/volley/toolbox/ImageLoader$BatchedImageRequest;)Ljava/util/LinkedList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_22
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_57

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    .line 444
    .local v3, "container":Lcom/android/volley/toolbox/ImageLoader$ImageContainer;
    # getter for: Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->mListener:Lcom/android/volley/toolbox/ImageLoader$ImageListener;
    invoke-static {v3}, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->access$600(Lcom/android/volley/toolbox/ImageLoader$ImageContainer;)Lcom/android/volley/toolbox/ImageLoader$ImageListener;

    move-result-object v4

    if-nez v4, :cond_35

    .line 445
    goto :goto_22

    .line 447
    :cond_35
    invoke-virtual {v1}, Lcom/android/volley/toolbox/ImageLoader$BatchedImageRequest;->getError()Lcom/android/volley/VolleyError;

    move-result-object v4

    if-nez v4, :cond_4b

    .line 448
    # getter for: Lcom/android/volley/toolbox/ImageLoader$BatchedImageRequest;->mResponseBitmap:Landroid/graphics/Bitmap;
    invoke-static {v1}, Lcom/android/volley/toolbox/ImageLoader$BatchedImageRequest;->access$200(Lcom/android/volley/toolbox/ImageLoader$BatchedImageRequest;)Landroid/graphics/Bitmap;

    move-result-object v4

    # setter for: Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->mBitmap:Landroid/graphics/Bitmap;
    invoke-static {v3, v4}, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->access$702(Lcom/android/volley/toolbox/ImageLoader$ImageContainer;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 449
    # getter for: Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->mListener:Lcom/android/volley/toolbox/ImageLoader$ImageListener;
    invoke-static {v3}, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->access$600(Lcom/android/volley/toolbox/ImageLoader$ImageContainer;)Lcom/android/volley/toolbox/ImageLoader$ImageListener;

    move-result-object v4

    const/4 v5, 0x0

    invoke-interface {v4, v3, v5}, Lcom/android/volley/toolbox/ImageLoader$ImageListener;->onResponse(Lcom/android/volley/toolbox/ImageLoader$ImageContainer;Z)V

    goto :goto_56

    .line 451
    :cond_4b
    # getter for: Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->mListener:Lcom/android/volley/toolbox/ImageLoader$ImageListener;
    invoke-static {v3}, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->access$600(Lcom/android/volley/toolbox/ImageLoader$ImageContainer;)Lcom/android/volley/toolbox/ImageLoader$ImageListener;

    move-result-object v4

    invoke-virtual {v1}, Lcom/android/volley/toolbox/ImageLoader$BatchedImageRequest;->getError()Lcom/android/volley/VolleyError;

    move-result-object v5

    invoke-interface {v4, v5}, Lcom/android/volley/toolbox/ImageLoader$ImageListener;->onErrorResponse(Lcom/android/volley/VolleyError;)V

    .line 453
    .end local v3    # "container":Lcom/android/volley/toolbox/ImageLoader$ImageContainer;
    :goto_56
    goto :goto_22

    .line 454
    .end local v1    # "bir":Lcom/android/volley/toolbox/ImageLoader$BatchedImageRequest;
    .end local v2    # "i$":Ljava/util/Iterator;
    :cond_57
    goto :goto_e

    .line 455
    .end local v0    # "i$":Ljava/util/Iterator;
    :cond_58
    iget-object v0, p0, Lcom/android/volley/toolbox/ImageLoader$4;->this$0:Lcom/android/volley/toolbox/ImageLoader;

    # getter for: Lcom/android/volley/toolbox/ImageLoader;->mBatchedResponses:Ljava/util/HashMap;
    invoke-static {v0}, Lcom/android/volley/toolbox/ImageLoader;->access$400(Lcom/android/volley/toolbox/ImageLoader;)Ljava/util/HashMap;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 456
    iget-object v0, p0, Lcom/android/volley/toolbox/ImageLoader$4;->this$0:Lcom/android/volley/toolbox/ImageLoader;

    const/4 v1, 0x0

    # setter for: Lcom/android/volley/toolbox/ImageLoader;->mRunnable:Ljava/lang/Runnable;
    invoke-static {v0, v1}, Lcom/android/volley/toolbox/ImageLoader;->access$802(Lcom/android/volley/toolbox/ImageLoader;Ljava/lang/Runnable;)Ljava/lang/Runnable;

    .line 457
    return-void
.end method
