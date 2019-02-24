.class final Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;
.super Ljava/lang/Object;
.source "EdgeGestureDetector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/ui/EdgeGestureDetector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "FasterStringBuilder"
.end annotation


# instance fields
.field private mChars:[C

.field private mLength:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 294
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 295
    const/16 v0, 0x40

    new-array v0, v0, [C

    iput-object v0, p0, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->mChars:[C

    .line 296
    return-void
.end method

.method private reserve(I)I
    .locals 3

    .line 384
    iget v0, p0, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->mLength:I

    .line 385
    iget v1, p0, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->mLength:I

    add-int/2addr v1, p1

    .line 386
    iget-object p1, p0, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->mChars:[C

    .line 387
    array-length v2, p1

    .line 388
    if-le v1, v2, :cond_0

    .line 389
    mul-int/lit8 v2, v2, 0x2

    .line 390
    new-array v1, v2, [C

    .line 391
    const/4 v2, 0x0

    invoke-static {p1, v2, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 392
    iput-object v1, p0, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->mChars:[C

    .line 394
    :cond_0
    return v0
.end method


# virtual methods
.method public append(FI)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;
    .locals 6

    .line 360
    nop

    .line 361
    const/4 v0, 0x1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, p2, :cond_0

    .line 362
    mul-int/lit8 v0, v0, 0xa

    .line 361
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 364
    :cond_0
    int-to-float v1, v0

    mul-float/2addr p1, v1

    float-to-double v2, p1

    invoke-static {v2, v3}, Ljava/lang/Math;->rint(D)D

    move-result-wide v2

    int-to-double v4, v0

    div-double/2addr v2, v4

    double-to-float p1, v2

    .line 366
    float-to-int v0, p1

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(I)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    .line 368
    if-eqz p2, :cond_1

    .line 369
    const-string v0, "."

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(Ljava/lang/String;)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    .line 370
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    .line 371
    float-to-double v2, p1

    invoke-static {v2, v3}, Ljava/lang/Math;->floor(D)D

    move-result-wide v4

    sub-double/2addr v2, v4

    double-to-float p1, v2

    .line 372
    mul-float/2addr p1, v1

    float-to-int p1, p1

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(II)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    .line 375
    :cond_1
    return-object p0
.end method

.method public append(I)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;
    .locals 1

    .line 312
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(II)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    return-object p1
.end method

.method public append(II)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;
    .locals 7

    .line 316
    const/4 v0, 0x1

    if-gez p1, :cond_0

    .line 317
    move v1, v0

    goto :goto_0

    .line 316
    :cond_0
    const/4 v1, 0x0

    .line 317
    :goto_0
    if-eqz v1, :cond_1

    .line 318
    neg-int p1, p1

    .line 319
    if-gez p1, :cond_1

    .line 320
    const-string p1, "-2147483648"

    invoke-virtual {p0, p1}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(Ljava/lang/String;)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    .line 321
    return-object p0

    .line 325
    :cond_1
    const/16 v2, 0xb

    invoke-direct {p0, v2}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->reserve(I)I

    move-result v2

    .line 326
    iget-object v3, p0, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->mChars:[C

    .line 328
    const/16 v4, 0x30

    if-nez p1, :cond_2

    .line 329
    aput-char v4, v3, v2

    .line 330
    iget p1, p0, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->mLength:I

    add-int/2addr p1, v0

    iput p1, p0, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->mLength:I

    .line 331
    return-object p0

    .line 334
    :cond_2
    if-eqz v1, :cond_3

    .line 335
    add-int/lit8 v0, v2, 0x1

    const/16 v1, 0x2d

    aput-char v1, v3, v2

    goto :goto_1

    .line 338
    :cond_3
    move v0, v2

    :goto_1
    const v1, 0x3b9aca00

    .line 339
    nop

    .line 340
    const/16 v2, 0xa

    move v5, v0

    move v0, v2

    :cond_4
    :goto_2
    if-ge p1, v1, :cond_5

    .line 341
    div-int/lit8 v1, v1, 0xa

    .line 342
    add-int/lit8 v0, v0, -0x1

    .line 343
    if-ge v0, p2, :cond_4

    .line 344
    add-int/lit8 v6, v5, 0x1

    aput-char v4, v3, v5

    .line 340
    move v5, v6

    goto :goto_2

    .line 349
    :cond_5
    :goto_3
    div-int p2, p1, v1

    .line 350
    mul-int v0, p2, v1

    sub-int/2addr p1, v0

    .line 351
    div-int/2addr v1, v2

    .line 352
    add-int/lit8 v0, v5, 0x1

    add-int/2addr p2, v4

    int-to-char p2, p2

    aput-char p2, v3, v5

    .line 353
    if-nez v1, :cond_6

    .line 355
    iput v0, p0, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->mLength:I

    .line 356
    return-object p0

    .line 349
    :cond_6
    move v5, v0

    goto :goto_3
.end method

.method public append(Ljava/lang/String;)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;
    .locals 4

    .line 304
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 305
    invoke-direct {p0, v0}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->reserve(I)I

    move-result v1

    .line 306
    iget-object v2, p0, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->mChars:[C

    const/4 v3, 0x0

    invoke-virtual {p1, v3, v0, v2, v1}, Ljava/lang/String;->getChars(II[CI)V

    .line 307
    iget p1, p0, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->mLength:I

    add-int/2addr p1, v0

    iput p1, p0, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->mLength:I

    .line 308
    return-object p0
.end method

.method public clear()Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;
    .locals 1

    .line 299
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->mLength:I

    .line 300
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 380
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->mChars:[C

    iget v2, p0, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->mLength:I

    const/4 v3, 0x0

    invoke-direct {v0, v1, v3, v2}, Ljava/lang/String;-><init>([CII)V

    return-object v0
.end method
