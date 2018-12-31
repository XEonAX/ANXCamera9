.class Landroid/support/test/internal/runner/InstrumentationConnection$1;
.super Ljava/lang/Object;
.source "InstrumentationConnection.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/test/internal/runner/InstrumentationConnection;->terminate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/test/internal/runner/InstrumentationConnection;


# direct methods
.method constructor <init>(Landroid/support/test/internal/runner/InstrumentationConnection;)V
    .locals 0

    .line 189
    iput-object p1, p0, Landroid/support/test/internal/runner/InstrumentationConnection$1;->this$0:Landroid/support/test/internal/runner/InstrumentationConnection;

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

    .line 189
    invoke-virtual {p0}, Landroid/support/test/internal/runner/InstrumentationConnection$1;->call()Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method public call()Ljava/lang/Void;
    .locals 1

    .line 192
    iget-object v0, p0, Landroid/support/test/internal/runner/InstrumentationConnection$1;->this$0:Landroid/support/test/internal/runner/InstrumentationConnection;

    iget-object v0, v0, Landroid/support/test/internal/runner/InstrumentationConnection;->mIncomingHandler:Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;

    invoke-static {v0}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->access$000(Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;)V

    .line 193
    const/4 v0, 0x0

    return-object v0
.end method
