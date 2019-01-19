.class Lcom/ss/android/vesdk/VEEditor$5;
.super Ljava/lang/Object;
.source "VEEditor.java"

# interfaces
.implements Lcom/ss/android/ttve/common/TECommonCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/vesdk/VEEditor;->setOnInfoListener(Lcom/ss/android/vesdk/VECommonCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/android/vesdk/VEEditor;

.field final synthetic val$callback:Lcom/ss/android/vesdk/VECommonCallback;


# direct methods
.method constructor <init>(Lcom/ss/android/vesdk/VEEditor;Lcom/ss/android/vesdk/VECommonCallback;)V
    .locals 0

    .line 529
    iput-object p1, p0, Lcom/ss/android/vesdk/VEEditor$5;->this$0:Lcom/ss/android/vesdk/VEEditor;

    iput-object p2, p0, Lcom/ss/android/vesdk/VEEditor$5;->val$callback:Lcom/ss/android/vesdk/VECommonCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCallback(IIFLjava/lang/String;)V
    .locals 1

    .line 533
    const/16 v0, 0x1007

    if-eq p1, v0, :cond_0

    .line 547
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor$5;->val$callback:Lcom/ss/android/vesdk/VECommonCallback;

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/ss/android/vesdk/VECommonCallback;->onCallback(IIFLjava/lang/String;)V

    goto :goto_0

    .line 535
    :cond_0
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor$5;->this$0:Lcom/ss/android/vesdk/VEEditor;

    invoke-static {v0}, Lcom/ss/android/vesdk/VEEditor;->access$1100(Lcom/ss/android/vesdk/VEEditor;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 536
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor$5;->this$0:Lcom/ss/android/vesdk/VEEditor;

    invoke-static {p1}, Lcom/ss/android/vesdk/VEEditor;->access$1200(Lcom/ss/android/vesdk/VEEditor;)Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;

    move-result-object p1

    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditor$5;->val$callback:Lcom/ss/android/vesdk/VECommonCallback;

    invoke-virtual {p1, p2}, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->setCallback(Lcom/ss/android/vesdk/VECommonCallback;)V

    .line 537
    new-instance p1, Ljava/lang/Thread;

    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditor$5;->this$0:Lcom/ss/android/vesdk/VEEditor;

    invoke-static {p2}, Lcom/ss/android/vesdk/VEEditor;->access$1200(Lcom/ss/android/vesdk/VEEditor;)Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 538
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor$5;->this$0:Lcom/ss/android/vesdk/VEEditor;

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lcom/ss/android/vesdk/VEEditor;->access$1102(Lcom/ss/android/vesdk/VEEditor;Z)Z

    .line 539
    goto :goto_0

    .line 541
    :cond_1
    if-nez p2, :cond_2

    .line 542
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor$5;->this$0:Lcom/ss/android/vesdk/VEEditor;

    invoke-static {v0}, Lcom/ss/android/vesdk/VEEditor;->access$1300(Lcom/ss/android/vesdk/VEEditor;)V

    .line 544
    :cond_2
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor$5;->val$callback:Lcom/ss/android/vesdk/VECommonCallback;

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/ss/android/vesdk/VECommonCallback;->onCallback(IIFLjava/lang/String;)V

    .line 545
    nop

    .line 550
    :goto_0
    return-void
.end method
