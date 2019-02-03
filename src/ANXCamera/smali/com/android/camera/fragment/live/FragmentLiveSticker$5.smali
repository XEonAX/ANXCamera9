.class Lcom/android/camera/fragment/live/FragmentLiveSticker$5;
.super Ljava/lang/Object;
.source "FragmentLiveSticker.java"

# interfaces
.implements Lcom/android/camera/network/net/base/ResponseListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/live/FragmentLiveSticker;->updateData()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/live/FragmentLiveSticker;)V
    .locals 0

    .line 353
    iput-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$5;->this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs onResponse([Ljava/lang/Object;)V
    .locals 4

    .line 356
    const/4 v0, 0x0

    aget-object p1, p1, v0

    check-cast p1, Ljava/util/List;

    .line 357
    new-instance v1, Lcom/android/camera/fragment/live/FragmentLiveSticker$5$2;

    invoke-direct {v1, p0, p1}, Lcom/android/camera/fragment/live/FragmentLiveSticker$5$2;-><init>(Lcom/android/camera/fragment/live/FragmentLiveSticker$5;Ljava/util/List;)V

    invoke-static {v1}, Lio/reactivex/Completable;->fromAction(Lio/reactivex/functions/Action;)Lio/reactivex/Completable;

    move-result-object v1

    .line 383
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->io()Lio/reactivex/Scheduler;

    move-result-object v2

    invoke-virtual {v1, v2}, Lio/reactivex/Completable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Completable;

    move-result-object v1

    .line 384
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v2

    invoke-virtual {v1, v2}, Lio/reactivex/Completable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Completable;

    move-result-object v1

    new-instance v2, Lcom/android/camera/fragment/live/FragmentLiveSticker$5$1;

    invoke-direct {v2, p0, p1}, Lcom/android/camera/fragment/live/FragmentLiveSticker$5$1;-><init>(Lcom/android/camera/fragment/live/FragmentLiveSticker$5;Ljava/util/List;)V

    .line 385
    invoke-virtual {v1, v2}, Lio/reactivex/Completable;->subscribe(Lio/reactivex/functions/Action;)Lio/reactivex/disposables/Disposable;

    .line 391
    const-string v1, "FragmentLiveSticker"

    const-string v2, "getStickerList %d "

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    if-nez p1, :cond_0

    const/4 p1, -0x1

    goto :goto_0

    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    :goto_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v3, v0

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 392
    return-void
.end method

.method public onResponseError(Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 6

    .line 396
    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 397
    invoke-static {}, Lcom/android/camera/fragment/live/FragmentLiveSticker;->access$200()[Lcom/android/camera/sticker/LiveStickerInfo;

    move-result-object v0

    array-length v0, v0

    rsub-int/lit8 v0, v0, 0xa

    const/4 v1, 0x1

    add-int/2addr v0, v1

    .line 398
    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v0, :cond_0

    .line 399
    new-instance v4, Lcom/android/camera/sticker/LiveStickerInfo;

    invoke-direct {v4}, Lcom/android/camera/sticker/LiveStickerInfo;-><init>()V

    .line 400
    const v5, 0x7f020122

    iput v5, v4, Lcom/android/camera/sticker/LiveStickerInfo;->iconId:I

    .line 401
    const-string v5, "https://mi.com/"

    iput-object v5, v4, Lcom/android/camera/sticker/LiveStickerInfo;->url:Ljava/lang/String;

    .line 402
    const-string v5, "0123456789abcdef0123456789abcdef"

    iput-object v5, v4, Lcom/android/camera/sticker/LiveStickerInfo;->hash:Ljava/lang/String;

    .line 403
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/android/camera/sticker/LiveStickerInfo;->id:Ljava/lang/String;

    .line 404
    invoke-interface {p3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 398
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 406
    :cond_0
    invoke-static {}, Lio/reactivex/Completable;->complete()Lio/reactivex/Completable;

    move-result-object v0

    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v3

    invoke-virtual {v0, v3}, Lio/reactivex/Completable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Completable;

    move-result-object v0

    new-instance v3, Lcom/android/camera/fragment/live/FragmentLiveSticker$5$3;

    invoke-direct {v3, p0, p3}, Lcom/android/camera/fragment/live/FragmentLiveSticker$5$3;-><init>(Lcom/android/camera/fragment/live/FragmentLiveSticker$5;Ljava/util/List;)V

    invoke-virtual {v0, v3}, Lio/reactivex/Completable;->subscribe(Lio/reactivex/functions/Action;)Lio/reactivex/disposables/Disposable;

    .line 412
    const-string p3, "FragmentLiveSticker"

    const-string v0, "errorCode %d msg: %s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    iget p1, p1, Lcom/android/camera/network/net/base/ErrorCode;->CODE:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v3, v2

    aput-object p2, v3, v1

    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p3, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 413
    return-void
.end method
