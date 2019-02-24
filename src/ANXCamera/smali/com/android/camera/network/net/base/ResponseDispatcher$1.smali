.class Lcom/android/camera/network/net/base/ResponseDispatcher$1;
.super Ljava/lang/Object;
.source "ResponseDispatcher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/network/net/base/ResponseDispatcher;->onResponse([Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/network/net/base/ResponseDispatcher;

.field final synthetic val$response:[Ljava/lang/Object;


# direct methods
.method constructor <init>(Lcom/android/camera/network/net/base/ResponseDispatcher;[Ljava/lang/Object;)V
    .locals 0

    .line 23
    iput-object p1, p0, Lcom/android/camera/network/net/base/ResponseDispatcher$1;->this$0:Lcom/android/camera/network/net/base/ResponseDispatcher;

    iput-object p2, p0, Lcom/android/camera/network/net/base/ResponseDispatcher$1;->val$response:[Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 27
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/network/net/base/ResponseDispatcher$1;->this$0:Lcom/android/camera/network/net/base/ResponseDispatcher;

    invoke-static {v0}, Lcom/android/camera/network/net/base/ResponseDispatcher;->access$000(Lcom/android/camera/network/net/base/ResponseDispatcher;)Lcom/android/camera/network/net/base/ResponseListener;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/network/net/base/ResponseDispatcher$1;->val$response:[Ljava/lang/Object;

    invoke-interface {v0, v1}, Lcom/android/camera/network/net/base/ResponseListener;->onResponse([Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    goto :goto_0

    .line 28
    :catch_0
    move-exception v0

    .line 29
    iget-object v0, p0, Lcom/android/camera/network/net/base/ResponseDispatcher$1;->this$0:Lcom/android/camera/network/net/base/ResponseDispatcher;

    sget-object v1, Lcom/android/camera/network/net/base/ErrorCode;->DATA_BIND_ERROR:Lcom/android/camera/network/net/base/ErrorCode;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, v2}, Lcom/android/camera/network/net/base/ResponseDispatcher;->onResponseError(Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V

    .line 31
    :goto_0
    return-void
.end method
