.class public Lcom/facebook/rebound/BouncyConversion;
.super Ljava/lang/Object;
.source "BouncyConversion.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final mBounciness:D

.field private final mBouncyFriction:D

.field private final mBouncyTension:D

.field private final mSpeed:D


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 17
    return-void
.end method

.method public constructor <init>(DD)V
    .locals 14

    move-object v7, p0

    move-wide v8, p1

    .line 24
    move-wide/from16 v0, p3

    invoke-direct {v7}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-wide v8, v7, Lcom/facebook/rebound/BouncyConversion;->mSpeed:D

    .line 26
    iput-wide v0, v7, Lcom/facebook/rebound/BouncyConversion;->mBounciness:D

    .line 27
    const-wide v10, 0x3ffb333333333333L    # 1.7

    div-double v1, v0, v10

    const-wide/16 v3, 0x0

    const-wide/high16 v5, 0x4034000000000000L    # 20.0

    move-object v0, v7

    invoke-direct/range {v0 .. v6}, Lcom/facebook/rebound/BouncyConversion;->normalize(DDD)D

    move-result-wide v1

    .line 28
    const-wide v5, 0x3fe999999999999aL    # 0.8

    invoke-direct/range {v0 .. v6}, Lcom/facebook/rebound/BouncyConversion;->project_normal(DDD)D

    move-result-wide v12

    .line 29
    div-double v1, v8, v10

    const-wide/high16 v5, 0x4034000000000000L    # 20.0

    invoke-direct/range {v0 .. v6}, Lcom/facebook/rebound/BouncyConversion;->normalize(DDD)D

    move-result-wide v1

    .line 30
    const-wide/high16 v3, 0x3fe0000000000000L    # 0.5

    const-wide/high16 v5, 0x4069000000000000L    # 200.0

    invoke-direct/range {v0 .. v6}, Lcom/facebook/rebound/BouncyConversion;->project_normal(DDD)D

    move-result-wide v0

    iput-wide v0, v7, Lcom/facebook/rebound/BouncyConversion;->mBouncyTension:D

    .line 31
    iget-wide v0, v7, Lcom/facebook/rebound/BouncyConversion;->mBouncyTension:D

    invoke-direct {v7, v0, v1}, Lcom/facebook/rebound/BouncyConversion;->b3_nobounce(D)D

    move-result-wide v3

    const-wide v5, 0x3f847ae147ae147bL    # 0.01

    move-object v0, v7

    move-wide v1, v12

    invoke-direct/range {v0 .. v6}, Lcom/facebook/rebound/BouncyConversion;->quadratic_out_interpolation(DDD)D

    move-result-wide v0

    iput-wide v0, v7, Lcom/facebook/rebound/BouncyConversion;->mBouncyFriction:D

    .line 32
    return-void
.end method

.method private b3_friction1(D)D
    .locals 6

    .line 67
    const-wide/high16 v0, 0x4008000000000000L    # 3.0

    invoke-static {p1, p2, v0, v1}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    const-wide v2, 0x3f46f0068db8bac7L    # 7.0E-4

    mul-double/2addr v2, v0

    const-wide/high16 v0, 0x4000000000000000L    # 2.0

    invoke-static {p1, p2, v0, v1}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    const-wide v4, 0x3f9fbe76c8b43958L    # 0.031

    mul-double/2addr v4, v0

    sub-double/2addr v2, v4

    const-wide v0, 0x3fe47ae147ae147bL    # 0.64

    mul-double/2addr v0, p1

    add-double/2addr v2, v0

    const-wide p1, 0x3ff47ae147ae147bL    # 1.28

    add-double/2addr v2, p1

    return-wide v2
.end method

.method private b3_friction2(D)D
    .locals 8

    .line 71
    const-wide/high16 v0, 0x4008000000000000L    # 3.0

    invoke-static {p1, p2, v0, v1}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    const-wide v2, 0x3f0711947cfa26a2L    # 4.4E-5

    mul-double/2addr v2, v0

    const-wide/high16 v0, 0x4000000000000000L    # 2.0

    invoke-static {p1, p2, v0, v1}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v4

    const-wide v6, 0x3f789374bc6a7efaL    # 0.006

    mul-double/2addr v6, v4

    sub-double/2addr v2, v6

    const-wide v4, 0x3fd70a3d70a3d70aL    # 0.36

    mul-double/2addr v4, p1

    add-double/2addr v2, v4

    add-double/2addr v2, v0

    return-wide v2
.end method

.method private b3_friction3(D)D
    .locals 6

    .line 75
    const-wide/high16 v0, 0x4008000000000000L    # 3.0

    invoke-static {p1, p2, v0, v1}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    const-wide v2, 0x3e9e32f0ee144531L    # 4.5E-7

    mul-double/2addr v2, v0

    const-wide/high16 v0, 0x4000000000000000L    # 2.0

    invoke-static {p1, p2, v0, v1}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    const-wide v4, 0x3f35c209246bf013L    # 3.32E-4

    mul-double/2addr v4, v0

    sub-double/2addr v2, v4

    const-wide v0, 0x3fbb98c7e28240b8L    # 0.1078

    mul-double/2addr v0, p1

    add-double/2addr v2, v0

    const-wide p1, 0x40175c28f5c28f5cL    # 5.84

    add-double/2addr v2, p1

    return-wide v2
.end method

.method private b3_nobounce(D)D
    .locals 3

    .line 79
    nop

    .line 80
    const-wide/high16 v0, 0x4032000000000000L    # 18.0

    cmpg-double v2, p1, v0

    if-gtz v2, :cond_0

    .line 81
    invoke-direct {p0, p1, p2}, Lcom/facebook/rebound/BouncyConversion;->b3_friction1(D)D

    move-result-wide p1

    goto :goto_0

    .line 82
    :cond_0
    cmpl-double v0, p1, v0

    const-wide/high16 v1, 0x4046000000000000L    # 44.0

    if-lez v0, :cond_1

    cmpg-double v0, p1, v1

    if-gtz v0, :cond_1

    .line 83
    invoke-direct {p0, p1, p2}, Lcom/facebook/rebound/BouncyConversion;->b3_friction2(D)D

    move-result-wide p1

    goto :goto_0

    .line 84
    :cond_1
    cmpl-double v0, p1, v1

    if-lez v0, :cond_2

    .line 85
    invoke-direct {p0, p1, p2}, Lcom/facebook/rebound/BouncyConversion;->b3_friction3(D)D

    move-result-wide p1

    goto :goto_0

    .line 87
    :cond_2
    nop

    .line 89
    const-wide/16 p1, 0x0

    :goto_0
    return-wide p1
.end method

.method private linear_interpolation(DDD)D
    .locals 2

    .line 59
    mul-double/2addr p5, p1

    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    sub-double/2addr v0, p1

    mul-double/2addr v0, p3

    add-double/2addr p5, v0

    return-wide p5
.end method

.method private normalize(DDD)D
    .locals 0

    .line 51
    sub-double/2addr p1, p3

    sub-double/2addr p5, p3

    div-double/2addr p1, p5

    return-wide p1
.end method

.method private project_normal(DDD)D
    .locals 0

    .line 55
    sub-double/2addr p5, p3

    mul-double/2addr p1, p5

    add-double/2addr p3, p1

    return-wide p3
.end method

.method private quadratic_out_interpolation(DDD)D
    .locals 9

    .line 63
    const-wide/high16 v0, 0x4000000000000000L    # 2.0

    mul-double/2addr v0, p1

    mul-double/2addr p1, p1

    sub-double v3, v0, p1

    move-object v2, p0

    move-wide v5, p3

    move-wide v7, p5

    invoke-direct/range {v2 .. v8}, Lcom/facebook/rebound/BouncyConversion;->linear_interpolation(DDD)D

    move-result-wide p1

    return-wide p1
.end method


# virtual methods
.method public getBounciness()D
    .locals 2

    .line 39
    iget-wide v0, p0, Lcom/facebook/rebound/BouncyConversion;->mBounciness:D

    return-wide v0
.end method

.method public getBouncyFriction()D
    .locals 2

    .line 47
    iget-wide v0, p0, Lcom/facebook/rebound/BouncyConversion;->mBouncyFriction:D

    return-wide v0
.end method

.method public getBouncyTension()D
    .locals 2

    .line 43
    iget-wide v0, p0, Lcom/facebook/rebound/BouncyConversion;->mBouncyTension:D

    return-wide v0
.end method

.method public getSpeed()D
    .locals 2

    .line 35
    iget-wide v0, p0, Lcom/facebook/rebound/BouncyConversion;->mSpeed:D

    return-wide v0
.end method
