.class public Lcom/xiaomi/protocol/ICustomCaptureResult;
.super Ljava/lang/Object;
.source "ICustomCaptureResult.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field private static final CAPTURE_RESULT_EXTRA_CLASS:Ljava/lang/String; = "android.hardware.camera2.impl.CaptureResultExtras"

.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/xiaomi/protocol/ICustomCaptureResult;",
            ">;"
        }
    .end annotation
.end field

.field private static final PHYSICAL_CAPTURE_RESULT_CLASS:Ljava/lang/String; = "android.hardware.camera2.impl.PhysicalCaptureResultInfo"

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mFrameNumber:J

.field private mRequest:Landroid/hardware/camera2/CaptureRequest;

.field private mResults:Landroid/os/Parcelable;

.field private mSequenceId:I

.field private mSessionId:I

.field private mTimeStamp:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 15
    const-class v0, Lcom/xiaomi/protocol/ICustomCaptureResult;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/protocol/ICustomCaptureResult;->TAG:Ljava/lang/String;

    .line 199
    new-instance v0, Lcom/xiaomi/protocol/ICustomCaptureResult$1;

    invoke-direct {v0}, Lcom/xiaomi/protocol/ICustomCaptureResult$1;-><init>()V

    sput-object v0, Lcom/xiaomi/protocol/ICustomCaptureResult;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    return-void
.end method

.method public constructor <init>(IIJLandroid/os/Parcelable;Landroid/hardware/camera2/CaptureRequest;)V
    .locals 0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput p1, p0, Lcom/xiaomi/protocol/ICustomCaptureResult;->mSessionId:I

    .line 38
    iput p2, p0, Lcom/xiaomi/protocol/ICustomCaptureResult;->mSequenceId:I

    .line 39
    iput-wide p3, p0, Lcom/xiaomi/protocol/ICustomCaptureResult;->mFrameNumber:J

    .line 40
    iput-object p5, p0, Lcom/xiaomi/protocol/ICustomCaptureResult;->mResults:Landroid/os/Parcelable;

    .line 41
    iput-object p6, p0, Lcom/xiaomi/protocol/ICustomCaptureResult;->mRequest:Landroid/hardware/camera2/CaptureRequest;

    .line 42
    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 2

    .line 190
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 191
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/xiaomi/protocol/ICustomCaptureResult;->mSessionId:I

    .line 192
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/xiaomi/protocol/ICustomCaptureResult;->mSequenceId:I

    .line 193
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/xiaomi/protocol/ICustomCaptureResult;->mFrameNumber:J

    .line 194
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/xiaomi/protocol/ICustomCaptureResult;->mTimeStamp:J

    .line 195
    const-class v0, Landroid/os/Parcelable;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/protocol/ICustomCaptureResult;->mResults:Landroid/os/Parcelable;

    .line 196
    const-class v0, Landroid/hardware/camera2/CaptureRequest;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/hardware/camera2/CaptureRequest;

    iput-object p1, p0, Lcom/xiaomi/protocol/ICustomCaptureResult;->mRequest:Landroid/hardware/camera2/CaptureRequest;

    .line 197
    return-void
.end method

.method public static getCameraMetaDataCopy(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 150
    :try_start_0
    const-string v0, "android.hardware.camera2.impl.CameraMetadataNative"

    .line 151
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 152
    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Class;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    .line 153
    new-array v1, v1, [Ljava/lang/Object;

    aput-object p0, v1, v3

    .line 154
    invoke-virtual {v0, v2}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object p0

    .line 155
    invoke-virtual {p0, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 156
    :catch_0
    move-exception p0

    .line 158
    sget-object v0, Lcom/xiaomi/protocol/ICustomCaptureResult;->TAG:Ljava/lang/String;

    const-string v1, "getCameraMetaDataCopy: failed: "

    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 161
    const/4 p0, 0x0

    return-object p0
.end method

.method public static toTotalCaptureResult(Lcom/xiaomi/protocol/ICustomCaptureResult;I)Landroid/hardware/camera2/TotalCaptureResult;
    .locals 16

    .line 102
    const/4 v1, 0x0

    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lcom/xiaomi/protocol/ICustomCaptureResult;->getSequenceId()I

    move-result v0

    .line 103
    nop

    .line 104
    nop

    .line 105
    nop

    .line 106
    invoke-virtual/range {p0 .. p0}, Lcom/xiaomi/protocol/ICustomCaptureResult;->getFrameNumber()J

    move-result-wide v2

    .line 107
    nop

    .line 108
    nop

    .line 109
    sget-object v4, Lcom/xiaomi/protocol/ICustomCaptureResult;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "toTotalCaptureResult: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v6, p1

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, "|"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, "|"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    const-string v4, "android.hardware.camera2.impl.CaptureResultExtras"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    .line 112
    const/4 v5, 0x7

    new-array v7, v5, [Ljava/lang/Class;

    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v9, 0x0

    aput-object v8, v7, v9

    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v10, 0x1

    aput-object v8, v7, v10

    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v11, 0x2

    aput-object v8, v7, v11

    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v12, 0x3

    aput-object v8, v7, v12

    sget-object v8, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    const/4 v13, 0x4

    aput-object v8, v7, v13

    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v14, 0x5

    aput-object v8, v7, v14

    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v15, 0x6

    aput-object v8, v7, v15

    .line 113
    invoke-virtual {v4, v7}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v4

    .line 114
    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v5, v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v5, v10

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v5, v11

    .line 115
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v5, v12

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    aput-object v0, v5, v13

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v5, v14

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v5, v15

    .line 114
    invoke-virtual {v4, v5}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 116
    const-class v2, Landroid/hardware/camera2/TotalCaptureResult;

    invoke-virtual {v2}, Ljava/lang/Class;->getDeclaredConstructors()[Ljava/lang/reflect/Constructor;

    move-result-object v2

    .line 117
    array-length v3, v2

    move v5, v9

    :goto_0
    if-ge v5, v3, :cond_1

    aget-object v7, v2, v5

    .line 119
    invoke-virtual {v7}, Ljava/lang/reflect/Constructor;->getParameters()[Ljava/lang/reflect/Parameter;

    move-result-object v8

    array-length v8, v8

    if-le v8, v11, :cond_0

    .line 120
    nop

    .line 121
    nop

    .line 124
    move-object v4, v7

    goto :goto_1

    .line 117
    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 124
    :cond_1
    :goto_1
    invoke-virtual/range {p0 .. p0}, Lcom/xiaomi/protocol/ICustomCaptureResult;->getResults()Landroid/os/Parcelable;

    move-result-object v2

    .line 125
    invoke-static {v2}, Lcom/xiaomi/protocol/ICustomCaptureResult;->getCameraMetaDataCopy(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 127
    if-nez v2, :cond_2

    .line 128
    return-object v1

    .line 131
    :cond_2
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x1c

    if-ge v3, v5, :cond_3

    .line 132
    new-array v3, v14, [Ljava/lang/Object;

    aput-object v2, v3, v9

    .line 133
    invoke-virtual/range {p0 .. p0}, Lcom/xiaomi/protocol/ICustomCaptureResult;->getRequest()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v2

    aput-object v2, v3, v10

    aput-object v0, v3, v11

    aput-object v1, v3, v12

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v3, v13

    .line 132
    invoke-virtual {v4, v3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/camera2/TotalCaptureResult;

    return-object v0

    .line 135
    :cond_3
    const-string v3, "android.hardware.camera2.impl.PhysicalCaptureResultInfo"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    .line 136
    invoke-static {v3, v9}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v3

    .line 137
    new-array v5, v15, [Ljava/lang/Object;

    aput-object v2, v5, v9

    .line 138
    invoke-virtual/range {p0 .. p0}, Lcom/xiaomi/protocol/ICustomCaptureResult;->getRequest()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v2

    aput-object v2, v5, v10

    aput-object v0, v5, v11

    aput-object v1, v5, v12

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v5, v13

    aput-object v3, v5, v14

    .line 137
    invoke-virtual {v4, v5}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/camera2/TotalCaptureResult;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 140
    :catch_0
    move-exception v0

    .line 141
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 144
    sget-object v0, Lcom/xiaomi/protocol/ICustomCaptureResult;->TAG:Ljava/lang/String;

    const-string v2, "null capture result!"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 145
    return-object v1
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .line 177
    const/4 v0, 0x0

    return v0
.end method

.method public getFrameNumber()J
    .locals 2

    .line 61
    iget-wide v0, p0, Lcom/xiaomi/protocol/ICustomCaptureResult;->mFrameNumber:J

    return-wide v0
.end method

.method public getRequest()Landroid/hardware/camera2/CaptureRequest;
    .locals 1

    .line 53
    iget-object v0, p0, Lcom/xiaomi/protocol/ICustomCaptureResult;->mRequest:Landroid/hardware/camera2/CaptureRequest;

    return-object v0
.end method

.method public getResults()Landroid/os/Parcelable;
    .locals 1

    .line 45
    iget-object v0, p0, Lcom/xiaomi/protocol/ICustomCaptureResult;->mResults:Landroid/os/Parcelable;

    return-object v0
.end method

.method public getSequenceId()I
    .locals 1

    .line 57
    iget v0, p0, Lcom/xiaomi/protocol/ICustomCaptureResult;->mSequenceId:I

    return v0
.end method

.method public getSessionId()I
    .locals 1

    .line 65
    iget v0, p0, Lcom/xiaomi/protocol/ICustomCaptureResult;->mSessionId:I

    return v0
.end method

.method public getTimeStamp()J
    .locals 2

    .line 85
    iget-wide v0, p0, Lcom/xiaomi/protocol/ICustomCaptureResult;->mTimeStamp:J

    return-wide v0
.end method

.method public setFrameNumber(J)V
    .locals 0

    .line 81
    iput-wide p1, p0, Lcom/xiaomi/protocol/ICustomCaptureResult;->mFrameNumber:J

    .line 82
    return-void
.end method

.method public setRequest(Landroid/hardware/camera2/CaptureRequest;)V
    .locals 0

    .line 73
    iput-object p1, p0, Lcom/xiaomi/protocol/ICustomCaptureResult;->mRequest:Landroid/hardware/camera2/CaptureRequest;

    .line 74
    return-void
.end method

.method public setResults(Landroid/os/Parcelable;)V
    .locals 0

    .line 49
    iput-object p1, p0, Lcom/xiaomi/protocol/ICustomCaptureResult;->mResults:Landroid/os/Parcelable;

    .line 50
    return-void
.end method

.method public setSequenceId(I)V
    .locals 0

    .line 77
    iput p1, p0, Lcom/xiaomi/protocol/ICustomCaptureResult;->mSequenceId:I

    .line 78
    return-void
.end method

.method public setSessionId(I)V
    .locals 0

    .line 69
    iput p1, p0, Lcom/xiaomi/protocol/ICustomCaptureResult;->mSessionId:I

    .line 70
    return-void
.end method

.method public setTimeStamp(J)V
    .locals 0

    .line 89
    iput-wide p1, p0, Lcom/xiaomi/protocol/ICustomCaptureResult;->mTimeStamp:J

    .line 90
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 166
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ICustomCaptureResult{mSessionId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/xiaomi/protocol/ICustomCaptureResult;->mSessionId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mSequenceId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/xiaomi/protocol/ICustomCaptureResult;->mSequenceId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mFrameNumber="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/xiaomi/protocol/ICustomCaptureResult;->mFrameNumber:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", mResults="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/xiaomi/protocol/ICustomCaptureResult;->mResults:Landroid/os/Parcelable;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", mRequest="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/xiaomi/protocol/ICustomCaptureResult;->mRequest:Landroid/hardware/camera2/CaptureRequest;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2

    .line 182
    iget v0, p0, Lcom/xiaomi/protocol/ICustomCaptureResult;->mSessionId:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 183
    iget v0, p0, Lcom/xiaomi/protocol/ICustomCaptureResult;->mSequenceId:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 184
    iget-wide v0, p0, Lcom/xiaomi/protocol/ICustomCaptureResult;->mFrameNumber:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 185
    iget-wide v0, p0, Lcom/xiaomi/protocol/ICustomCaptureResult;->mTimeStamp:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 186
    iget-object v0, p0, Lcom/xiaomi/protocol/ICustomCaptureResult;->mResults:Landroid/os/Parcelable;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 187
    iget-object v0, p0, Lcom/xiaomi/protocol/ICustomCaptureResult;->mRequest:Landroid/hardware/camera2/CaptureRequest;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 188
    return-void
.end method
