.class public Lcom/miui/filtersdk/BeautyArcsoftJni;
.super Ljava/lang/Object;
.source "BeautyArcsoftJni.java"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 8
    const-string v0, "image_arcsoft_4plus"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native beautifyProcess([BIIIIIIIIIIIIII)V
.end method

.method public static native beautifyProcessBitmap(Landroid/graphics/Bitmap;IIIIIIIIIIIIII)V
.end method
