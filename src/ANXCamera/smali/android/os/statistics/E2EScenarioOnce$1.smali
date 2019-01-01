.class Landroid/os/statistics/E2EScenarioOnce$1;
.super Ljava/lang/Object;
.source "E2EScenarioOnce.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/os/statistics/E2EScenarioOnce;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Landroid/os/statistics/E2EScenarioOnce;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 128
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Landroid/os/statistics/E2EScenarioOnce;
    .locals 1
    .param p1, "source"    # Landroid/os/Parcel;

    .line 131
    new-instance v0, Landroid/os/statistics/E2EScenarioOnce;

    invoke-direct {v0}, Landroid/os/statistics/E2EScenarioOnce;-><init>()V

    .line 132
    .local v0, "object":Landroid/os/statistics/E2EScenarioOnce;
    invoke-virtual {v0, p1}, Landroid/os/statistics/E2EScenarioOnce;->readFromParcel(Landroid/os/Parcel;)V

    .line 133
    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 0

    .line 128
    invoke-virtual {p0, p1}, Landroid/os/statistics/E2EScenarioOnce$1;->createFromParcel(Landroid/os/Parcel;)Landroid/os/statistics/E2EScenarioOnce;

    move-result-object p1

    return-object p1
.end method

.method public newArray(I)[Landroid/os/statistics/E2EScenarioOnce;
    .locals 1
    .param p1, "size"    # I

    .line 137
    new-array v0, p1, [Landroid/os/statistics/E2EScenarioOnce;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 0

    .line 128
    invoke-virtual {p0, p1}, Landroid/os/statistics/E2EScenarioOnce$1;->newArray(I)[Landroid/os/statistics/E2EScenarioOnce;

    move-result-object p1

    return-object p1
.end method
