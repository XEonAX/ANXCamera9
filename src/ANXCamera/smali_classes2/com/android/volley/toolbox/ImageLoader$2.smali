.class Lcom/android/volley/toolbox/ImageLoader$2;
.super Ljava/lang/Object;
.source "ImageLoader.java"

# interfaces
.implements Lcom/android/volley/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/volley/toolbox/ImageLoader;->get(Ljava/lang/String;Lcom/android/volley/toolbox/ImageLoader$ImageListener;II)Lcom/android/volley/toolbox/ImageLoader$ImageContainer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/volley/Response$Listener<",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/volley/toolbox/ImageLoader;

.field final synthetic val$cacheKey:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/android/volley/toolbox/ImageLoader;Ljava/lang/String;)V
    .registers 3

    .line 220
    iput-object p1, p0, Lcom/android/volley/toolbox/ImageLoader$2;->this$0:Lcom/android/volley/toolbox/ImageLoader;

    iput-object p2, p0, Lcom/android/volley/toolbox/ImageLoader$2;->val$cacheKey:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onResponse(Landroid/graphics/Bitmap;)V
    .registers 4
    .param p1, "response"    # Landroid/graphics/Bitmap;

    .line 223
    iget-object v0, p0, Lcom/android/volley/toolbox/ImageLoader$2;->this$0:Lcom/android/volley/toolbox/ImageLoader;

    iget-object v1, p0, Lcom/android/volley/toolbox/ImageLoader$2;->val$cacheKey:Ljava/lang/String;

    # invokes: Lcom/android/volley/toolbox/ImageLoader;->onGetImageSuccess(Ljava/lang/String;Landroid/graphics/Bitmap;)V
    invoke-static {v0, v1, p1}, Lcom/android/volley/toolbox/ImageLoader;->access$000(Lcom/android/volley/toolbox/ImageLoader;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 224
    return-void
.end method

.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .line 220
    move-object v0, p1

    check-cast v0, Landroid/graphics/Bitmap;

    invoke-virtual {p0, v0}, Lcom/android/volley/toolbox/ImageLoader$2;->onResponse(Landroid/graphics/Bitmap;)V

    return-void
.end method
