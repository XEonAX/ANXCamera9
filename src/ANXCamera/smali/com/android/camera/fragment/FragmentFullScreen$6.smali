.class Lcom/android/camera/fragment/FragmentFullScreen$6;
.super Ljava/lang/Object;
.source "FragmentFullScreen.java"

# interfaces
.implements Lcom/ss/android/vesdk/VECommonCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/FragmentFullScreen;->initLiveListener()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/FragmentFullScreen;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/FragmentFullScreen;)V
    .locals 0

    .line 405
    iput-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen$6;->this$0:Lcom/android/camera/fragment/FragmentFullScreen;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCallback(IIFLjava/lang/String;)V
    .locals 0

    .line 408
    const/16 p2, 0x1002

    if-eq p1, p2, :cond_4

    const/16 p2, 0x1005

    if-eq p1, p2, :cond_3

    const/16 p2, 0x1007

    if-eq p1, p2, :cond_2

    const/16 p2, 0x1009

    if-eq p1, p2, :cond_1

    const/16 p2, 0x1010

    if-eq p1, p2, :cond_0

    .line 430
    const-string p2, "FragmentFullScreen"

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "CombineCallback: "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 410
    :cond_0
    const-string p1, "FragmentFullScreen"

    const-string p2, "CombineStart"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 411
    goto :goto_0

    .line 415
    :cond_1
    goto :goto_0

    .line 418
    :cond_2
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen$6;->this$0:Lcom/android/camera/fragment/FragmentFullScreen;

    invoke-static {p1}, Lcom/android/camera/fragment/FragmentFullScreen;->access$200(Lcom/android/camera/fragment/FragmentFullScreen;)V

    .line 419
    goto :goto_0

    .line 422
    :cond_3
    goto :goto_0

    .line 424
    :cond_4
    const-string p1, "FragmentFullScreen"

    const-string p2, "play finished and loop"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 427
    nop

    .line 434
    :goto_0
    return-void
.end method
