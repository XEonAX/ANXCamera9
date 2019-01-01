.class Landroid/os/statistics/E2EScenarioPayload$1;
.super Ljava/lang/Object;
.source "E2EScenarioPayload.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/os/statistics/E2EScenarioPayload;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Landroid/os/statistics/E2EScenarioPayload;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 151
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Landroid/os/statistics/E2EScenarioPayload;
    .locals 1
    .param p1, "source"    # Landroid/os/Parcel;

    .line 154
    new-instance v0, Landroid/os/statistics/E2EScenarioPayload;

    invoke-direct {v0, p1}, Landroid/os/statistics/E2EScenarioPayload;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 0

    .line 151
    invoke-virtual {p0, p1}, Landroid/os/statistics/E2EScenarioPayload$1;->createFromParcel(Landroid/os/Parcel;)Landroid/os/statistics/E2EScenarioPayload;

    move-result-object p1

    return-object p1
.end method

.method public newArray(I)[Landroid/os/statistics/E2EScenarioPayload;
    .locals 1
    .param p1, "size"    # I

    .line 158
    new-array v0, p1, [Landroid/os/statistics/E2EScenarioPayload;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 0

    .line 151
    invoke-virtual {p0, p1}, Landroid/os/statistics/E2EScenarioPayload$1;->newArray(I)[Landroid/os/statistics/E2EScenarioPayload;

    move-result-object p1

    return-object p1
.end method
