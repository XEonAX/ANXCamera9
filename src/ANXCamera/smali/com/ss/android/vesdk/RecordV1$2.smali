.class Lcom/ss/android/vesdk/RecordV1$2;
.super Ljava/lang/Object;
.source "RecordV1.java"

# interfaces
.implements Lcom/ss/android/medialib/listener/NativeInitListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/vesdk/RecordV1;-><init>(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/android/vesdk/RecordV1;


# direct methods
.method constructor <init>(Lcom/ss/android/vesdk/RecordV1;)V
    .locals 0

    .line 59
    iput-object p1, p0, Lcom/ss/android/vesdk/RecordV1$2;->this$0:Lcom/ss/android/vesdk/RecordV1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onNativeInitCallBack(I)V
    .locals 2

    .line 62
    iget-object v0, p0, Lcom/ss/android/vesdk/RecordV1$2;->this$0:Lcom/ss/android/vesdk/RecordV1;

    invoke-static {v0}, Lcom/ss/android/vesdk/RecordV1;->access$200(Lcom/ss/android/vesdk/RecordV1;)Lcom/ss/android/vesdk/VEListener$VERecorderStateListener;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 63
    iget-object v0, p0, Lcom/ss/android/vesdk/RecordV1$2;->this$0:Lcom/ss/android/vesdk/RecordV1;

    invoke-static {v0}, Lcom/ss/android/vesdk/RecordV1;->access$200(Lcom/ss/android/vesdk/RecordV1;)Lcom/ss/android/vesdk/VEListener$VERecorderStateListener;

    move-result-object v0

    if-nez p1, :cond_0

    const-string v1, "success"

    goto :goto_0

    :cond_0
    const-string v1, "failed"

    :goto_0
    invoke-interface {v0, p1, v1}, Lcom/ss/android/vesdk/VEListener$VERecorderStateListener;->onNativeInit(ILjava/lang/String;)V

    .line 65
    :cond_1
    return-void
.end method

.method public onNativeInitHardEncoderRetCallback(II)V
    .locals 0

    .line 69
    iget-object p2, p0, Lcom/ss/android/vesdk/RecordV1$2;->this$0:Lcom/ss/android/vesdk/RecordV1;

    invoke-static {p2}, Lcom/ss/android/vesdk/RecordV1;->access$200(Lcom/ss/android/vesdk/RecordV1;)Lcom/ss/android/vesdk/VEListener$VERecorderStateListener;

    move-result-object p2

    if-eqz p2, :cond_1

    .line 70
    iget-object p2, p0, Lcom/ss/android/vesdk/RecordV1$2;->this$0:Lcom/ss/android/vesdk/RecordV1;

    invoke-static {p2}, Lcom/ss/android/vesdk/RecordV1;->access$200(Lcom/ss/android/vesdk/RecordV1;)Lcom/ss/android/vesdk/VEListener$VERecorderStateListener;

    move-result-object p2

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    invoke-interface {p2, p1}, Lcom/ss/android/vesdk/VEListener$VERecorderStateListener;->onHardEncoderInit(Z)V

    .line 72
    :cond_1
    return-void
.end method
