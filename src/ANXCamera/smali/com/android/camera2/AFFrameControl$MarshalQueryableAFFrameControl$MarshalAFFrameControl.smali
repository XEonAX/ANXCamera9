.class Lcom/android/camera2/AFFrameControl$MarshalQueryableAFFrameControl$MarshalAFFrameControl;
.super Landroid/hardware/camera2/marshal/Marshaler;
.source "AFFrameControl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera2/AFFrameControl$MarshalQueryableAFFrameControl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MarshalAFFrameControl"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/hardware/camera2/marshal/Marshaler<",
        "Lcom/android/camera2/AFFrameControl;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera2/AFFrameControl$MarshalQueryableAFFrameControl;


# direct methods
.method protected constructor <init>(Lcom/android/camera2/AFFrameControl$MarshalQueryableAFFrameControl;Landroid/hardware/camera2/utils/TypeReference;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/camera2/utils/TypeReference<",
            "Lcom/android/camera2/AFFrameControl;",
            ">;I)V"
        }
    .end annotation

    .line 110
    iput-object p1, p0, Lcom/android/camera2/AFFrameControl$MarshalQueryableAFFrameControl$MarshalAFFrameControl;->this$0:Lcom/android/camera2/AFFrameControl$MarshalQueryableAFFrameControl;

    .line 111
    invoke-direct {p0, p1, p2, p3}, Landroid/hardware/camera2/marshal/Marshaler;-><init>(Landroid/hardware/camera2/marshal/MarshalQueryable;Landroid/hardware/camera2/utils/TypeReference;I)V

    .line 112
    return-void
.end method


# virtual methods
.method public getNativeSize()I
    .locals 1

    .line 188
    const/16 v0, 0x398

    return v0
.end method

.method public marshal(Lcom/android/camera2/AFFrameControl;Ljava/nio/ByteBuffer;)V
    .locals 5

    .line 116
    invoke-static {p1}, Lcom/android/camera2/AFFrameControl;->access$000(Lcom/android/camera2/AFFrameControl;)I

    move-result v0

    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 117
    invoke-static {p1}, Lcom/android/camera2/AFFrameControl;->access$100(Lcom/android/camera2/AFFrameControl;)I

    move-result v0

    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 118
    invoke-static {p1}, Lcom/android/camera2/AFFrameControl;->access$200(Lcom/android/camera2/AFFrameControl;)Lcom/android/camera2/AFFrameControl$AFGyroData;

    move-result-object v0

    iget v0, v0, Lcom/android/camera2/AFFrameControl$AFGyroData;->sampleCount:I

    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 120
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    const/16 v2, 0x20

    if-ge v1, v2, :cond_0

    .line 121
    invoke-static {p1}, Lcom/android/camera2/AFFrameControl;->access$200(Lcom/android/camera2/AFFrameControl;)Lcom/android/camera2/AFFrameControl$AFGyroData;

    move-result-object v2

    iget-object v2, v2, Lcom/android/camera2/AFFrameControl$AFGyroData;->pAngularVelocityX:[F

    aget v2, v2, v1

    invoke-virtual {p2, v2}, Ljava/nio/ByteBuffer;->putFloat(F)Ljava/nio/ByteBuffer;

    .line 120
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 124
    :cond_0
    move v1, v0

    :goto_1
    if-ge v1, v2, :cond_1

    .line 125
    invoke-static {p1}, Lcom/android/camera2/AFFrameControl;->access$200(Lcom/android/camera2/AFFrameControl;)Lcom/android/camera2/AFFrameControl$AFGyroData;

    move-result-object v3

    iget-object v3, v3, Lcom/android/camera2/AFFrameControl$AFGyroData;->pAngularVelocityY:[F

    aget v3, v3, v1

    invoke-virtual {p2, v3}, Ljava/nio/ByteBuffer;->putFloat(F)Ljava/nio/ByteBuffer;

    .line 124
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 128
    :cond_1
    move v1, v0

    :goto_2
    if-ge v1, v2, :cond_2

    .line 129
    invoke-static {p1}, Lcom/android/camera2/AFFrameControl;->access$200(Lcom/android/camera2/AFFrameControl;)Lcom/android/camera2/AFFrameControl$AFGyroData;

    move-result-object v3

    iget-object v3, v3, Lcom/android/camera2/AFFrameControl$AFGyroData;->pAngularVelocityZ:[F

    aget v3, v3, v1

    invoke-virtual {p2, v3}, Ljava/nio/ByteBuffer;->putFloat(F)Ljava/nio/ByteBuffer;

    .line 128
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 132
    :cond_2
    :goto_3
    if-ge v0, v2, :cond_3

    .line 133
    invoke-static {p1}, Lcom/android/camera2/AFFrameControl;->access$200(Lcom/android/camera2/AFFrameControl;)Lcom/android/camera2/AFFrameControl$AFGyroData;

    move-result-object v1

    iget-object v1, v1, Lcom/android/camera2/AFFrameControl$AFGyroData;->timeStamp:[J

    aget-wide v3, v1, v0

    long-to-float v1, v3

    invoke-virtual {p2, v1}, Ljava/nio/ByteBuffer;->putFloat(F)Ljava/nio/ByteBuffer;

    .line 132
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 136
    :cond_3
    return-void
.end method

.method public bridge synthetic marshal(Ljava/lang/Object;Ljava/nio/ByteBuffer;)V
    .locals 0

    .line 109
    check-cast p1, Lcom/android/camera2/AFFrameControl;

    invoke-virtual {p0, p1, p2}, Lcom/android/camera2/AFFrameControl$MarshalQueryableAFFrameControl$MarshalAFFrameControl;->marshal(Lcom/android/camera2/AFFrameControl;Ljava/nio/ByteBuffer;)V

    return-void
.end method

.method public unmarshal(Ljava/nio/ByteBuffer;)Lcom/android/camera2/AFFrameControl;
    .locals 8

    .line 140
    new-instance v0, Lcom/android/camera2/AFFrameControl$AFGyroData;

    invoke-direct {v0}, Lcom/android/camera2/AFFrameControl$AFGyroData;-><init>()V

    .line 142
    const/4 v1, 0x0

    move v2, v1

    :goto_0
    const/4 v3, 0x4

    if-ge v2, v3, :cond_0

    .line 143
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    .line 142
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 147
    :cond_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v2

    .line 148
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v3

    .line 149
    move v4, v1

    :goto_1
    const/16 v5, 0x2f

    if-ge v4, v5, :cond_1

    .line 150
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    .line 149
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 152
    :cond_1
    move v4, v1

    :goto_2
    const/16 v5, 0x18

    if-ge v4, v5, :cond_2

    .line 153
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    .line 152
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 156
    :cond_2
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    .line 161
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getFloat()F

    .line 162
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v4

    .line 163
    iput v4, v0, Lcom/android/camera2/AFFrameControl$AFGyroData;->sampleCount:I

    .line 164
    move v4, v1

    :goto_3
    const/16 v5, 0x20

    if-ge v4, v5, :cond_3

    .line 165
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getFloat()F

    move-result v5

    .line 166
    iget-object v6, v0, Lcom/android/camera2/AFFrameControl$AFGyroData;->pAngularVelocityX:[F

    aput v5, v6, v4

    .line 164
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 168
    :cond_3
    move v4, v1

    :goto_4
    if-ge v4, v5, :cond_4

    .line 169
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getFloat()F

    move-result v6

    .line 170
    iget-object v7, v0, Lcom/android/camera2/AFFrameControl$AFGyroData;->pAngularVelocityY:[F

    aput v6, v7, v4

    .line 168
    add-int/lit8 v4, v4, 0x1

    goto :goto_4

    .line 172
    :cond_4
    move v4, v1

    :goto_5
    if-ge v4, v5, :cond_5

    .line 173
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getFloat()F

    move-result v6

    .line 174
    iget-object v7, v0, Lcom/android/camera2/AFFrameControl$AFGyroData;->pAngularVelocityZ:[F

    aput v6, v7, v4

    .line 172
    add-int/lit8 v4, v4, 0x1

    goto :goto_5

    .line 176
    :cond_5
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getLong()J

    .line 177
    :goto_6
    if-ge v1, v5, :cond_6

    .line 178
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v6

    .line 179
    iget-object v4, v0, Lcom/android/camera2/AFFrameControl$AFGyroData;->timeStamp:[J

    aput-wide v6, v4, v1

    .line 177
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 183
    :cond_6
    new-instance p1, Lcom/android/camera2/AFFrameControl;

    invoke-direct {p1, v2, v3, v0}, Lcom/android/camera2/AFFrameControl;-><init>(IILcom/android/camera2/AFFrameControl$AFGyroData;)V

    return-object p1
.end method

.method public bridge synthetic unmarshal(Ljava/nio/ByteBuffer;)Ljava/lang/Object;
    .locals 0

    .line 109
    invoke-virtual {p0, p1}, Lcom/android/camera2/AFFrameControl$MarshalQueryableAFFrameControl$MarshalAFFrameControl;->unmarshal(Ljava/nio/ByteBuffer;)Lcom/android/camera2/AFFrameControl;

    move-result-object p1

    return-object p1
.end method
