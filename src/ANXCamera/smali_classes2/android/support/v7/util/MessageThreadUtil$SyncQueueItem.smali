.class Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
.super Ljava/lang/Object;
.source "MessageThreadUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/util/MessageThreadUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "SyncQueueItem"
.end annotation


# static fields
.field private static sPool:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

.field private static final sPoolLock:Ljava/lang/Object;


# instance fields
.field public arg1:I

.field public arg2:I

.field public arg3:I

.field public arg4:I

.field public arg5:I

.field public data:Ljava/lang/Object;

.field private next:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

.field public what:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 165
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->sPoolLock:Ljava/lang/Object;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .line 162
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$200(Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;)Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    .line 162
    iget-object v0, p0, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->next:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    return-object v0
.end method

.method static synthetic access$202(Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;)Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    .param p1, "x1"    # Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    .line 162
    iput-object p1, p0, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->next:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    return-object p1
.end method

.method static obtainMessage(III)Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    .registers 10
    .param p0, "what"    # I
    .param p1, "arg1"    # I
    .param p2, "arg2"    # I

    .line 210
    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move v0, p0

    move v1, p1

    move v2, p2

    invoke-static/range {v0 .. v6}, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->obtainMessage(IIIIIILjava/lang/Object;)Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    move-result-object v0

    return-object v0
.end method

.method static obtainMessage(IIIIIILjava/lang/Object;)Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    .registers 10
    .param p0, "what"    # I
    .param p1, "arg1"    # I
    .param p2, "arg2"    # I
    .param p3, "arg3"    # I
    .param p4, "arg4"    # I
    .param p5, "arg5"    # I
    .param p6, "data"    # Ljava/lang/Object;

    .line 189
    sget-object v0, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->sPoolLock:Ljava/lang/Object;

    monitor-enter v0

    .line 191
    :try_start_3
    sget-object v1, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->sPool:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    if-nez v1, :cond_d

    .line 192
    new-instance v1, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    invoke-direct {v1}, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;-><init>()V

    .local v1, "item":Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    goto :goto_18

    .line 194
    .end local v1    # "item":Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    :cond_d
    sget-object v1, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->sPool:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    .line 195
    .restart local v1    # "item":Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    sget-object v2, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->sPool:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    iget-object v2, v2, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->next:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    sput-object v2, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->sPool:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    .line 196
    const/4 v2, 0x0

    iput-object v2, v1, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->next:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    .line 198
    :goto_18
    iput p0, v1, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->what:I

    .line 199
    iput p1, v1, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->arg1:I

    .line 200
    iput p2, v1, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->arg2:I

    .line 201
    iput p3, v1, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->arg3:I

    .line 202
    iput p4, v1, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->arg4:I

    .line 203
    iput p5, v1, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->arg5:I

    .line 204
    iput-object p6, v1, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->data:Ljava/lang/Object;

    .line 205
    monitor-exit v0

    return-object v1

    .line 206
    .end local v1    # "item":Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    :catchall_28
    move-exception v1

    monitor-exit v0
    :try_end_2a
    .catchall {:try_start_3 .. :try_end_2a} :catchall_28

    throw v1
.end method

.method static obtainMessage(IILjava/lang/Object;)Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    .registers 10
    .param p0, "what"    # I
    .param p1, "arg1"    # I
    .param p2, "data"    # Ljava/lang/Object;

    .line 214
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move v0, p0

    move v1, p1

    move-object v6, p2

    invoke-static/range {v0 .. v6}, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->obtainMessage(IIIIIILjava/lang/Object;)Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method recycle()V
    .registers 3

    .line 176
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->next:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    .line 177
    const/4 v1, 0x0

    iput v1, p0, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->arg5:I

    iput v1, p0, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->arg4:I

    iput v1, p0, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->arg3:I

    iput v1, p0, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->arg2:I

    iput v1, p0, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->arg1:I

    iput v1, p0, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->what:I

    .line 178
    iput-object v0, p0, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->data:Ljava/lang/Object;

    .line 179
    sget-object v0, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->sPoolLock:Ljava/lang/Object;

    monitor-enter v0

    .line 180
    :try_start_15
    sget-object v1, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->sPool:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    if-eqz v1, :cond_1d

    .line 181
    sget-object v1, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->sPool:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    iput-object v1, p0, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->next:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    .line 183
    :cond_1d
    sput-object p0, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->sPool:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    .line 184
    monitor-exit v0

    .line 185
    return-void

    .line 184
    :catchall_21
    move-exception v1

    monitor-exit v0
    :try_end_23
    .catchall {:try_start_15 .. :try_end_23} :catchall_21

    throw v1
.end method
