.class public Landroid/support/test/runner/MonitoringInstrumentation$ActivityFinisher;
.super Ljava/lang/Object;
.source "MonitoringInstrumentation.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/test/runner/MonitoringInstrumentation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ActivityFinisher"
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/test/runner/MonitoringInstrumentation;


# direct methods
.method public constructor <init>(Landroid/support/test/runner/MonitoringInstrumentation;)V
    .locals 0

    .line 811
    iput-object p1, p0, Landroid/support/test/runner/MonitoringInstrumentation$ActivityFinisher;->this$0:Landroid/support/test/runner/MonitoringInstrumentation;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 814
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 816
    sget-object v1, Landroid/support/test/runner/lifecycle/Stage;->CREATED:Landroid/support/test/runner/lifecycle/Stage;

    sget-object v2, Landroid/support/test/runner/lifecycle/Stage;->STOPPED:Landroid/support/test/runner/lifecycle/Stage;

    invoke-static {v1, v2}, Ljava/util/EnumSet;->range(Ljava/lang/Enum;Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/EnumSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/test/runner/lifecycle/Stage;

    .line 817
    iget-object v3, p0, Landroid/support/test/runner/MonitoringInstrumentation$ActivityFinisher;->this$0:Landroid/support/test/runner/MonitoringInstrumentation;

    invoke-static {v3}, Landroid/support/test/runner/MonitoringInstrumentation;->access$300(Landroid/support/test/runner/MonitoringInstrumentation;)Landroid/support/test/internal/runner/lifecycle/ActivityLifecycleMonitorImpl;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/support/test/internal/runner/lifecycle/ActivityLifecycleMonitorImpl;->getActivitiesInStage(Landroid/support/test/runner/lifecycle/Stage;)Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 818
    goto :goto_0

    .line 820
    :cond_0
    const-string v1, "MonitoringInstr"

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    const/16 v3, 0x3c

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v3, "Activities that are still in CREATED to STOPPED: "

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 822
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    .line 823
    invoke-virtual {v1}, Landroid/app/Activity;->isFinishing()Z

    move-result v2

    if-nez v2, :cond_1

    .line 825
    :try_start_0
    const-string v2, "MonitoringInstr"

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x14

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v4, v5

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v4, "Finishing activity: "

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 826
    invoke-virtual {v1}, Landroid/app/Activity;->finish()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 829
    goto :goto_2

    .line 827
    :catch_0
    move-exception v1

    .line 828
    const-string v2, "MonitoringInstr"

    const-string v3, "Failed to finish activity."

    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 831
    :cond_1
    :goto_2
    goto :goto_1

    .line 832
    :cond_2
    return-void
.end method
