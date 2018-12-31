.class public final Lcom/bumptech/glide/load/resource/bitmap/m;
.super Ljava/lang/Object;
.source "DefaultImageHeaderParser.java"

# interfaces
.implements Lcom/bumptech/glide/load/ImageHeaderParser;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/load/resource/bitmap/m$d;,
        Lcom/bumptech/glide/load/resource/bitmap/m$a;,
        Lcom/bumptech/glide/load/resource/bitmap/m$c;,
        Lcom/bumptech/glide/load/resource/bitmap/m$b;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "DfltImageHeaderParser"

.field private static final jX:I = 0x474946

.field private static final jY:I = -0x76afb1b9

.field static final jZ:I = 0xffd8

.field private static final ka:I = 0x4d4d

.field private static final kb:I = 0x4949

.field private static final kc:Ljava/lang/String; = "Exif\u0000\u0000"

.field static final kd:[B

.field private static final ke:I = 0xda

.field private static final kf:I = 0xd9

.field static final kg:I = 0xff

.field static final kh:I = 0xe1

.field private static final ki:I = 0x112

.field private static final kj:[I

.field private static final kk:I = 0x52494646

.field private static final kl:I = 0x57454250

.field private static final km:I = 0x56503800

.field private static final kn:I = -0x100

.field private static final ko:I = 0xff

.field private static final kp:I = 0x58

.field private static final kq:I = 0x4c

.field private static final kr:I = 0x10

.field private static final ks:I = 0x8


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 36
    const-string v0, "Exif\u0000\u0000"

    const-string v1, "UTF-8"

    .line 37
    invoke-static {v1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    sput-object v0, Lcom/bumptech/glide/load/resource/bitmap/m;->kd:[B

    .line 43
    const/16 v0, 0xd

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/bumptech/glide/load/resource/bitmap/m;->kj:[I

    return-void

    :array_0
    .array-data 4
        0x0
        0x1
        0x1
        0x2
        0x4
        0x8
        0x1
        0x1
        0x2
        0x4
        0x8
        0x4
        0x8
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static a(Lcom/bumptech/glide/load/resource/bitmap/m$b;)I
    .locals 11

    .line 256
    const-string v0, "Exif\u0000\u0000"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    .line 258
    invoke-virtual {p0, v0}, Lcom/bumptech/glide/load/resource/bitmap/m$b;->z(I)S

    move-result v1

    .line 260
    const/16 v2, 0x4949

    const/4 v3, 0x3

    if-eq v1, v2, :cond_2

    const/16 v2, 0x4d4d

    if-eq v1, v2, :cond_1

    .line 268
    const-string v2, "DfltImageHeaderParser"

    invoke-static {v2, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 269
    const-string v2, "DfltImageHeaderParser"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unknown endianness = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 271
    :cond_0
    sget-object v1, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    goto :goto_0

    .line 262
    :cond_1
    sget-object v1, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    .line 263
    goto :goto_0

    .line 265
    :cond_2
    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    .line 266
    nop

    .line 275
    :goto_0
    invoke-virtual {p0, v1}, Lcom/bumptech/glide/load/resource/bitmap/m$b;->a(Ljava/nio/ByteOrder;)V

    .line 277
    add-int/lit8 v1, v0, 0x4

    invoke-virtual {p0, v1}, Lcom/bumptech/glide/load/resource/bitmap/m$b;->y(I)I

    move-result v1

    add-int/2addr v1, v0

    .line 278
    invoke-virtual {p0, v1}, Lcom/bumptech/glide/load/resource/bitmap/m$b;->z(I)S

    move-result v0

    .line 279
    const/4 v2, 0x0

    :goto_1
    if-ge v2, v0, :cond_e

    .line 280
    invoke-static {v1, v2}, Lcom/bumptech/glide/load/resource/bitmap/m;->h(II)I

    move-result v4

    .line 282
    invoke-virtual {p0, v4}, Lcom/bumptech/glide/load/resource/bitmap/m$b;->z(I)S

    move-result v5

    .line 284
    const/16 v6, 0x112

    if-eq v5, v6, :cond_3

    .line 285
    goto/16 :goto_5

    .line 288
    :cond_3
    add-int/lit8 v6, v4, 0x2

    invoke-virtual {p0, v6}, Lcom/bumptech/glide/load/resource/bitmap/m$b;->z(I)S

    move-result v6

    .line 290
    const/4 v7, 0x1

    if-lt v6, v7, :cond_c

    const/16 v7, 0xc

    if-le v6, v7, :cond_4

    goto/16 :goto_4

    .line 297
    :cond_4
    add-int/lit8 v7, v4, 0x4

    invoke-virtual {p0, v7}, Lcom/bumptech/glide/load/resource/bitmap/m$b;->y(I)I

    move-result v7

    .line 298
    if-gez v7, :cond_5

    .line 299
    const-string v4, "DfltImageHeaderParser"

    invoke-static {v4, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_d

    .line 300
    const-string v4, "DfltImageHeaderParser"

    const-string v5, "Negative tiff component count"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_5

    .line 305
    :cond_5
    const-string v8, "DfltImageHeaderParser"

    invoke-static {v8, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 306
    const-string v8, "DfltImageHeaderParser"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Got tagIndex="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, " tagType="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, " formatCode="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, " componentCount="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 310
    :cond_6
    sget-object v8, Lcom/bumptech/glide/load/resource/bitmap/m;->kj:[I

    aget v8, v8, v6

    add-int/2addr v7, v8

    .line 311
    const/4 v8, 0x4

    if-le v7, v8, :cond_7

    .line 312
    const-string v4, "DfltImageHeaderParser"

    invoke-static {v4, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_d

    .line 313
    const-string v4, "DfltImageHeaderParser"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Got byte count > 4, not orientation, continuing, formatCode="

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_5

    .line 318
    :cond_7
    add-int/lit8 v4, v4, 0x8

    .line 319
    if-ltz v4, :cond_b

    invoke-virtual {p0}, Lcom/bumptech/glide/load/resource/bitmap/m$b;->length()I

    move-result v6

    if-le v4, v6, :cond_8

    goto :goto_3

    .line 326
    :cond_8
    if-ltz v7, :cond_a

    add-int/2addr v7, v4

    invoke-virtual {p0}, Lcom/bumptech/glide/load/resource/bitmap/m$b;->length()I

    move-result v6

    if-le v7, v6, :cond_9

    goto :goto_2

    .line 334
    :cond_9
    invoke-virtual {p0, v4}, Lcom/bumptech/glide/load/resource/bitmap/m$b;->z(I)S

    move-result p0

    return p0

    .line 327
    :cond_a
    :goto_2
    const-string v4, "DfltImageHeaderParser"

    invoke-static {v4, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_d

    .line 328
    const-string v4, "DfltImageHeaderParser"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Illegal number of bytes for TI tag data tagType="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_5

    .line 320
    :cond_b
    :goto_3
    const-string v6, "DfltImageHeaderParser"

    invoke-static {v6, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v6

    if-eqz v6, :cond_d

    .line 321
    const-string v6, "DfltImageHeaderParser"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Illegal tagValueOffset="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " tagType="

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v6, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_5

    .line 291
    :cond_c
    :goto_4
    const-string v4, "DfltImageHeaderParser"

    invoke-static {v4, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_d

    .line 292
    const-string v4, "DfltImageHeaderParser"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Got invalid format code = "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 279
    :cond_d
    :goto_5
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_1

    .line 337
    :cond_e
    const/4 p0, -0x1

    return p0
.end method

.method private a(Lcom/bumptech/glide/load/resource/bitmap/m$c;Lcom/bumptech/glide/load/engine/bitmap_recycle/b;)I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 150
    invoke-interface {p1}, Lcom/bumptech/glide/load/resource/bitmap/m$c;->ck()I

    move-result v0

    .line 152
    invoke-static {v0}, Lcom/bumptech/glide/load/resource/bitmap/m;->x(I)Z

    move-result v1

    const/4 v2, 0x3

    const/4 v3, -0x1

    if-nez v1, :cond_1

    .line 153
    const-string p1, "DfltImageHeaderParser"

    invoke-static {p1, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 154
    const-string p1, "DfltImageHeaderParser"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Parser doesn\'t handle magic number: "

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 156
    :cond_0
    return v3

    .line 158
    :cond_1
    invoke-direct {p0, p1}, Lcom/bumptech/glide/load/resource/bitmap/m;->b(Lcom/bumptech/glide/load/resource/bitmap/m$c;)I

    move-result v0

    .line 159
    if-ne v0, v3, :cond_3

    .line 160
    const-string p1, "DfltImageHeaderParser"

    invoke-static {p1, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 161
    const-string p1, "DfltImageHeaderParser"

    const-string p2, "Failed to parse exif segment length, or exif segment not found"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 163
    :cond_2
    return v3

    .line 166
    :cond_3
    const-class v1, [B

    invoke-interface {p2, v0, v1}, Lcom/bumptech/glide/load/engine/bitmap_recycle/b;->a(ILjava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [B

    .line 168
    :try_start_0
    invoke-direct {p0, p1, v1, v0}, Lcom/bumptech/glide/load/resource/bitmap/m;->a(Lcom/bumptech/glide/load/resource/bitmap/m$c;[BI)I

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 170
    invoke-interface {p2, v1}, Lcom/bumptech/glide/load/engine/bitmap_recycle/b;->put(Ljava/lang/Object;)V

    .line 168
    return p1

    .line 170
    :catchall_0
    move-exception p1

    invoke-interface {p2, v1}, Lcom/bumptech/glide/load/engine/bitmap_recycle/b;->put(Ljava/lang/Object;)V

    throw p1
.end method

.method private a(Lcom/bumptech/glide/load/resource/bitmap/m$c;[BI)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 177
    invoke-interface {p1, p2, p3}, Lcom/bumptech/glide/load/resource/bitmap/m$c;->read([BI)I

    move-result p1

    .line 178
    const/4 v0, -0x1

    const/4 v1, 0x3

    if-eq p1, p3, :cond_1

    .line 179
    const-string p2, "DfltImageHeaderParser"

    invoke-static {p2, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 180
    const-string p2, "DfltImageHeaderParser"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to read exif segment data, length: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p3, ", actually read: "

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 184
    :cond_0
    return v0

    .line 187
    :cond_1
    invoke-direct {p0, p2, p3}, Lcom/bumptech/glide/load/resource/bitmap/m;->a([BI)Z

    move-result p1

    .line 188
    if-eqz p1, :cond_2

    .line 189
    new-instance p1, Lcom/bumptech/glide/load/resource/bitmap/m$b;

    invoke-direct {p1, p2, p3}, Lcom/bumptech/glide/load/resource/bitmap/m$b;-><init>([BI)V

    invoke-static {p1}, Lcom/bumptech/glide/load/resource/bitmap/m;->a(Lcom/bumptech/glide/load/resource/bitmap/m$b;)I

    move-result p1

    return p1

    .line 191
    :cond_2
    const-string p1, "DfltImageHeaderParser"

    invoke-static {p1, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 192
    const-string p1, "DfltImageHeaderParser"

    const-string p2, "Missing jpeg exif preamble"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 194
    :cond_3
    return v0
.end method

.method private a(Lcom/bumptech/glide/load/resource/bitmap/m$c;)Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;
    .locals 6
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 88
    invoke-interface {p1}, Lcom/bumptech/glide/load/resource/bitmap/m$c;->ck()I

    move-result v0

    .line 91
    const v1, 0xffd8

    if-ne v0, v1, :cond_0

    .line 92
    sget-object p1, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->cJ:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    return-object p1

    .line 95
    :cond_0
    shl-int/lit8 v0, v0, 0x10

    const/high16 v1, -0x10000

    and-int/2addr v0, v1

    invoke-interface {p1}, Lcom/bumptech/glide/load/resource/bitmap/m$c;->ck()I

    move-result v2

    const v3, 0xffff

    and-int/2addr v2, v3

    or-int/2addr v0, v2

    .line 97
    const v2, -0x76afb1b9

    if-ne v0, v2, :cond_2

    .line 100
    const-wide/16 v0, 0x15

    invoke-interface {p1, v0, v1}, Lcom/bumptech/glide/load/resource/bitmap/m$c;->skip(J)J

    .line 101
    invoke-interface {p1}, Lcom/bumptech/glide/load/resource/bitmap/m$c;->getByte()I

    move-result p1

    .line 103
    const/4 v0, 0x3

    if-lt p1, v0, :cond_1

    sget-object p1, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->cL:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    goto :goto_0

    :cond_1
    sget-object p1, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->cM:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    :goto_0
    return-object p1

    .line 107
    :cond_2
    shr-int/lit8 v2, v0, 0x8

    const v4, 0x474946

    if-ne v2, v4, :cond_3

    .line 108
    sget-object p1, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->cI:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    return-object p1

    .line 113
    :cond_3
    const v2, 0x52494646

    if-eq v0, v2, :cond_4

    .line 114
    sget-object p1, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->cP:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    return-object p1

    .line 117
    :cond_4
    const-wide/16 v4, 0x4

    invoke-interface {p1, v4, v5}, Lcom/bumptech/glide/load/resource/bitmap/m$c;->skip(J)J

    .line 118
    nop

    .line 119
    invoke-interface {p1}, Lcom/bumptech/glide/load/resource/bitmap/m$c;->ck()I

    move-result v0

    shl-int/lit8 v0, v0, 0x10

    and-int/2addr v0, v1

    invoke-interface {p1}, Lcom/bumptech/glide/load/resource/bitmap/m$c;->ck()I

    move-result v2

    and-int/2addr v2, v3

    or-int/2addr v0, v2

    .line 120
    const v2, 0x57454250

    if-eq v0, v2, :cond_5

    .line 121
    sget-object p1, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->cP:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    return-object p1

    .line 123
    :cond_5
    nop

    .line 124
    invoke-interface {p1}, Lcom/bumptech/glide/load/resource/bitmap/m$c;->ck()I

    move-result v0

    shl-int/lit8 v0, v0, 0x10

    and-int/2addr v0, v1

    invoke-interface {p1}, Lcom/bumptech/glide/load/resource/bitmap/m$c;->ck()I

    move-result v1

    and-int/2addr v1, v3

    or-int/2addr v0, v1

    .line 125
    and-int/lit16 v1, v0, -0x100

    const v2, 0x56503800

    if-eq v1, v2, :cond_6

    .line 126
    sget-object p1, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->cP:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    return-object p1

    .line 128
    :cond_6
    and-int/lit16 v0, v0, 0xff

    const/16 v1, 0x58

    if-ne v0, v1, :cond_8

    .line 130
    invoke-interface {p1, v4, v5}, Lcom/bumptech/glide/load/resource/bitmap/m$c;->skip(J)J

    .line 131
    invoke-interface {p1}, Lcom/bumptech/glide/load/resource/bitmap/m$c;->getByte()I

    move-result p1

    and-int/lit8 p1, p1, 0x10

    if-eqz p1, :cond_7

    sget-object p1, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->cN:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    goto :goto_1

    :cond_7
    sget-object p1, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->cO:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    :goto_1
    return-object p1

    .line 133
    :cond_8
    const/16 v1, 0x4c

    if-ne v0, v1, :cond_a

    .line 136
    invoke-interface {p1, v4, v5}, Lcom/bumptech/glide/load/resource/bitmap/m$c;->skip(J)J

    .line 137
    invoke-interface {p1}, Lcom/bumptech/glide/load/resource/bitmap/m$c;->getByte()I

    move-result p1

    and-int/lit8 p1, p1, 0x8

    if-eqz p1, :cond_9

    sget-object p1, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->cN:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    goto :goto_2

    :cond_9
    sget-object p1, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->cO:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    :goto_2
    return-object p1

    .line 139
    :cond_a
    sget-object p1, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->cO:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    return-object p1
.end method

.method private a([BI)Z
    .locals 4

    .line 199
    const/4 v0, 0x0

    if-eqz p1, :cond_0

    sget-object v1, Lcom/bumptech/glide/load/resource/bitmap/m;->kd:[B

    array-length v1, v1

    if-le p2, v1, :cond_0

    .line 201
    const/4 p2, 0x1

    goto :goto_0

    .line 199
    :cond_0
    nop

    .line 201
    move p2, v0

    :goto_0
    if-eqz p2, :cond_2

    .line 202
    move v1, v0

    :goto_1
    sget-object v2, Lcom/bumptech/glide/load/resource/bitmap/m;->kd:[B

    array-length v2, v2

    if-ge v1, v2, :cond_2

    .line 203
    aget-byte v2, p1, v1

    sget-object v3, Lcom/bumptech/glide/load/resource/bitmap/m;->kd:[B

    aget-byte v3, v3, v1

    if-eq v2, v3, :cond_1

    .line 204
    nop

    .line 205
    nop

    .line 209
    move p2, v0

    goto :goto_2

    .line 202
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 209
    :cond_2
    :goto_2
    return p2
.end method

.method private b(Lcom/bumptech/glide/load/resource/bitmap/m$c;)I
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 218
    :goto_0
    invoke-interface {p1}, Lcom/bumptech/glide/load/resource/bitmap/m$c;->cl()S

    move-result v0

    .line 219
    const/16 v1, 0xff

    const/4 v2, 0x3

    const/4 v3, -0x1

    if-eq v0, v1, :cond_1

    .line 220
    const-string p1, "DfltImageHeaderParser"

    invoke-static {p1, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 221
    const-string p1, "DfltImageHeaderParser"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown segmentId="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 223
    :cond_0
    return v3

    .line 226
    :cond_1
    invoke-interface {p1}, Lcom/bumptech/glide/load/resource/bitmap/m$c;->cl()S

    move-result v0

    .line 227
    const/16 v1, 0xda

    if-ne v0, v1, :cond_2

    .line 228
    return v3

    .line 229
    :cond_2
    const/16 v1, 0xd9

    if-ne v0, v1, :cond_4

    .line 230
    const-string p1, "DfltImageHeaderParser"

    invoke-static {p1, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 231
    const-string p1, "DfltImageHeaderParser"

    const-string v0, "Found MARKER_EOI in exif segment"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 233
    :cond_3
    return v3

    .line 237
    :cond_4
    invoke-interface {p1}, Lcom/bumptech/glide/load/resource/bitmap/m$c;->ck()I

    move-result v1

    add-int/lit8 v1, v1, -0x2

    .line 238
    const/16 v4, 0xe1

    if-eq v0, v4, :cond_7

    .line 239
    int-to-long v4, v1

    invoke-interface {p1, v4, v5}, Lcom/bumptech/glide/load/resource/bitmap/m$c;->skip(J)J

    move-result-wide v6

    .line 240
    cmp-long v4, v6, v4

    if-eqz v4, :cond_6

    .line 241
    const-string p1, "DfltImageHeaderParser"

    invoke-static {p1, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result p1

    if-eqz p1, :cond_5

    .line 242
    const-string p1, "DfltImageHeaderParser"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unable to skip enough data, type: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", wanted to skip: "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", but actually skipped: "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 247
    :cond_5
    return v3

    .line 249
    :cond_6
    nop

    .line 252
    goto/16 :goto_0

    .line 250
    :cond_7
    return v1
.end method

.method private static h(II)I
    .locals 1

    .line 341
    add-int/lit8 p0, p0, 0x2

    const/16 v0, 0xc

    mul-int/2addr v0, p1

    add-int/2addr p0, v0

    return p0
.end method

.method private static x(I)Z
    .locals 2

    .line 345
    const v0, 0xffd8

    and-int v1, p0, v0

    if-eq v1, v0, :cond_1

    const/16 v0, 0x4d4d

    if-eq p0, v0, :cond_1

    const/16 v0, 0x4949

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method


# virtual methods
.method public a(Ljava/io/InputStream;Lcom/bumptech/glide/load/engine/bitmap_recycle/b;)I
    .locals 1
    .param p1    # Ljava/io/InputStream;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/load/engine/bitmap_recycle/b;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 75
    new-instance v0, Lcom/bumptech/glide/load/resource/bitmap/m$d;

    invoke-static {p1}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/io/InputStream;

    invoke-direct {v0, p1}, Lcom/bumptech/glide/load/resource/bitmap/m$d;-><init>(Ljava/io/InputStream;)V

    .line 76
    invoke-static {p2}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/bumptech/glide/load/engine/bitmap_recycle/b;

    .line 75
    invoke-direct {p0, v0, p1}, Lcom/bumptech/glide/load/resource/bitmap/m;->a(Lcom/bumptech/glide/load/resource/bitmap/m$c;Lcom/bumptech/glide/load/engine/bitmap_recycle/b;)I

    move-result p1

    return p1
.end method

.method public a(Ljava/nio/ByteBuffer;Lcom/bumptech/glide/load/engine/bitmap_recycle/b;)I
    .locals 1
    .param p1    # Ljava/nio/ByteBuffer;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/load/engine/bitmap_recycle/b;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 82
    new-instance v0, Lcom/bumptech/glide/load/resource/bitmap/m$a;

    invoke-static {p1}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/nio/ByteBuffer;

    invoke-direct {v0, p1}, Lcom/bumptech/glide/load/resource/bitmap/m$a;-><init>(Ljava/nio/ByteBuffer;)V

    .line 83
    invoke-static {p2}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/bumptech/glide/load/engine/bitmap_recycle/b;

    .line 82
    invoke-direct {p0, v0, p1}, Lcom/bumptech/glide/load/resource/bitmap/m;->a(Lcom/bumptech/glide/load/resource/bitmap/m$c;Lcom/bumptech/glide/load/engine/bitmap_recycle/b;)I

    move-result p1

    return p1
.end method

.method public b(Ljava/io/InputStream;)Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;
    .locals 1
    .param p1    # Ljava/io/InputStream;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 63
    new-instance v0, Lcom/bumptech/glide/load/resource/bitmap/m$d;

    invoke-static {p1}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/io/InputStream;

    invoke-direct {v0, p1}, Lcom/bumptech/glide/load/resource/bitmap/m$d;-><init>(Ljava/io/InputStream;)V

    invoke-direct {p0, v0}, Lcom/bumptech/glide/load/resource/bitmap/m;->a(Lcom/bumptech/glide/load/resource/bitmap/m$c;)Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    move-result-object p1

    return-object p1
.end method

.method public b(Ljava/nio/ByteBuffer;)Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;
    .locals 1
    .param p1    # Ljava/nio/ByteBuffer;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 69
    new-instance v0, Lcom/bumptech/glide/load/resource/bitmap/m$a;

    invoke-static {p1}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/nio/ByteBuffer;

    invoke-direct {v0, p1}, Lcom/bumptech/glide/load/resource/bitmap/m$a;-><init>(Ljava/nio/ByteBuffer;)V

    invoke-direct {p0, v0}, Lcom/bumptech/glide/load/resource/bitmap/m;->a(Lcom/bumptech/glide/load/resource/bitmap/m$c;)Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    move-result-object p1

    return-object p1
.end method
