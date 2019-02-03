.class public Landroid/support/v7/util/AsyncListUtil;
.super Ljava/lang/Object;
.source "AsyncListUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/util/AsyncListUtil$ViewCallback;,
        Landroid/support/v7/util/AsyncListUtil$DataCallback;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field private static final TAG:Ljava/lang/String; = "AsyncListUtil"


# instance fields
.field private mAllowScrollHints:Z

.field private final mBackgroundCallback:Landroid/support/v7/util/ThreadUtil$BackgroundCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v7/util/ThreadUtil$BackgroundCallback<",
            "TT;>;"
        }
    .end annotation
.end field

.field final mBackgroundProxy:Landroid/support/v7/util/ThreadUtil$BackgroundCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v7/util/ThreadUtil$BackgroundCallback<",
            "TT;>;"
        }
    .end annotation
.end field

.field final mDataCallback:Landroid/support/v7/util/AsyncListUtil$DataCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v7/util/AsyncListUtil$DataCallback<",
            "TT;>;"
        }
    .end annotation
.end field

.field mDisplayedGeneration:I

.field private mItemCount:I

.field private final mMainThreadCallback:Landroid/support/v7/util/ThreadUtil$MainThreadCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v7/util/ThreadUtil$MainThreadCallback<",
            "TT;>;"
        }
    .end annotation
.end field

.field final mMainThreadProxy:Landroid/support/v7/util/ThreadUtil$MainThreadCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v7/util/ThreadUtil$MainThreadCallback<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final mMissingPositions:Landroid/util/SparseIntArray;

.field final mPrevRange:[I

.field mRequestedGeneration:I

.field private mScrollHint:I

.field final mTClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "TT;>;"
        }
    .end annotation
.end field

.field final mTileList:Landroid/support/v7/util/TileList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v7/util/TileList<",
            "TT;>;"
        }
    .end annotation
.end field

.field final mTileSize:I

.field final mTmpRange:[I

.field final mTmpRangeExtended:[I

.field final mViewCallback:Landroid/support/v7/util/AsyncListUtil$ViewCallback;


# direct methods
.method public constructor <init>(Ljava/lang/Class;ILandroid/support/v7/util/AsyncListUtil$DataCallback;Landroid/support/v7/util/AsyncListUtil$ViewCallback;)V
    .registers 7
    .param p2, "tileSize"    # I
    .param p4, "viewCallback"    # Landroid/support/v7/util/AsyncListUtil$ViewCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "TT;>;I",
            "Landroid/support/v7/util/AsyncListUtil$DataCallback<",
            "TT;>;",
            "Landroid/support/v7/util/AsyncListUtil$ViewCallback;",
            ")V"
        }
    .end annotation

    .line 88
    .local p0, "this":Landroid/support/v7/util/AsyncListUtil;, "Landroid/support/v7/util/AsyncListUtil<TT;>;"
    .local p1, "klass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p3, "dataCallback":Landroid/support/v7/util/AsyncListUtil$DataCallback;, "Landroid/support/v7/util/AsyncListUtil$DataCallback<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    const/4 v0, 0x2

    new-array v1, v0, [I

    iput-object v1, p0, Landroid/support/v7/util/AsyncListUtil;->mTmpRange:[I

    .line 62
    new-array v1, v0, [I

    iput-object v1, p0, Landroid/support/v7/util/AsyncListUtil;->mPrevRange:[I

    .line 63
    new-array v0, v0, [I

    iput-object v0, p0, Landroid/support/v7/util/AsyncListUtil;->mTmpRangeExtended:[I

    .line 66
    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v7/util/AsyncListUtil;->mScrollHint:I

    .line 68
    iput v0, p0, Landroid/support/v7/util/AsyncListUtil;->mItemCount:I

    .line 70
    iput v0, p0, Landroid/support/v7/util/AsyncListUtil;->mDisplayedGeneration:I

    .line 71
    iget v0, p0, Landroid/support/v7/util/AsyncListUtil;->mDisplayedGeneration:I

    iput v0, p0, Landroid/support/v7/util/AsyncListUtil;->mRequestedGeneration:I

    .line 73
    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v0, p0, Landroid/support/v7/util/AsyncListUtil;->mMissingPositions:Landroid/util/SparseIntArray;

    .line 207
    new-instance v0, Landroid/support/v7/util/AsyncListUtil$1;

    invoke-direct {v0, p0}, Landroid/support/v7/util/AsyncListUtil$1;-><init>(Landroid/support/v7/util/AsyncListUtil;)V

    iput-object v0, p0, Landroid/support/v7/util/AsyncListUtil;->mMainThreadCallback:Landroid/support/v7/util/ThreadUtil$MainThreadCallback;

    .line 289
    new-instance v0, Landroid/support/v7/util/AsyncListUtil$2;

    invoke-direct {v0, p0}, Landroid/support/v7/util/AsyncListUtil$2;-><init>(Landroid/support/v7/util/AsyncListUtil;)V

    iput-object v0, p0, Landroid/support/v7/util/AsyncListUtil;->mBackgroundCallback:Landroid/support/v7/util/ThreadUtil$BackgroundCallback;

    .line 89
    iput-object p1, p0, Landroid/support/v7/util/AsyncListUtil;->mTClass:Ljava/lang/Class;

    .line 90
    iput p2, p0, Landroid/support/v7/util/AsyncListUtil;->mTileSize:I

    .line 91
    iput-object p3, p0, Landroid/support/v7/util/AsyncListUtil;->mDataCallback:Landroid/support/v7/util/AsyncListUtil$DataCallback;

    .line 92
    iput-object p4, p0, Landroid/support/v7/util/AsyncListUtil;->mViewCallback:Landroid/support/v7/util/AsyncListUtil$ViewCallback;

    .line 94
    new-instance v0, Landroid/support/v7/util/TileList;

    iget v1, p0, Landroid/support/v7/util/AsyncListUtil;->mTileSize:I

    invoke-direct {v0, v1}, Landroid/support/v7/util/TileList;-><init>(I)V

    iput-object v0, p0, Landroid/support/v7/util/AsyncListUtil;->mTileList:Landroid/support/v7/util/TileList;

    .line 96
    new-instance v0, Landroid/support/v7/util/MessageThreadUtil;

    invoke-direct {v0}, Landroid/support/v7/util/MessageThreadUtil;-><init>()V

    .line 97
    .local v0, "threadUtil":Landroid/support/v7/util/ThreadUtil;, "Landroid/support/v7/util/ThreadUtil<TT;>;"
    iget-object v1, p0, Landroid/support/v7/util/AsyncListUtil;->mMainThreadCallback:Landroid/support/v7/util/ThreadUtil$MainThreadCallback;

    invoke-interface {v0, v1}, Landroid/support/v7/util/ThreadUtil;->getMainThreadProxy(Landroid/support/v7/util/ThreadUtil$MainThreadCallback;)Landroid/support/v7/util/ThreadUtil$MainThreadCallback;

    move-result-object v1

    iput-object v1, p0, Landroid/support/v7/util/AsyncListUtil;->mMainThreadProxy:Landroid/support/v7/util/ThreadUtil$MainThreadCallback;

    .line 98
    iget-object v1, p0, Landroid/support/v7/util/AsyncListUtil;->mBackgroundCallback:Landroid/support/v7/util/ThreadUtil$BackgroundCallback;

    invoke-interface {v0, v1}, Landroid/support/v7/util/ThreadUtil;->getBackgroundProxy(Landroid/support/v7/util/ThreadUtil$BackgroundCallback;)Landroid/support/v7/util/ThreadUtil$BackgroundCallback;

    move-result-object v1

    iput-object v1, p0, Landroid/support/v7/util/AsyncListUtil;->mBackgroundProxy:Landroid/support/v7/util/ThreadUtil$BackgroundCallback;

    .line 100
    invoke-virtual {p0}, Landroid/support/v7/util/AsyncListUtil;->refresh()V

    .line 101
    return-void
.end method

.method static synthetic access$002(Landroid/support/v7/util/AsyncListUtil;I)I
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/util/AsyncListUtil;
    .param p1, "x1"    # I

    .line 46
    iput p1, p0, Landroid/support/v7/util/AsyncListUtil;->mItemCount:I

    return p1
.end method

.method static synthetic access$102(Landroid/support/v7/util/AsyncListUtil;Z)Z
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/util/AsyncListUtil;
    .param p1, "x1"    # Z

    .line 46
    iput-boolean p1, p0, Landroid/support/v7/util/AsyncListUtil;->mAllowScrollHints:Z

    return p1
.end method

.method static synthetic access$200(Landroid/support/v7/util/AsyncListUtil;)V
    .registers 1
    .param p0, "x0"    # Landroid/support/v7/util/AsyncListUtil;

    .line 46
    invoke-direct {p0}, Landroid/support/v7/util/AsyncListUtil;->updateRange()V

    return-void
.end method

.method static synthetic access$300(Landroid/support/v7/util/AsyncListUtil;)Landroid/util/SparseIntArray;
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/util/AsyncListUtil;

    .line 46
    iget-object v0, p0, Landroid/support/v7/util/AsyncListUtil;->mMissingPositions:Landroid/util/SparseIntArray;

    return-object v0
.end method

.method private isRefreshPending()Z
    .registers 3

    .line 104
    .local p0, "this":Landroid/support/v7/util/AsyncListUtil;, "Landroid/support/v7/util/AsyncListUtil<TT;>;"
    iget v0, p0, Landroid/support/v7/util/AsyncListUtil;->mRequestedGeneration:I

    iget v1, p0, Landroid/support/v7/util/AsyncListUtil;->mDisplayedGeneration:I

    if-eq v0, v1, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    return v0
.end method

.method private varargs log(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 6
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .line 76
    .local p0, "this":Landroid/support/v7/util/AsyncListUtil;, "Landroid/support/v7/util/AsyncListUtil<TT;>;"
    const-string v0, "AsyncListUtil"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[MAIN] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    return-void
.end method

.method private updateRange()V
    .registers 11

    .line 175
    .local p0, "this":Landroid/support/v7/util/AsyncListUtil;, "Landroid/support/v7/util/AsyncListUtil<TT;>;"
    iget-object v0, p0, Landroid/support/v7/util/AsyncListUtil;->mViewCallback:Landroid/support/v7/util/AsyncListUtil$ViewCallback;

    iget-object v1, p0, Landroid/support/v7/util/AsyncListUtil;->mTmpRange:[I

    invoke-virtual {v0, v1}, Landroid/support/v7/util/AsyncListUtil$ViewCallback;->getItemRangeInto([I)V

    .line 176
    iget-object v0, p0, Landroid/support/v7/util/AsyncListUtil;->mTmpRange:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    iget-object v2, p0, Landroid/support/v7/util/AsyncListUtil;->mTmpRange:[I

    const/4 v3, 0x1

    aget v2, v2, v3

    if-gt v0, v2, :cond_bb

    iget-object v0, p0, Landroid/support/v7/util/AsyncListUtil;->mTmpRange:[I

    aget v0, v0, v1

    if-gez v0, :cond_1b

    goto/16 :goto_bb

    .line 179
    :cond_1b
    iget-object v0, p0, Landroid/support/v7/util/AsyncListUtil;->mTmpRange:[I

    aget v0, v0, v3

    iget v2, p0, Landroid/support/v7/util/AsyncListUtil;->mItemCount:I

    if-lt v0, v2, :cond_24

    .line 181
    return-void

    .line 184
    :cond_24
    iget-boolean v0, p0, Landroid/support/v7/util/AsyncListUtil;->mAllowScrollHints:Z

    if-nez v0, :cond_2b

    .line 185
    iput v1, p0, Landroid/support/v7/util/AsyncListUtil;->mScrollHint:I

    goto :goto_5d

    .line 186
    :cond_2b
    iget-object v0, p0, Landroid/support/v7/util/AsyncListUtil;->mTmpRange:[I

    aget v0, v0, v1

    iget-object v2, p0, Landroid/support/v7/util/AsyncListUtil;->mPrevRange:[I

    aget v2, v2, v3

    if-gt v0, v2, :cond_5b

    iget-object v0, p0, Landroid/support/v7/util/AsyncListUtil;->mPrevRange:[I

    aget v0, v0, v1

    iget-object v2, p0, Landroid/support/v7/util/AsyncListUtil;->mTmpRange:[I

    aget v2, v2, v3

    if-le v0, v2, :cond_40

    goto :goto_5b

    .line 189
    :cond_40
    iget-object v0, p0, Landroid/support/v7/util/AsyncListUtil;->mTmpRange:[I

    aget v0, v0, v1

    iget-object v2, p0, Landroid/support/v7/util/AsyncListUtil;->mPrevRange:[I

    aget v2, v2, v1

    if-ge v0, v2, :cond_4d

    .line 190
    iput v3, p0, Landroid/support/v7/util/AsyncListUtil;->mScrollHint:I

    goto :goto_5d

    .line 191
    :cond_4d
    iget-object v0, p0, Landroid/support/v7/util/AsyncListUtil;->mTmpRange:[I

    aget v0, v0, v1

    iget-object v2, p0, Landroid/support/v7/util/AsyncListUtil;->mPrevRange:[I

    aget v2, v2, v1

    if-le v0, v2, :cond_5d

    .line 192
    const/4 v0, 0x2

    iput v0, p0, Landroid/support/v7/util/AsyncListUtil;->mScrollHint:I

    goto :goto_5d

    .line 188
    :cond_5b
    :goto_5b
    iput v1, p0, Landroid/support/v7/util/AsyncListUtil;->mScrollHint:I

    .line 195
    :cond_5d
    :goto_5d
    iget-object v0, p0, Landroid/support/v7/util/AsyncListUtil;->mPrevRange:[I

    iget-object v2, p0, Landroid/support/v7/util/AsyncListUtil;->mTmpRange:[I

    aget v2, v2, v1

    aput v2, v0, v1

    .line 196
    iget-object v0, p0, Landroid/support/v7/util/AsyncListUtil;->mPrevRange:[I

    iget-object v2, p0, Landroid/support/v7/util/AsyncListUtil;->mTmpRange:[I

    aget v2, v2, v3

    aput v2, v0, v3

    .line 198
    iget-object v0, p0, Landroid/support/v7/util/AsyncListUtil;->mViewCallback:Landroid/support/v7/util/AsyncListUtil$ViewCallback;

    iget-object v2, p0, Landroid/support/v7/util/AsyncListUtil;->mTmpRange:[I

    iget-object v4, p0, Landroid/support/v7/util/AsyncListUtil;->mTmpRangeExtended:[I

    iget v5, p0, Landroid/support/v7/util/AsyncListUtil;->mScrollHint:I

    invoke-virtual {v0, v2, v4, v5}, Landroid/support/v7/util/AsyncListUtil$ViewCallback;->extendRangeInto([I[II)V

    .line 199
    iget-object v0, p0, Landroid/support/v7/util/AsyncListUtil;->mTmpRangeExtended:[I

    iget-object v2, p0, Landroid/support/v7/util/AsyncListUtil;->mTmpRange:[I

    aget v2, v2, v1

    iget-object v4, p0, Landroid/support/v7/util/AsyncListUtil;->mTmpRangeExtended:[I

    aget v4, v4, v1

    invoke-static {v4, v1}, Ljava/lang/Math;->max(II)I

    move-result v4

    invoke-static {v2, v4}, Ljava/lang/Math;->min(II)I

    move-result v2

    aput v2, v0, v1

    .line 200
    iget-object v0, p0, Landroid/support/v7/util/AsyncListUtil;->mTmpRangeExtended:[I

    iget-object v2, p0, Landroid/support/v7/util/AsyncListUtil;->mTmpRange:[I

    aget v2, v2, v3

    iget-object v4, p0, Landroid/support/v7/util/AsyncListUtil;->mTmpRangeExtended:[I

    aget v4, v4, v3

    iget v5, p0, Landroid/support/v7/util/AsyncListUtil;->mItemCount:I

    sub-int/2addr v5, v3

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-static {v2, v4}, Ljava/lang/Math;->max(II)I

    move-result v2

    aput v2, v0, v3

    .line 203
    iget-object v4, p0, Landroid/support/v7/util/AsyncListUtil;->mBackgroundProxy:Landroid/support/v7/util/ThreadUtil$BackgroundCallback;

    iget-object v0, p0, Landroid/support/v7/util/AsyncListUtil;->mTmpRange:[I

    aget v5, v0, v1

    iget-object v0, p0, Landroid/support/v7/util/AsyncListUtil;->mTmpRange:[I

    aget v6, v0, v3

    iget-object v0, p0, Landroid/support/v7/util/AsyncListUtil;->mTmpRangeExtended:[I

    aget v7, v0, v1

    iget-object v0, p0, Landroid/support/v7/util/AsyncListUtil;->mTmpRangeExtended:[I

    aget v8, v0, v3

    iget v9, p0, Landroid/support/v7/util/AsyncListUtil;->mScrollHint:I

    invoke-interface/range {v4 .. v9}, Landroid/support/v7/util/ThreadUtil$BackgroundCallback;->updateRange(IIIII)V

    .line 205
    return-void

    .line 177
    :cond_bb
    :goto_bb
    return-void
.end method


# virtual methods
.method public getItem(I)Ljava/lang/Object;
    .registers 5
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .line 151
    .local p0, "this":Landroid/support/v7/util/AsyncListUtil;, "Landroid/support/v7/util/AsyncListUtil<TT;>;"
    if-ltz p1, :cond_1b

    iget v0, p0, Landroid/support/v7/util/AsyncListUtil;->mItemCount:I

    if-ge p1, v0, :cond_1b

    .line 154
    iget-object v0, p0, Landroid/support/v7/util/AsyncListUtil;->mTileList:Landroid/support/v7/util/TileList;

    invoke-virtual {v0, p1}, Landroid/support/v7/util/TileList;->getItemAt(I)Ljava/lang/Object;

    move-result-object v0

    .line 155
    .local v0, "item":Ljava/lang/Object;, "TT;"
    if-nez v0, :cond_1a

    invoke-direct {p0}, Landroid/support/v7/util/AsyncListUtil;->isRefreshPending()Z

    move-result v1

    if-nez v1, :cond_1a

    .line 156
    iget-object v1, p0, Landroid/support/v7/util/AsyncListUtil;->mMissingPositions:Landroid/util/SparseIntArray;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 158
    :cond_1a
    return-object v0

    .line 152
    .end local v0    # "item":Ljava/lang/Object;, "TT;"
    :cond_1b
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " is not within 0 and "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Landroid/support/v7/util/AsyncListUtil;->mItemCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getItemCount()I
    .registers 2

    .line 171
    .local p0, "this":Landroid/support/v7/util/AsyncListUtil;, "Landroid/support/v7/util/AsyncListUtil<TT;>;"
    iget v0, p0, Landroid/support/v7/util/AsyncListUtil;->mItemCount:I

    return v0
.end method

.method public onRangeChanged()V
    .registers 2

    .line 116
    .local p0, "this":Landroid/support/v7/util/AsyncListUtil;, "Landroid/support/v7/util/AsyncListUtil<TT;>;"
    invoke-direct {p0}, Landroid/support/v7/util/AsyncListUtil;->isRefreshPending()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 117
    return-void

    .line 119
    :cond_7
    invoke-direct {p0}, Landroid/support/v7/util/AsyncListUtil;->updateRange()V

    .line 120
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/util/AsyncListUtil;->mAllowScrollHints:Z

    .line 121
    return-void
.end method

.method public refresh()V
    .registers 3

    .line 130
    .local p0, "this":Landroid/support/v7/util/AsyncListUtil;, "Landroid/support/v7/util/AsyncListUtil<TT;>;"
    iget-object v0, p0, Landroid/support/v7/util/AsyncListUtil;->mMissingPositions:Landroid/util/SparseIntArray;

    invoke-virtual {v0}, Landroid/util/SparseIntArray;->clear()V

    .line 131
    iget-object v0, p0, Landroid/support/v7/util/AsyncListUtil;->mBackgroundProxy:Landroid/support/v7/util/ThreadUtil$BackgroundCallback;

    iget v1, p0, Landroid/support/v7/util/AsyncListUtil;->mRequestedGeneration:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Landroid/support/v7/util/AsyncListUtil;->mRequestedGeneration:I

    invoke-interface {v0, v1}, Landroid/support/v7/util/ThreadUtil$BackgroundCallback;->refresh(I)V

    .line 132
    return-void
.end method
