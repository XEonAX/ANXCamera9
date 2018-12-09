.class Lcom/android/camera/ThumbnailUpdater$SaveThumbnailTask;
.super Landroid/os/AsyncTask;
.source "ThumbnailUpdater.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/ThumbnailUpdater;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SaveThumbnailTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Lcom/android/camera/Thumbnail;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/ThumbnailUpdater;


# direct methods
.method private constructor <init>(Lcom/android/camera/ThumbnailUpdater;)V
    .locals 0

    .line 177
    iput-object p1, p0, Lcom/android/camera/ThumbnailUpdater$SaveThumbnailTask;->this$0:Lcom/android/camera/ThumbnailUpdater;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/camera/ThumbnailUpdater;Lcom/android/camera/ThumbnailUpdater$1;)V
    .locals 0

    .line 177
    invoke-direct {p0, p1}, Lcom/android/camera/ThumbnailUpdater$SaveThumbnailTask;-><init>(Lcom/android/camera/ThumbnailUpdater;)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 177
    check-cast p1, [Lcom/android/camera/Thumbnail;

    invoke-virtual {p0, p1}, Lcom/android/camera/ThumbnailUpdater$SaveThumbnailTask;->doInBackground([Lcom/android/camera/Thumbnail;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Lcom/android/camera/Thumbnail;)Ljava/lang/Void;
    .locals 4

    .line 180
    array-length v0, p1

    .line 181
    iget-object v1, p0, Lcom/android/camera/ThumbnailUpdater$SaveThumbnailTask;->this$0:Lcom/android/camera/ThumbnailUpdater;

    invoke-static {v1}, Lcom/android/camera/ThumbnailUpdater;->access$000(Lcom/android/camera/ThumbnailUpdater;)Lcom/android/camera/ActivityBase;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/ActivityBase;->getFilesDir()Ljava/io/File;

    move-result-object v1

    .line 182
    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_0

    .line 183
    aget-object v3, p1, v2

    invoke-virtual {v3, v1}, Lcom/android/camera/Thumbnail;->saveLastThumbnailToFile(Ljava/io/File;)V

    .line 182
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 185
    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method
