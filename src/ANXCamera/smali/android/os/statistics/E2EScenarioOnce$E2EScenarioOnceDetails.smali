.class public Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;
.super Landroid/os/statistics/PerfEvent$DetailFields;
.source "E2EScenarioOnce.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/os/statistics/E2EScenarioOnce;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "E2EScenarioOnceDetails"
.end annotation


# instance fields
.field public beginPackageName:Ljava/lang/String;

.field public beginProcessName:Ljava/lang/String;

.field public beginWalltimeMillis:J

.field public endPackageName:Ljava/lang/String;

.field public endProcessName:Ljava/lang/String;

.field public endWalltimeMillis:J

.field public payload:Landroid/os/statistics/E2EScenarioPayload;

.field public scenario:Landroid/os/statistics/E2EScenario;

.field public settings:Landroid/os/statistics/E2EScenarioSettings;

.field public tag:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 141
    invoke-direct {p0}, Landroid/os/statistics/PerfEvent$DetailFields;-><init>()V

    return-void
.end method
