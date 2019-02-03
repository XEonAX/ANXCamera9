.class public Lcom/android/camera/fragment/fullscreen/ShareInfo;
.super Ljava/lang/Object;
.source "ShareInfo.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/android/camera/fragment/fullscreen/ShareInfo;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public className:Ljava/lang/String;

.field public drawableRes:I

.field public index:I

.field public packageName:Ljava/lang/String;

.field public textRes:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 48
    new-instance v0, Lcom/android/camera/fragment/fullscreen/ShareInfo$1;

    invoke-direct {v0}, Lcom/android/camera/fragment/fullscreen/ShareInfo$1;-><init>()V

    sput-object v0, Lcom/android/camera/fragment/fullscreen/ShareInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;II)V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput p1, p0, Lcom/android/camera/fragment/fullscreen/ShareInfo;->index:I

    .line 19
    iput-object p2, p0, Lcom/android/camera/fragment/fullscreen/ShareInfo;->packageName:Ljava/lang/String;

    .line 20
    iput-object p3, p0, Lcom/android/camera/fragment/fullscreen/ShareInfo;->className:Ljava/lang/String;

    .line 22
    iput p4, p0, Lcom/android/camera/fragment/fullscreen/ShareInfo;->drawableRes:I

    .line 23
    iput p5, p0, Lcom/android/camera/fragment/fullscreen/ShareInfo;->textRes:I

    .line 24
    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/fullscreen/ShareInfo;->index:I

    .line 42
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/fullscreen/ShareInfo;->packageName:Ljava/lang/String;

    .line 43
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/fullscreen/ShareInfo;->className:Ljava/lang/String;

    .line 44
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/fullscreen/ShareInfo;->drawableRes:I

    .line 45
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/fullscreen/ShareInfo;->textRes:I

    .line 46
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .line 28
    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 33
    iget p2, p0, Lcom/android/camera/fragment/fullscreen/ShareInfo;->index:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 34
    iget-object p2, p0, Lcom/android/camera/fragment/fullscreen/ShareInfo;->packageName:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 35
    iget-object p2, p0, Lcom/android/camera/fragment/fullscreen/ShareInfo;->className:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 36
    iget p2, p0, Lcom/android/camera/fragment/fullscreen/ShareInfo;->drawableRes:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 37
    iget p2, p0, Lcom/android/camera/fragment/fullscreen/ShareInfo;->textRes:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 38
    return-void
.end method
