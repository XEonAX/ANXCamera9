.class public Lcom/ss/android/vesdk/VESize;
.super Ljava/lang/Object;
.source "VESize.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/ss/android/vesdk/VESize;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public height:I

.field public width:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 35
    new-instance v0, Lcom/ss/android/vesdk/VESize$1;

    invoke-direct {v0}, Lcom/ss/android/vesdk/VESize$1;-><init>()V

    sput-object v0, Lcom/ss/android/vesdk/VESize;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(II)V
    .locals 1

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    const/16 v0, 0x2d0

    iput v0, p0, Lcom/ss/android/vesdk/VESize;->width:I

    .line 12
    const/16 v0, 0x500

    iput v0, p0, Lcom/ss/android/vesdk/VESize;->height:I

    .line 15
    iput p1, p0, Lcom/ss/android/vesdk/VESize;->width:I

    .line 16
    iput p2, p0, Lcom/ss/android/vesdk/VESize;->height:I

    .line 17
    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    const/16 v0, 0x2d0

    iput v0, p0, Lcom/ss/android/vesdk/VESize;->width:I

    .line 12
    const/16 v0, 0x500

    iput v0, p0, Lcom/ss/android/vesdk/VESize;->height:I

    .line 20
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/ss/android/vesdk/VESize;->width:I

    .line 21
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lcom/ss/android/vesdk/VESize;->height:I

    .line 22
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .line 32
    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 26
    iget p2, p0, Lcom/ss/android/vesdk/VESize;->width:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 27
    iget p2, p0, Lcom/ss/android/vesdk/VESize;->height:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 28
    return-void
.end method
