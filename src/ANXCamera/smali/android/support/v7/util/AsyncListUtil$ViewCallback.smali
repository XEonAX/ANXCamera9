.class public abstract Landroid/support/v7/util/AsyncListUtil$ViewCallback;
.super Ljava/lang/Object;
.source "AsyncListUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/util/AsyncListUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "ViewCallback"
.end annotation


# static fields
.field public static final HINT_SCROLL_ASC:I = 0x2

.field public static final HINT_SCROLL_DESC:I = 0x1

.field public static final HINT_SCROLL_NONE:I


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 517
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public extendRangeInto([I[II)V
    .registers 10
    .param p1, "range"    # [I
    .param p2, "outRange"    # [I
    .param p3, "scrollHint"    # I
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    .line 573
    const/4 v0, 0x1

    aget v1, p1, v0

    const/4 v2, 0x0

    aget v3, p1, v2

    sub-int/2addr v1, v3

    add-int/2addr v1, v0

    .line 574
    .local v1, "fullRange":I
    div-int/lit8 v3, v1, 0x2

    .line 575
    .local v3, "halfRange":I
    aget v4, p1, v2

    if-ne p3, v0, :cond_10

    move v5, v1

    goto :goto_11

    :cond_10
    move v5, v3

    :goto_11
    sub-int/2addr v4, v5

    aput v4, p2, v2

    .line 576
    aget v2, p1, v0

    const/4 v4, 0x2

    if-ne p3, v4, :cond_1b

    move v4, v1

    goto :goto_1c

    :cond_1b
    move v4, v3

    :goto_1c
    add-int/2addr v2, v4

    aput v2, p2, v0

    .line 577
    return-void
.end method

.method public abstract getItemRangeInto([I)V
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation
.end method

.method public abstract onDataRefresh()V
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation
.end method

.method public abstract onItemLoaded(I)V
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation
.end method
