.class Landroid/support/v4/graphics/BitmapCompatHoneycombMr1;
.super Ljava/lang/Object;
.source "BitmapCompatHoneycombMr1.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static getAllocationByteCount(Landroid/graphics/Bitmap;)I
    .registers 2
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;

    .line 26
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getByteCount()I

    move-result v0

    return v0
.end method
