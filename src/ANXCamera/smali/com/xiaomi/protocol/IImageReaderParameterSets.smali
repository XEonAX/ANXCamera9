.class public Lcom/xiaomi/protocol/IImageReaderParameterSets;
.super Ljava/lang/Object;
.source "IImageReaderParameterSets.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/xiaomi/protocol/IImageReaderParameterSets;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public format:I

.field public height:I

.field public maxImages:I

.field private shouldHoldImages:Z

.field public targetCamera:I

.field public width:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 93
    new-instance v0, Lcom/xiaomi/protocol/IImageReaderParameterSets$1;

    invoke-direct {v0}, Lcom/xiaomi/protocol/IImageReaderParameterSets$1;-><init>()V

    sput-object v0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(IIIII)V
    .locals 1

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->shouldHoldImages:Z

    .line 18
    iput p1, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->width:I

    .line 19
    iput p2, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->height:I

    .line 20
    iput p3, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->format:I

    .line 21
    iput p4, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->maxImages:I

    .line 22
    iput p5, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->targetCamera:I

    .line 23
    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 2

    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->shouldHoldImages:Z

    .line 85
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->width:I

    .line 86
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->height:I

    .line 87
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->format:I

    .line 88
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->maxImages:I

    .line 89
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->targetCamera:I

    .line 90
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->shouldHoldImages:Z

    .line 91
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .line 71
    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2

    .line 56
    instance-of v0, p1, Lcom/xiaomi/protocol/IImageReaderParameterSets;

    if-eqz v0, :cond_1

    .line 57
    check-cast p1, Lcom/xiaomi/protocol/IImageReaderParameterSets;

    .line 58
    iget v0, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->targetCamera:I

    iget v1, p1, Lcom/xiaomi/protocol/IImageReaderParameterSets;->targetCamera:I

    if-ne v0, v1, :cond_0

    iget v0, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->width:I

    iget v1, p1, Lcom/xiaomi/protocol/IImageReaderParameterSets;->width:I

    if-ne v0, v1, :cond_0

    iget v0, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->height:I

    iget v1, p1, Lcom/xiaomi/protocol/IImageReaderParameterSets;->height:I

    if-ne v0, v1, :cond_0

    iget v0, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->format:I

    iget v1, p1, Lcom/xiaomi/protocol/IImageReaderParameterSets;->format:I

    if-ne v0, v1, :cond_0

    iget v0, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->maxImages:I

    iget v1, p1, Lcom/xiaomi/protocol/IImageReaderParameterSets;->maxImages:I

    if-ne v0, v1, :cond_0

    iget-boolean v0, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->shouldHoldImages:Z

    iget-boolean p1, p1, Lcom/xiaomi/protocol/IImageReaderParameterSets;->shouldHoldImages:Z

    if-ne v0, p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1

    .line 66
    :cond_1
    invoke-super {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public isShouldHoldImages()Z
    .locals 1

    .line 32
    iget-boolean v0, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->shouldHoldImages:Z

    return v0
.end method

.method public setShouldHoldImages(Z)V
    .locals 0

    .line 39
    iput-boolean p1, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->shouldHoldImages:Z

    .line 40
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 44
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v1, "IImageReaderParameterSets[ %d, %d, %d, %d, %s, %s]"

    const/4 v2, 0x6

    new-array v2, v2, [Ljava/lang/Object;

    iget v3, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->width:I

    .line 45
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    iget v3, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->height:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v2, v4

    iget v3, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->format:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x2

    aput-object v3, v2, v4

    iget v3, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->maxImages:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x3

    aput-object v3, v2, v4

    iget v3, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->targetCamera:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x4

    aput-object v3, v2, v4

    iget-boolean v3, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->shouldHoldImages:Z

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    const/4 v4, 0x5

    aput-object v3, v2, v4

    .line 44
    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 76
    iget p2, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->width:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 77
    iget p2, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->height:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 78
    iget p2, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->format:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 79
    iget p2, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->maxImages:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 80
    iget p2, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->targetCamera:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 81
    iget-boolean p2, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->shouldHoldImages:Z

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    .line 82
    return-void
.end method
