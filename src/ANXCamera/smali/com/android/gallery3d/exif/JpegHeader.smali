.class Lcom/android/gallery3d/exif/JpegHeader;
.super Ljava/lang/Object;
.source "JpegHeader.java"


# static fields
.field public static final APP0:S = -0x20s

.field public static final APP1:S = -0x1fs

.field public static final DAC:S = -0x34s

.field public static final DHT:S = -0x3cs

.field public static final EOI:S = -0x27s

.field public static final JPG:S = -0x38s

.field public static final SOF0:S = -0x40s

.field public static final SOF15:S = -0x31s

.field public static final SOI:S = -0x28s


# direct methods
.method constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final isSofMarker(S)Z
    .locals 1

    .line 36
    const/16 v0, -0x40

    if-lt p0, v0, :cond_0

    const/16 v0, -0x31

    if-gt p0, v0, :cond_0

    const/16 v0, -0x3c

    if-eq p0, v0, :cond_0

    const/16 v0, -0x38

    if-eq p0, v0, :cond_0

    const/16 v0, -0x34

    if-eq p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method
