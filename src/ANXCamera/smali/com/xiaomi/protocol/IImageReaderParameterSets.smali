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

.field public static final TELE_IMAGE_FLAG:I = 0x0

.field public static final WIDE_IMAGE_FLAG:I = 0x1


# instance fields
.field public format:I

.field public height:I

.field public maxImages:I

.field public targetCamera:I

.field public width:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 37
    new-instance v0, Lcom/xiaomi/protocol/IImageReaderParameterSets$1;

    invoke-direct {v0}, Lcom/xiaomi/protocol/IImageReaderParameterSets$1;-><init>()V

    sput-object v0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(IIIII)V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput p1, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->width:I

    .line 27
    iput p2, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->height:I

    .line 28
    iput p3, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->format:I

    .line 29
    iput p4, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->maxImages:I

    .line 30
    iput p5, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->targetCamera:I

    .line 31
    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    invoke-virtual {p0, p1}, Lcom/xiaomi/protocol/IImageReaderParameterSets;->readFromParcel(Landroid/os/Parcel;)V

    .line 35
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .line 51
    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2

    .line 85
    if-eqz p1, :cond_1

    instance-of v0, p1, Lcom/xiaomi/protocol/IImageReaderParameterSets;

    if-eqz v0, :cond_1

    .line 86
    check-cast p1, Lcom/xiaomi/protocol/IImageReaderParameterSets;

    .line 87
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

    iget p1, p1, Lcom/xiaomi/protocol/IImageReaderParameterSets;->maxImages:I

    if-ne v0, p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1

    .line 93
    :cond_1
    invoke-super {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 95
    invoke-super {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public readFromParcel(Landroid/os/Parcel;)V
    .locals 1

    .line 64
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->width:I

    .line 65
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->height:I

    .line 66
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->format:I

    .line 67
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->maxImages:I

    .line 68
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->targetCamera:I

    .line 69
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 73
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v1, "IImageReaderParameterSets[ %d, %d, %d, %d %s]"

    const/4 v2, 0x5

    new-array v2, v2, [Ljava/lang/Object;

    iget v3, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->width:I

    .line 74
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

    .line 73
    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 56
    iget p2, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->width:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 57
    iget p2, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->height:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 58
    iget p2, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->format:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 59
    iget p2, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->maxImages:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 60
    iget p2, p0, Lcom/xiaomi/protocol/IImageReaderParameterSets;->targetCamera:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 61
    return-void
.end method
