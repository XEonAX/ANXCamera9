.class final Lcom/xiaomi/protocol/IImageReaderParameterSets$1;
.super Ljava/lang/Object;
.source "IImageReaderParameterSets.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/protocol/IImageReaderParameterSets;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lcom/xiaomi/protocol/IImageReaderParameterSets;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/xiaomi/protocol/IImageReaderParameterSets;
    .locals 1

    .line 40
    new-instance v0, Lcom/xiaomi/protocol/IImageReaderParameterSets;

    invoke-direct {v0, p1}, Lcom/xiaomi/protocol/IImageReaderParameterSets;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 0

    .line 37
    invoke-virtual {p0, p1}, Lcom/xiaomi/protocol/IImageReaderParameterSets$1;->createFromParcel(Landroid/os/Parcel;)Lcom/xiaomi/protocol/IImageReaderParameterSets;

    move-result-object p1

    return-object p1
.end method

.method public newArray(I)[Lcom/xiaomi/protocol/IImageReaderParameterSets;
    .locals 0

    .line 45
    new-array p1, p1, [Lcom/xiaomi/protocol/IImageReaderParameterSets;

    return-object p1
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 0

    .line 37
    invoke-virtual {p0, p1}, Lcom/xiaomi/protocol/IImageReaderParameterSets$1;->newArray(I)[Lcom/xiaomi/protocol/IImageReaderParameterSets;

    move-result-object p1

    return-object p1
.end method
