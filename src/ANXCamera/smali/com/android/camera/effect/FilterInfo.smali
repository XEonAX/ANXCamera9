.class public Lcom/android/camera/effect/FilterInfo;
.super Ljava/lang/Object;
.source "FilterInfo.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/effect/FilterInfo$FilterCategory;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Lcom/android/camera/effect/FilterInfo;",
        ">;"
    }
.end annotation


# static fields
.field public static final AI_SCENE_FILTER_ID_0_NONE:I

.field public static final CATEGORY_SHIFT:I = 0x10

.field public static final FILTER_CATEGORY_AI_SCENE:I = 0x5

.field public static final FILTER_CATEGORY_BEAUTY:I = 0x2

.field public static final FILTER_CATEGORY_LIGHTING:I = 0x6

.field public static final FILTER_CATEGORY_NORMAL:I = 0x1

.field public static final FILTER_CATEGORY_PRIVATE:I = 0x0

.field public static final FILTER_CATEGORY_STICKER:I = 0x3

.field public static final FILTER_ID_BLUR:I

.field public static final FILTER_ID_GAUSSIAN:I

.field public static final FILTER_ID_GRADIENTER:I

.field public static final FILTER_ID_NONE:I

.field public static final FILTER_ID_PEAKINGMF:I

.field public static final FILTER_ID_RGB2YUV:I

.field public static final FILTER_ID_STICKER:I

.field public static final FILTER_ID_TILTSHIFT:I

.field public static final FILTER_ID_YUV2RGB:I

.field public static final RENDER_CATEGORY_MAKEUP:I = 0x4

.field public static final RENDER_ID_MAKEUP:I


# instance fields
.field private mCategory:I

.field private mIconResId:I

.field private mIndex:I

.field private mIsNeedRect:Z

.field private mNameResId:I

.field private mOrder:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 33
    const/4 v0, 0x0

    const/16 v1, 0x101

    invoke-static {v0, v1}, Lcom/android/camera/effect/FilterInfo;->getId(II)I

    move-result v1

    sput v1, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_BLUR:I

    .line 34
    const/16 v1, 0x102

    invoke-static {v0, v1}, Lcom/android/camera/effect/FilterInfo;->getId(II)I

    move-result v1

    sput v1, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_GRADIENTER:I

    .line 35
    const/16 v1, 0x103

    invoke-static {v0, v1}, Lcom/android/camera/effect/FilterInfo;->getId(II)I

    move-result v1

    sput v1, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_TILTSHIFT:I

    .line 36
    const/16 v1, 0x104

    invoke-static {v0, v1}, Lcom/android/camera/effect/FilterInfo;->getId(II)I

    move-result v1

    sput v1, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_GAUSSIAN:I

    .line 37
    const/16 v1, 0x105

    invoke-static {v0, v1}, Lcom/android/camera/effect/FilterInfo;->getId(II)I

    move-result v1

    sput v1, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_PEAKINGMF:I

    .line 38
    const/16 v1, 0x106

    invoke-static {v0, v1}, Lcom/android/camera/effect/FilterInfo;->getId(II)I

    move-result v1

    sput v1, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_STICKER:I

    .line 39
    const/16 v1, 0x107

    invoke-static {v0, v1}, Lcom/android/camera/effect/FilterInfo;->getId(II)I

    move-result v1

    sput v1, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_YUV2RGB:I

    .line 40
    const/16 v1, 0x108

    invoke-static {v0, v1}, Lcom/android/camera/effect/FilterInfo;->getId(II)I

    move-result v0

    sput v0, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_RGB2YUV:I

    .line 42
    const/4 v0, 0x1

    const/16 v1, 0x200

    invoke-static {v0, v1}, Lcom/android/camera/effect/FilterInfo;->getId(II)I

    move-result v0

    sput v0, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    .line 44
    const/4 v0, 0x4

    const/16 v1, 0x301

    invoke-static {v0, v1}, Lcom/android/camera/effect/FilterInfo;->getId(II)I

    move-result v0

    sput v0, Lcom/android/camera/effect/FilterInfo;->RENDER_ID_MAKEUP:I

    .line 47
    sget v0, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    sput v0, Lcom/android/camera/effect/FilterInfo;->AI_SCENE_FILTER_ID_0_NONE:I

    return-void
.end method

.method public constructor <init>(II)V
    .locals 1

    .line 57
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, v0, p2}, Lcom/android/camera/effect/FilterInfo;-><init>(IIII)V

    .line 58
    return-void
.end method

.method public constructor <init>(IIII)V
    .locals 6

    .line 61
    invoke-static {p1}, Lcom/android/camera/effect/FilterInfo;->getCategory(I)I

    move-result v1

    invoke-static {p1}, Lcom/android/camera/effect/FilterInfo;->getIndex(I)I

    move-result v2

    move-object v0, p0

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/effect/FilterInfo;-><init>(IIIII)V

    .line 62
    return-void
.end method

.method public constructor <init>(IIIII)V
    .locals 0

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    iput p1, p0, Lcom/android/camera/effect/FilterInfo;->mCategory:I

    .line 66
    iput p2, p0, Lcom/android/camera/effect/FilterInfo;->mIndex:I

    .line 67
    iput p5, p0, Lcom/android/camera/effect/FilterInfo;->mOrder:I

    .line 68
    iput p3, p0, Lcom/android/camera/effect/FilterInfo;->mNameResId:I

    .line 69
    iput p4, p0, Lcom/android/camera/effect/FilterInfo;->mIconResId:I

    .line 70
    return-void
.end method

.method public static getCategory(I)I
    .locals 0

    .line 113
    shr-int/lit8 p0, p0, 0x10

    return p0
.end method

.method public static getId(II)I
    .locals 0

    .line 109
    shl-int/lit8 p0, p0, 0x10

    or-int/2addr p0, p1

    return p0
.end method

.method public static getIndex(I)I
    .locals 1

    .line 117
    const v0, 0xffff

    and-int/2addr p0, v0

    return p0
.end method


# virtual methods
.method public compareTo(Lcom/android/camera/effect/FilterInfo;)I
    .locals 2
    .param p1    # Lcom/android/camera/effect/FilterInfo;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 122
    iget v0, p0, Lcom/android/camera/effect/FilterInfo;->mOrder:I

    iget v1, p1, Lcom/android/camera/effect/FilterInfo;->mOrder:I

    if-ne v0, v1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/android/camera/effect/FilterInfo;->mOrder:I

    iget p1, p1, Lcom/android/camera/effect/FilterInfo;->mOrder:I

    if-le v0, p1, :cond_1

    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, -0x1

    :goto_0
    return p1
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 9
    check-cast p1, Lcom/android/camera/effect/FilterInfo;

    invoke-virtual {p0, p1}, Lcom/android/camera/effect/FilterInfo;->compareTo(Lcom/android/camera/effect/FilterInfo;)I

    move-result p1

    return p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 127
    const/4 v0, 0x0

    if-eqz p1, :cond_2

    instance-of v1, p1, Lcom/android/camera/effect/FilterInfo;

    if-nez v1, :cond_0

    goto :goto_0

    .line 130
    :cond_0
    iget v1, p0, Lcom/android/camera/effect/FilterInfo;->mCategory:I

    check-cast p1, Lcom/android/camera/effect/FilterInfo;

    iget v2, p1, Lcom/android/camera/effect/FilterInfo;->mCategory:I

    if-ne v1, v2, :cond_1

    iget v1, p0, Lcom/android/camera/effect/FilterInfo;->mIndex:I

    iget p1, p1, Lcom/android/camera/effect/FilterInfo;->mIndex:I

    if-ne v1, p1, :cond_1

    const/4 v0, 0x1

    nop

    :cond_1
    return v0

    .line 128
    :cond_2
    :goto_0
    return v0
.end method

.method public getIconResId()I
    .locals 1

    .line 81
    iget v0, p0, Lcom/android/camera/effect/FilterInfo;->mIconResId:I

    return v0
.end method

.method public getId()I
    .locals 2

    .line 105
    iget v0, p0, Lcom/android/camera/effect/FilterInfo;->mCategory:I

    shl-int/lit8 v0, v0, 0x10

    iget v1, p0, Lcom/android/camera/effect/FilterInfo;->mIndex:I

    or-int/2addr v0, v1

    return v0
.end method

.method public getNameResId()I
    .locals 1

    .line 73
    iget v0, p0, Lcom/android/camera/effect/FilterInfo;->mNameResId:I

    return v0
.end method

.method public getOrder()I
    .locals 1

    .line 97
    iget v0, p0, Lcom/android/camera/effect/FilterInfo;->mOrder:I

    return v0
.end method

.method public isNeedRect()Z
    .locals 1

    .line 89
    iget-boolean v0, p0, Lcom/android/camera/effect/FilterInfo;->mIsNeedRect:Z

    return v0
.end method

.method public setIconResId(I)V
    .locals 0

    .line 85
    iput p1, p0, Lcom/android/camera/effect/FilterInfo;->mIconResId:I

    .line 86
    return-void
.end method

.method public setNameResId(I)V
    .locals 0

    .line 77
    iput p1, p0, Lcom/android/camera/effect/FilterInfo;->mNameResId:I

    .line 78
    return-void
.end method

.method public setNeedRect(Z)V
    .locals 0

    .line 93
    iput-boolean p1, p0, Lcom/android/camera/effect/FilterInfo;->mIsNeedRect:Z

    .line 94
    return-void
.end method

.method public setOrder(I)V
    .locals 0

    .line 101
    iput p1, p0, Lcom/android/camera/effect/FilterInfo;->mOrder:I

    .line 102
    return-void
.end method
