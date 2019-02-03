.class Landroid/support/v7/util/MessageThreadUtil$2$1;
.super Ljava/lang/Object;
.source "MessageThreadUtil.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/util/MessageThreadUtil$2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroid/support/v7/util/MessageThreadUtil$2;


# direct methods
.method constructor <init>(Landroid/support/v7/util/MessageThreadUtil$2;)V
    .registers 2

    .line 125
    .local p0, "this":Landroid/support/v7/util/MessageThreadUtil$2$1;, "Landroid/support/v7/util/MessageThreadUtil$2.1;"
    iput-object p1, p0, Landroid/support/v7/util/MessageThreadUtil$2$1;->this$1:Landroid/support/v7/util/MessageThreadUtil$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 9

    .line 128
    .local p0, "this":Landroid/support/v7/util/MessageThreadUtil$2$1;, "Landroid/support/v7/util/MessageThreadUtil$2.1;"
    iget-object v0, p0, Landroid/support/v7/util/MessageThreadUtil$2$1;->this$1:Landroid/support/v7/util/MessageThreadUtil$2;

    # getter for: Landroid/support/v7/util/MessageThreadUtil$2;->mQueue:Landroid/support/v7/util/MessageThreadUtil$MessageQueue;
    invoke-static {v0}, Landroid/support/v7/util/MessageThreadUtil$2;->access$100(Landroid/support/v7/util/MessageThreadUtil$2;)Landroid/support/v7/util/MessageThreadUtil$MessageQueue;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->next()Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    move-result-object v0

    .line 129
    .local v0, "msg":Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    if-nez v0, :cond_d

    .line 130
    return-void

    .line 132
    :cond_d
    iget v1, v0, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->what:I

    packed-switch v1, :pswitch_data_7e

    .line 151
    const-string v1, "ThreadUtil"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unsupported message, what="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->what:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_7d

    .line 148
    :pswitch_2b
    iget-object v1, p0, Landroid/support/v7/util/MessageThreadUtil$2$1;->this$1:Landroid/support/v7/util/MessageThreadUtil$2;

    iget-object v1, v1, Landroid/support/v7/util/MessageThreadUtil$2;->val$callback:Landroid/support/v7/util/ThreadUtil$BackgroundCallback;

    iget-object v2, v0, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->data:Ljava/lang/Object;

    check-cast v2, Landroid/support/v7/util/TileList$Tile;

    invoke-interface {v1, v2}, Landroid/support/v7/util/ThreadUtil$BackgroundCallback;->recycleTile(Landroid/support/v7/util/TileList$Tile;)V

    .line 149
    goto :goto_7d

    .line 144
    :pswitch_37
    iget-object v1, p0, Landroid/support/v7/util/MessageThreadUtil$2$1;->this$1:Landroid/support/v7/util/MessageThreadUtil$2;

    iget-object v1, v1, Landroid/support/v7/util/MessageThreadUtil$2;->val$callback:Landroid/support/v7/util/ThreadUtil$BackgroundCallback;

    iget v2, v0, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->arg1:I

    iget v3, v0, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->arg2:I

    invoke-interface {v1, v2, v3}, Landroid/support/v7/util/ThreadUtil$BackgroundCallback;->loadTile(II)V

    .line 145
    goto :goto_7d

    .line 138
    :pswitch_43
    iget-object v1, p0, Landroid/support/v7/util/MessageThreadUtil$2$1;->this$1:Landroid/support/v7/util/MessageThreadUtil$2;

    # getter for: Landroid/support/v7/util/MessageThreadUtil$2;->mQueue:Landroid/support/v7/util/MessageThreadUtil$MessageQueue;
    invoke-static {v1}, Landroid/support/v7/util/MessageThreadUtil$2;->access$100(Landroid/support/v7/util/MessageThreadUtil$2;)Landroid/support/v7/util/MessageThreadUtil$MessageQueue;

    move-result-object v1

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->removeMessages(I)V

    .line 139
    iget-object v1, p0, Landroid/support/v7/util/MessageThreadUtil$2$1;->this$1:Landroid/support/v7/util/MessageThreadUtil$2;

    # getter for: Landroid/support/v7/util/MessageThreadUtil$2;->mQueue:Landroid/support/v7/util/MessageThreadUtil$MessageQueue;
    invoke-static {v1}, Landroid/support/v7/util/MessageThreadUtil$2;->access$100(Landroid/support/v7/util/MessageThreadUtil$2;)Landroid/support/v7/util/MessageThreadUtil$MessageQueue;

    move-result-object v1

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->removeMessages(I)V

    .line 140
    iget-object v1, p0, Landroid/support/v7/util/MessageThreadUtil$2$1;->this$1:Landroid/support/v7/util/MessageThreadUtil$2;

    iget-object v2, v1, Landroid/support/v7/util/MessageThreadUtil$2;->val$callback:Landroid/support/v7/util/ThreadUtil$BackgroundCallback;

    iget v3, v0, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->arg1:I

    iget v4, v0, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->arg2:I

    iget v5, v0, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->arg3:I

    iget v6, v0, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->arg4:I

    iget v7, v0, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->arg5:I

    invoke-interface/range {v2 .. v7}, Landroid/support/v7/util/ThreadUtil$BackgroundCallback;->updateRange(IIIII)V

    .line 142
    goto :goto_7d

    .line 134
    :pswitch_69
    iget-object v1, p0, Landroid/support/v7/util/MessageThreadUtil$2$1;->this$1:Landroid/support/v7/util/MessageThreadUtil$2;

    # getter for: Landroid/support/v7/util/MessageThreadUtil$2;->mQueue:Landroid/support/v7/util/MessageThreadUtil$MessageQueue;
    invoke-static {v1}, Landroid/support/v7/util/MessageThreadUtil$2;->access$100(Landroid/support/v7/util/MessageThreadUtil$2;)Landroid/support/v7/util/MessageThreadUtil$MessageQueue;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->removeMessages(I)V

    .line 135
    iget-object v1, p0, Landroid/support/v7/util/MessageThreadUtil$2$1;->this$1:Landroid/support/v7/util/MessageThreadUtil$2;

    iget-object v1, v1, Landroid/support/v7/util/MessageThreadUtil$2;->val$callback:Landroid/support/v7/util/ThreadUtil$BackgroundCallback;

    iget v2, v0, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->arg1:I

    invoke-interface {v1, v2}, Landroid/support/v7/util/ThreadUtil$BackgroundCallback;->refresh(I)V

    .line 136
    nop

    .line 153
    :goto_7d
    return-void

    :pswitch_data_7e
    .packed-switch 0x1
        :pswitch_69
        :pswitch_43
        :pswitch_37
        :pswitch_2b
    .end packed-switch
.end method
