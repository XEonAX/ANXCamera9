.class public Lcom/arcsoft/avatar/AvatarEngine;
.super Ljava/lang/Object;
.source "AvatarEngine.java"

# interfaces
.implements Lcom/arcsoft/avatar/AvatarConfig;


# static fields
.field private static final a:Ljava/lang/String; = "AvatarEngine"

.field private static final bD:F = 0.8f


# instance fields
.field private bE:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "Arcsoft_Avatar_Jni"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    const-string v0, "AvatarEngine"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/arcsoft/avatar/AvatarEngine;->bE:J

    return-void
.end method

.method private native nativeAvatarProcess(JIII[B[BIZI)I
.end method

.method private native nativeAvatarProcessEx(JIII[Ljava/nio/ByteBuffer;[BIZI)I
.end method

.method private native nativeAvatarProcessEx2(JLcom/arcsoft/avatar/d/a;[BIZI)I
.end method

.method private native nativeAvatarProfile(JLjava/lang/String;III[BIZLcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;Lcom/arcsoft/avatar/AvatarConfig$m;)I
.end method

.method private native nativeAvatarRender(JIIIIZ[I)I
.end method

.method private native nativeCreate()J
.end method

.method private native nativeDestroy(J)I
.end method

.method private native nativeGetConfig(JIILcom/arcsoft/avatar/AvatarConfig$k;)I
.end method

.method private native nativeGetConfigValue(JLcom/arcsoft/avatar/AvatarConfig$e;)I
.end method

.method private native nativeGetSupportConfigType(JILcom/arcsoft/avatar/AvatarConfig$l;)I
.end method

.method private native nativeInit(JLjava/lang/String;Ljava/lang/String;)I
.end method

.method private native nativeIsSupportSwitchGender(J)Z
.end method

.method private native nativeLoadConfig(JLjava/lang/String;)I
.end method

.method private native nativeProcessOutlineExpression(J[BIIIIZILcom/arcsoft/avatar/AvatarConfig$g;)I
.end method

.method private native nativeProcessWithInfo(J[BIIIIZILcom/arcsoft/avatar/AvatarConfig$g;)I
.end method

.method private native nativeReleaseRender(J)I
.end method

.method private native nativeRenderThumb(J[BIII)I
.end method

.method private native nativeSaveConfig(JLjava/lang/String;)I
.end method

.method private native nativeSetConfig(JLcom/arcsoft/avatar/AvatarConfig$c;)I
.end method

.method private native nativeSetRenderScene(JZF)I
.end method

.method private native nativeSetTemplate(JLjava/lang/String;)I
.end method

.method private native nativeSwitchGender(JZ)I
.end method

.method private native nativeUnInit(J)I
.end method


# virtual methods
.method public declared-synchronized a(III[B[BIZI)I
    .locals 13

    move-object v12, p0

    monitor-enter p0

    :try_start_0
    iget-wide v2, v12, Lcom/arcsoft/avatar/AvatarEngine;->bE:J

    move-object v1, v12

    move v4, p1

    move v5, p2

    move/from16 v6, p3

    move-object/from16 v7, p4

    move-object/from16 v8, p5

    move/from16 v9, p6

    move/from16 v10, p7

    move/from16 v11, p8

    invoke-direct/range {v1 .. v11}, Lcom/arcsoft/avatar/AvatarEngine;->nativeAvatarProcess(JIII[B[BIZI)I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized a(III[Ljava/nio/ByteBuffer;[BIZI)I
    .locals 13

    move-object v12, p0

    monitor-enter p0

    :try_start_0
    iget-wide v2, v12, Lcom/arcsoft/avatar/AvatarEngine;->bE:J

    move-object v1, v12

    move v4, p1

    move v5, p2

    move/from16 v6, p3

    move-object/from16 v7, p4

    move-object/from16 v8, p5

    move/from16 v9, p6

    move/from16 v10, p7

    move/from16 v11, p8

    invoke-direct/range {v1 .. v11}, Lcom/arcsoft/avatar/AvatarEngine;->nativeAvatarProcessEx(JIII[Ljava/nio/ByteBuffer;[BIZI)I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized a(Lcom/arcsoft/avatar/AvatarConfig$c;)I
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/arcsoft/avatar/AvatarEngine;->bE:J

    invoke-direct {p0, v0, v1, p1}, Lcom/arcsoft/avatar/AvatarEngine;->nativeSetConfig(JLcom/arcsoft/avatar/AvatarConfig$c;)I

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized a(Lcom/arcsoft/avatar/AvatarConfig$g;)I
    .locals 9

    monitor-enter p0

    const/4 v0, 0x0

    if-nez p1, :cond_0

    :try_start_0
    const-string p1, "CheckOutLine"

    const-string v1, "null"

    invoke-static {p1, v1}, Lcom/arcsoft/avatar/d/g;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception p1

    goto/16 :goto_7

    :cond_0
    :try_start_1
    iget-object v1, p1, Lcom/arcsoft/avatar/AvatarConfig$g;->bn:[F

    if-nez v1, :cond_1

    const-string p1, "CheckOutLine"

    const-string v1, "shelterFlags == null"

    invoke-static {p1, v1}, Lcom/arcsoft/avatar/d/g;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return v0

    :cond_1
    :try_start_2
    const-string v1, "CheckOutLine"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "faceCount = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p1, Lcom/arcsoft/avatar/AvatarConfig$g;->faceCount:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/arcsoft/avatar/d/g;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget v1, p1, Lcom/arcsoft/avatar/AvatarConfig$g;->faceCount:I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-gtz v1, :cond_2

    monitor-exit p0

    return v0

    :cond_2
    nop

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    const/16 v3, 0x24

    if-gt v0, v3, :cond_3

    :try_start_3
    iget-object v3, p1, Lcom/arcsoft/avatar/AvatarConfig$g;->bn:[F

    aget v3, v3, v0

    add-float/2addr v2, v3

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    const/high16 v0, 0x42100000    # 36.0f

    div-float/2addr v2, v0

    const-string v0, "CheckOutLine"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "fFaceValue = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/arcsoft/avatar/d/g;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    const v0, 0x3f4ccccd    # 0.8f

    cmpl-float v2, v2, v0

    if-lez v2, :cond_4

    const/4 p1, 0x5

    monitor-exit p0

    return p1

    :cond_4
    nop

    const/16 v2, 0x45

    move v3, v1

    :goto_1
    const/16 v4, 0x50

    if-gt v2, v4, :cond_5

    :try_start_4
    iget-object v4, p1, Lcom/arcsoft/avatar/AvatarConfig$g;->bn:[F

    aget v4, v4, v2

    add-float/2addr v3, v4

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_5
    const/high16 v2, 0x41400000    # 12.0f

    div-float/2addr v3, v2

    const-string v4, "CheckOutLine"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "fLeftEyeValue = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/arcsoft/avatar/d/g;->d(Ljava/lang/String;Ljava/lang/String;)V

    nop

    nop

    nop

    const/16 v4, 0x39

    move v5, v1

    :goto_2
    const/16 v6, 0x44

    if-gt v4, v6, :cond_6

    iget-object v6, p1, Lcom/arcsoft/avatar/AvatarConfig$g;->bn:[F

    aget v6, v6, v4

    add-float/2addr v5, v6

    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    :cond_6
    div-float v2, v5, v2

    const-string v4, "CheckOutLine"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "fRightEyeValue = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/arcsoft/avatar/d/g;->d(Ljava/lang/String;Ljava/lang/String;)V

    cmpl-float v4, v2, v3

    if-lez v4, :cond_7

    nop

    const/4 v3, 0x2

    goto :goto_3

    :cond_7
    const/4 v2, 0x1

    move v8, v3

    move v3, v2

    move v2, v8

    :goto_3
    const/16 v4, 0x5d

    move v5, v1

    :goto_4
    const/16 v6, 0x70

    if-gt v4, v6, :cond_8

    iget-object v6, p1, Lcom/arcsoft/avatar/AvatarConfig$g;->bn:[F

    aget v6, v6, v4

    add-float/2addr v5, v6

    add-int/lit8 v4, v4, 0x1

    goto :goto_4

    :cond_8
    const/high16 v4, 0x41a00000    # 20.0f

    div-float v4, v5, v4

    const-string v5, "CheckOutLine"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "fMouthEyeValue = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/arcsoft/avatar/d/g;->d(Ljava/lang/String;Ljava/lang/String;)V

    cmpl-float v5, v4, v2

    if-lez v5, :cond_9

    nop

    const/4 v3, 0x3

    move v2, v4

    :cond_9
    const/16 v4, 0x51

    :goto_5
    const/16 v5, 0x77

    if-gt v4, v5, :cond_a

    iget-object v5, p1, Lcom/arcsoft/avatar/AvatarConfig$g;->bn:[F

    aget v5, v5, v4

    add-float/2addr v1, v5

    add-int/lit8 v4, v4, 0x1

    goto :goto_5

    :cond_a
    const/high16 p1, 0x421c0000    # 39.0f

    div-float p1, v1, p1

    const-string v1, "CheckOutLine"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "fNOSEEyeValue = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Lcom/arcsoft/avatar/d/g;->d(Ljava/lang/String;Ljava/lang/String;)V

    cmpl-float v1, p1, v2

    if-lez v1, :cond_b

    const/4 v3, 0x4

    goto :goto_6

    :cond_b
    move p1, v2

    :goto_6
    const-string v1, "CheckOutLine"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "fMax = "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v4, " res = "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/arcsoft/avatar/d/g;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    cmpl-float p1, p1, v0

    if-lez p1, :cond_c

    monitor-exit p0

    return v3

    :cond_c
    const/4 p1, 0x6

    monitor-exit p0

    return p1

    :goto_7
    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized a(Lcom/arcsoft/avatar/d/a;[BIZI)I
    .locals 8

    monitor-enter p0

    :try_start_0
    iget-wide v1, p0, Lcom/arcsoft/avatar/AvatarEngine;->bE:J

    move-object v0, p0

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    move v6, p4

    move v7, p5

    invoke-direct/range {v0 .. v7}, Lcom/arcsoft/avatar/AvatarEngine;->nativeAvatarProcessEx2(JLcom/arcsoft/avatar/d/a;[BIZI)I

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized a(Ljava/lang/String;III[BIZLcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;Lcom/arcsoft/avatar/AvatarConfig$m;)I
    .locals 14

    move-object v13, p0

    monitor-enter p0

    :try_start_0
    iget-wide v2, v13, Lcom/arcsoft/avatar/AvatarEngine;->bE:J

    move-object v1, v13

    move-object v4, p1

    move/from16 v5, p2

    move/from16 v6, p3

    move/from16 v7, p4

    move-object/from16 v8, p5

    move/from16 v9, p6

    move/from16 v10, p7

    move-object/from16 v11, p8

    move-object/from16 v12, p9

    invoke-direct/range {v1 .. v12}, Lcom/arcsoft/avatar/AvatarEngine;->nativeAvatarProfile(JLjava/lang/String;III[BIZLcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;Lcom/arcsoft/avatar/AvatarConfig$m;)I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized a([BIII)I
    .locals 7

    monitor-enter p0

    :try_start_0
    iget-wide v1, p0, Lcom/arcsoft/avatar/AvatarEngine;->bE:J

    move-object v0, p0

    move-object v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    invoke-direct/range {v0 .. v6}, Lcom/arcsoft/avatar/AvatarEngine;->nativeRenderThumb(J[BIII)I

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized a([BIIIIZILcom/arcsoft/avatar/AvatarConfig$g;)I
    .locals 13

    move-object v12, p0

    monitor-enter p0

    :try_start_0
    iget-wide v2, v12, Lcom/arcsoft/avatar/AvatarEngine;->bE:J

    move-object v1, v12

    move-object v4, p1

    move v5, p2

    move/from16 v6, p3

    move/from16 v7, p4

    move/from16 v8, p5

    move/from16 v9, p6

    move/from16 v10, p7

    move-object/from16 v11, p8

    invoke-direct/range {v1 .. v11}, Lcom/arcsoft/avatar/AvatarEngine;->nativeProcessOutlineExpression(J[BIIIIZILcom/arcsoft/avatar/AvatarConfig$g;)I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized a(I)Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/ArrayList<",
            "Lcom/arcsoft/avatar/AvatarConfig$d;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-wide v1, p0, Lcom/arcsoft/avatar/AvatarEngine;->bE:J

    new-instance v3, Lcom/arcsoft/avatar/AvatarEngine$1;

    invoke-direct {v3, p0, v0}, Lcom/arcsoft/avatar/AvatarEngine$1;-><init>(Lcom/arcsoft/avatar/AvatarEngine;Ljava/util/ArrayList;)V

    invoke-direct {p0, v1, v2, p1, v3}, Lcom/arcsoft/avatar/AvatarEngine;->nativeGetSupportConfigType(JILcom/arcsoft/avatar/AvatarConfig$l;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized a(II)Ljava/util/ArrayList;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Ljava/util/ArrayList<",
            "Lcom/arcsoft/avatar/AvatarConfig$c;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-wide v2, p0, Lcom/arcsoft/avatar/AvatarEngine;->bE:J

    new-instance v6, Lcom/arcsoft/avatar/AvatarEngine$2;

    invoke-direct {v6, p0, v0, p1}, Lcom/arcsoft/avatar/AvatarEngine$2;-><init>(Lcom/arcsoft/avatar/AvatarEngine;Ljava/util/ArrayList;I)V

    move-object v1, p0

    move v4, p1

    move v5, p2

    invoke-direct/range {v1 .. v6}, Lcom/arcsoft/avatar/AvatarEngine;->nativeGetConfig(JIILcom/arcsoft/avatar/AvatarConfig$k;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized a(IIIIZ[I)V
    .locals 9

    monitor-enter p0

    :try_start_0
    iget-wide v1, p0, Lcom/arcsoft/avatar/AvatarEngine;->bE:J

    move-object v0, p0

    move v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    move v7, p5

    move-object v8, p6

    invoke-direct/range {v0 .. v8}, Lcom/arcsoft/avatar/AvatarEngine;->nativeAvatarRender(JIIIIZ[I)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized a(Lcom/arcsoft/avatar/AvatarConfig$e;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/arcsoft/avatar/AvatarEngine;->bE:J

    invoke-direct {p0, v0, v1, p1}, Lcom/arcsoft/avatar/AvatarEngine;->nativeGetConfigValue(JLcom/arcsoft/avatar/AvatarConfig$e;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized a(ZF)V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/arcsoft/avatar/AvatarEngine;->bE:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/arcsoft/avatar/AvatarEngine;->nativeSetRenderScene(JZF)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized b([BIIIIZILcom/arcsoft/avatar/AvatarConfig$g;)I
    .locals 13

    move-object v12, p0

    monitor-enter p0

    :try_start_0
    iget-wide v2, v12, Lcom/arcsoft/avatar/AvatarEngine;->bE:J

    move-object v1, v12

    move-object v4, p1

    move v5, p2

    move/from16 v6, p3

    move/from16 v7, p4

    move/from16 v8, p5

    move/from16 v9, p6

    move/from16 v10, p7

    move-object/from16 v11, p8

    invoke-direct/range {v1 .. v11}, Lcom/arcsoft/avatar/AvatarEngine;->nativeProcessWithInfo(J[BIIIIZILcom/arcsoft/avatar/AvatarConfig$g;)I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized c(Z)V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/arcsoft/avatar/AvatarEngine;->bE:J

    invoke-direct {p0, v0, v1, p1}, Lcom/arcsoft/avatar/AvatarEngine;->nativeSwitchGender(JZ)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized destroy()V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/arcsoft/avatar/AvatarEngine;->bE:J

    invoke-direct {p0, v0, v1}, Lcom/arcsoft/avatar/AvatarEngine;->nativeDestroy(J)I

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/arcsoft/avatar/AvatarEngine;->bE:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized e()V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/arcsoft/avatar/AvatarEngine;->bE:J

    invoke-direct {p0, v0, v1}, Lcom/arcsoft/avatar/AvatarEngine;->nativeReleaseRender(J)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized f(Ljava/lang/String;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/arcsoft/avatar/AvatarEngine;->bE:J

    invoke-direct {p0, v0, v1, p1}, Lcom/arcsoft/avatar/AvatarEngine;->nativeSetTemplate(JLjava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized f(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/arcsoft/avatar/AvatarEngine;->nativeCreate()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/arcsoft/avatar/AvatarEngine;->bE:J

    iget-wide v0, p0, Lcom/arcsoft/avatar/AvatarEngine;->bE:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/arcsoft/avatar/AvatarEngine;->nativeInit(JLjava/lang/String;Ljava/lang/String;)I

    move-result p1

    const-string p2, "AvatarEngine"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "init res = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/arcsoft/avatar/d/g;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized f()Z
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/arcsoft/avatar/AvatarEngine;->bE:J

    invoke-direct {p0, v0, v1}, Lcom/arcsoft/avatar/AvatarEngine;->nativeIsSupportSwitchGender(J)Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized g(Ljava/lang/String;)I
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/arcsoft/avatar/AvatarEngine;->bE:J

    invoke-direct {p0, v0, v1, p1}, Lcom/arcsoft/avatar/AvatarEngine;->nativeSaveConfig(JLjava/lang/String;)I

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized h(Ljava/lang/String;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/arcsoft/avatar/AvatarEngine;->bE:J

    invoke-direct {p0, v0, v1, p1}, Lcom/arcsoft/avatar/AvatarEngine;->nativeLoadConfig(JLjava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized unInit()V
    .locals 4

    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/arcsoft/avatar/AvatarEngine;->bE:J

    invoke-direct {p0, v0, v1}, Lcom/arcsoft/avatar/AvatarEngine;->nativeUnInit(J)I

    move-result v0

    const-string v1, "AvatarEngine"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "uninit res = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/arcsoft/avatar/d/g;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
