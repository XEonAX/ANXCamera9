.class Lcom/android/camera/fragment/FragmentFullScreen$5;
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

    .line 361
    iput-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen$5;->this$0:Lcom/android/camera/fragment/FragmentFullScreen;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCallback(IIFLjava/lang/String;)V
    .locals 0

    .line 364
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen$5;->this$0:Lcom/android/camera/fragment/FragmentFullScreen;

    invoke-static {p1}, Lcom/android/camera/fragment/FragmentFullScreen;->access$400(Lcom/android/camera/fragment/FragmentFullScreen;)V

    .line 365
    return-void
.end method
