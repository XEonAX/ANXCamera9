.class Lcom/xiaomi/engine/MiaNodeJNI$1;
.super Ljava/lang/Object;
.source "MiaNodeJNI.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/engine/MiaNodeJNI;->tryToCloseNode()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xiaomi/engine/MiaNodeJNI;


# direct methods
.method constructor <init>(Lcom/xiaomi/engine/MiaNodeJNI;)V
    .locals 0

    .line 51
    iput-object p1, p0, Lcom/xiaomi/engine/MiaNodeJNI$1;->this$0:Lcom/xiaomi/engine/MiaNodeJNI;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 54
    iget-object v0, p0, Lcom/xiaomi/engine/MiaNodeJNI$1;->this$0:Lcom/xiaomi/engine/MiaNodeJNI;

    invoke-static {}, Lcom/xiaomi/engine/MiaNodeJNI;->access$100()I

    move-result v1

    invoke-static {v0, v1}, Lcom/xiaomi/engine/MiaNodeJNI;->access$200(Lcom/xiaomi/engine/MiaNodeJNI;I)V

    .line 55
    return-void
.end method
