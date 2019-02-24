.class Lcom/android/camera/network/net/base/ResponseDispatcher$2;
.super Ljava/lang/Object;
.source "ResponseDispatcher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/network/net/base/ResponseDispatcher;->onResponseError(Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/network/net/base/ResponseDispatcher;

.field final synthetic val$errorCode:Lcom/android/camera/network/net/base/ErrorCode;

.field final synthetic val$errorMessage:Ljava/lang/String;

.field final synthetic val$respnoseData:Ljava/lang/Object;


# direct methods
.method constructor <init>(Lcom/android/camera/network/net/base/ResponseDispatcher;Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0

    .line 46
    iput-object p1, p0, Lcom/android/camera/network/net/base/ResponseDispatcher$2;->this$0:Lcom/android/camera/network/net/base/ResponseDispatcher;

    iput-object p2, p0, Lcom/android/camera/network/net/base/ResponseDispatcher$2;->val$errorCode:Lcom/android/camera/network/net/base/ErrorCode;

    iput-object p3, p0, Lcom/android/camera/network/net/base/ResponseDispatcher$2;->val$errorMessage:Ljava/lang/String;

    iput-object p4, p0, Lcom/android/camera/network/net/base/ResponseDispatcher$2;->val$respnoseData:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 49
    iget-object v0, p0, Lcom/android/camera/network/net/base/ResponseDispatcher$2;->this$0:Lcom/android/camera/network/net/base/ResponseDispatcher;

    invoke-static {v0}, Lcom/android/camera/network/net/base/ResponseDispatcher;->access$000(Lcom/android/camera/network/net/base/ResponseDispatcher;)Lcom/android/camera/network/net/base/ResponseListener;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/network/net/base/ResponseDispatcher$2;->val$errorCode:Lcom/android/camera/network/net/base/ErrorCode;

    iget-object v2, p0, Lcom/android/camera/network/net/base/ResponseDispatcher$2;->val$errorMessage:Ljava/lang/String;

    iget-object v3, p0, Lcom/android/camera/network/net/base/ResponseDispatcher$2;->val$respnoseData:Ljava/lang/Object;

    invoke-interface {v0, v1, v2, v3}, Lcom/android/camera/network/net/base/ResponseListener;->onResponseError(Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V

    .line 50
    return-void
.end method
