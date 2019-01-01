.class Lmiui/util/Pools$SoftReferenceInstanceHolder;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lmiui/util/Pools$IInstanceHolder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/util/Pools;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SoftReferenceInstanceHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lmiui/util/Pools$IInstanceHolder<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private volatile Hf:I

.field private final JB:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "TT;>;"
        }
    .end annotation
.end field

.field private volatile JD:[Ljava/lang/ref/SoftReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/ref/SoftReference<",
            "TT;>;"
        }
    .end annotation
.end field

.field private volatile mIndex:I


# direct methods
.method constructor <init>(Ljava/lang/Class;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "TT;>;I)V"
        }
    .end annotation

    .line 177
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 178
    iput-object p1, p0, Lmiui/util/Pools$SoftReferenceInstanceHolder;->JB:Ljava/lang/Class;

    .line 179
    iput p2, p0, Lmiui/util/Pools$SoftReferenceInstanceHolder;->Hf:I

    .line 180
    new-array p1, p2, [Ljava/lang/ref/SoftReference;

    .line 182
    iput-object p1, p0, Lmiui/util/Pools$SoftReferenceInstanceHolder;->JD:[Ljava/lang/ref/SoftReference;

    .line 183
    const/4 p1, 0x0

    iput p1, p0, Lmiui/util/Pools$SoftReferenceInstanceHolder;->mIndex:I

    .line 184
    return-void
.end method


# virtual methods
.method public dD()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "TT;>;"
        }
    .end annotation

    .line 188
    iget-object v0, p0, Lmiui/util/Pools$SoftReferenceInstanceHolder;->JB:Ljava/lang/Class;

    return-object v0
.end method

.method public declared-synchronized get()Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    monitor-enter p0

    .line 219
    :try_start_0
    iget v0, p0, Lmiui/util/Pools$SoftReferenceInstanceHolder;->mIndex:I

    .line 220
    iget-object v1, p0, Lmiui/util/Pools$SoftReferenceInstanceHolder;->JD:[Ljava/lang/ref/SoftReference;

    .line 221
    :cond_0
    :goto_0
    const/4 v2, 0x0

    if-eqz v0, :cond_2

    .line 222
    add-int/lit8 v0, v0, -0x1

    .line 223
    aget-object v3, v1, v0

    if-eqz v3, :cond_0

    .line 224
    aget-object v3, v1, v0

    invoke-virtual {v3}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v3

    .line 225
    aput-object v2, v1, v0

    .line 227
    if-eqz v3, :cond_1

    .line 228
    iput v0, p0, Lmiui/util/Pools$SoftReferenceInstanceHolder;->mIndex:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 229
    monitor-exit p0

    return-object v3

    .line 231
    :cond_1
    goto :goto_0

    .line 234
    :cond_2
    monitor-exit p0

    return-object v2

    .line 218
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getSize()I
    .locals 1

    .line 193
    iget v0, p0, Lmiui/util/Pools$SoftReferenceInstanceHolder;->Hf:I

    return v0
.end method

.method public declared-synchronized put(Ljava/lang/Object;)Z
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    monitor-enter p0

    .line 239
    :try_start_0
    iget v0, p0, Lmiui/util/Pools$SoftReferenceInstanceHolder;->mIndex:I

    .line 240
    iget-object v1, p0, Lmiui/util/Pools$SoftReferenceInstanceHolder;->JD:[Ljava/lang/ref/SoftReference;

    .line 242
    iget v2, p0, Lmiui/util/Pools$SoftReferenceInstanceHolder;->Hf:I

    const/4 v3, 0x1

    if-lt v0, v2, :cond_3

    .line 243
    const/4 v2, 0x0

    move v4, v2

    :goto_0
    if-ge v4, v0, :cond_2

    .line 244
    aget-object v5, v1, v4

    if-eqz v5, :cond_1

    aget-object v5, v1, v4

    invoke-virtual {v5}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v5

    if-nez v5, :cond_0

    goto :goto_1

    .line 243
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 245
    :cond_1
    :goto_1
    new-instance v0, Ljava/lang/ref/SoftReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    aput-object v0, v1, v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 246
    monitor-exit p0

    return v3

    .line 249
    :cond_2
    monitor-exit p0

    return v2

    .line 252
    :cond_3
    :try_start_1
    new-instance v2, Ljava/lang/ref/SoftReference;

    invoke-direct {v2, p1}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    aput-object v2, v1, v0

    .line 253
    add-int/2addr v0, v3

    iput v0, p0, Lmiui/util/Pools$SoftReferenceInstanceHolder;->mIndex:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 254
    monitor-exit p0

    return v3

    .line 238
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized resize(I)V
    .locals 3

    monitor-enter p0

    .line 198
    :try_start_0
    iget v0, p0, Lmiui/util/Pools$SoftReferenceInstanceHolder;->Hf:I

    add-int/2addr p1, v0

    .line 199
    if-gtz p1, :cond_0

    .line 200
    invoke-static {}, Lmiui/util/Pools;->dC()Ljava/util/HashMap;

    move-result-object p1

    monitor-enter p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 201
    :try_start_1
    invoke-static {}, Lmiui/util/Pools;->dC()Ljava/util/HashMap;

    move-result-object v0

    invoke-virtual {p0}, Lmiui/util/Pools$SoftReferenceInstanceHolder;->dD()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 202
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 203
    monitor-exit p0

    return-void

    .line 202
    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw v0

    .line 206
    :cond_0
    iput p1, p0, Lmiui/util/Pools$SoftReferenceInstanceHolder;->Hf:I

    .line 207
    iget-object v0, p0, Lmiui/util/Pools$SoftReferenceInstanceHolder;->JD:[Ljava/lang/ref/SoftReference;

    .line 208
    iget v1, p0, Lmiui/util/Pools$SoftReferenceInstanceHolder;->mIndex:I

    .line 209
    array-length v2, v0

    if-le p1, v2, :cond_1

    .line 210
    new-array p1, p1, [Ljava/lang/ref/SoftReference;

    .line 212
    const/4 v2, 0x0

    invoke-static {v0, v2, p1, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 213
    iput-object p1, p0, Lmiui/util/Pools$SoftReferenceInstanceHolder;->JD:[Ljava/lang/ref/SoftReference;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 215
    :cond_1
    monitor-exit p0

    return-void

    .line 197
    :catchall_1
    move-exception p1

    monitor-exit p0

    throw p1
.end method
