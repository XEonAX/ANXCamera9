.class Landroid/provider/MiuiSettings$SettingsCloudData$CloudData$1;
.super Ljava/lang/Object;
.source "MiuiSettings.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/provider/MiuiSettings$SettingsCloudData$CloudData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Landroid/provider/MiuiSettings$SettingsCloudData$CloudData;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 6021
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Landroid/provider/MiuiSettings$SettingsCloudData$CloudData;
    .registers 4
    .param p1, "source"    # Landroid/os/Parcel;

    .line 6024
    new-instance v0, Landroid/provider/MiuiSettings$SettingsCloudData$CloudData;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/provider/MiuiSettings$SettingsCloudData$CloudData;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .registers 2

    .line 6021
    invoke-virtual {p0, p1}, Landroid/provider/MiuiSettings$SettingsCloudData$CloudData$1;->createFromParcel(Landroid/os/Parcel;)Landroid/provider/MiuiSettings$SettingsCloudData$CloudData;

    move-result-object p1

    return-object p1
.end method

.method public newArray(I)[Landroid/provider/MiuiSettings$SettingsCloudData$CloudData;
    .registers 3
    .param p1, "size"    # I

    .line 6028
    new-array v0, p1, [Landroid/provider/MiuiSettings$SettingsCloudData$CloudData;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .registers 2

    .line 6021
    invoke-virtual {p0, p1}, Landroid/provider/MiuiSettings$SettingsCloudData$CloudData$1;->newArray(I)[Landroid/provider/MiuiSettings$SettingsCloudData$CloudData;

    move-result-object p1

    return-object p1
.end method
