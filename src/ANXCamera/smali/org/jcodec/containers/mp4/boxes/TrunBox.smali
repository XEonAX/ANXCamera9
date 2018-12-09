.class public Lorg/jcodec/containers/mp4/boxes/TrunBox;
.super Lorg/jcodec/containers/mp4/boxes/FullBox;
.source "TrunBox.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jcodec/containers/mp4/boxes/TrunBox$Factory;
    }
.end annotation


# static fields
.field private static final DATA_OFFSET_AVAILABLE:I = 0x1

.field private static final FIRST_SAMPLE_FLAGS_AVAILABLE:I = 0x4

.field private static final SAMPLE_COMPOSITION_OFFSET_AVAILABLE:I = 0x800

.field private static final SAMPLE_DURATION_AVAILABLE:I = 0x100

.field private static final SAMPLE_FLAGS_AVAILABLE:I = 0x400

.field private static final SAMPLE_SIZE_AVAILABLE:I = 0x200


# instance fields
.field private dataOffset:I

.field private firstSampleFlags:I

.field private sampleCompositionOffset:[I

.field private sampleCount:I

.field private sampleDuration:[I

.field private sampleFlags:[I

.field private sampleSize:[I


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/Header;)V
    .locals 0

    .line 73
    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 74
    return-void
.end method

.method static synthetic access$002(Lorg/jcodec/containers/mp4/boxes/TrunBox;I)I
    .locals 0

    .line 34
    iput p1, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->dataOffset:I

    return p1
.end method

.method static synthetic access$102(Lorg/jcodec/containers/mp4/boxes/TrunBox;I)I
    .locals 0

    .line 34
    iput p1, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->firstSampleFlags:I

    return p1
.end method

.method static synthetic access$200(Lorg/jcodec/containers/mp4/boxes/TrunBox;)I
    .locals 0

    .line 34
    iget p0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleCount:I

    return p0
.end method

.method static synthetic access$302(Lorg/jcodec/containers/mp4/boxes/TrunBox;[I)[I
    .locals 0

    .line 34
    iput-object p1, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleDuration:[I

    return-object p1
.end method

.method static synthetic access$402(Lorg/jcodec/containers/mp4/boxes/TrunBox;[I)[I
    .locals 0

    .line 34
    iput-object p1, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleSize:[I

    return-object p1
.end method

.method static synthetic access$502(Lorg/jcodec/containers/mp4/boxes/TrunBox;[I)[I
    .locals 0

    .line 34
    iput-object p1, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleFlags:[I

    return-object p1
.end method

.method static synthetic access$602(Lorg/jcodec/containers/mp4/boxes/TrunBox;[I)[I
    .locals 0

    .line 34
    iput-object p1, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleCompositionOffset:[I

    return-object p1
.end method

.method public static copy(Lorg/jcodec/containers/mp4/boxes/TrunBox;)Lorg/jcodec/containers/mp4/boxes/TrunBox$Factory;
    .locals 7

    .line 65
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleCount:I

    iget v1, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->dataOffset:I

    iget v2, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->firstSampleFlags:I

    iget-object v3, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleDuration:[I

    iget-object v4, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleSize:[I

    iget-object v5, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleFlags:[I

    iget-object v6, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleCompositionOffset:[I

    .line 66
    invoke-static/range {v0 .. v6}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->createTrunBox2(III[I[I[I[I)Lorg/jcodec/containers/mp4/boxes/TrunBox;

    move-result-object v0

    .line 67
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->getFlags()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->setFlags(I)V

    .line 68
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->getVersion()B

    move-result p0

    invoke-virtual {v0, p0}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->setVersion(B)V

    .line 69
    new-instance p0, Lorg/jcodec/containers/mp4/boxes/TrunBox$Factory;

    invoke-direct {p0, v0}, Lorg/jcodec/containers/mp4/boxes/TrunBox$Factory;-><init>(Lorg/jcodec/containers/mp4/boxes/TrunBox;)V

    return-object p0
.end method

.method public static create(I)Lorg/jcodec/containers/mp4/boxes/TrunBox$Factory;
    .locals 1

    .line 61
    new-instance v0, Lorg/jcodec/containers/mp4/boxes/TrunBox$Factory;

    invoke-static {p0}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->createTrunBox1(I)Lorg/jcodec/containers/mp4/boxes/TrunBox;

    move-result-object p0

    invoke-direct {v0, p0}, Lorg/jcodec/containers/mp4/boxes/TrunBox$Factory;-><init>(Lorg/jcodec/containers/mp4/boxes/TrunBox;)V

    return-object v0
.end method

.method public static createTrunBox()Lorg/jcodec/containers/mp4/boxes/TrunBox;
    .locals 3

    .line 253
    new-instance v0, Lorg/jcodec/containers/mp4/boxes/TrunBox;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->fourcc()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/TrunBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    return-object v0
.end method

.method public static createTrunBox1(I)Lorg/jcodec/containers/mp4/boxes/TrunBox;
    .locals 3

    .line 77
    new-instance v0, Lorg/jcodec/containers/mp4/boxes/TrunBox;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->fourcc()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/TrunBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 78
    iput p0, v0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleCount:I

    .line 79
    return-object v0
.end method

.method public static createTrunBox2(III[I[I[I[I)Lorg/jcodec/containers/mp4/boxes/TrunBox;
    .locals 3

    .line 84
    new-instance v0, Lorg/jcodec/containers/mp4/boxes/TrunBox;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->fourcc()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/TrunBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 85
    iput p0, v0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleCount:I

    .line 86
    iput p1, v0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->dataOffset:I

    .line 87
    iput p2, v0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->firstSampleFlags:I

    .line 88
    iput-object p3, v0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleDuration:[I

    .line 89
    iput-object p4, v0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleSize:[I

    .line 90
    iput-object p5, v0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleFlags:[I

    .line 91
    iput-object p6, v0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleCompositionOffset:[I

    .line 92
    return-object v0
.end method

.method public static flagsGetSampleDegradationPriority(I)I
    .locals 1

    .line 249
    shr-int/lit8 p0, p0, 0x10

    const v0, 0xffff

    and-int/2addr p0, v0

    return p0
.end method

.method public static flagsGetSampleDependsOn(I)I
    .locals 0

    .line 229
    shr-int/lit8 p0, p0, 0x6

    and-int/lit8 p0, p0, 0x3

    return p0
.end method

.method public static flagsGetSampleHasRedundancy(I)I
    .locals 0

    .line 237
    shr-int/lit8 p0, p0, 0xa

    and-int/lit8 p0, p0, 0x3

    return p0
.end method

.method public static flagsGetSampleIsDependedOn(I)I
    .locals 0

    .line 233
    shr-int/lit8 p0, p0, 0x8

    and-int/lit8 p0, p0, 0x3

    return p0
.end method

.method public static flagsGetSampleIsDifferentSample(I)I
    .locals 0

    .line 245
    shr-int/lit8 p0, p0, 0xf

    and-int/lit8 p0, p0, 0x1

    return p0
.end method

.method public static flagsGetSamplePaddingValue(I)I
    .locals 0

    .line 241
    shr-int/lit8 p0, p0, 0xc

    and-int/lit8 p0, p0, 0x7

    return p0
.end method

.method public static fourcc()Ljava/lang/String;
    .locals 1

    .line 53
    const-string v0, "trun"

    return-object v0
.end method


# virtual methods
.method public doWrite(Ljava/nio/ByteBuffer;)V
    .locals 2

    .line 291
    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;->doWrite(Ljava/nio/ByteBuffer;)V

    .line 292
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleCount:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 293
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->isDataOffsetAvailable()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 294
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->dataOffset:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 295
    :cond_0
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->isFirstSampleFlagsAvailable()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 296
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->firstSampleFlags:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 298
    :cond_1
    const/4 v0, 0x0

    :goto_0
    iget v1, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleCount:I

    if-ge v0, v1, :cond_6

    .line 299
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->isSampleDurationAvailable()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 300
    iget-object v1, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleDuration:[I

    aget v1, v1, v0

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 301
    :cond_2
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->isSampleSizeAvailable()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 302
    iget-object v1, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleSize:[I

    aget v1, v1, v0

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 303
    :cond_3
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->isSampleFlagsAvailable()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 304
    iget-object v1, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleFlags:[I

    aget v1, v1, v0

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 305
    :cond_4
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->isSampleCompositionOffsetAvailable()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 306
    iget-object v1, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleCompositionOffset:[I

    aget v1, v1, v0

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 298
    :cond_5
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 308
    :cond_6
    return-void
.end method

.method public estimateSize()I
    .locals 2

    .line 312
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleCount:I

    mul-int/lit8 v0, v0, 0x10

    const/16 v1, 0x18

    add-int/2addr v1, v0

    return v1
.end method

.method public getDataOffset()I
    .locals 1

    .line 165
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->dataOffset:I

    return v0
.end method

.method public getFirstSampleFlags()I
    .locals 1

    .line 169
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->firstSampleFlags:I

    return v0
.end method

.method public getSampleCompositionOffset(I)J
    .locals 2

    .line 201
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleCompositionOffset:[I

    aget p1, v0, p1

    invoke-static {p1}, Lorg/jcodec/platform/Platform;->unsignedInt(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getSampleCompositionOffsets()[I
    .locals 1

    .line 185
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleCompositionOffset:[I

    return-object v0
.end method

.method public getSampleCount()J
    .locals 2

    .line 161
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleCount:I

    invoke-static {v0}, Lorg/jcodec/platform/Platform;->unsignedInt(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getSampleDuration(I)J
    .locals 2

    .line 189
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleDuration:[I

    aget p1, v0, p1

    invoke-static {p1}, Lorg/jcodec/platform/Platform;->unsignedInt(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getSampleDurations()[I
    .locals 1

    .line 173
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleDuration:[I

    return-object v0
.end method

.method public getSampleFlags(I)I
    .locals 1

    .line 197
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleFlags:[I

    aget p1, v0, p1

    return p1
.end method

.method public getSampleSize(I)J
    .locals 2

    .line 193
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleSize:[I

    aget p1, v0, p1

    invoke-static {p1}, Lorg/jcodec/platform/Platform;->unsignedInt(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getSampleSizes()[I
    .locals 1

    .line 177
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleSize:[I

    return-object v0
.end method

.method public getSamplesFlags()[I
    .locals 1

    .line 181
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleFlags:[I

    return-object v0
.end method

.method public isDataOffsetAvailable()Z
    .locals 2

    .line 205
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->flags:I

    const/4 v1, 0x1

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public isFirstSampleFlagsAvailable()Z
    .locals 1

    .line 225
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->flags:I

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isSampleCompositionOffsetAvailable()Z
    .locals 1

    .line 209
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->flags:I

    and-int/lit16 v0, v0, 0x800

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isSampleDurationAvailable()Z
    .locals 1

    .line 221
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->flags:I

    and-int/lit16 v0, v0, 0x100

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isSampleFlagsAvailable()Z
    .locals 1

    .line 213
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->flags:I

    and-int/lit16 v0, v0, 0x400

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isSampleSizeAvailable()Z
    .locals 1

    .line 217
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->flags:I

    and-int/lit16 v0, v0, 0x200

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public parse(Ljava/nio/ByteBuffer;)V
    .locals 3

    .line 258
    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;->parse(Ljava/nio/ByteBuffer;)V

    .line 260
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->isSampleFlagsAvailable()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->isFirstSampleFlagsAvailable()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 261
    :cond_0
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "Broken stream"

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 263
    :cond_1
    :goto_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleCount:I

    .line 264
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->isDataOffsetAvailable()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 265
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->dataOffset:I

    .line 266
    :cond_2
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->isFirstSampleFlagsAvailable()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 267
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->firstSampleFlags:I

    .line 268
    :cond_3
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->isSampleDurationAvailable()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 269
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleCount:I

    new-array v0, v0, [I

    iput-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleDuration:[I

    .line 270
    :cond_4
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->isSampleSizeAvailable()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 271
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleCount:I

    new-array v0, v0, [I

    iput-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleSize:[I

    .line 272
    :cond_5
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->isSampleFlagsAvailable()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 273
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleCount:I

    new-array v0, v0, [I

    iput-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleFlags:[I

    .line 274
    :cond_6
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->isSampleCompositionOffsetAvailable()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 275
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleCount:I

    new-array v0, v0, [I

    iput-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleCompositionOffset:[I

    .line 277
    :cond_7
    const/4 v0, 0x0

    :goto_1
    iget v1, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleCount:I

    if-ge v0, v1, :cond_c

    .line 278
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->isSampleDurationAvailable()Z

    move-result v1

    if-eqz v1, :cond_8

    .line 279
    iget-object v1, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleDuration:[I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v2

    aput v2, v1, v0

    .line 280
    :cond_8
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->isSampleSizeAvailable()Z

    move-result v1

    if-eqz v1, :cond_9

    .line 281
    iget-object v1, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleSize:[I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v2

    aput v2, v1, v0

    .line 282
    :cond_9
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->isSampleFlagsAvailable()Z

    move-result v1

    if-eqz v1, :cond_a

    .line 283
    iget-object v1, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleFlags:[I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v2

    aput v2, v1, v0

    .line 284
    :cond_a
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->isSampleCompositionOffsetAvailable()Z

    move-result v1

    if-eqz v1, :cond_b

    .line 285
    iget-object v1, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleCompositionOffset:[I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v2

    aput v2, v1, v0

    .line 277
    :cond_b
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 287
    :cond_c
    return-void
.end method

.method public setDataOffset(I)V
    .locals 0

    .line 57
    iput p1, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->dataOffset:I

    .line 58
    return-void
.end method
