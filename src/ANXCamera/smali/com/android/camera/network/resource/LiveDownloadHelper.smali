.class public interface abstract Lcom/android/camera/network/resource/LiveDownloadHelper;
.super Ljava/lang/Object;
.source "LiveDownloadHelper.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/android/camera/network/resource/LiveResource;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract createDownloadRequest(Lcom/android/camera/network/resource/LiveResource;)Lcom/android/camera/network/download/Request;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lcom/android/camera/network/download/Request;"
        }
    .end annotation
.end method

.method public abstract isDownloaded(Lcom/android/camera/network/resource/LiveResource;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation
.end method
