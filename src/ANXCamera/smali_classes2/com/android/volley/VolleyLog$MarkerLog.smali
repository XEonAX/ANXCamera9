.class Lcom/android/volley/VolleyLog$MarkerLog;
.super Ljava/lang/Object;
.source "VolleyLog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/volley/VolleyLog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "MarkerLog"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/volley/VolleyLog$MarkerLog$Marker;
    }
.end annotation


# static fields
.field public static final ENABLED:Z

.field private static final MIN_DURATION_FOR_LOGGING_MS:J


# instance fields
.field private mFinished:Z

.field private final mMarkers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/volley/VolleyLog$MarkerLog$Marker;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 104
    sget-boolean v0, Lcom/android/volley/VolleyLog;->DEBUG:Z

    sput-boolean v0, Lcom/android/volley/VolleyLog$MarkerLog;->ENABLED:Z

    return-void
.end method

.method constructor <init>()V
    .registers 2

    .line 103
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 121
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/volley/VolleyLog$MarkerLog;->mMarkers:Ljava/util/List;

    .line 122
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/volley/VolleyLog$MarkerLog;->mFinished:Z

    return-void
.end method

.method private getTotalDuration()J
    .registers 7

    .line 167
    iget-object v0, p0, Lcom/android/volley/VolleyLog$MarkerLog;->mMarkers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_b

    .line 168
    const-wide/16 v0, 0x0

    return-wide v0

    .line 171
    :cond_b
    iget-object v0, p0, Lcom/android/volley/VolleyLog$MarkerLog;->mMarkers:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/volley/VolleyLog$MarkerLog$Marker;

    iget-wide v0, v0, Lcom/android/volley/VolleyLog$MarkerLog$Marker;->time:J

    .line 172
    .local v0, "first":J
    iget-object v2, p0, Lcom/android/volley/VolleyLog$MarkerLog;->mMarkers:Ljava/util/List;

    iget-object v3, p0, Lcom/android/volley/VolleyLog$MarkerLog;->mMarkers:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/volley/VolleyLog$MarkerLog$Marker;

    iget-wide v2, v2, Lcom/android/volley/VolleyLog$MarkerLog$Marker;->time:J

    .line 173
    .local v2, "last":J
    sub-long v4, v2, v0

    return-wide v4
.end method


# virtual methods
.method public declared-synchronized add(Ljava/lang/String;J)V
    .registers 12
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "threadId"    # J

    monitor-enter p0

    .line 126
    :try_start_1
    iget-boolean v0, p0, Lcom/android/volley/VolleyLog$MarkerLog;->mFinished:Z

    if-nez v0, :cond_18

    .line 130
    iget-object v0, p0, Lcom/android/volley/VolleyLog$MarkerLog;->mMarkers:Ljava/util/List;

    new-instance v7, Lcom/android/volley/VolleyLog$MarkerLog$Marker;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v5

    move-object v1, v7

    move-object v2, p1

    move-wide v3, p2

    invoke-direct/range {v1 .. v6}, Lcom/android/volley/VolleyLog$MarkerLog$Marker;-><init>(Ljava/lang/String;JJ)V

    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_16
    .catchall {:try_start_1 .. :try_end_16} :catchall_20

    .line 131
    monitor-exit p0

    return-void

    .line 127
    :cond_18
    :try_start_18
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Marker added to finished log"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_20
    .catchall {:try_start_18 .. :try_end_20} :catchall_20

    .line 125
    .end local p1    # "name":Ljava/lang/String;
    .end local p2    # "threadId":J
    :catchall_20
    move-exception p1

    monitor-exit p0

    .end local p0    # "this":Lcom/android/volley/VolleyLog$MarkerLog;
    throw p1
.end method

.method protected finalize()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 159
    iget-boolean v0, p0, Lcom/android/volley/VolleyLog$MarkerLog;->mFinished:Z

    if-nez v0, :cond_11

    .line 160
    const-string v0, "Request on the loose"

    invoke-virtual {p0, v0}, Lcom/android/volley/VolleyLog$MarkerLog;->finish(Ljava/lang/String;)V

    .line 161
    const-string v0, "Marker log finalized without finish() - uncaught exit point for request"

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/android/volley/VolleyLog;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 163
    :cond_11
    return-void
.end method

.method public declared-synchronized finish(Ljava/lang/String;)V
    .registers 18
    .param p1, "header"    # Ljava/lang/String;

    move-object/from16 v1, p0

    monitor-enter p0

    .line 139
    const/4 v0, 0x1

    :try_start_4
    iput-boolean v0, v1, Lcom/android/volley/VolleyLog$MarkerLog;->mFinished:Z

    .line 141
    invoke-direct/range {p0 .. p0}, Lcom/android/volley/VolleyLog$MarkerLog;->getTotalDuration()J

    move-result-wide v2
    :try_end_a
    .catchall {:try_start_4 .. :try_end_a} :catchall_6c

    .line 142
    .local v2, "duration":J
    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-gtz v4, :cond_12

    .line 143
    monitor-exit p0

    return-void

    .line 146
    :cond_12
    :try_start_12
    iget-object v4, v1, Lcom/android/volley/VolleyLog$MarkerLog;->mMarkers:Ljava/util/List;

    const/4 v5, 0x0

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/volley/VolleyLog$MarkerLog$Marker;

    iget-wide v6, v4, Lcom/android/volley/VolleyLog$MarkerLog$Marker;->time:J

    .line 147
    .local v6, "prevTime":J
    const-string v4, "(%-4d ms) %s"

    const/4 v8, 0x2

    new-array v9, v8, [Ljava/lang/Object;

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    aput-object v10, v9, v5

    aput-object p1, v9, v0

    invoke-static {v4, v9}, Lcom/android/volley/VolleyLog;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 148
    iget-object v4, v1, Lcom/android/volley/VolleyLog$MarkerLog;->mMarkers:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :goto_33
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_68

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/android/volley/VolleyLog$MarkerLog$Marker;

    .line 149
    .local v9, "marker":Lcom/android/volley/VolleyLog$MarkerLog$Marker;
    iget-wide v11, v9, Lcom/android/volley/VolleyLog$MarkerLog$Marker;->time:J

    .line 150
    .local v11, "thisTime":J
    const-string v13, "(+%-4d) [%2d] %s"

    const/4 v14, 0x3

    new-array v14, v14, [Ljava/lang/Object;
    :try_end_46
    .catchall {:try_start_12 .. :try_end_46} :catchall_6c

    sub-long v0, v11, v6

    :try_start_48
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    aput-object v0, v14, v5

    iget-wide v0, v9, Lcom/android/volley/VolleyLog$MarkerLog$Marker;->thread:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    const/4 v1, 0x1

    aput-object v0, v14, v1

    iget-object v0, v9, Lcom/android/volley/VolleyLog$MarkerLog$Marker;->name:Ljava/lang/String;

    aput-object v0, v14, v8

    invoke-static {v13, v14}, Lcom/android/volley/VolleyLog;->d(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_5e
    .catchall {:try_start_48 .. :try_end_5e} :catchall_64

    .line 151
    move-wide v6, v11

    .line 152
    .end local v9    # "marker":Lcom/android/volley/VolleyLog$MarkerLog$Marker;
    .end local v11    # "thisTime":J
    nop

    .line 148
    move v0, v1

    move-object/from16 v1, p0

    goto :goto_33

    .line 138
    .end local v2    # "duration":J
    .end local v4    # "i$":Ljava/util/Iterator;
    .end local v6    # "prevTime":J
    .end local p1    # "header":Ljava/lang/String;
    :catchall_64
    move-exception v0

    move-object/from16 v1, p0

    goto :goto_6d

    .line 153
    .restart local v2    # "duration":J
    .restart local v6    # "prevTime":J
    .restart local p1    # "header":Ljava/lang/String;
    :cond_68
    move-object/from16 v1, p0

    monitor-exit p0

    return-void

    .line 138
    .end local v2    # "duration":J
    .end local v6    # "prevTime":J
    .end local p1    # "header":Ljava/lang/String;
    :catchall_6c
    move-exception v0

    :goto_6d
    monitor-exit p0

    .end local p0    # "this":Lcom/android/volley/VolleyLog$MarkerLog;
    throw v0
.end method
