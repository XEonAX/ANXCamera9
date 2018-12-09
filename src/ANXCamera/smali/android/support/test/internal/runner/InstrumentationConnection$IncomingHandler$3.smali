.class Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler$3;
.super Ljava/lang/Object;
.source "InstrumentationConnection.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->getClientsForType(Ljava/lang/String;)Ljava/util/Set;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Ljava/util/Set<",
        "Landroid/os/Messenger;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;

.field final synthetic val$type:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;Ljava/lang/String;)V
    .locals 0

    .line 504
    iput-object p1, p0, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler$3;->this$0:Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;

    iput-object p2, p0, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler$3;->val$type:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 504
    invoke-virtual {p0}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler$3;->call()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public call()Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Landroid/os/Messenger;",
            ">;"
        }
    .end annotation

    .line 507
    iget-object v0, p0, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler$3;->this$0:Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;

    iget-object v0, v0, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->mTypedClients:Ljava/util/Map;

    iget-object v1, p0, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler$3;->val$type:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    return-object v0
.end method
