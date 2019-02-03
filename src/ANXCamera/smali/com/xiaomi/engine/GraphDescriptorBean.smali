.class public final Lcom/xiaomi/engine/GraphDescriptorBean;
.super Ljava/lang/Object;
.source "GraphDescriptorBean.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/xiaomi/engine/GraphDescriptorBean;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mCameraCombinationMode:I

.field private mIsSnapshot:Z

.field private mOperationModeID:I

.field private mStreamNumber:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 143
    new-instance v0, Lcom/xiaomi/engine/GraphDescriptorBean$1;

    invoke-direct {v0}, Lcom/xiaomi/engine/GraphDescriptorBean$1;-><init>()V

    sput-object v0, Lcom/xiaomi/engine/GraphDescriptorBean;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    const/4 v0, 0x0

    iput v0, p0, Lcom/xiaomi/engine/GraphDescriptorBean;->mOperationModeID:I

    .line 44
    iput v0, p0, Lcom/xiaomi/engine/GraphDescriptorBean;->mStreamNumber:I

    .line 45
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/xiaomi/engine/GraphDescriptorBean;->mIsSnapshot:Z

    .line 46
    iput v0, p0, Lcom/xiaomi/engine/GraphDescriptorBean;->mCameraCombinationMode:I

    .line 47
    return-void
.end method

.method public constructor <init>(IIZI)V
    .locals 0

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    iput p1, p0, Lcom/xiaomi/engine/GraphDescriptorBean;->mOperationModeID:I

    .line 60
    iput p2, p0, Lcom/xiaomi/engine/GraphDescriptorBean;->mStreamNumber:I

    .line 61
    iput-boolean p3, p0, Lcom/xiaomi/engine/GraphDescriptorBean;->mIsSnapshot:Z

    .line 62
    iput p4, p0, Lcom/xiaomi/engine/GraphDescriptorBean;->mCameraCombinationMode:I

    .line 63
    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    .line 136
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 137
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/xiaomi/engine/GraphDescriptorBean;->mOperationModeID:I

    .line 138
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/xiaomi/engine/GraphDescriptorBean;->mStreamNumber:I

    .line 139
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/xiaomi/engine/GraphDescriptorBean;->mIsSnapshot:Z

    .line 140
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lcom/xiaomi/engine/GraphDescriptorBean;->mCameraCombinationMode:I

    .line 141
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .line 125
    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 157
    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    .line 158
    return v0

    .line 160
    :cond_0
    instance-of v1, p1, Lcom/xiaomi/engine/GraphDescriptorBean;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    .line 161
    return v2

    .line 163
    :cond_1
    check-cast p1, Lcom/xiaomi/engine/GraphDescriptorBean;

    .line 164
    iget v1, p0, Lcom/xiaomi/engine/GraphDescriptorBean;->mOperationModeID:I

    iget v3, p1, Lcom/xiaomi/engine/GraphDescriptorBean;->mOperationModeID:I

    if-ne v1, v3, :cond_2

    iget v1, p0, Lcom/xiaomi/engine/GraphDescriptorBean;->mStreamNumber:I

    iget v3, p1, Lcom/xiaomi/engine/GraphDescriptorBean;->mStreamNumber:I

    if-ne v1, v3, :cond_2

    iget-boolean v1, p0, Lcom/xiaomi/engine/GraphDescriptorBean;->mIsSnapshot:Z

    iget-boolean v3, p1, Lcom/xiaomi/engine/GraphDescriptorBean;->mIsSnapshot:Z

    if-ne v1, v3, :cond_2

    iget v1, p0, Lcom/xiaomi/engine/GraphDescriptorBean;->mCameraCombinationMode:I

    iget p1, p1, Lcom/xiaomi/engine/GraphDescriptorBean;->mCameraCombinationMode:I

    if-ne v1, p1, :cond_2

    goto :goto_0

    :cond_2
    move v0, v2

    :goto_0
    return v0
.end method

.method public getCameraCombinationMode()I
    .locals 1

    .line 104
    iget v0, p0, Lcom/xiaomi/engine/GraphDescriptorBean;->mCameraCombinationMode:I

    return v0
.end method

.method public getOperationModeID()I
    .locals 1

    .line 73
    iget v0, p0, Lcom/xiaomi/engine/GraphDescriptorBean;->mOperationModeID:I

    return v0
.end method

.method public getStreamNumber()I
    .locals 1

    .line 83
    iget v0, p0, Lcom/xiaomi/engine/GraphDescriptorBean;->mStreamNumber:I

    return v0
.end method

.method public hashCode()I
    .locals 3

    .line 172
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/Object;

    iget v1, p0, Lcom/xiaomi/engine/GraphDescriptorBean;->mOperationModeID:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    iget v1, p0, Lcom/xiaomi/engine/GraphDescriptorBean;->mStreamNumber:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    iget-boolean v1, p0, Lcom/xiaomi/engine/GraphDescriptorBean;->mIsSnapshot:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const/4 v2, 0x2

    aput-object v1, v0, v2

    iget v1, p0, Lcom/xiaomi/engine/GraphDescriptorBean;->mCameraCombinationMode:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x3

    aput-object v1, v0, v2

    invoke-static {v0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public isSnapshot()Z
    .locals 1

    .line 93
    iget-boolean v0, p0, Lcom/xiaomi/engine/GraphDescriptorBean;->mIsSnapshot:Z

    return v0
.end method

.method public setCameraCombinationMode(I)V
    .locals 0

    .line 120
    iput p1, p0, Lcom/xiaomi/engine/GraphDescriptorBean;->mCameraCombinationMode:I

    .line 121
    return-void
.end method

.method public setOperationModeID(I)V
    .locals 0

    .line 108
    iput p1, p0, Lcom/xiaomi/engine/GraphDescriptorBean;->mOperationModeID:I

    .line 109
    return-void
.end method

.method public setSnapshot(Z)V
    .locals 0

    .line 116
    iput-boolean p1, p0, Lcom/xiaomi/engine/GraphDescriptorBean;->mIsSnapshot:Z

    .line 117
    return-void
.end method

.method public setStreamNumber(I)V
    .locals 0

    .line 112
    iput p1, p0, Lcom/xiaomi/engine/GraphDescriptorBean;->mStreamNumber:I

    .line 113
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 130
    iget p2, p0, Lcom/xiaomi/engine/GraphDescriptorBean;->mOperationModeID:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 131
    iget p2, p0, Lcom/xiaomi/engine/GraphDescriptorBean;->mStreamNumber:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 132
    iget-boolean p2, p0, Lcom/xiaomi/engine/GraphDescriptorBean;->mIsSnapshot:Z

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    .line 133
    iget p2, p0, Lcom/xiaomi/engine/GraphDescriptorBean;->mCameraCombinationMode:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 134
    return-void
.end method
