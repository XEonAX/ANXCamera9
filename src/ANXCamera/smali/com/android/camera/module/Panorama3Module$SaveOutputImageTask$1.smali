.class Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask$1;
.super Ljava/lang/Object;
.source "Panorama3Module.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->onPostExecute(Ljava/lang/Integer;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;


# direct methods
.method constructor <init>(Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;)V
    .locals 0

    .line 1444
    iput-object p1, p0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask$1;->this$1:Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1447
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask$1;->this$1:Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;

    iget-object v0, v0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-virtual {v0}, Lcom/android/camera/module/Panorama3Module;->handlePendingScreenSlide()V

    .line 1448
    return-void
.end method
