.class public final Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;
.super Ljava/lang/Object;
.source "ModulusGF.java"


# static fields
.field public static final PDF417_GF:Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;


# instance fields
.field private final expTable:[I

.field private final logTable:[I

.field private final modulus:I

.field private final one:Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;

.field private final zero:Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .line 29
    new-instance v0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;

    const/16 v1, 0x3a1

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;-><init>(II)V

    sput-object v0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->PDF417_GF:Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;

    return-void
.end method

.method private constructor <init>(II)V
    .registers 8
    .param p1, "modulus"    # I
    .param p2, "generator"    # I

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput p1, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->modulus:I

    .line 39
    new-array v0, p1, [I

    iput-object v0, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->expTable:[I

    .line 40
    new-array v0, p1, [I

    iput-object v0, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->logTable:[I

    .line 41
    const/4 v0, 0x1

    .line 42
    .local v0, "x":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_f
    if-lt v1, p1, :cond_38

    .line 46
    .end local v1    # "i":I
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_12
    add-int/lit8 v2, p1, -0x1

    if-lt v1, v2, :cond_2d

    .line 50
    .end local v1    # "i":I
    new-instance v1, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;

    const/4 v2, 0x1

    new-array v3, v2, [I

    invoke-direct {v1, p0, v3}, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;-><init>(Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;[I)V

    iput-object v1, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->zero:Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;

    .line 51
    new-instance v1, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;

    new-array v3, v2, [I

    const/4 v4, 0x0

    aput v2, v3, v4

    invoke-direct {v1, p0, v3}, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;-><init>(Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;[I)V

    iput-object v1, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->one:Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;

    .line 52
    return-void

    .line 47
    .restart local v1    # "i":I
    :cond_2d
    iget-object v2, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->logTable:[I

    iget-object v3, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->expTable:[I

    aget v3, v3, v1

    aput v1, v2, v3

    .line 46
    add-int/lit8 v1, v1, 0x1

    goto :goto_12

    .line 43
    :cond_38
    iget-object v2, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->expTable:[I

    aput v0, v2, v1

    .line 44
    mul-int v2, v0, p2

    rem-int v0, v2, p1

    .line 42
    add-int/lit8 v1, v1, 0x1

    goto :goto_f
.end method


# virtual methods
.method add(II)I
    .registers 5
    .param p1, "a"    # I
    .param p2, "b"    # I

    .line 76
    add-int v0, p1, p2

    iget v1, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->modulus:I

    rem-int/2addr v0, v1

    return v0
.end method

.method buildMonomial(II)Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    .registers 5
    .param p1, "degree"    # I
    .param p2, "coefficient"    # I

    .line 64
    if-ltz p1, :cond_14

    .line 67
    if-nez p2, :cond_7

    .line 68
    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->zero:Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;

    return-object v0

    .line 70
    :cond_7
    add-int/lit8 v0, p1, 0x1

    new-array v0, v0, [I

    .line 71
    .local v0, "coefficients":[I
    const/4 v1, 0x0

    aput p2, v0, v1

    .line 72
    new-instance v1, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;

    invoke-direct {v1, p0, v0}, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;-><init>(Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;[I)V

    return-object v1

    .line 65
    .end local v0    # "coefficients":[I
    :cond_14
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method exp(I)I
    .registers 3
    .param p1, "a"    # I

    .line 84
    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->expTable:[I

    aget v0, v0, p1

    return v0
.end method

.method getOne()Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    .registers 2

    .line 60
    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->one:Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;

    return-object v0
.end method

.method getSize()I
    .registers 2

    .line 109
    iget v0, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->modulus:I

    return v0
.end method

.method getZero()Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    .registers 2

    .line 56
    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->zero:Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;

    return-object v0
.end method

.method inverse(I)I
    .registers 5
    .param p1, "a"    # I

    .line 95
    if-eqz p1, :cond_10

    .line 98
    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->expTable:[I

    iget v1, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->modulus:I

    iget-object v2, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->logTable:[I

    aget v2, v2, p1

    sub-int/2addr v1, v2

    add-int/lit8 v1, v1, -0x1

    aget v0, v0, v1

    return v0

    .line 96
    :cond_10
    new-instance v0, Ljava/lang/ArithmeticException;

    invoke-direct {v0}, Ljava/lang/ArithmeticException;-><init>()V

    throw v0
.end method

.method log(I)I
    .registers 3
    .param p1, "a"    # I

    .line 88
    if-eqz p1, :cond_7

    .line 91
    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->logTable:[I

    aget v0, v0, p1

    return v0

    .line 89
    :cond_7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method multiply(II)I
    .registers 6
    .param p1, "a"    # I
    .param p2, "b"    # I

    .line 102
    if-eqz p1, :cond_18

    if-nez p2, :cond_5

    goto :goto_18

    .line 105
    :cond_5
    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->expTable:[I

    iget-object v1, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->logTable:[I

    aget v1, v1, p1

    iget-object v2, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->logTable:[I

    aget v2, v2, p2

    add-int/2addr v1, v2

    iget v2, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->modulus:I

    add-int/lit8 v2, v2, -0x1

    rem-int/2addr v1, v2

    aget v0, v0, v1

    return v0

    .line 103
    :cond_18
    :goto_18
    const/4 v0, 0x0

    return v0
.end method

.method subtract(II)I
    .registers 5
    .param p1, "a"    # I
    .param p2, "b"    # I

    .line 80
    iget v0, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->modulus:I

    add-int/2addr v0, p1

    sub-int/2addr v0, p2

    iget v1, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->modulus:I

    rem-int/2addr v0, v1

    return v0
.end method
