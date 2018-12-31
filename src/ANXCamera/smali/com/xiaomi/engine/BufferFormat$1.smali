.class final Lcom/xiaomi/engine/BufferFormat$1;
.super Ljava/lang/Object;
.source "BufferFormat.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/engine/BufferFormat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lcom/xiaomi/engine/BufferFormat;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 116
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/xiaomi/engine/BufferFormat;
    .locals 1

    .line 119
    new-instance v0, Lcom/xiaomi/engine/BufferFormat;

    invoke-direct {v0, p1}, Lcom/xiaomi/engine/BufferFormat;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 0

    .line 116
    invoke-virtual {p0, p1}, Lcom/xiaomi/engine/BufferFormat$1;->createFromParcel(Landroid/os/Parcel;)Lcom/xiaomi/engine/BufferFormat;

    move-result-object p1

    return-object p1
.end method

.method public newArray(I)[Lcom/xiaomi/engine/BufferFormat;
    .locals 0

    .line 124
    new-array p1, p1, [Lcom/xiaomi/engine/BufferFormat;

    return-object p1
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 0

    .line 116
    invoke-virtual {p0, p1}, Lcom/xiaomi/engine/BufferFormat$1;->newArray(I)[Lcom/xiaomi/engine/BufferFormat;

    move-result-object p1

    return-object p1
.end method
