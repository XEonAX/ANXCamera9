.class Lmiui/hardware/display/DisplayFeatureManager$1;
.super Ljava/lang/Object;
.source "DisplayFeatureManager.java"

# interfaces
.implements Landroid/os/IHwBinder$DeathRecipient;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lmiui/hardware/display/DisplayFeatureManager;->initServiceDeathRecipient()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lmiui/hardware/display/DisplayFeatureManager;


# direct methods
.method constructor <init>(Lmiui/hardware/display/DisplayFeatureManager;)V
    .locals 0
    .param p1, "this$0"    # Lmiui/hardware/display/DisplayFeatureManager;

    .line 119
    iput-object p1, p0, Lmiui/hardware/display/DisplayFeatureManager$1;->this$0:Lmiui/hardware/display/DisplayFeatureManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public serviceDied(J)V
    .locals 3
    .param p1, "cookie"    # J

    .line 122
    iget-object v0, p0, Lmiui/hardware/display/DisplayFeatureManager$1;->this$0:Lmiui/hardware/display/DisplayFeatureManager;

    invoke-static {v0}, Lmiui/hardware/display/DisplayFeatureManager;->access$000(Lmiui/hardware/display/DisplayFeatureManager;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    .line 123
    :try_start_0
    invoke-static {}, Lmiui/hardware/display/DisplayFeatureManager;->access$100()Ljava/lang/String;

    move-result-object v1

    const-string v2, "hwbinder service binderDied!"

    invoke-static {v1, v2}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 124
    iget-object v1, p0, Lmiui/hardware/display/DisplayFeatureManager$1;->this$0:Lmiui/hardware/display/DisplayFeatureManager;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lmiui/hardware/display/DisplayFeatureManager;->access$202(Lmiui/hardware/display/DisplayFeatureManager;Lmiui/hardware/display/DisplayFeatureServiceProxy;)Lmiui/hardware/display/DisplayFeatureServiceProxy;

    .line 125
    monitor-exit v0

    .line 126
    return-void

    .line 125
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
