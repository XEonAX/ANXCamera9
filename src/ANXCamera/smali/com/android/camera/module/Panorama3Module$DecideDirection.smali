.class Lcom/android/camera/module/Panorama3Module$DecideDirection;
.super Lcom/android/camera/panorama/PanoramaState;
.source "Panorama3Module.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/Panorama3Module;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DecideDirection"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;
    }
.end annotation


# instance fields
.field private mHasSubmit:Z

.field final synthetic this$0:Lcom/android/camera/module/Panorama3Module;


# direct methods
.method private constructor <init>(Lcom/android/camera/module/Panorama3Module;)V
    .locals 0

    .line 1777
    iput-object p1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-direct {p0}, Lcom/android/camera/panorama/PanoramaState;-><init>()V

    .line 1778
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection;->mHasSubmit:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/camera/module/Panorama3Module;Lcom/android/camera/module/Panorama3Module$1;)V
    .locals 0

    .line 1777
    invoke-direct {p0, p1}, Lcom/android/camera/module/Panorama3Module$DecideDirection;-><init>(Lcom/android/camera/module/Panorama3Module;)V

    return-void
.end method


# virtual methods
.method public onSaveImage(Lcom/android/camera/panorama/CaptureImage;)Z
    .locals 3

    .line 1963
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v0, p1}, Lcom/android/camera/module/Panorama3Module;->access$4100(Lcom/android/camera/module/Panorama3Module;Lcom/android/camera/panorama/CaptureImage;)V

    .line 1964
    iget-boolean p1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection;->mHasSubmit:Z

    const/4 v0, 0x1

    if-nez p1, :cond_0

    .line 1965
    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$100()Ljava/lang/String;

    move-result-object p1

    const-string v1, "submit DecideDirectionAttach"

    invoke-static {p1, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1966
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {p1}, Lcom/android/camera/module/Panorama3Module;->access$4300(Lcom/android/camera/module/Panorama3Module;)Ljava/util/concurrent/ExecutorService;

    move-result-object p1

    new-instance v1, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;-><init>(Lcom/android/camera/module/Panorama3Module$DecideDirection;Lcom/android/camera/module/Panorama3Module$1;)V

    invoke-interface {p1, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 1967
    iput-boolean v0, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection;->mHasSubmit:Z

    .line 1970
    :cond_0
    return v0
.end method
