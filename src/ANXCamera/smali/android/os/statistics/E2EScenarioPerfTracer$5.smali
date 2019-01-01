.class Landroid/os/statistics/E2EScenarioPerfTracer$5;
.super Ljava/lang/Object;
.source "E2EScenarioPerfTracer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/os/statistics/E2EScenarioPerfTracer;->finishScenario(Landroid/os/Bundle;Landroid/os/statistics/E2EScenarioPayload;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$payload:Landroid/os/statistics/E2EScenarioPayload;

.field final synthetic val$perfShielder:Lcom/android/internal/app/IPerfShielder;

.field final synthetic val$scenarioBundle:Landroid/os/Bundle;

.field final synthetic val$tid:I

.field final synthetic val$uptimeMs:J


# direct methods
.method constructor <init>(Lcom/android/internal/app/IPerfShielder;Landroid/os/Bundle;Landroid/os/statistics/E2EScenarioPayload;IJ)V
    .locals 0

    .line 190
    iput-object p1, p0, Landroid/os/statistics/E2EScenarioPerfTracer$5;->val$perfShielder:Lcom/android/internal/app/IPerfShielder;

    iput-object p2, p0, Landroid/os/statistics/E2EScenarioPerfTracer$5;->val$scenarioBundle:Landroid/os/Bundle;

    iput-object p3, p0, Landroid/os/statistics/E2EScenarioPerfTracer$5;->val$payload:Landroid/os/statistics/E2EScenarioPayload;

    iput p4, p0, Landroid/os/statistics/E2EScenarioPerfTracer$5;->val$tid:I

    iput-wide p5, p0, Landroid/os/statistics/E2EScenarioPerfTracer$5;->val$uptimeMs:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 194
    :try_start_0
    iget-object v0, p0, Landroid/os/statistics/E2EScenarioPerfTracer$5;->val$perfShielder:Lcom/android/internal/app/IPerfShielder;

    iget-object v1, p0, Landroid/os/statistics/E2EScenarioPerfTracer$5;->val$scenarioBundle:Landroid/os/Bundle;

    iget-object v2, p0, Landroid/os/statistics/E2EScenarioPerfTracer$5;->val$payload:Landroid/os/statistics/E2EScenarioPayload;

    iget v3, p0, Landroid/os/statistics/E2EScenarioPerfTracer$5;->val$tid:I

    iget-wide v4, p0, Landroid/os/statistics/E2EScenarioPerfTracer$5;->val$uptimeMs:J

    invoke-interface/range {v0 .. v5}, Lcom/android/internal/app/IPerfShielder;->finishSpecificScenario(Landroid/os/Bundle;Landroid/os/statistics/E2EScenarioPayload;IJ)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 196
    goto :goto_0

    .line 195
    :catch_0
    move-exception v0

    .line 197
    :goto_0
    return-void
.end method
