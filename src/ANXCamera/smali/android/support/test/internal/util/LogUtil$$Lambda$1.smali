.class final synthetic Landroid/support/test/internal/util/LogUtil$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/support/test/internal/util/LogUtil$Supplier;


# instance fields
.field private final arg$1:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroid/support/test/internal/util/LogUtil$$Lambda$1;->arg$1:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public get()Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Landroid/support/test/internal/util/LogUtil$$Lambda$1;->arg$1:Ljava/lang/String;

    invoke-static {v0}, Landroid/support/test/internal/util/LogUtil;->lambda$logDebugWithProcess$1$LogUtil(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
