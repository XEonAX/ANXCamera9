.class Lcom/android/camera/module/loader/camera2/FocusTask$1;
.super Ljava/lang/Object;
.source "FocusTask.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/loader/camera2/FocusTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lcom/android/camera/module/loader/camera2/FocusTask;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/android/camera/module/loader/camera2/FocusTask;
    .locals 1

    .line 89
    new-instance v0, Lcom/android/camera/module/loader/camera2/FocusTask;

    invoke-direct {v0, p1}, Lcom/android/camera/module/loader/camera2/FocusTask;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 0

    .line 86
    invoke-virtual {p0, p1}, Lcom/android/camera/module/loader/camera2/FocusTask$1;->createFromParcel(Landroid/os/Parcel;)Lcom/android/camera/module/loader/camera2/FocusTask;

    move-result-object p1

    return-object p1
.end method

.method public newArray(I)[Lcom/android/camera/module/loader/camera2/FocusTask;
    .locals 0

    .line 94
    new-array p1, p1, [Lcom/android/camera/module/loader/camera2/FocusTask;

    return-object p1
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 0

    .line 86
    invoke-virtual {p0, p1}, Lcom/android/camera/module/loader/camera2/FocusTask$1;->newArray(I)[Lcom/android/camera/module/loader/camera2/FocusTask;

    move-result-object p1

    return-object p1
.end method
