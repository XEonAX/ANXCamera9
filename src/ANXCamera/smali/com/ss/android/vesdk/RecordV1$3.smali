.class Lcom/ss/android/vesdk/RecordV1$3;
.super Ljava/lang/Object;
.source "RecordV1.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/vesdk/RecordV1;->concatAsync(Ljava/lang/String;Ljava/lang/String;Lcom/ss/android/vesdk/IRecorder$OnConcatFinishedListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/android/vesdk/RecordV1;

.field final synthetic val$listener:Lcom/ss/android/vesdk/IRecorder$OnConcatFinishedListener;

.field final synthetic val$outputAudioPath:Ljava/lang/String;

.field final synthetic val$outputVideoPath:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/ss/android/vesdk/RecordV1;Ljava/lang/String;Ljava/lang/String;Lcom/ss/android/vesdk/IRecorder$OnConcatFinishedListener;)V
    .locals 0

    .line 166
    iput-object p1, p0, Lcom/ss/android/vesdk/RecordV1$3;->this$0:Lcom/ss/android/vesdk/RecordV1;

    iput-object p2, p0, Lcom/ss/android/vesdk/RecordV1$3;->val$outputVideoPath:Ljava/lang/String;

    iput-object p3, p0, Lcom/ss/android/vesdk/RecordV1$3;->val$outputAudioPath:Ljava/lang/String;

    iput-object p4, p0, Lcom/ss/android/vesdk/RecordV1$3;->val$listener:Lcom/ss/android/vesdk/IRecorder$OnConcatFinishedListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 169
    iget-object v0, p0, Lcom/ss/android/vesdk/RecordV1$3;->this$0:Lcom/ss/android/vesdk/RecordV1;

    invoke-static {v0}, Lcom/ss/android/vesdk/RecordV1;->access$300(Lcom/ss/android/vesdk/RecordV1;)Lcom/ss/android/medialib/TTRecorder;

    move-result-object v0

    iget-object v1, p0, Lcom/ss/android/vesdk/RecordV1$3;->val$outputVideoPath:Ljava/lang/String;

    iget-object v2, p0, Lcom/ss/android/vesdk/RecordV1$3;->val$outputAudioPath:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/ss/android/medialib/TTRecorder;->concatSyn(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 170
    iget-object v1, p0, Lcom/ss/android/vesdk/RecordV1$3;->val$listener:Lcom/ss/android/vesdk/IRecorder$OnConcatFinishedListener;

    invoke-interface {v1, v0}, Lcom/ss/android/vesdk/IRecorder$OnConcatFinishedListener;->onConcatFinished(I)V

    .line 171
    return-void
.end method
