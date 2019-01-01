.class public Landroid/support/v4/util/TimeUtils;
.super Ljava/lang/Object;
.source "TimeUtils.java"


# static fields
.field public static final HUNDRED_DAY_FIELD_LEN:I = 0x13

.field private static final SECONDS_PER_DAY:I = 0x15180

.field private static final SECONDS_PER_HOUR:I = 0xe10

.field private static final SECONDS_PER_MINUTE:I = 0x3c

.field private static sFormatStr:[C

.field private static final sFormatSync:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 35
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Landroid/support/v4/util/TimeUtils;->sFormatSync:Ljava/lang/Object;

    .line 36
    const/16 v0, 0x18

    new-array v0, v0, [C

    sput-object v0, Landroid/support/v4/util/TimeUtils;->sFormatStr:[C

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static accumField(IIZI)I
    .locals 2
    .param p0, "amt"    # I
    .param p1, "suffix"    # I
    .param p2, "always"    # Z
    .param p3, "zeropad"    # I

    .line 39
    const/4 v0, 0x3

    const/16 v1, 0x63

    if-gt p0, v1, :cond_5

    if-eqz p2, :cond_0

    if-lt p3, v0, :cond_0

    goto :goto_2

    .line 42
    :cond_0
    const/16 v0, 0x9

    const/4 v1, 0x2

    if-gt p0, v0, :cond_4

    if-eqz p2, :cond_1

    if-lt p3, v1, :cond_1

    goto :goto_1

    .line 45
    :cond_1
    if-nez p2, :cond_3

    if-lez p0, :cond_2

    goto :goto_0

    .line 48
    :cond_2
    const/4 v0, 0x0

    return v0

    .line 46
    :cond_3
    :goto_0
    const/4 v0, 0x1

    add-int/2addr v0, p1

    return v0

    .line 43
    :cond_4
    :goto_1
    add-int/2addr v1, p1

    return v1

    .line 40
    :cond_5
    :goto_2
    add-int/2addr v0, p1

    return v0
.end method

.method public static formatDuration(JJLjava/io/PrintWriter;)V
    .locals 3
    .param p0, "time"    # J
    .param p2, "now"    # J
    .param p4, "pw"    # Ljava/io/PrintWriter;

    .line 169
    const-wide/16 v0, 0x0

    cmp-long v0, p0, v0

    if-nez v0, :cond_0

    .line 170
    const-string v0, "--"

    invoke-virtual {p4, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 171
    return-void

    .line 173
    :cond_0
    sub-long v0, p0, p2

    const/4 v2, 0x0

    invoke-static {v0, v1, p4, v2}, Landroid/support/v4/util/TimeUtils;->formatDuration(JLjava/io/PrintWriter;I)V

    .line 174
    return-void
.end method

.method public static formatDuration(JLjava/io/PrintWriter;)V
    .locals 1
    .param p0, "duration"    # J
    .param p2, "pw"    # Ljava/io/PrintWriter;

    .line 164
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Landroid/support/v4/util/TimeUtils;->formatDuration(JLjava/io/PrintWriter;I)V

    .line 165
    return-void
.end method

.method public static formatDuration(JLjava/io/PrintWriter;I)V
    .locals 5
    .param p0, "duration"    # J
    .param p2, "pw"    # Ljava/io/PrintWriter;
    .param p3, "fieldLen"    # I

    .line 156
    sget-object v0, Landroid/support/v4/util/TimeUtils;->sFormatSync:Ljava/lang/Object;

    monitor-enter v0

    .line 157
    :try_start_0
    invoke-static {p0, p1, p3}, Landroid/support/v4/util/TimeUtils;->formatDurationLocked(JI)I

    move-result v1

    .line 158
    .local v1, "len":I
    new-instance v2, Ljava/lang/String;

    sget-object v3, Landroid/support/v4/util/TimeUtils;->sFormatStr:[C

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4, v1}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {p2, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 159
    .end local v1    # "len":I
    monitor-exit v0

    .line 160
    return-void

    .line 159
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public static formatDuration(JLjava/lang/StringBuilder;)V
    .locals 4
    .param p0, "duration"    # J
    .param p2, "builder"    # Ljava/lang/StringBuilder;

    .line 148
    sget-object v0, Landroid/support/v4/util/TimeUtils;->sFormatSync:Ljava/lang/Object;

    monitor-enter v0

    .line 149
    const/4 v1, 0x0

    :try_start_0
    invoke-static {p0, p1, v1}, Landroid/support/v4/util/TimeUtils;->formatDurationLocked(JI)I

    move-result v2

    .line 150
    .local v2, "len":I
    sget-object v3, Landroid/support/v4/util/TimeUtils;->sFormatStr:[C

    invoke-virtual {p2, v3, v1, v2}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 151
    .end local v2    # "len":I
    monitor-exit v0

    .line 152
    return-void

    .line 151
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private static formatDurationLocked(JI)I
    .locals 27
    .param p0, "duration"    # J
    .param p2, "fieldLen"    # I

    move-wide/from16 v0, p0

    .line 76
    move/from16 v2, p2

    sget-object v3, Landroid/support/v4/util/TimeUtils;->sFormatStr:[C

    array-length v3, v3

    if-ge v3, v2, :cond_0

    .line 77
    new-array v3, v2, [C

    sput-object v3, Landroid/support/v4/util/TimeUtils;->sFormatStr:[C

    .line 80
    :cond_0
    sget-object v3, Landroid/support/v4/util/TimeUtils;->sFormatStr:[C

    .line 82
    .local v3, "formatStr":[C
    const-wide/16 v4, 0x0

    cmp-long v6, v0, v4

    const/16 v7, 0x20

    if-nez v6, :cond_2

    .line 83
    const/4 v4, 0x0

    .line 84
    .local v4, "pos":I
    add-int/lit8 v2, v2, -0x1

    .line 85
    .end local p2    # "fieldLen":I
    .local v2, "fieldLen":I
    :goto_0
    if-ge v4, v2, :cond_1

    .line 86
    aput-char v7, v3, v4

    goto :goto_0

    .line 88
    :cond_1
    const/16 v5, 0x30

    aput-char v5, v3, v4

    .line 89
    add-int/lit8 v5, v4, 0x1

    return v5

    .line 93
    .end local v2    # "fieldLen":I
    .end local v4    # "pos":I
    .restart local p2    # "fieldLen":I
    :cond_2
    cmp-long v4, v0, v4

    if-lez v4, :cond_3

    .line 94
    const/16 v4, 0x2b

    .line 100
    .end local p0    # "duration":J
    .local v0, "duration":J
    .local v10, "prefix":C
    :goto_1
    move v10, v4

    goto :goto_2

    .line 96
    .end local v0    # "duration":J
    .end local v10    # "prefix":C
    .restart local p0    # "duration":J
    :cond_3
    const/16 v4, 0x2d

    .line 97
    .local v4, "prefix":C
    neg-long v0, v0

    .end local p0    # "duration":J
    .restart local v0    # "duration":J
    goto :goto_1

    .line 100
    .end local v4    # "prefix":C
    .restart local v10    # "prefix":C
    :goto_2
    const-wide/16 v4, 0x3e8

    rem-long v8, v0, v4

    long-to-int v11, v8

    .line 101
    .local v11, "millis":I
    div-long v4, v0, v4

    long-to-double v4, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->floor(D)D

    move-result-wide v4

    double-to-int v4, v4

    .line 102
    .local v4, "seconds":I
    const/4 v5, 0x0

    .local v5, "days":I
    const/4 v6, 0x0

    .local v6, "hours":I
    const/4 v8, 0x0

    .line 104
    .local v8, "minutes":I
    const v9, 0x15180

    if-le v4, v9, :cond_4

    .line 105
    div-int v5, v4, v9

    .line 106
    mul-int/2addr v9, v5

    sub-int/2addr v4, v9

    .line 108
    .end local v5    # "days":I
    .local v12, "days":I
    :cond_4
    move v12, v5

    const/16 v5, 0xe10

    if-le v4, v5, :cond_5

    .line 109
    div-int/lit16 v5, v4, 0xe10

    .line 110
    .end local v6    # "hours":I
    .local v5, "hours":I
    mul-int/lit16 v6, v5, 0xe10

    sub-int/2addr v4, v6

    .line 112
    move v13, v5

    goto :goto_3

    .end local v5    # "hours":I
    .restart local v6    # "hours":I
    :cond_5
    move v13, v6

    .end local v6    # "hours":I
    .local v13, "hours":I
    :goto_3
    const/16 v5, 0x3c

    if-le v4, v5, :cond_6

    .line 113
    div-int/lit8 v5, v4, 0x3c

    .line 114
    .end local v8    # "minutes":I
    .local v5, "minutes":I
    mul-int/lit8 v6, v5, 0x3c

    sub-int/2addr v4, v6

    .line 117
    move v15, v4

    move v14, v5

    goto :goto_4

    .end local v5    # "minutes":I
    .restart local v8    # "minutes":I
    :cond_6
    move v15, v4

    move v14, v8

    .end local v4    # "seconds":I
    .end local v8    # "minutes":I
    .local v14, "minutes":I
    .local v15, "seconds":I
    :goto_4
    const/4 v4, 0x0

    .line 119
    .local v4, "pos":I
    const/16 v16, 0x3

    const/4 v9, 0x2

    const/4 v8, 0x0

    const/4 v6, 0x1

    if-eqz v2, :cond_b

    .line 120
    invoke-static {v12, v6, v8, v8}, Landroid/support/v4/util/TimeUtils;->accumField(IIZI)I

    move-result v5

    .line 121
    .local v5, "myLen":I
    if-lez v5, :cond_7

    move v8, v6

    nop

    :cond_7
    invoke-static {v13, v6, v8, v9}, Landroid/support/v4/util/TimeUtils;->accumField(IIZI)I

    move-result v8

    add-int/2addr v5, v8

    .line 122
    if-lez v5, :cond_8

    move v8, v6

    goto :goto_5

    :cond_8
    const/4 v8, 0x0

    :goto_5
    invoke-static {v14, v6, v8, v9}, Landroid/support/v4/util/TimeUtils;->accumField(IIZI)I

    move-result v8

    add-int/2addr v5, v8

    .line 123
    if-lez v5, :cond_9

    move v8, v6

    goto :goto_6

    :cond_9
    const/4 v8, 0x0

    :goto_6
    invoke-static {v15, v6, v8, v9}, Landroid/support/v4/util/TimeUtils;->accumField(IIZI)I

    move-result v8

    add-int/2addr v5, v8

    .line 124
    if-lez v5, :cond_a

    move/from16 v8, v16

    goto :goto_7

    :cond_a
    const/4 v8, 0x0

    :goto_7
    invoke-static {v11, v9, v6, v8}, Landroid/support/v4/util/TimeUtils;->accumField(IIZI)I

    move-result v8

    add-int/2addr v8, v6

    add-int/2addr v5, v8

    .line 125
    :goto_8
    if-ge v5, v2, :cond_b

    .line 126
    aput-char v7, v3, v4

    .line 127
    add-int/lit8 v4, v4, 0x1

    .line 128
    add-int/lit8 v5, v5, 0x1

    goto :goto_8

    .line 132
    .end local v5    # "myLen":I
    :cond_b
    aput-char v10, v3, v4

    .line 133
    add-int/lit8 v18, v4, 0x1

    .line 135
    .end local v4    # "pos":I
    .local v18, "pos":I
    move/from16 v8, v18

    .line 136
    .local v8, "start":I
    if-eqz v2, :cond_c

    move v4, v6

    goto :goto_9

    :cond_c
    const/4 v4, 0x0

    :goto_9
    move/from16 v19, v4

    .line 137
    .local v19, "zeropad":Z
    const/16 v7, 0x64

    const/16 v20, 0x0

    const/16 v21, 0x0

    move-object v4, v3

    move v5, v12

    move/from16 v22, v6

    move v6, v7

    move/from16 v7, v18

    move/from16 v23, v8

    const/16 v17, 0x0

    move/from16 v8, v20

    .end local v8    # "start":I
    .local v23, "start":I
    move/from16 v20, v9

    move/from16 v9, v21

    invoke-static/range {v4 .. v9}, Landroid/support/v4/util/TimeUtils;->printField([CICIZI)I

    move-result v9

    .line 138
    .end local v18    # "pos":I
    .local v9, "pos":I
    const/16 v6, 0x68

    move/from16 v8, v23

    if-eq v9, v8, :cond_d

    .end local v23    # "start":I
    .restart local v8    # "start":I
    move/from16 v18, v22

    goto :goto_a

    :cond_d
    move/from16 v18, v17

    :goto_a
    if-eqz v19, :cond_e

    move/from16 v21, v20

    goto :goto_b

    :cond_e
    move/from16 v21, v17

    :goto_b
    move-object v4, v3

    move v5, v13

    move v7, v9

    move/from16 v24, v8

    move/from16 v8, v18

    .end local v8    # "start":I
    .local v24, "start":I
    move/from16 v18, v9

    move/from16 v9, v21

    .end local v9    # "pos":I
    .restart local v18    # "pos":I
    invoke-static/range {v4 .. v9}, Landroid/support/v4/util/TimeUtils;->printField([CICIZI)I

    move-result v9

    .line 139
    .end local v18    # "pos":I
    .restart local v9    # "pos":I
    const/16 v6, 0x6d

    move/from16 v8, v24

    if-eq v9, v8, :cond_f

    .end local v24    # "start":I
    .restart local v8    # "start":I
    move/from16 v18, v22

    goto :goto_c

    :cond_f
    move/from16 v18, v17

    :goto_c
    if-eqz v19, :cond_10

    move/from16 v21, v20

    goto :goto_d

    :cond_10
    move/from16 v21, v17

    :goto_d
    move-object v4, v3

    move v5, v14

    move v7, v9

    move/from16 v25, v8

    move/from16 v8, v18

    .end local v8    # "start":I
    .local v25, "start":I
    move/from16 v18, v9

    move/from16 v9, v21

    .end local v9    # "pos":I
    .restart local v18    # "pos":I
    invoke-static/range {v4 .. v9}, Landroid/support/v4/util/TimeUtils;->printField([CICIZI)I

    move-result v9

    .line 140
    .end local v18    # "pos":I
    .restart local v9    # "pos":I
    const/16 v6, 0x73

    move/from16 v8, v25

    if-eq v9, v8, :cond_11

    .end local v25    # "start":I
    .restart local v8    # "start":I
    goto :goto_e

    :cond_11
    move/from16 v22, v17

    :goto_e
    if-eqz v19, :cond_12

    goto :goto_f

    :cond_12
    move/from16 v20, v17

    :goto_f
    move-object v4, v3

    move v5, v15

    move v7, v9

    move/from16 v26, v8

    move/from16 v8, v22

    .end local v8    # "start":I
    .local v26, "start":I
    move/from16 v18, v9

    move/from16 v9, v20

    .end local v9    # "pos":I
    .restart local v18    # "pos":I
    invoke-static/range {v4 .. v9}, Landroid/support/v4/util/TimeUtils;->printField([CICIZI)I

    move-result v9

    .line 141
    .end local v18    # "pos":I
    .restart local v9    # "pos":I
    const/16 v6, 0x6d

    const/4 v8, 0x1

    if-eqz v19, :cond_13

    move/from16 v7, v26

    if-eq v9, v7, :cond_14

    .end local v26    # "start":I
    .local v7, "start":I
    goto :goto_10

    .end local v7    # "start":I
    .restart local v26    # "start":I
    :cond_13
    move/from16 v7, v26

    .end local v26    # "start":I
    .restart local v7    # "start":I
    :cond_14
    move/from16 v16, v17

    :goto_10
    move-object v4, v3

    move v5, v11

    move/from16 v17, v7

    move v7, v9

    .end local v7    # "start":I
    .local v17, "start":I
    move/from16 v18, v9

    move/from16 v9, v16

    .end local v9    # "pos":I
    .restart local v18    # "pos":I
    invoke-static/range {v4 .. v9}, Landroid/support/v4/util/TimeUtils;->printField([CICIZI)I

    move-result v4

    .line 142
    .end local v18    # "pos":I
    .restart local v4    # "pos":I
    const/16 v5, 0x73

    aput-char v5, v3, v4

    .line 143
    add-int/lit8 v5, v4, 0x1

    return v5
.end method

.method private static printField([CICIZI)I
    .locals 3
    .param p0, "formatStr"    # [C
    .param p1, "amt"    # I
    .param p2, "suffix"    # C
    .param p3, "pos"    # I
    .param p4, "always"    # Z
    .param p5, "zeropad"    # I

    .line 53
    if-nez p4, :cond_0

    if-lez p1, :cond_7

    .line 54
    :cond_0
    move v0, p3

    .line 55
    .local v0, "startPos":I
    if-eqz p4, :cond_1

    const/4 v1, 0x3

    if-ge p5, v1, :cond_2

    :cond_1
    const/16 v1, 0x63

    if-le p1, v1, :cond_3

    .line 56
    :cond_2
    div-int/lit8 v1, p1, 0x64

    .line 57
    .local v1, "dig":I
    add-int/lit8 v2, v1, 0x30

    int-to-char v2, v2

    aput-char v2, p0, p3

    .line 58
    add-int/lit8 p3, p3, 0x1

    .line 59
    mul-int/lit8 v2, v1, 0x64

    sub-int/2addr p1, v2

    .line 61
    .end local v1    # "dig":I
    :cond_3
    if-eqz p4, :cond_4

    const/4 v1, 0x2

    if-ge p5, v1, :cond_5

    :cond_4
    const/16 v1, 0x9

    if-gt p1, v1, :cond_5

    if-eq v0, p3, :cond_6

    .line 62
    :cond_5
    div-int/lit8 v1, p1, 0xa

    .line 63
    .restart local v1    # "dig":I
    add-int/lit8 v2, v1, 0x30

    int-to-char v2, v2

    aput-char v2, p0, p3

    .line 64
    add-int/lit8 p3, p3, 0x1

    .line 65
    mul-int/lit8 v2, v1, 0xa

    sub-int/2addr p1, v2

    .line 67
    .end local v1    # "dig":I
    :cond_6
    add-int/lit8 v1, p1, 0x30

    int-to-char v1, v1

    aput-char v1, p0, p3

    .line 68
    add-int/lit8 p3, p3, 0x1

    .line 69
    aput-char p2, p0, p3

    .line 70
    add-int/lit8 p3, p3, 0x1

    .line 72
    .end local v0    # "startPos":I
    :cond_7
    return p3
.end method
