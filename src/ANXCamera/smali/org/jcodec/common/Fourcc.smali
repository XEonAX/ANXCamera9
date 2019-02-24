.class public Lorg/jcodec/common/Fourcc;
.super Ljava/lang/Object;
.source "Fourcc.java"


# static fields
.field public static final free:I

.field public static final ftyp:I

.field public static final mdat:I

.field public static final moov:I

.field public static final wide:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 19
    const-string v0, "ftyp"

    invoke-static {v0}, Lorg/jcodec/common/Fourcc;->intFourcc(Ljava/lang/String;)I

    move-result v0

    sput v0, Lorg/jcodec/common/Fourcc;->ftyp:I

    .line 20
    const-string v0, "free"

    invoke-static {v0}, Lorg/jcodec/common/Fourcc;->intFourcc(Ljava/lang/String;)I

    move-result v0

    sput v0, Lorg/jcodec/common/Fourcc;->free:I

    .line 21
    const-string v0, "moov"

    invoke-static {v0}, Lorg/jcodec/common/Fourcc;->intFourcc(Ljava/lang/String;)I

    move-result v0

    sput v0, Lorg/jcodec/common/Fourcc;->moov:I

    .line 22
    const-string v0, "mdat"

    invoke-static {v0}, Lorg/jcodec/common/Fourcc;->intFourcc(Ljava/lang/String;)I

    move-result v0

    sput v0, Lorg/jcodec/common/Fourcc;->mdat:I

    .line 23
    const-string v0, "wide"

    invoke-static {v0}, Lorg/jcodec/common/Fourcc;->intFourcc(Ljava/lang/String;)I

    move-result v0

    sput v0, Lorg/jcodec/common/Fourcc;->wide:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static intFourcc(Ljava/lang/String;)I
    .locals 4

    .line 15
    invoke-static {p0}, Lorg/jcodec/platform/Platform;->getBytes(Ljava/lang/String;)[B

    move-result-object p0

    .line 16
    const/4 v0, 0x0

    aget-byte v0, p0, v0

    const/4 v1, 0x1

    aget-byte v1, p0, v1

    const/4 v2, 0x2

    aget-byte v2, p0, v2

    const/4 v3, 0x3

    aget-byte p0, p0, v3

    invoke-static {v0, v1, v2, p0}, Lorg/jcodec/common/Fourcc;->makeInt(BBBB)I

    move-result p0

    return p0
.end method

.method public static makeInt(BBBB)I
    .locals 0

    .line 8
    shl-int/lit8 p0, p0, 0x18

    and-int/lit16 p1, p1, 0xff

    shl-int/lit8 p1, p1, 0x10

    or-int/2addr p0, p1

    and-int/lit16 p1, p2, 0xff

    shl-int/lit8 p1, p1, 0x8

    or-int/2addr p0, p1

    and-int/lit16 p1, p3, 0xff

    or-int/2addr p0, p1

    return p0
.end method
