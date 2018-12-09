.class public Lcom/xiaomi/camera/liveshot/util/XmpHelper;
.super Ljava/lang/Object;
.source "XmpHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/camera/liveshot/util/XmpHelper$Section;
    }
.end annotation


# static fields
.field public static final GOOGLE_MICROVIDEO_NAMESPACE:Ljava/lang/String; = "http://ns.google.com/photos/1.0/camera/"

.field private static final MAX_XMP_BUFFER_SIZE:I = 0xffde

.field public static final MICROVIDEO_OFFSET:Ljava/lang/String; = "MicroVideoOffset"

.field public static final MICROVIDEO_PREFIX:Ljava/lang/String; = "GCamera"

.field public static final MICROVIDEO_PRESENTATION_TIMESTAMP:Ljava/lang/String; = "MicroVideoPresentationTimestampUs"

.field public static final MICROVIDEO_TYPE:Ljava/lang/String; = "MicroVideo"

.field public static final MICROVIDEO_VERSION:Ljava/lang/String; = "MicroVideoVersion"

.field private static final M_APP1:I = 0xe1

.field private static final M_SOI:I = 0xd8

.field private static final M_SOS:I = 0xda

.field private static final TAG:Ljava/lang/String;

.field private static final XMP_HEADER:Ljava/lang/String; = "http://ns.adobe.com/xap/1.0/\u0000"

.field private static final XMP_HEADER_SIZE:I = 0x1d


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 48
    const-class v0, Lcom/xiaomi/camera/liveshot/util/XmpHelper;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/camera/liveshot/util/XmpHelper;->TAG:Ljava/lang/String;

    .line 102
    :try_start_0
    invoke-static {}, Lcom/adobe/xmp/XMPMetaFactory;->getSchemaRegistry()Lcom/adobe/xmp/XMPSchemaRegistry;

    move-result-object v0

    const-string v1, "http://ns.google.com/photos/1.0/camera/"

    const-string v2, "GCamera"

    invoke-interface {v0, v1, v2}, Lcom/adobe/xmp/XMPSchemaRegistry;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Lcom/adobe/xmp/XMPException; {:try_start_0 .. :try_end_0} :catch_0

    .line 105
    goto :goto_0

    .line 103
    :catch_0
    move-exception v0

    .line 104
    sget-object v1, Lcom/xiaomi/camera/liveshot/util/XmpHelper;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to register ns http://ns.google.com/photos/1.0/camera/: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 106
    :goto_0
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 108
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 109
    return-void
.end method

.method public static createXMPMeta()Lcom/adobe/xmp/XMPMeta;
    .locals 1

    .line 165
    invoke-static {}, Lcom/adobe/xmp/XMPMetaFactory;->create()Lcom/adobe/xmp/XMPMeta;

    move-result-object v0

    return-object v0
.end method

.method public static extractOrCreateXMPMeta(Ljava/lang/String;)Lcom/adobe/xmp/XMPMeta;
    .locals 0

    .line 172
    invoke-static {p0}, Lcom/xiaomi/camera/liveshot/util/XmpHelper;->extractXMPMeta(Ljava/lang/String;)Lcom/adobe/xmp/XMPMeta;

    move-result-object p0

    .line 173
    if-nez p0, :cond_0

    invoke-static {}, Lcom/xiaomi/camera/liveshot/util/XmpHelper;->createXMPMeta()Lcom/adobe/xmp/XMPMeta;

    move-result-object p0

    :cond_0
    return-object p0
.end method

.method public static extractXMPMeta(Ljava/io/InputStream;)Lcom/adobe/xmp/XMPMeta;
    .locals 5

    .line 138
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/xiaomi/camera/liveshot/util/XmpHelper;->parse(Ljava/io/InputStream;Z)Ljava/util/List;

    move-result-object p0

    .line 139
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 140
    return-object v0

    .line 143
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/xiaomi/camera/liveshot/util/XmpHelper$Section;

    .line 144
    iget-object v2, v1, Lcom/xiaomi/camera/liveshot/util/XmpHelper$Section;->data:[B

    invoke-static {v2}, Lcom/xiaomi/camera/liveshot/util/XmpHelper;->hasXMPHeader([B)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 145
    iget-object p0, v1, Lcom/xiaomi/camera/liveshot/util/XmpHelper$Section;->data:[B

    invoke-static {p0}, Lcom/xiaomi/camera/liveshot/util/XmpHelper;->getXMPContentEnd([B)I

    move-result p0

    .line 146
    const/16 v2, 0x1d

    sub-int/2addr p0, v2

    new-array p0, p0, [B

    .line 147
    iget-object v1, v1, Lcom/xiaomi/camera/liveshot/util/XmpHelper$Section;->data:[B

    const/4 v3, 0x0

    array-length v4, p0

    invoke-static {v1, v2, p0, v3, v4}, Ljava/lang/System;->arraycopy([BI[BII)V

    .line 150
    :try_start_0
    invoke-static {p0}, Lcom/adobe/xmp/XMPMetaFactory;->parseFromBuffer([B)Lcom/adobe/xmp/XMPMeta;

    move-result-object p0
    :try_end_0
    .catch Lcom/adobe/xmp/XMPException; {:try_start_0 .. :try_end_0} :catch_0

    .line 151
    return-object p0

    .line 152
    :catch_0
    move-exception p0

    .line 153
    sget-object v1, Lcom/xiaomi/camera/liveshot/util/XmpHelper;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "XMP parse error: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    return-object v0

    .line 157
    :cond_1
    goto :goto_0

    .line 158
    :cond_2
    return-object v0
.end method

.method public static extractXMPMeta(Ljava/lang/String;)Lcom/adobe/xmp/XMPMeta;
    .locals 5

    .line 119
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, ".jpg"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v2, ".jpeg"

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 120
    sget-object p0, Lcom/xiaomi/camera/liveshot/util/XmpHelper;->TAG:Ljava/lang/String;

    const-string v0, "XMP parse: only jpeg file is supported"

    invoke-static {p0, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    return-object v1

    .line 124
    :cond_0
    :try_start_0
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/xiaomi/camera/liveshot/util/XmpHelper;->extractXMPMeta(Ljava/io/InputStream;)Lcom/adobe/xmp/XMPMeta;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 125
    :catch_0
    move-exception v0

    .line 126
    sget-object v2, Lcom/xiaomi/camera/liveshot/util/XmpHelper;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Could not read from "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ": "

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v2, p0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    return-object v1
.end method

.method private static getXMPContentEnd([B)I
    .locals 4

    .line 337
    array-length v0, p0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    :goto_0
    if-lt v0, v1, :cond_1

    .line 338
    aget-byte v2, p0, v0

    const/16 v3, 0x3e

    if-ne v2, v3, :cond_0

    .line 339
    add-int/lit8 v2, v0, -0x1

    aget-byte v2, p0, v2

    const/16 v3, 0x3f

    if-eq v2, v3, :cond_0

    .line 340
    add-int/2addr v0, v1

    return v0

    .line 337
    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 345
    :cond_1
    array-length p0, p0

    return p0
.end method

.method private static hasXMPHeader([B)Z
    .locals 3

    .line 311
    array-length v0, p0

    const/16 v1, 0x1d

    const/4 v2, 0x0

    if-ge v0, v1, :cond_0

    .line 312
    return v2

    .line 315
    :cond_0
    :try_start_0
    new-array v0, v1, [B

    .line 316
    invoke-static {p0, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy([BI[BII)V

    .line 317
    new-instance p0, Ljava/lang/String;

    const-string v1, "UTF-8"

    invoke-direct {p0, v0, v1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    const-string v0, "http://ns.adobe.com/xap/1.0/\u0000"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz p0, :cond_1

    .line 318
    const/4 p0, 0x1

    return p0

    .line 322
    :cond_1
    nop

    .line 323
    return v2

    .line 320
    :catch_0
    move-exception p0

    .line 321
    return v2
.end method

.method private static insertXMPSection(Ljava/util/List;Lcom/adobe/xmp/XMPMeta;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/xiaomi/camera/liveshot/util/XmpHelper$Section;",
            ">;",
            "Lcom/adobe/xmp/XMPMeta;",
            ")",
            "Ljava/util/List<",
            "Lcom/xiaomi/camera/liveshot/util/XmpHelper$Section;",
            ">;"
        }
    .end annotation

    .line 256
    const/4 v0, 0x0

    if-eqz p0, :cond_5

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    if-gt v1, v2, :cond_0

    goto/16 :goto_2

    .line 261
    :cond_0
    :try_start_0
    new-instance v1, Lcom/adobe/xmp/options/SerializeOptions;

    invoke-direct {v1}, Lcom/adobe/xmp/options/SerializeOptions;-><init>()V

    .line 262
    invoke-virtual {v1, v2}, Lcom/adobe/xmp/options/SerializeOptions;->setUseCompactFormat(Z)Lcom/adobe/xmp/options/SerializeOptions;

    .line 266
    invoke-virtual {v1, v2}, Lcom/adobe/xmp/options/SerializeOptions;->setOmitPacketWrapper(Z)Lcom/adobe/xmp/options/SerializeOptions;

    .line 267
    invoke-static {p1, v1}, Lcom/adobe/xmp/XMPMetaFactory;->serializeToBuffer(Lcom/adobe/xmp/XMPMeta;Lcom/adobe/xmp/options/SerializeOptions;)[B

    move-result-object p1
    :try_end_0
    .catch Lcom/adobe/xmp/XMPException; {:try_start_0 .. :try_end_0} :catch_0

    .line 271
    nop

    .line 272
    array-length v1, p1

    const v3, 0xffde

    if-le v1, v3, :cond_1

    .line 274
    return-object v0

    .line 277
    :cond_1
    array-length v1, p1

    const/16 v3, 0x1d

    add-int/2addr v1, v3

    new-array v1, v1, [B

    .line 278
    const-string v4, "http://ns.adobe.com/xap/1.0/\u0000"

    invoke-virtual {v4}, Ljava/lang/String;->getBytes()[B

    move-result-object v4

    const/4 v5, 0x0

    invoke-static {v4, v5, v1, v5, v3}, Ljava/lang/System;->arraycopy([BI[BII)V

    .line 279
    array-length v4, p1

    invoke-static {p1, v5, v1, v3, v4}, Ljava/lang/System;->arraycopy([BI[BII)V

    .line 280
    new-instance p1, Lcom/xiaomi/camera/liveshot/util/XmpHelper$Section;

    invoke-direct {p1, v0}, Lcom/xiaomi/camera/liveshot/util/XmpHelper$Section;-><init>(Lcom/xiaomi/camera/liveshot/util/XmpHelper$1;)V

    .line 281
    const/16 v0, 0xe1

    iput v0, p1, Lcom/xiaomi/camera/liveshot/util/XmpHelper$Section;->marker:I

    .line 283
    array-length v3, v1

    add-int/lit8 v3, v3, 0x2

    iput v3, p1, Lcom/xiaomi/camera/liveshot/util/XmpHelper$Section;->length:I

    .line 284
    iput-object v1, p1, Lcom/xiaomi/camera/liveshot/util/XmpHelper$Section;->data:[B

    .line 285
    move v1, v5

    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v3

    if-ge v1, v3, :cond_3

    .line 287
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/xiaomi/camera/liveshot/util/XmpHelper$Section;

    iget v3, v3, Lcom/xiaomi/camera/liveshot/util/XmpHelper$Section;->marker:I

    if-ne v3, v0, :cond_2

    .line 288
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/xiaomi/camera/liveshot/util/XmpHelper$Section;

    iget-object v3, v3, Lcom/xiaomi/camera/liveshot/util/XmpHelper$Section;->data:[B

    invoke-static {v3}, Lcom/xiaomi/camera/liveshot/util/XmpHelper;->hasXMPHeader([B)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 290
    invoke-interface {p0, v1, p1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 291
    return-object p0

    .line 285
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 296
    :cond_3
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 297
    invoke-interface {p0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/xiaomi/camera/liveshot/util/XmpHelper$Section;

    iget v3, v3, Lcom/xiaomi/camera/liveshot/util/XmpHelper$Section;->marker:I

    if-ne v3, v0, :cond_4

    goto :goto_1

    .line 298
    :cond_4
    move v2, v5

    :goto_1
    invoke-interface {p0, v5, v2}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 299
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 300
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p1

    invoke-interface {p0, v2, p1}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object p0

    invoke-interface {v1, p0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 301
    return-object v1

    .line 268
    :catch_0
    move-exception p0

    .line 269
    sget-object p1, Lcom/xiaomi/camera/liveshot/util/XmpHelper;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Serialize xmp failed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 270
    return-object v0

    .line 257
    :cond_5
    :goto_2
    return-object v0
.end method

.method private static parse(Ljava/io/InputStream;Z)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/InputStream;",
            "Z)",
            "Ljava/util/List<",
            "Lcom/xiaomi/camera/liveshot/util/XmpHelper$Section;",
            ">;"
        }
    .end annotation

    .line 359
    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v1

    const/16 v2, 0xff

    if-ne v1, v2, :cond_10

    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v1

    const/16 v3, 0xd8

    if-eq v1, v3, :cond_0

    goto/16 :goto_a

    .line 362
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 364
    :goto_0
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v3
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_6
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v4, -0x1

    if-eq v3, v4, :cond_e

    .line 365
    if-eq v3, v2, :cond_2

    .line 366
    nop

    .line 412
    if-eqz p0, :cond_1

    .line 414
    :try_start_1
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 417
    goto :goto_1

    .line 415
    :catch_0
    move-exception p0

    .line 366
    :cond_1
    :goto_1
    return-object v0

    .line 369
    :cond_2
    :goto_2
    :try_start_2
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v3
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_6
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-ne v3, v2, :cond_3

    goto :goto_2

    .line 371
    :cond_3
    if-ne v3, v4, :cond_5

    .line 372
    nop

    .line 412
    if-eqz p0, :cond_4

    .line 414
    :try_start_3
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 417
    goto :goto_3

    .line 415
    :catch_1
    move-exception p0

    .line 372
    :cond_4
    :goto_3
    return-object v0

    .line 374
    :cond_5
    nop

    .line 375
    const/16 v5, 0xda

    const/4 v6, 0x0

    if-ne v3, v5, :cond_8

    .line 378
    if-nez p1, :cond_6

    .line 379
    :try_start_4
    new-instance p1, Lcom/xiaomi/camera/liveshot/util/XmpHelper$Section;

    invoke-direct {p1, v0}, Lcom/xiaomi/camera/liveshot/util/XmpHelper$Section;-><init>(Lcom/xiaomi/camera/liveshot/util/XmpHelper$1;)V

    .line 380
    iput v3, p1, Lcom/xiaomi/camera/liveshot/util/XmpHelper$Section;->marker:I

    .line 381
    iput v4, p1, Lcom/xiaomi/camera/liveshot/util/XmpHelper$Section;->length:I

    .line 382
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result v2

    new-array v2, v2, [B

    iput-object v2, p1, Lcom/xiaomi/camera/liveshot/util/XmpHelper$Section;->data:[B

    .line 383
    iget-object v2, p1, Lcom/xiaomi/camera/liveshot/util/XmpHelper$Section;->data:[B

    iget-object v3, p1, Lcom/xiaomi/camera/liveshot/util/XmpHelper$Section;->data:[B

    array-length v3, v3

    invoke-virtual {p0, v2, v6, v3}, Ljava/io/InputStream;->read([BII)I

    .line 384
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_6
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 386
    :cond_6
    nop

    .line 412
    if-eqz p0, :cond_7

    .line 414
    :try_start_5
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    .line 417
    goto :goto_4

    .line 415
    :catch_2
    move-exception p0

    .line 386
    :cond_7
    :goto_4
    return-object v1

    .line 388
    :cond_8
    :try_start_6
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v5

    .line 389
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v7

    .line 390
    if-eq v5, v4, :cond_c

    if-ne v7, v4, :cond_9

    goto :goto_7

    .line 393
    :cond_9
    shl-int/lit8 v4, v5, 0x8

    or-int/2addr v4, v7

    .line 394
    if-eqz p1, :cond_b

    const/16 v5, 0xe1

    if-ne v3, v5, :cond_a

    goto :goto_5

    .line 404
    :cond_a
    add-int/lit8 v4, v4, -0x2

    int-to-long v3, v4

    invoke-virtual {p0, v3, v4}, Ljava/io/InputStream;->skip(J)J

    goto :goto_6

    .line 395
    :cond_b
    :goto_5
    new-instance v5, Lcom/xiaomi/camera/liveshot/util/XmpHelper$Section;

    invoke-direct {v5, v0}, Lcom/xiaomi/camera/liveshot/util/XmpHelper$Section;-><init>(Lcom/xiaomi/camera/liveshot/util/XmpHelper$1;)V

    .line 396
    iput v3, v5, Lcom/xiaomi/camera/liveshot/util/XmpHelper$Section;->marker:I

    .line 397
    iput v4, v5, Lcom/xiaomi/camera/liveshot/util/XmpHelper$Section;->length:I

    .line 398
    add-int/lit8 v4, v4, -0x2

    new-array v3, v4, [B

    iput-object v3, v5, Lcom/xiaomi/camera/liveshot/util/XmpHelper$Section;->data:[B

    .line 399
    iget-object v3, v5, Lcom/xiaomi/camera/liveshot/util/XmpHelper$Section;->data:[B

    invoke-virtual {p0, v3, v6, v4}, Ljava/io/InputStream;->read([BII)I

    .line 400
    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 401
    nop

    .line 406
    :goto_6
    goto/16 :goto_0

    .line 391
    :cond_c
    :goto_7
    nop

    .line 412
    if-eqz p0, :cond_d

    .line 414
    :try_start_7
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_3

    .line 417
    goto :goto_8

    .line 415
    :catch_3
    move-exception p0

    .line 391
    :cond_d
    :goto_8
    return-object v0

    .line 407
    :cond_e
    nop

    .line 412
    if-eqz p0, :cond_f

    .line 414
    :try_start_8
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_4

    .line 417
    goto :goto_9

    .line 415
    :catch_4
    move-exception p0

    .line 407
    :cond_f
    :goto_9
    return-object v1

    .line 360
    :cond_10
    :goto_a
    nop

    .line 412
    if-eqz p0, :cond_11

    .line 414
    :try_start_9
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_5

    .line 417
    goto :goto_b

    .line 415
    :catch_5
    move-exception p0

    .line 360
    :cond_11
    :goto_b
    return-object v0

    .line 412
    :catchall_0
    move-exception p1

    goto :goto_d

    .line 408
    :catch_6
    move-exception p1

    .line 409
    :try_start_a
    sget-object v1, Lcom/xiaomi/camera/liveshot/util/XmpHelper;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Could not parse file: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 410
    nop

    .line 412
    if-eqz p0, :cond_12

    .line 414
    :try_start_b
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_7

    .line 417
    goto :goto_c

    .line 415
    :catch_7
    move-exception p0

    .line 410
    :cond_12
    :goto_c
    return-object v0

    .line 412
    :goto_d
    if-eqz p0, :cond_13

    .line 414
    :try_start_c
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_8

    .line 417
    goto :goto_e

    .line 415
    :catch_8
    move-exception p0

    .line 417
    :cond_13
    :goto_e
    throw p1
.end method

.method private static writeJpegFile(Ljava/io/OutputStream;Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/OutputStream;",
            "Ljava/util/List<",
            "Lcom/xiaomi/camera/liveshot/util/XmpHelper$Section;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 239
    const/16 v0, 0xff

    invoke-virtual {p0, v0}, Ljava/io/OutputStream;->write(I)V

    .line 240
    const/16 v1, 0xd8

    invoke-virtual {p0, v1}, Ljava/io/OutputStream;->write(I)V

    .line 241
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/xiaomi/camera/liveshot/util/XmpHelper$Section;

    .line 242
    invoke-virtual {p0, v0}, Ljava/io/OutputStream;->write(I)V

    .line 243
    iget v2, v1, Lcom/xiaomi/camera/liveshot/util/XmpHelper$Section;->marker:I

    invoke-virtual {p0, v2}, Ljava/io/OutputStream;->write(I)V

    .line 244
    iget v2, v1, Lcom/xiaomi/camera/liveshot/util/XmpHelper$Section;->length:I

    if-lez v2, :cond_0

    .line 246
    iget v2, v1, Lcom/xiaomi/camera/liveshot/util/XmpHelper$Section;->length:I

    shr-int/lit8 v2, v2, 0x8

    .line 247
    iget v3, v1, Lcom/xiaomi/camera/liveshot/util/XmpHelper$Section;->length:I

    and-int/2addr v3, v0

    .line 248
    invoke-virtual {p0, v2}, Ljava/io/OutputStream;->write(I)V

    .line 249
    invoke-virtual {p0, v3}, Ljava/io/OutputStream;->write(I)V

    .line 251
    :cond_0
    iget-object v1, v1, Lcom/xiaomi/camera/liveshot/util/XmpHelper$Section;->data:[B

    invoke-virtual {p0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 252
    goto :goto_0

    .line 253
    :cond_1
    return-void
.end method

.method public static writeXMPMeta(Ljava/io/InputStream;Ljava/io/OutputStream;Lcom/adobe/xmp/XMPMeta;)Z
    .locals 3

    .line 210
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/xiaomi/camera/liveshot/util/XmpHelper;->parse(Ljava/io/InputStream;Z)Ljava/util/List;

    move-result-object p0

    .line 211
    invoke-static {p0, p2}, Lcom/xiaomi/camera/liveshot/util/XmpHelper;->insertXMPSection(Ljava/util/List;Lcom/adobe/xmp/XMPMeta;)Ljava/util/List;

    move-result-object p0

    .line 212
    if-nez p0, :cond_0

    .line 213
    return v0

    .line 217
    :cond_0
    :try_start_0
    invoke-static {p1, p0}, Lcom/xiaomi/camera/liveshot/util/XmpHelper;->writeJpegFile(Ljava/io/OutputStream;Ljava/util/List;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 222
    if-eqz p1, :cond_1

    .line 224
    :try_start_1
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 227
    :goto_0
    goto :goto_1

    .line 225
    :catch_0
    move-exception p0

    goto :goto_0

    .line 230
    :cond_1
    :goto_1
    const/4 p0, 0x1

    return p0

    .line 222
    :catchall_0
    move-exception p0

    goto :goto_3

    .line 218
    :catch_1
    move-exception p0

    .line 219
    :try_start_2
    sget-object p2, Lcom/xiaomi/camera/liveshot/util/XmpHelper;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Write to stream failed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p2, p0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 220
    nop

    .line 222
    if-eqz p1, :cond_2

    .line 224
    :try_start_3
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    .line 227
    goto :goto_2

    .line 225
    :catch_2
    move-exception p0

    .line 220
    :cond_2
    :goto_2
    return v0

    .line 222
    :goto_3
    if-eqz p1, :cond_3

    .line 224
    :try_start_4
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    .line 227
    goto :goto_4

    .line 225
    :catch_3
    move-exception p1

    .line 227
    :cond_3
    :goto_4
    throw p0
.end method

.method public static writeXMPMeta(Ljava/lang/String;Lcom/adobe/xmp/XMPMeta;)Z
    .locals 4

    .line 180
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, ".jpg"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v2, ".jpeg"

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 181
    sget-object p0, Lcom/xiaomi/camera/liveshot/util/XmpHelper;->TAG:Ljava/lang/String;

    const-string p1, "XMP parse: only jpeg file is supported"

    invoke-static {p0, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 182
    return v1

    .line 184
    :cond_0
    nop

    .line 186
    :try_start_0
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v1}, Lcom/xiaomi/camera/liveshot/util/XmpHelper;->parse(Ljava/io/InputStream;Z)Ljava/util/List;

    move-result-object v0

    .line 187
    invoke-static {v0, p1}, Lcom/xiaomi/camera/liveshot/util/XmpHelper;->insertXMPSection(Ljava/util/List;Lcom/adobe/xmp/XMPMeta;)Ljava/util/List;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_3

    .line 188
    if-nez p1, :cond_1

    .line 189
    return v1

    .line 194
    :cond_1
    nop

    .line 196
    :try_start_1
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    const/4 v2, 0x0

    .line 198
    :try_start_2
    invoke-static {v0, p1}, Lcom/xiaomi/camera/liveshot/util/XmpHelper;->writeJpegFile(Ljava/io/OutputStream;Ljava/util/List;)V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 199
    :try_start_3
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    .line 202
    nop

    .line 203
    const/4 p0, 0x1

    return p0

    .line 199
    :catchall_0
    move-exception p1

    goto :goto_0

    .line 196
    :catch_0
    move-exception v2

    :try_start_4
    throw v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 199
    :goto_0
    if-eqz v2, :cond_2

    :try_start_5
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_1
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    goto :goto_1

    :catch_1
    move-exception v0

    :try_start_6
    invoke-virtual {v2, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_1

    :cond_2
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    :goto_1
    throw p1
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_2

    :catch_2
    move-exception p1

    .line 200
    sget-object v0, Lcom/xiaomi/camera/liveshot/util/XmpHelper;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to write to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ": "

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 201
    return v1

    .line 191
    :catch_3
    move-exception p1

    .line 192
    sget-object v0, Lcom/xiaomi/camera/liveshot/util/XmpHelper;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Could not read from "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ": "

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 193
    return v1
.end method
