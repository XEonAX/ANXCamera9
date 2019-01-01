.class public Landroid/os/statistics/E2EScenarioOnce;
.super Landroid/os/statistics/MacroscopicEvent;
.source "E2EScenarioOnce.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/statistics/MacroscopicEvent<",
        "Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;",
        ">;"
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Landroid/os/statistics/E2EScenarioOnce;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public beginPid:I

.field public beginTid:I

.field public beginUptimeMillis:J

.field public endPid:I

.field public endTid:I

.field public endUptimeMillis:J

.field public scenarioOnceId:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 127
    new-instance v0, Landroid/os/statistics/E2EScenarioOnce$1;

    invoke-direct {v0}, Landroid/os/statistics/E2EScenarioOnce$1;-><init>()V

    sput-object v0, Landroid/os/statistics/E2EScenarioOnce;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 24
    new-instance v0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;

    invoke-direct {v0}, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;-><init>()V

    const v1, 0x10005

    invoke-direct {p0, v1, v0}, Landroid/os/statistics/MacroscopicEvent;-><init>(ILandroid/os/statistics/PerfEvent$DetailFields;)V

    .line 25
    return-void
.end method


# virtual methods
.method fillIn(Landroid/os/statistics/JniParcel;Ljava/lang/Object;Landroid/os/statistics/NativeBackTrace;)V
    .locals 0
    .param p1, "dataParcel"    # Landroid/os/statistics/JniParcel;
    .param p2, "javaBackTrace"    # Ljava/lang/Object;
    .param p3, "nativeBackTrace"    # Landroid/os/statistics/NativeBackTrace;

    .line 121
    return-void
.end method

.method public isUserPerceptible()Z
    .locals 1

    .line 124
    const/4 v0, 0x1

    return v0
.end method

.method occursInCurrentProcess()Z
    .locals 1

    .line 116
    const/4 v0, 0x0

    return v0
.end method

.method public readFromParcel(Landroid/os/Parcel;)V
    .locals 3
    .param p1, "source"    # Landroid/os/Parcel;

    .line 57
    invoke-super {p0, p1}, Landroid/os/statistics/MacroscopicEvent;->readFromParcel(Landroid/os/Parcel;)V

    .line 59
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Landroid/os/statistics/E2EScenarioOnce;->scenarioOnceId:J

    .line 61
    invoke-virtual {p0}, Landroid/os/statistics/E2EScenarioOnce;->getDetailsFields()Landroid/os/statistics/PerfEvent$DetailFields;

    move-result-object v0

    check-cast v0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;

    .line 63
    .local v0, "details":Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;
    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Landroid/os/statistics/E2EScenario;

    iput-object v2, v0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->scenario:Landroid/os/statistics/E2EScenario;

    .line 64
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Landroid/os/statistics/E2EScenarioSettings;

    iput-object v2, v0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->settings:Landroid/os/statistics/E2EScenarioSettings;

    .line 65
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->tag:Ljava/lang/String;

    .line 66
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/os/statistics/E2EScenarioPayload;

    iput-object v1, v0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->payload:Landroid/os/statistics/E2EScenarioPayload;

    .line 68
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v1

    iput-wide v1, p0, Landroid/os/statistics/E2EScenarioOnce;->beginUptimeMillis:J

    .line 69
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v1

    iput-wide v1, v0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->beginWalltimeMillis:J

    .line 70
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Landroid/os/statistics/E2EScenarioOnce;->beginPid:I

    .line 71
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Landroid/os/statistics/E2EScenarioOnce;->beginTid:I

    .line 72
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->beginProcessName:Ljava/lang/String;

    .line 73
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->beginPackageName:Ljava/lang/String;

    .line 75
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v1

    iput-wide v1, p0, Landroid/os/statistics/E2EScenarioOnce;->endUptimeMillis:J

    .line 76
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v1

    iput-wide v1, v0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->endWalltimeMillis:J

    .line 77
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Landroid/os/statistics/E2EScenarioOnce;->endPid:I

    .line 78
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Landroid/os/statistics/E2EScenarioOnce;->endTid:I

    .line 79
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->endProcessName:Ljava/lang/String;

    .line 80
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->endPackageName:Ljava/lang/String;

    .line 81
    return-void
.end method

.method public writeToJson(Lorg/json/JSONObject;)V
    .locals 4
    .param p1, "json"    # Lorg/json/JSONObject;

    .line 85
    invoke-super {p0, p1}, Landroid/os/statistics/MacroscopicEvent;->writeToJson(Lorg/json/JSONObject;)V

    .line 87
    :try_start_0
    const-string/jumbo v0, "scenarioOnceId"

    iget-wide v1, p0, Landroid/os/statistics/E2EScenarioOnce;->scenarioOnceId:J

    invoke-virtual {p1, v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 89
    invoke-virtual {p0}, Landroid/os/statistics/E2EScenarioOnce;->getDetailsFields()Landroid/os/statistics/PerfEvent$DetailFields;

    move-result-object v0

    check-cast v0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;

    .line 91
    .local v0, "details":Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;
    const-string/jumbo v1, "scenario"

    iget-object v2, v0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->scenario:Landroid/os/statistics/E2EScenario;

    invoke-virtual {v2}, Landroid/os/statistics/E2EScenario;->toJson()Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 92
    iget-object v1, v0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->payload:Landroid/os/statistics/E2EScenarioPayload;

    if-eqz v1, :cond_0

    iget-object v1, v0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->payload:Landroid/os/statistics/E2EScenarioPayload;

    invoke-virtual {v1}, Landroid/os/statistics/E2EScenarioPayload;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 93
    const-string/jumbo v1, "payload"

    iget-object v2, v0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->payload:Landroid/os/statistics/E2EScenarioPayload;

    invoke-virtual {v2}, Landroid/os/statistics/E2EScenarioPayload;->toJson()Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 96
    :cond_0
    const-string v1, "beginUptime"

    iget-wide v2, p0, Landroid/os/statistics/E2EScenarioOnce;->beginUptimeMillis:J

    invoke-virtual {p1, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 97
    const-string v1, "beginWalltime"

    iget-wide v2, v0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->beginWalltimeMillis:J

    invoke-virtual {p1, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 98
    const-string v1, "beginPid"

    iget v2, p0, Landroid/os/statistics/E2EScenarioOnce;->beginPid:I

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 99
    const-string v1, "beginTid"

    iget v2, p0, Landroid/os/statistics/E2EScenarioOnce;->beginTid:I

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 100
    const-string v1, "beginProcessName"

    iget-object v2, v0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->beginProcessName:Ljava/lang/String;

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 101
    const-string v1, "beginPackageName"

    iget-object v2, v0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->beginPackageName:Ljava/lang/String;

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 103
    const-string v1, "endUptime"

    iget-wide v2, p0, Landroid/os/statistics/E2EScenarioOnce;->endUptimeMillis:J

    invoke-virtual {p1, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 104
    const-string v1, "endWalltime"

    iget-wide v2, v0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->endWalltimeMillis:J

    invoke-virtual {p1, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 105
    const-string v1, "endPid"

    iget v2, p0, Landroid/os/statistics/E2EScenarioOnce;->endPid:I

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 106
    const-string v1, "endTid"

    iget v2, p0, Landroid/os/statistics/E2EScenarioOnce;->endTid:I

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 107
    const-string v1, "endProcessName"

    iget-object v2, v0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->endProcessName:Ljava/lang/String;

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 108
    const-string v1, "endPackageName"

    iget-object v2, v0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->endPackageName:Ljava/lang/String;

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 111
    .end local v0    # "details":Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;
    goto :goto_0

    .line 109
    :catch_0
    move-exception v0

    .line 110
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 112
    .end local v0    # "e":Lorg/json/JSONException;
    :goto_0
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 3
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .line 29
    invoke-super {p0, p1, p2}, Landroid/os/statistics/MacroscopicEvent;->writeToParcel(Landroid/os/Parcel;I)V

    .line 31
    iget-wide v0, p0, Landroid/os/statistics/E2EScenarioOnce;->scenarioOnceId:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 33
    invoke-virtual {p0}, Landroid/os/statistics/E2EScenarioOnce;->getDetailsFields()Landroid/os/statistics/PerfEvent$DetailFields;

    move-result-object v0

    check-cast v0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;

    .line 35
    .local v0, "details":Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;
    iget-object v1, v0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->scenario:Landroid/os/statistics/E2EScenario;

    invoke-virtual {p1, v1, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 36
    iget-object v1, v0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->settings:Landroid/os/statistics/E2EScenarioSettings;

    invoke-virtual {p1, v1, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 37
    iget-object v1, v0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->tag:Ljava/lang/String;

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 38
    iget-object v1, v0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->payload:Landroid/os/statistics/E2EScenarioPayload;

    invoke-virtual {p1, v1, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 40
    iget-wide v1, p0, Landroid/os/statistics/E2EScenarioOnce;->beginUptimeMillis:J

    invoke-virtual {p1, v1, v2}, Landroid/os/Parcel;->writeLong(J)V

    .line 41
    iget-wide v1, v0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->beginWalltimeMillis:J

    invoke-virtual {p1, v1, v2}, Landroid/os/Parcel;->writeLong(J)V

    .line 42
    iget v1, p0, Landroid/os/statistics/E2EScenarioOnce;->beginPid:I

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 43
    iget v1, p0, Landroid/os/statistics/E2EScenarioOnce;->beginTid:I

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 44
    iget-object v1, v0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->beginProcessName:Ljava/lang/String;

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 45
    iget-object v1, v0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->beginPackageName:Ljava/lang/String;

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 47
    iget-wide v1, p0, Landroid/os/statistics/E2EScenarioOnce;->endUptimeMillis:J

    invoke-virtual {p1, v1, v2}, Landroid/os/Parcel;->writeLong(J)V

    .line 48
    iget-wide v1, v0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->endWalltimeMillis:J

    invoke-virtual {p1, v1, v2}, Landroid/os/Parcel;->writeLong(J)V

    .line 49
    iget v1, p0, Landroid/os/statistics/E2EScenarioOnce;->endPid:I

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 50
    iget v1, p0, Landroid/os/statistics/E2EScenarioOnce;->endTid:I

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 51
    iget-object v1, v0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->endProcessName:Ljava/lang/String;

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 52
    iget-object v1, v0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->endPackageName:Ljava/lang/String;

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 53
    return-void
.end method
