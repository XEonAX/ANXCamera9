.class Landroid/support/v7/widget/PositionMap$ContainerHelpers;
.super Ljava/lang/Object;
.source "PositionMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/widget/PositionMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ContainerHelpers"
.end annotation


# static fields
.field static final EMPTY_BOOLEANS:[Z

.field static final EMPTY_INTS:[I

.field static final EMPTY_LONGS:[J

.field static final EMPTY_OBJECTS:[Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 434
    const/4 v0, 0x0

    new-array v1, v0, [Z

    sput-object v1, Landroid/support/v7/widget/PositionMap$ContainerHelpers;->EMPTY_BOOLEANS:[Z

    .line 435
    new-array v1, v0, [I

    sput-object v1, Landroid/support/v7/widget/PositionMap$ContainerHelpers;->EMPTY_INTS:[I

    .line 436
    new-array v1, v0, [J

    sput-object v1, Landroid/support/v7/widget/PositionMap$ContainerHelpers;->EMPTY_LONGS:[J

    .line 437
    new-array v0, v0, [Ljava/lang/Object;

    sput-object v0, Landroid/support/v7/widget/PositionMap$ContainerHelpers;->EMPTY_OBJECTS:[Ljava/lang/Object;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 433
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static binarySearch([III)I
    .locals 4
    .param p0, "array"    # [I
    .param p1, "size"    # I
    .param p2, "value"    # I

    .line 441
    const/4 v0, 0x0

    .line 442
    .local v0, "lo":I
    add-int/lit8 v1, p1, -0x1

    .line 444
    .local v1, "hi":I
    :goto_0
    if-gt v0, v1, :cond_2

    .line 445
    add-int v2, v0, v1

    ushr-int/lit8 v2, v2, 0x1

    .line 446
    .local v2, "mid":I
    aget v3, p0, v2

    .line 448
    .local v3, "midVal":I
    if-ge v3, p2, :cond_0

    .line 449
    add-int/lit8 v0, v2, 0x1

    goto :goto_1

    .line 450
    :cond_0
    if-le v3, p2, :cond_1

    .line 451
    add-int/lit8 v1, v2, -0x1

    .line 455
    .end local v2    # "mid":I
    .end local v3    # "midVal":I
    :goto_1
    goto :goto_0

    .line 453
    .restart local v2    # "mid":I
    .restart local v3    # "midVal":I
    :cond_1
    return v2

    .line 456
    .end local v2    # "mid":I
    .end local v3    # "midVal":I
    :cond_2
    not-int v2, v0

    return v2
.end method
