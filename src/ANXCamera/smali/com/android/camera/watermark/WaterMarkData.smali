.class public Lcom/android/camera/watermark/WaterMarkData;
.super Ljava/lang/Object;
.source "WaterMarkData.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/watermark/WaterMarkData$WatermarkType;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/android/camera/watermark/WaterMarkData;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private bottomMargin:I

.field private faceRectF:Landroid/graphics/RectF;

.field private faceViewHeight:I

.field private faceViewWidth:I

.field private transient image:Landroid/graphics/Bitmap;

.field private info:Ljava/lang/String;

.field private isFemale:Z

.field private orientation:I

.field private watermarkType:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 40
    new-instance v0, Lcom/android/camera/watermark/WaterMarkData$1;

    invoke-direct {v0}, Lcom/android/camera/watermark/WaterMarkData$1;-><init>()V

    sput-object v0, Lcom/android/camera/watermark/WaterMarkData;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 125
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/watermark/WaterMarkData;->watermarkType:I

    .line 127
    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 2

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/watermark/WaterMarkData;->watermarkType:I

    .line 29
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    nop

    :cond_0
    iput-boolean v0, p0, Lcom/android/camera/watermark/WaterMarkData;->isFemale:Z

    .line 30
    const-class v0, Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    iput-object v0, p0, Lcom/android/camera/watermark/WaterMarkData;->image:Landroid/graphics/Bitmap;

    .line 31
    const-class v0, Landroid/graphics/RectF;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/graphics/RectF;

    iput-object v0, p0, Lcom/android/camera/watermark/WaterMarkData;->faceRectF:Landroid/graphics/RectF;

    .line 32
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/watermark/WaterMarkData;->info:Ljava/lang/String;

    .line 33
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/camera/watermark/WaterMarkData;->bottomMargin:I

    .line 34
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/camera/watermark/WaterMarkData;->faceViewWidth:I

    .line 35
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/camera/watermark/WaterMarkData;->faceViewHeight:I

    .line 36
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/camera/watermark/WaterMarkData;->orientation:I

    .line 37
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lcom/android/camera/watermark/WaterMarkData;->watermarkType:I

    .line 38
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .line 131
    const/4 v0, 0x0

    return v0
.end method

.method public getBottomMargin()I
    .locals 1

    .line 85
    iget v0, p0, Lcom/android/camera/watermark/WaterMarkData;->bottomMargin:I

    return v0
.end method

.method public getFaceRectF()Landroid/graphics/RectF;
    .locals 1

    .line 69
    iget-object v0, p0, Lcom/android/camera/watermark/WaterMarkData;->faceRectF:Landroid/graphics/RectF;

    return-object v0
.end method

.method public getFaceViewHeight()I
    .locals 1

    .line 101
    iget v0, p0, Lcom/android/camera/watermark/WaterMarkData;->faceViewHeight:I

    return v0
.end method

.method public getFaceViewWidth()I
    .locals 1

    .line 93
    iget v0, p0, Lcom/android/camera/watermark/WaterMarkData;->faceViewWidth:I

    return v0
.end method

.method public getImage()Landroid/graphics/Bitmap;
    .locals 1

    .line 61
    iget-object v0, p0, Lcom/android/camera/watermark/WaterMarkData;->image:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public getInfo()Ljava/lang/String;
    .locals 1

    .line 77
    iget-object v0, p0, Lcom/android/camera/watermark/WaterMarkData;->info:Ljava/lang/String;

    return-object v0
.end method

.method public getOrientation()I
    .locals 1

    .line 109
    iget v0, p0, Lcom/android/camera/watermark/WaterMarkData;->orientation:I

    return v0
.end method

.method public getWatermarkType()I
    .locals 1

    .line 118
    iget v0, p0, Lcom/android/camera/watermark/WaterMarkData;->watermarkType:I

    return v0
.end method

.method public isFemale()Z
    .locals 1

    .line 53
    iget-boolean v0, p0, Lcom/android/camera/watermark/WaterMarkData;->isFemale:Z

    return v0
.end method

.method public setBottomMargin(I)V
    .locals 0

    .line 89
    iput p1, p0, Lcom/android/camera/watermark/WaterMarkData;->bottomMargin:I

    .line 90
    return-void
.end method

.method public setFaceRectF(Landroid/graphics/RectF;)V
    .locals 0

    .line 73
    iput-object p1, p0, Lcom/android/camera/watermark/WaterMarkData;->faceRectF:Landroid/graphics/RectF;

    .line 74
    return-void
.end method

.method public setFaceViewHeight(I)V
    .locals 0

    .line 105
    iput p1, p0, Lcom/android/camera/watermark/WaterMarkData;->faceViewHeight:I

    .line 106
    return-void
.end method

.method public setFaceViewWidth(I)V
    .locals 0

    .line 97
    iput p1, p0, Lcom/android/camera/watermark/WaterMarkData;->faceViewWidth:I

    .line 98
    return-void
.end method

.method public setFemale(Z)V
    .locals 0

    .line 57
    iput-boolean p1, p0, Lcom/android/camera/watermark/WaterMarkData;->isFemale:Z

    .line 58
    return-void
.end method

.method public setImage(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 65
    iput-object p1, p0, Lcom/android/camera/watermark/WaterMarkData;->image:Landroid/graphics/Bitmap;

    .line 66
    return-void
.end method

.method public setInfo(Ljava/lang/String;)V
    .locals 0

    .line 81
    iput-object p1, p0, Lcom/android/camera/watermark/WaterMarkData;->info:Ljava/lang/String;

    .line 82
    return-void
.end method

.method public setOrientation(I)V
    .locals 0

    .line 113
    iput p1, p0, Lcom/android/camera/watermark/WaterMarkData;->orientation:I

    .line 114
    return-void
.end method

.method public setWatermarkType(I)V
    .locals 0

    .line 122
    iput p1, p0, Lcom/android/camera/watermark/WaterMarkData;->watermarkType:I

    .line 123
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    .line 136
    iget-boolean v0, p0, Lcom/android/camera/watermark/WaterMarkData;->isFemale:Z

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 137
    iget-object v0, p0, Lcom/android/camera/watermark/WaterMarkData;->image:Landroid/graphics/Bitmap;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 138
    iget-object v0, p0, Lcom/android/camera/watermark/WaterMarkData;->faceRectF:Landroid/graphics/RectF;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 139
    iget-object p2, p0, Lcom/android/camera/watermark/WaterMarkData;->info:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 140
    iget p2, p0, Lcom/android/camera/watermark/WaterMarkData;->bottomMargin:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 141
    iget p2, p0, Lcom/android/camera/watermark/WaterMarkData;->faceViewWidth:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 142
    iget p2, p0, Lcom/android/camera/watermark/WaterMarkData;->faceViewHeight:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 143
    iget p2, p0, Lcom/android/camera/watermark/WaterMarkData;->orientation:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 144
    iget p2, p0, Lcom/android/camera/watermark/WaterMarkData;->watermarkType:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 145
    return-void
.end method
