.class public Lcom/ss/android/ugc/effectmanager/link/task/task/HostListStatusUpdateTask;
.super Lcom/ss/android/ugc/effectmanager/common/task/NormalTask;
.source "HostListStatusUpdateTask.java"


# static fields
.field private static final MAX_SORT_TIME:J = 0x7fffffffL

.field private static final TAG:Ljava/lang/String; = "HostListStatusUpdateTask"


# instance fields
.field private mHosts:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/link/model/host/Host;",
            ">;"
        }
    .end annotation
.end field

.field private mLinkSelector:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

.field private mSpeedApi:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/ss/android/ugc/effectmanager/link/LinkSelector;Landroid/os/Handler;Ljava/lang/String;)V
    .locals 1

    .line 32
    const-string v0, "NORMAL"

    invoke-direct {p0, p2, p3, v0}, Lcom/ss/android/ugc/effectmanager/common/task/NormalTask;-><init>(Landroid/os/Handler;Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/ss/android/ugc/effectmanager/link/task/task/HostListStatusUpdateTask;->mHosts:Ljava/util/List;

    .line 33
    iget-object p2, p0, Lcom/ss/android/ugc/effectmanager/link/task/task/HostListStatusUpdateTask;->mHosts:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->clear()V

    .line 34
    iget-object p2, p0, Lcom/ss/android/ugc/effectmanager/link/task/task/HostListStatusUpdateTask;->mHosts:Ljava/util/List;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->getOriginHosts()Ljava/util/List;

    move-result-object p3

    invoke-interface {p2, p3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 35
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->getSpeedApi()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/ss/android/ugc/effectmanager/link/task/task/HostListStatusUpdateTask;->mSpeedApi:Ljava/lang/String;

    .line 36
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/link/task/task/HostListStatusUpdateTask;->mLinkSelector:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    .line 37
    return-void
.end method

.method private getHostStatus(Lcom/ss/android/ugc/effectmanager/link/model/host/Host;J)V
    .locals 26

    move-object/from16 v12, p0

    move-object/from16 v13, p1

    .line 56
    if-nez v13, :cond_0

    .line 57
    return-void

    .line 59
    :cond_0
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    .line 60
    invoke-virtual/range {p1 .. p1}, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->getSchema()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "://"

    .line 61
    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    invoke-virtual/range {p1 .. p1}, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->getHost()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, v12, Lcom/ss/android/ugc/effectmanager/link/task/task/HostListStatusUpdateTask;->mSpeedApi:Ljava/lang/String;

    .line 63
    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {v14, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 65
    nop

    .line 66
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v15

    .line 67
    const/4 v1, -0x1

    .line 68
    const-wide/16 v2, -0x1

    .line 69
    nop

    .line 71
    const-wide/32 v10, 0x7fffffff

    const/4 v4, 0x0

    :try_start_0
    new-instance v0, Ljava/net/URL;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v5}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 72
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v5

    move-object v9, v5

    check-cast v9, Ljava/net/HttpURLConnection;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_9
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 73
    :try_start_1
    iget-object v5, v12, Lcom/ss/android/ugc/effectmanager/link/task/task/HostListStatusUpdateTask;->mLinkSelector:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    invoke-virtual {v5}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->getSpeedTimeOut()I

    move-result v5

    invoke-virtual {v9, v5}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 74
    iget-object v5, v12, Lcom/ss/android/ugc/effectmanager/link/task/task/HostListStatusUpdateTask;->mLinkSelector:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    invoke-virtual {v5}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->getSpeedTimeOut()I

    move-result v5

    invoke-virtual {v9, v5}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 75
    const-string v5, "X-SS-No-Cookie"

    const-string v6, "true"

    invoke-virtual {v9, v5, v6}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v7
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_8
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 77
    :try_start_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_7
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    sub-long/2addr v5, v15

    .line 78
    :try_start_3
    const-string v1, "X-TT-LOGID"

    invoke-virtual {v9, v1}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_6
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 79
    const/16 v1, 0xc8

    if-ne v7, v1, :cond_1

    .line 80
    add-long v1, v5, p2

    :try_start_4
    invoke-virtual {v13, v1, v2}, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->setSortTime(J)V

    .line 81
    invoke-virtual/range {p1 .. p1}, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->resetStatus()V

    .line 82
    invoke-virtual {v0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v2
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    const/4 v0, 0x0

    const/16 v18, 0x1

    move-object v1, v12

    move-object v3, v13

    move v4, v7

    move-wide/from16 v19, v5

    move/from16 v21, v7

    move-wide v7, v15

    move-object/from16 v22, v9

    move-object/from16 v9, v17

    move-object/from16 v23, v14

    move-wide/from16 v24, v15

    move-wide v14, v10

    move-object v10, v0

    move/from16 v11, v18

    :try_start_5
    invoke-direct/range {v1 .. v11}, Lcom/ss/android/ugc/effectmanager/link/task/task/HostListStatusUpdateTask;->sendEvent(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/link/model/host/Host;IJJLjava/lang/String;Ljava/lang/Exception;Z)V

    .line 83
    const-string v0, "HostListStatusUpdateTask"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "sort speed time = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    move-wide/from16 v10, v19

    :try_start_6
    invoke-virtual {v1, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p1 .. p1}, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->getSchema()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "://"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p1 .. p1}, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ss/android/ugc/effectmanager/common/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    const-string v0, "HostListStatusUpdateTask"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "sort weight time = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p1 .. p1}, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->getWeightTime()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p1 .. p1}, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->getSchema()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "://"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p1 .. p1}, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ss/android/ugc/effectmanager/common/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    goto/16 :goto_3

    .line 91
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    move-wide/from16 v10, v19

    :goto_0
    move-wide v5, v10

    goto :goto_2

    .line 97
    :catchall_0
    move-exception v0

    move-object/from16 v22, v9

    :goto_1
    move-object/from16 v5, v22

    goto/16 :goto_a

    .line 91
    :catch_2
    move-exception v0

    move/from16 v21, v7

    move-object/from16 v22, v9

    move-object/from16 v23, v14

    move-wide/from16 v24, v15

    move-wide v14, v10

    move-wide v10, v5

    :goto_2
    move-object/from16 v9, v17

    move/from16 v4, v21

    move-object/from16 v11, v22

    move-object v10, v0

    goto/16 :goto_7

    .line 87
    :cond_1
    move/from16 v21, v7

    move-object/from16 v22, v9

    move-object/from16 v23, v14

    move-wide/from16 v24, v15

    move-wide v14, v10

    move-wide v10, v5

    :try_start_7
    const-string v1, "HostListStatusUpdateTask"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "sort speed error code = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_5
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    move/from16 v9, v21

    :try_start_8
    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/ss/android/ugc/effectmanager/common/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    invoke-virtual {v13, v14, v15}, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->setSortTime(J)V

    .line 89
    invoke-virtual {v0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v2
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_4
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    const/4 v0, 0x0

    const/16 v16, 0x0

    move-object v1, v12

    move-object v3, v13

    move v4, v9

    move-wide v5, v10

    move-wide/from16 v7, v24

    move/from16 v18, v9

    move-object/from16 v9, v17

    move-wide/from16 v19, v10

    move-object v10, v0

    move/from16 v11, v16

    :try_start_9
    invoke-direct/range {v1 .. v11}, Lcom/ss/android/ugc/effectmanager/link/task/task/HostListStatusUpdateTask;->sendEvent(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/link/model/host/Host;IJJLjava/lang/String;Ljava/lang/Exception;Z)V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_3
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 97
    :goto_3
    move-object/from16 v5, v22

    if-eqz v5, :cond_2

    .line 98
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->disconnect()V

    goto/16 :goto_8

    .line 91
    :catch_3
    move-exception v0

    goto :goto_4

    :catch_4
    move-exception v0

    move/from16 v18, v9

    move-wide/from16 v19, v10

    goto :goto_4

    .line 97
    :catchall_1
    move-exception v0

    goto :goto_1

    .line 91
    :catch_5
    move-exception v0

    move-wide/from16 v19, v10

    move/from16 v18, v21

    :goto_4
    move-object/from16 v5, v22

    move-object v10, v0

    move-object v11, v5

    move-object/from16 v9, v17

    goto :goto_5

    :catch_6
    move-exception v0

    move-wide/from16 v19, v5

    move/from16 v18, v7

    move-object v5, v9

    move-object/from16 v23, v14

    move-wide/from16 v24, v15

    move-wide v14, v10

    move-object v10, v0

    move-object v9, v4

    move-object v11, v5

    :goto_5
    move/from16 v4, v18

    move-wide/from16 v5, v19

    goto :goto_7

    :catch_7
    move-exception v0

    move/from16 v18, v7

    move-object v5, v9

    move-object/from16 v23, v14

    move-wide/from16 v24, v15

    move-wide v14, v10

    move-object v10, v0

    move-object v9, v4

    move-object v11, v5

    move/from16 v4, v18

    goto :goto_6

    .line 97
    :catchall_2
    move-exception v0

    move-object v5, v9

    goto/16 :goto_a

    .line 91
    :catch_8
    move-exception v0

    move-object v5, v9

    move-object/from16 v23, v14

    move-wide/from16 v24, v15

    move-wide v14, v10

    move-object v10, v0

    move-object v9, v4

    move-object v11, v5

    move v4, v1

    :goto_6
    move-wide v5, v2

    goto :goto_7

    .line 97
    :catchall_3
    move-exception v0

    move-object v5, v4

    goto :goto_a

    .line 91
    :catch_9
    move-exception v0

    move-object/from16 v23, v14

    move-wide/from16 v24, v15

    move-wide v14, v10

    move-object v10, v0

    move-wide v5, v2

    move-object v9, v4

    move-object v11, v9

    move v4, v1

    .line 92
    :goto_7
    :try_start_a
    const-string v0, "HostListStatusUpdateTask"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "sort speed error = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ss/android/ugc/effectmanager/common/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    invoke-virtual {v13, v14, v15}, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->setSortTime(J)V

    .line 94
    invoke-virtual {v10}, Ljava/lang/Exception;->printStackTrace()V

    .line 95
    move-object/from16 v1, v23

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_5

    const/4 v0, 0x0

    move-object v1, v12

    move-object v3, v13

    move-wide/from16 v7, v24

    move-object v12, v11

    move v11, v0

    :try_start_b
    invoke-direct/range {v1 .. v11}, Lcom/ss/android/ugc/effectmanager/link/task/task/HostListStatusUpdateTask;->sendEvent(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/link/model/host/Host;IJJLjava/lang/String;Ljava/lang/Exception;Z)V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_4

    .line 97
    if-eqz v12, :cond_2

    .line 98
    invoke-virtual {v12}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 101
    :cond_2
    :goto_8
    return-void

    .line 97
    :catchall_4
    move-exception v0

    goto :goto_9

    :catchall_5
    move-exception v0

    move-object v12, v11

    :goto_9
    move-object v5, v12

    :goto_a
    if-eqz v5, :cond_3

    .line 98
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_3
    throw v0
.end method

.method private sendEvent(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/link/model/host/Host;IJJLjava/lang/String;Ljava/lang/Exception;Z)V
    .locals 13

    .line 105
    new-instance v0, Lcom/ss/android/ugc/effectmanager/link/task/result/HostStatusUpdateResult;

    new-instance v12, Lcom/ss/android/ugc/effectmanager/link/model/host/HostStatus;

    move-object v1, v12

    move-object v2, p1

    move-object v3, p2

    move/from16 v4, p3

    move-wide/from16 v5, p4

    move-wide/from16 v7, p6

    move-object/from16 v9, p8

    move-object/from16 v10, p9

    move/from16 v11, p10

    invoke-direct/range {v1 .. v11}, Lcom/ss/android/ugc/effectmanager/link/model/host/HostStatus;-><init>(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/link/model/host/Host;IJJLjava/lang/String;Ljava/lang/Exception;Z)V

    const/4 v1, 0x0

    invoke-direct {v0, v12, v1}, Lcom/ss/android/ugc/effectmanager/link/task/result/HostStatusUpdateResult;-><init>(Lcom/ss/android/ugc/effectmanager/link/model/host/HostStatus;Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    const/16 v1, 0x1e

    move-object v2, p0

    invoke-virtual {v2, v1, v0}, Lcom/ss/android/ugc/effectmanager/link/task/task/HostListStatusUpdateTask;->sendMessage(ILcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;)V

    .line 107
    return-void
.end method

.method private sendResults()V
    .locals 3

    .line 136
    new-instance v0, Lcom/ss/android/ugc/effectmanager/link/task/result/HostListStatusUpdateTaskResult;

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/link/task/task/HostListStatusUpdateTask;->mHosts:Ljava/util/List;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/ss/android/ugc/effectmanager/link/task/result/HostListStatusUpdateTaskResult;-><init>(Ljava/util/List;Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    const/16 v1, 0x1f

    invoke-virtual {p0, v1, v0}, Lcom/ss/android/ugc/effectmanager/link/task/task/HostListStatusUpdateTask;->sendMessage(ILcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;)V

    .line 137
    return-void
.end method

.method private sortHost()V
    .locals 7

    .line 110
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/task/task/HostListStatusUpdateTask;->mHosts:Ljava/util/List;

    new-instance v1, Lcom/ss/android/ugc/effectmanager/link/task/task/HostListStatusUpdateTask$1;

    invoke-direct {v1, p0}, Lcom/ss/android/ugc/effectmanager/link/task/task/HostListStatusUpdateTask$1;-><init>(Lcom/ss/android/ugc/effectmanager/link/task/task/HostListStatusUpdateTask;)V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 116
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/link/task/task/HostListStatusUpdateTask;->mHosts:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 117
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 118
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/link/task/task/HostListStatusUpdateTask;->mHosts:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 119
    const/4 v1, 0x0

    :goto_0
    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/link/task/task/HostListStatusUpdateTask;->mHosts:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 120
    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/link/task/task/HostListStatusUpdateTask;->mHosts:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;

    .line 121
    const-string v3, "HostListStatusUpdateTask"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "weight sort = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->getSortTime()J

    move-result-wide v5

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->getSchema()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "://"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->getHost()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/ss/android/ugc/effectmanager/link/task/task/HostListStatusUpdateTask;->mSpeedApi:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/ss/android/ugc/effectmanager/common/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    add-int/lit8 v1, v1, 0x1

    move v3, v1

    :goto_1
    iget-object v4, p0, Lcom/ss/android/ugc/effectmanager/link/task/task/HostListStatusUpdateTask;->mHosts:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_1

    .line 123
    iget-object v4, p0, Lcom/ss/android/ugc/effectmanager/link/task/task/HostListStatusUpdateTask;->mHosts:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;

    .line 124
    invoke-virtual {v2}, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->getHost()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4}, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->getHost()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 125
    invoke-interface {v0, v4}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 122
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 119
    :cond_1
    goto :goto_0

    .line 129
    :cond_2
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/link/task/task/HostListStatusUpdateTask;->mHosts:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 130
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/link/task/task/HostListStatusUpdateTask;->mHosts:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 131
    const-string v0, "HostListStatusUpdateTask"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "speed distinct = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/link/task/task/HostListStatusUpdateTask;->mHosts:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " thread = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ss/android/ugc/effectmanager/common/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    return-void
.end method

.method private speedMeasure()V
    .locals 6

    .line 47
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/link/task/task/HostListStatusUpdateTask;->mHosts:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 48
    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/link/task/task/HostListStatusUpdateTask;->mHosts:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;

    const-wide/16 v3, 0x0

    invoke-virtual {v2, v3, v4}, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->setSortTime(J)V

    .line 49
    move v2, v0

    :goto_1
    iget-object v3, p0, Lcom/ss/android/ugc/effectmanager/link/task/task/HostListStatusUpdateTask;->mLinkSelector:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    invoke-virtual {v3}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->getRepeatTime()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 50
    iget-object v3, p0, Lcom/ss/android/ugc/effectmanager/link/task/task/HostListStatusUpdateTask;->mHosts:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;

    iget-object v4, p0, Lcom/ss/android/ugc/effectmanager/link/task/task/HostListStatusUpdateTask;->mHosts:Ljava/util/List;

    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;

    invoke-virtual {v4}, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->getSortTime()J

    move-result-wide v4

    invoke-direct {p0, v3, v4, v5}, Lcom/ss/android/ugc/effectmanager/link/task/task/HostListStatusUpdateTask;->getHostStatus(Lcom/ss/android/ugc/effectmanager/link/model/host/Host;J)V

    .line 49
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 47
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 53
    :cond_1
    return-void
.end method


# virtual methods
.method public execute()V
    .locals 0

    .line 40
    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/link/task/task/HostListStatusUpdateTask;->speedMeasure()V

    .line 41
    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/link/task/task/HostListStatusUpdateTask;->sortHost()V

    .line 42
    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/link/task/task/HostListStatusUpdateTask;->sendResults()V

    .line 43
    return-void
.end method
