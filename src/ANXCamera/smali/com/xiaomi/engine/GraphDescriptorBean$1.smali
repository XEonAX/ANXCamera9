.class final Lcom/xiaomi/engine/GraphDescriptorBean$1;
.super Ljava/lang/Object;
.source "GraphDescriptorBean.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/engine/GraphDescriptorBean;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lcom/xiaomi/engine/GraphDescriptorBean;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 143
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/xiaomi/engine/GraphDescriptorBean;
    .locals 1

    .line 146
    new-instance v0, Lcom/xiaomi/engine/GraphDescriptorBean;

    invoke-direct {v0, p1}, Lcom/xiaomi/engine/GraphDescriptorBean;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 0

    .line 143
    invoke-virtual {p0, p1}, Lcom/xiaomi/engine/GraphDescriptorBean$1;->createFromParcel(Landroid/os/Parcel;)Lcom/xiaomi/engine/GraphDescriptorBean;

    move-result-object p1

    return-object p1
.end method

.method public newArray(I)[Lcom/xiaomi/engine/GraphDescriptorBean;
    .locals 0

    .line 151
    new-array p1, p1, [Lcom/xiaomi/engine/GraphDescriptorBean;

    return-object p1
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 0

    .line 143
    invoke-virtual {p0, p1}, Lcom/xiaomi/engine/GraphDescriptorBean$1;->newArray(I)[Lcom/xiaomi/engine/GraphDescriptorBean;

    move-result-object p1

    return-object p1
.end method
