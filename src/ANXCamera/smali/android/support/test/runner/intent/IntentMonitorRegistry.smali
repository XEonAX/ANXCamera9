.class public final Landroid/support/test/runner/intent/IntentMonitorRegistry;
.super Ljava/lang/Object;
.source "IntentMonitorRegistry.java"


# static fields
.field private static final mMonitorRef:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Landroid/support/test/runner/intent/IntentMonitor;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 24
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Landroid/support/test/runner/intent/IntentMonitorRegistry;->mMonitorRef:Ljava/util/concurrent/atomic/AtomicReference;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    return-void
.end method

.method public static getInstance()Landroid/support/test/runner/intent/IntentMonitor;
    .locals 2

    .line 34
    sget-object v0, Landroid/support/test/runner/intent/IntentMonitorRegistry;->mMonitorRef:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/test/runner/intent/IntentMonitor;

    .line 35
    if-eqz v0, :cond_0

    .line 40
    return-object v0

    .line 36
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "No intent monitor registered! Are you running under an Instrumentation which registers intent monitors?"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static registerInstance(Landroid/support/test/runner/intent/IntentMonitor;)V
    .locals 1

    .line 48
    sget-object v0, Landroid/support/test/runner/intent/IntentMonitorRegistry;->mMonitorRef:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 49
    return-void
.end method
