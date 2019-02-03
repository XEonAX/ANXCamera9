.class Lcom/ss/android/medialib/TTRecorder$1;
.super Ljava/lang/Object;
.source "TTRecorder.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/medialib/TTRecorder;->concat(Ljava/lang/String;Ljava/lang/String;Lcom/ss/android/medialib/TTRecorder$OnConcatFinishListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/android/medialib/TTRecorder;

.field final synthetic val$audioPath:Ljava/lang/String;

.field final synthetic val$listener:Lcom/ss/android/medialib/TTRecorder$OnConcatFinishListener;

.field final synthetic val$videoPath:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/ss/android/medialib/TTRecorder;Ljava/lang/String;Ljava/lang/String;Lcom/ss/android/medialib/TTRecorder$OnConcatFinishListener;)V
    .locals 0

    .line 259
    iput-object p1, p0, Lcom/ss/android/medialib/TTRecorder$1;->this$0:Lcom/ss/android/medialib/TTRecorder;

    iput-object p2, p0, Lcom/ss/android/medialib/TTRecorder$1;->val$videoPath:Ljava/lang/String;

    iput-object p3, p0, Lcom/ss/android/medialib/TTRecorder$1;->val$audioPath:Ljava/lang/String;

    iput-object p4, p0, Lcom/ss/android/medialib/TTRecorder$1;->val$listener:Lcom/ss/android/medialib/TTRecorder$OnConcatFinishListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 262
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder$1;->this$0:Lcom/ss/android/medialib/TTRecorder;

    iget-object v1, p0, Lcom/ss/android/medialib/TTRecorder$1;->this$0:Lcom/ss/android/medialib/TTRecorder;

    invoke-static {v1}, Lcom/ss/android/medialib/TTRecorder;->access$000(Lcom/ss/android/medialib/TTRecorder;)J

    move-result-wide v1

    iget-object v3, p0, Lcom/ss/android/medialib/TTRecorder$1;->val$videoPath:Ljava/lang/String;

    iget-object v4, p0, Lcom/ss/android/medialib/TTRecorder$1;->val$audioPath:Ljava/lang/String;

    const-string v5, ""

    const-string v6, ""

    invoke-static/range {v0 .. v6}, Lcom/ss/android/medialib/TTRecorder;->access$100(Lcom/ss/android/medialib/TTRecorder;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 263
    iget-object v1, p0, Lcom/ss/android/medialib/TTRecorder$1;->val$listener:Lcom/ss/android/medialib/TTRecorder$OnConcatFinishListener;

    if-eqz v1, :cond_0

    .line 264
    iget-object v1, p0, Lcom/ss/android/medialib/TTRecorder$1;->val$listener:Lcom/ss/android/medialib/TTRecorder$OnConcatFinishListener;

    invoke-interface {v1, v0}, Lcom/ss/android/medialib/TTRecorder$OnConcatFinishListener;->onConcatFinish(I)V

    .line 266
    :cond_0
    return-void
.end method
