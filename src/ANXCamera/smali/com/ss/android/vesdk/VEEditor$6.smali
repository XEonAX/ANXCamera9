.class Lcom/ss/android/vesdk/VEEditor$6;
.super Ljava/lang/Object;
.source "VEEditor.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/vesdk/VEEditor;->genReverseVideoAsync(Lcom/ss/android/vesdk/VEReverseCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/android/vesdk/VEEditor;

.field final synthetic val$callback:Lcom/ss/android/vesdk/VEReverseCallback;


# direct methods
.method constructor <init>(Lcom/ss/android/vesdk/VEEditor;Lcom/ss/android/vesdk/VEReverseCallback;)V
    .locals 0

    .line 1272
    iput-object p1, p0, Lcom/ss/android/vesdk/VEEditor$6;->this$0:Lcom/ss/android/vesdk/VEEditor;

    iput-object p2, p0, Lcom/ss/android/vesdk/VEEditor$6;->val$callback:Lcom/ss/android/vesdk/VEReverseCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .line 1275
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor$6;->this$0:Lcom/ss/android/vesdk/VEEditor;

    invoke-static {v0}, Lcom/ss/android/vesdk/VEEditor;->access$1400(Lcom/ss/android/vesdk/VEEditor;)Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    move-result-object v0

    iget-object v0, v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mVideoPaths:[Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor$6;->this$0:Lcom/ss/android/vesdk/VEEditor;

    invoke-static {v0}, Lcom/ss/android/vesdk/VEEditor;->access$1400(Lcom/ss/android/vesdk/VEEditor;)Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    move-result-object v0

    iget-object v0, v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mVideoPaths:[Ljava/lang/String;

    array-length v0, v0

    if-gtz v0, :cond_1

    .line 1276
    :cond_0
    const-string v0, "VEEditor"

    const-string v1, "reverse failed, invalid params!"

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 1277
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor$6;->val$callback:Lcom/ss/android/vesdk/VEReverseCallback;

    const/16 v1, -0x64

    invoke-interface {v0, v1}, Lcom/ss/android/vesdk/VEReverseCallback;->onReverseFinish(I)V

    .line 1279
    :cond_1
    new-instance v0, Lcom/ss/android/medialib/FFMpegInvoker;

    invoke-direct {v0}, Lcom/ss/android/medialib/FFMpegInvoker;-><init>()V

    .line 1280
    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor$6;->this$0:Lcom/ss/android/vesdk/VEEditor;

    invoke-static {v1}, Lcom/ss/android/vesdk/VEEditor;->access$1400(Lcom/ss/android/vesdk/VEEditor;)Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    move-result-object v1

    iget-object v2, p0, Lcom/ss/android/vesdk/VEEditor$6;->this$0:Lcom/ss/android/vesdk/VEEditor;

    invoke-static {v2}, Lcom/ss/android/vesdk/VEEditor;->access$1400(Lcom/ss/android/vesdk/VEEditor;)Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    move-result-object v2

    iget-object v2, v2, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mVideoPaths:[Ljava/lang/String;

    array-length v2, v2

    new-array v2, v2, [Ljava/lang/String;

    iput-object v2, v1, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mReverseVideoPath:[Ljava/lang/String;

    .line 1282
    const/4 v1, 0x0

    move v2, v1

    :goto_0
    iget-object v3, p0, Lcom/ss/android/vesdk/VEEditor$6;->this$0:Lcom/ss/android/vesdk/VEEditor;

    invoke-static {v3}, Lcom/ss/android/vesdk/VEEditor;->access$1400(Lcom/ss/android/vesdk/VEEditor;)Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    move-result-object v3

    iget-object v3, v3, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mVideoPaths:[Ljava/lang/String;

    array-length v3, v3

    if-ge v2, v3, :cond_4

    .line 1283
    iget-object v3, p0, Lcom/ss/android/vesdk/VEEditor$6;->this$0:Lcom/ss/android/vesdk/VEEditor;

    invoke-static {v3}, Lcom/ss/android/vesdk/VEEditor;->access$1400(Lcom/ss/android/vesdk/VEEditor;)Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->genReverseVideoPath(I)Ljava/lang/String;

    move-result-object v3

    .line 1284
    iget-object v4, p0, Lcom/ss/android/vesdk/VEEditor$6;->this$0:Lcom/ss/android/vesdk/VEEditor;

    invoke-static {v4}, Lcom/ss/android/vesdk/VEEditor;->access$1400(Lcom/ss/android/vesdk/VEEditor;)Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    move-result-object v4

    iget-object v4, v4, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mVideoPaths:[Ljava/lang/String;

    aget-object v4, v4, v2

    invoke-virtual {v0, v4, v3}, Lcom/ss/android/medialib/FFMpegInvoker;->addFastReverseVideo(Ljava/lang/String;Ljava/lang/String;)I

    move-result v4

    .line 1285
    iget-object v5, p0, Lcom/ss/android/vesdk/VEEditor$6;->this$0:Lcom/ss/android/vesdk/VEEditor;

    invoke-static {v5}, Lcom/ss/android/vesdk/VEEditor;->access$1500(Lcom/ss/android/vesdk/VEEditor;)Z

    move-result v5

    const/4 v6, -0x1

    if-eqz v5, :cond_2

    .line 1286
    const-string v5, "VEEditor"

    const-string v7, "reverse failed, reverse has been canceled"

    invoke-static {v5, v7}, Lcom/ss/android/ttve/common/TELogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 1287
    iget-object v5, p0, Lcom/ss/android/vesdk/VEEditor$6;->this$0:Lcom/ss/android/vesdk/VEEditor;

    invoke-static {v5, v1}, Lcom/ss/android/vesdk/VEEditor;->access$1502(Lcom/ss/android/vesdk/VEEditor;Z)Z

    .line 1288
    iget-object v5, p0, Lcom/ss/android/vesdk/VEEditor$6;->val$callback:Lcom/ss/android/vesdk/VEReverseCallback;

    invoke-interface {v5, v6}, Lcom/ss/android/vesdk/VEReverseCallback;->onReverseFinish(I)V

    .line 1290
    :cond_2
    if-nez v4, :cond_3

    goto :goto_1

    .line 1292
    :cond_3
    :try_start_0
    new-instance v5, Lcom/ss/android/vesdk/VEException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "reverse mResManager.mVideoPaths[i] failed: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lcom/ss/android/vesdk/VEException;-><init>(ILjava/lang/String;)V

    throw v5
    :try_end_0
    .catch Lcom/ss/android/vesdk/VEException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1293
    :catch_0
    move-exception v5

    .line 1294
    const-string v5, "VEEditor"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "reverse failed, result code: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v5, v4}, Lcom/ss/android/ttve/common/TELogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 1297
    :goto_1
    iget-object v4, p0, Lcom/ss/android/vesdk/VEEditor$6;->this$0:Lcom/ss/android/vesdk/VEEditor;

    invoke-static {v4}, Lcom/ss/android/vesdk/VEEditor;->access$1400(Lcom/ss/android/vesdk/VEEditor;)Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    move-result-object v4

    iget-object v4, v4, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mReverseVideoPath:[Ljava/lang/String;

    aput-object v3, v4, v2

    .line 1282
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1299
    :cond_4
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor$6;->this$0:Lcom/ss/android/vesdk/VEEditor;

    const/4 v2, 0x1

    invoke-static {v0, v2}, Lcom/ss/android/vesdk/VEEditor;->access$1602(Lcom/ss/android/vesdk/VEEditor;Z)Z

    .line 1300
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor$6;->val$callback:Lcom/ss/android/vesdk/VEReverseCallback;

    invoke-interface {v0, v1}, Lcom/ss/android/vesdk/VEReverseCallback;->onReverseFinish(I)V

    .line 1301
    return-void
.end method
