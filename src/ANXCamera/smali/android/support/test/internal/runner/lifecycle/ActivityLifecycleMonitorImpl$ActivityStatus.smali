.class Landroid/support/test/internal/runner/lifecycle/ActivityLifecycleMonitorImpl$ActivityStatus;
.super Ljava/lang/Object;
.source "ActivityLifecycleMonitorImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/test/internal/runner/lifecycle/ActivityLifecycleMonitorImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ActivityStatus"
.end annotation


# instance fields
.field private final mActivityRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private mLifecycleStage:Landroid/support/test/runner/lifecycle/Stage;


# direct methods
.method constructor <init>(Landroid/app/Activity;Landroid/support/test/runner/lifecycle/Stage;)V
    .locals 1

    .line 194
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 195
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-static {p1}, Landroid/support/test/internal/util/Checks;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/Activity;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Landroid/support/test/internal/runner/lifecycle/ActivityLifecycleMonitorImpl$ActivityStatus;->mActivityRef:Ljava/lang/ref/WeakReference;

    .line 196
    invoke-static {p2}, Landroid/support/test/internal/util/Checks;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/support/test/runner/lifecycle/Stage;

    iput-object p1, p0, Landroid/support/test/internal/runner/lifecycle/ActivityLifecycleMonitorImpl$ActivityStatus;->mLifecycleStage:Landroid/support/test/runner/lifecycle/Stage;

    .line 197
    return-void
.end method

.method static synthetic access$000(Landroid/support/test/internal/runner/lifecycle/ActivityLifecycleMonitorImpl$ActivityStatus;)Ljava/lang/ref/WeakReference;
    .locals 0

    .line 190
    iget-object p0, p0, Landroid/support/test/internal/runner/lifecycle/ActivityLifecycleMonitorImpl$ActivityStatus;->mActivityRef:Ljava/lang/ref/WeakReference;

    return-object p0
.end method

.method static synthetic access$100(Landroid/support/test/internal/runner/lifecycle/ActivityLifecycleMonitorImpl$ActivityStatus;)Landroid/support/test/runner/lifecycle/Stage;
    .locals 0

    .line 190
    iget-object p0, p0, Landroid/support/test/internal/runner/lifecycle/ActivityLifecycleMonitorImpl$ActivityStatus;->mLifecycleStage:Landroid/support/test/runner/lifecycle/Stage;

    return-object p0
.end method

.method static synthetic access$102(Landroid/support/test/internal/runner/lifecycle/ActivityLifecycleMonitorImpl$ActivityStatus;Landroid/support/test/runner/lifecycle/Stage;)Landroid/support/test/runner/lifecycle/Stage;
    .locals 0

    .line 190
    iput-object p1, p0, Landroid/support/test/internal/runner/lifecycle/ActivityLifecycleMonitorImpl$ActivityStatus;->mLifecycleStage:Landroid/support/test/runner/lifecycle/Stage;

    return-object p1
.end method
