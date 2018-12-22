.class public final Lmiui/util/Pools;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lmiui/util/Pools$SoftReferencePool;,
        Lmiui/util/Pools$SimplePool;,
        Lmiui/util/Pools$BasePool;,
        Lmiui/util/Pools$SoftReferenceInstanceHolder;,
        Lmiui/util/Pools$InstanceHolder;,
        Lmiui/util/Pools$IInstanceHolder;,
        Lmiui/util/Pools$Manager;,
        Lmiui/util/Pools$Pool;
    }
.end annotation


# static fields
.field private static final Jv:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Class<",
            "*>;",
            "Lmiui/util/Pools$InstanceHolder<",
            "*>;>;"
        }
    .end annotation
.end field

.field private static final Jw:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Class<",
            "*>;",
            "Lmiui/util/Pools$SoftReferenceInstanceHolder<",
            "*>;>;"
        }
    .end annotation
.end field

.field private static final Jx:Lmiui/util/Pools$Pool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lmiui/util/Pools$Pool<",
            "Ljava/lang/StringBuilder;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 259
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lmiui/util/Pools;->Jv:Ljava/util/HashMap;

    .line 262
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lmiui/util/Pools;->Jw:Ljava/util/HashMap;

    .line 266
    new-instance v0, Lmiui/util/Pools$1;

    invoke-direct {v0}, Lmiui/util/Pools$1;-><init>()V

    const/4 v1, 0x4

    invoke-static {v0, v1}, Lmiui/util/Pools;->createSoftReferencePool(Lmiui/util/Pools$Manager;I)Lmiui/util/Pools$SoftReferencePool;

    move-result-object v0

    sput-object v0, Lmiui/util/Pools;->Jx:Lmiui/util/Pools$Pool;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static a(Lmiui/util/Pools$InstanceHolder;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lmiui/util/Pools$InstanceHolder<",
            "TT;>;I)V"
        }
    .end annotation

    .line 310
    sget-object v0, Lmiui/util/Pools;->Jv:Ljava/util/HashMap;

    monitor-enter v0

    .line 311
    neg-int p1, p1

    :try_start_4
    invoke-virtual {p0, p1}, Lmiui/util/Pools$InstanceHolder;->resize(I)V

    .line 312
    monitor-exit v0

    .line 313
    return-void

    .line 312
    :catchall_9
    move-exception p0

    monitor-exit v0
    :try_end_b
    .catchall {:try_start_4 .. :try_end_b} :catchall_9

    throw p0
.end method

.method static a(Lmiui/util/Pools$SoftReferenceInstanceHolder;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lmiui/util/Pools$SoftReferenceInstanceHolder<",
            "TT;>;I)V"
        }
    .end annotation

    .line 341
    sget-object v0, Lmiui/util/Pools;->Jw:Ljava/util/HashMap;

    monitor-enter v0

    .line 342
    neg-int p1, p1

    :try_start_4
    invoke-virtual {p0, p1}, Lmiui/util/Pools$SoftReferenceInstanceHolder;->resize(I)V

    .line 343
    monitor-exit v0

    .line 344
    return-void

    .line 343
    :catchall_9
    move-exception p0

    monitor-exit v0
    :try_end_b
    .catchall {:try_start_4 .. :try_end_b} :catchall_9

    throw p0
.end method

.method static b(Ljava/lang/Class;I)Lmiui/util/Pools$InstanceHolder;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;I)",
            "Lmiui/util/Pools$InstanceHolder<",
            "TT;>;"
        }
    .end annotation

    .line 291
    sget-object v0, Lmiui/util/Pools;->Jv:Ljava/util/HashMap;

    monitor-enter v0

    .line 292
    :try_start_3
    sget-object v1, Lmiui/util/Pools;->Jv:Ljava/util/HashMap;

    .line 293
    invoke-virtual {v1, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmiui/util/Pools$InstanceHolder;

    .line 294
    if-nez v1, :cond_18

    .line 295
    new-instance v1, Lmiui/util/Pools$InstanceHolder;

    invoke-direct {v1, p0, p1}, Lmiui/util/Pools$InstanceHolder;-><init>(Ljava/lang/Class;I)V

    .line 296
    sget-object p1, Lmiui/util/Pools;->Jv:Ljava/util/HashMap;

    invoke-virtual {p1, p0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1b

    .line 298
    :cond_18
    invoke-virtual {v1, p1}, Lmiui/util/Pools$InstanceHolder;->resize(I)V

    .line 300
    :goto_1b
    monitor-exit v0

    return-object v1

    .line 301
    :catchall_1d
    move-exception p0

    monitor-exit v0
    :try_end_1f
    .catchall {:try_start_3 .. :try_end_1f} :catchall_1d

    throw p0
.end method

.method static c(Ljava/lang/Class;I)Lmiui/util/Pools$SoftReferenceInstanceHolder;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;I)",
            "Lmiui/util/Pools$SoftReferenceInstanceHolder<",
            "TT;>;"
        }
    .end annotation

    .line 322
    sget-object v0, Lmiui/util/Pools;->Jw:Ljava/util/HashMap;

    monitor-enter v0

    .line 323
    :try_start_3
    sget-object v1, Lmiui/util/Pools;->Jw:Ljava/util/HashMap;

    .line 324
    invoke-virtual {v1, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmiui/util/Pools$SoftReferenceInstanceHolder;

    .line 325
    if-nez v1, :cond_18

    .line 326
    new-instance v1, Lmiui/util/Pools$SoftReferenceInstanceHolder;

    invoke-direct {v1, p0, p1}, Lmiui/util/Pools$SoftReferenceInstanceHolder;-><init>(Ljava/lang/Class;I)V

    .line 327
    sget-object p1, Lmiui/util/Pools;->Jw:Ljava/util/HashMap;

    invoke-virtual {p1, p0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1b

    .line 329
    :cond_18
    invoke-virtual {v1, p1}, Lmiui/util/Pools$SoftReferenceInstanceHolder;->resize(I)V

    .line 331
    :goto_1b
    monitor-exit v0

    return-object v1

    .line 332
    :catchall_1d
    move-exception p0

    monitor-exit v0
    :try_end_1f
    .catchall {:try_start_3 .. :try_end_1f} :catchall_1d

    throw p0
.end method

.method public static createSimplePool(Lmiui/util/Pools$Manager;I)Lmiui/util/Pools$SimplePool;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lmiui/util/Pools$Manager<",
            "TT;>;I)",
            "Lmiui/util/Pools$SimplePool<",
            "TT;>;"
        }
    .end annotation

    .line 453
    new-instance v0, Lmiui/util/Pools$SimplePool;

    invoke-direct {v0, p0, p1}, Lmiui/util/Pools$SimplePool;-><init>(Lmiui/util/Pools$Manager;I)V

    return-object v0
.end method

.method public static createSoftReferencePool(Lmiui/util/Pools$Manager;I)Lmiui/util/Pools$SoftReferencePool;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lmiui/util/Pools$Manager<",
            "TT;>;I)",
            "Lmiui/util/Pools$SoftReferencePool<",
            "TT;>;"
        }
    .end annotation

    .line 467
    new-instance v0, Lmiui/util/Pools$SoftReferencePool;

    invoke-direct {v0, p0, p1}, Lmiui/util/Pools$SoftReferencePool;-><init>(Lmiui/util/Pools$Manager;I)V

    return-object v0
.end method

.method static synthetic dB()Ljava/util/HashMap;
    .registers 1

    .line 28
    sget-object v0, Lmiui/util/Pools;->Jv:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic dC()Ljava/util/HashMap;
    .registers 1

    .line 28
    sget-object v0, Lmiui/util/Pools;->Jw:Ljava/util/HashMap;

    return-object v0
.end method

.method public static getStringBuilderPool()Lmiui/util/Pools$Pool;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lmiui/util/Pools$Pool<",
            "Ljava/lang/StringBuilder;",
            ">;"
        }
    .end annotation

    .line 281
    sget-object v0, Lmiui/util/Pools;->Jx:Lmiui/util/Pools$Pool;

    return-object v0
.end method
