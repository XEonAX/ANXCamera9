.class Lcom/android/camera/network/imageloader/LruImageCache;
.super Ljava/lang/Object;
.source "LruImageCache.java"

# interfaces
.implements Lcom/android/volley/toolbox/ImageLoader$ImageCache;


# instance fields
.field private lruCache:Landroid/util/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LruCache<",
            "Ljava/lang/String;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private max:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    const/high16 v0, 0x500000

    iput v0, p0, Lcom/android/camera/network/imageloader/LruImageCache;->max:I

    .line 18
    new-instance v0, Lcom/android/camera/network/imageloader/LruImageCache$1;

    iget v1, p0, Lcom/android/camera/network/imageloader/LruImageCache;->max:I

    invoke-direct {v0, p0, v1}, Lcom/android/camera/network/imageloader/LruImageCache$1;-><init>(Lcom/android/camera/network/imageloader/LruImageCache;I)V

    iput-object v0, p0, Lcom/android/camera/network/imageloader/LruImageCache;->lruCache:Landroid/util/LruCache;

    .line 24
    return-void
.end method


# virtual methods
.method public getBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 1

    .line 28
    iget-object v0, p0, Lcom/android/camera/network/imageloader/LruImageCache;->lruCache:Landroid/util/LruCache;

    invoke-virtual {v0, p1}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/graphics/Bitmap;

    return-object p1
.end method

.method public putBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 1

    .line 33
    iget-object v0, p0, Lcom/android/camera/network/imageloader/LruImageCache;->lruCache:Landroid/util/LruCache;

    invoke-virtual {v0, p1, p2}, Landroid/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    return-void
.end method
