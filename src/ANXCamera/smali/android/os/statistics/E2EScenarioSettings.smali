.class public final Landroid/os/statistics/E2EScenarioSettings;
.super Ljava/lang/Object;
.source "E2EScenarioSettings.java"

# interfaces
.implements Landroid/os/Parcelable;
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Landroid/os/statistics/E2EScenarioSettings;",
            ">;"
        }
    .end annotation
.end field

.field public static final STATISTICS_MODE_ALL:I = 0x7

.field public static final STATISTICS_MODE_AVERAGE:I = 0x1

.field public static final STATISTICS_MODE_DISTRIBUTION:I = 0x4

.field public static final STATISTICS_MODE_HISTORY:I = 0x2

.field public static final STATISTICS_MODE_NONE:I = 0x0

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field public historyLimitPerDay:I

.field public isAutoAnalysisEnabled:Z

.field public slownessFloorThresholdMillis:I

.field public statisticsMode:I

.field public timeoutMillisOfAutoAnalysis:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 106
    new-instance v0, Landroid/os/statistics/E2EScenarioSettings$1;

    invoke-direct {v0}, Landroid/os/statistics/E2EScenarioSettings$1;-><init>()V

    sput-object v0, Landroid/os/statistics/E2EScenarioSettings;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .registers 3
    .param p1, "source"    # Landroid/os/Parcel;

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Landroid/os/statistics/E2EScenarioSettings;->statisticsMode:I

    .line 47
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Landroid/os/statistics/E2EScenarioSettings;->historyLimitPerDay:I

    .line 49
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-eqz v0, :cond_17

    const/4 v0, 0x1

    goto :goto_18

    :cond_17
    const/4 v0, 0x0

    :goto_18
    iput-boolean v0, p0, Landroid/os/statistics/E2EScenarioSettings;->isAutoAnalysisEnabled:Z

    .line 50
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Landroid/os/statistics/E2EScenarioSettings;->slownessFloorThresholdMillis:I

    .line 51
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Landroid/os/statistics/E2EScenarioSettings;->timeoutMillisOfAutoAnalysis:I

    .line 52
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .registers 3

    .line 66
    new-instance v0, Landroid/os/statistics/E2EScenarioSettings;

    invoke-direct {v0}, Landroid/os/statistics/E2EScenarioSettings;-><init>()V

    .line 68
    .local v0, "result":Landroid/os/statistics/E2EScenarioSettings;
    iget v1, p0, Landroid/os/statistics/E2EScenarioSettings;->statisticsMode:I

    iput v1, v0, Landroid/os/statistics/E2EScenarioSettings;->statisticsMode:I

    .line 69
    iget v1, p0, Landroid/os/statistics/E2EScenarioSettings;->historyLimitPerDay:I

    iput v1, v0, Landroid/os/statistics/E2EScenarioSettings;->historyLimitPerDay:I

    .line 71
    iget-boolean v1, p0, Landroid/os/statistics/E2EScenarioSettings;->isAutoAnalysisEnabled:Z

    iput-boolean v1, v0, Landroid/os/statistics/E2EScenarioSettings;->isAutoAnalysisEnabled:Z

    .line 72
    iget v1, p0, Landroid/os/statistics/E2EScenarioSettings;->slownessFloorThresholdMillis:I

    iput v1, v0, Landroid/os/statistics/E2EScenarioSettings;->slownessFloorThresholdMillis:I

    .line 73
    iget v1, p0, Landroid/os/statistics/E2EScenarioSettings;->timeoutMillisOfAutoAnalysis:I

    iput v1, v0, Landroid/os/statistics/E2EScenarioSettings;->timeoutMillisOfAutoAnalysis:I

    .line 74
    return-object v0
.end method

.method public describeContents()I
    .registers 2

    .line 93
    const/4 v0, 0x0

    return v0
.end method

.method public enableAutoAnalysis(II)V
    .registers 4
    .param p1, "slownessFloorThresholdMillis"    # I
    .param p2, "timeoutMillisOfAutoAnalysis"    # I

    .line 86
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/os/statistics/E2EScenarioSettings;->isAutoAnalysisEnabled:Z

    .line 87
    iput p1, p0, Landroid/os/statistics/E2EScenarioSettings;->slownessFloorThresholdMillis:I

    .line 88
    iput p2, p0, Landroid/os/statistics/E2EScenarioSettings;->timeoutMillisOfAutoAnalysis:I

    .line 89
    return-void
.end method

.method public isValid()Z
    .registers 2

    .line 58
    iget-boolean v0, p0, Landroid/os/statistics/E2EScenarioSettings;->isAutoAnalysisEnabled:Z

    if-eqz v0, :cond_a

    iget v0, p0, Landroid/os/statistics/E2EScenarioSettings;->slownessFloorThresholdMillis:I

    if-gtz v0, :cond_a

    .line 59
    const/4 v0, 0x0

    return v0

    .line 61
    :cond_a
    const/4 v0, 0x1

    return v0
.end method

.method public setHistoryLimitPerDay(I)V
    .registers 2
    .param p1, "historyLimitPerDay"    # I

    .line 82
    iput p1, p0, Landroid/os/statistics/E2EScenarioSettings;->historyLimitPerDay:I

    .line 83
    return-void
.end method

.method public setStatisticsMode(I)V
    .registers 2
    .param p1, "mode"    # I

    .line 78
    iput p1, p0, Landroid/os/statistics/E2EScenarioSettings;->statisticsMode:I

    .line 79
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .line 98
    iget v0, p0, Landroid/os/statistics/E2EScenarioSettings;->statisticsMode:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 99
    iget v0, p0, Landroid/os/statistics/E2EScenarioSettings;->historyLimitPerDay:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 101
    iget-boolean v0, p0, Landroid/os/statistics/E2EScenarioSettings;->isAutoAnalysisEnabled:Z

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 102
    iget v0, p0, Landroid/os/statistics/E2EScenarioSettings;->slownessFloorThresholdMillis:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 103
    iget v0, p0, Landroid/os/statistics/E2EScenarioSettings;->timeoutMillisOfAutoAnalysis:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 104
    return-void
.end method
