.class final Lcom/bef/effectsdk/GPUProcessor$1;
.super Ljava/lang/Object;
.source "GPUProcessor.java"

# interfaces
.implements Lcom/bef/effectsdk/message/MessageCenter$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bef/effectsdk/GPUProcessor;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onMessageReceived(IIILjava/lang/String;)V
    .locals 1

    .line 17
    invoke-static {}, Lcom/bef/effectsdk/GPUProcessor;->access$000()Lcom/bef/effectsdk/GPUProcessor$Listener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 18
    invoke-static {}, Lcom/bef/effectsdk/GPUProcessor;->access$000()Lcom/bef/effectsdk/GPUProcessor$Listener;

    move-result-object v0

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/bef/effectsdk/GPUProcessor$Listener;->onMessageReceived(IIILjava/lang/String;)V

    .line 20
    :cond_0
    return-void
.end method
