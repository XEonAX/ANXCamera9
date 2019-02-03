.class public Lcom/android/camera/fragment/music/FragmentLiveMusicPager;
.super Landroid/support/v4/app/Fragment;
.source "FragmentLiveMusicPager.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnTouchListener;
.implements Lcom/android/camera/fragment/CtaNoticeFragment$OnCtaNoticeClickListener;


# static fields
.field private static final MAX_REQUEST_TIME:J = 0xa4cb80L

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mCurrentSelectMusic:Lcom/android/camera/fragment/music/LiveMusicInfo;

.field private mCurrentSelectedMusicLayout:Landroid/widget/LinearLayout;

.field private mIsDestroyed:Z

.field private mIsLoadingAnimationStart:Z

.field private mIsMediaPreparing:Z

.field private mItemType:I

.field private mLiveMusicInfoList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/camera/fragment/music/LiveMusicInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mMediaLoadingProgressBar:Landroid/widget/ProgressBar;

.field private mMediaPlayer:Landroid/media/MediaPlayer;

.field private mMp3DownloadCallback:Lcom/android/camera/fragment/music/FragmentLiveMusic$Mp3DownloadCallback;

.field private mMusicAdapter:Lcom/android/camera/fragment/music/MusicAdapter;

.field private mMusicPlayPosition:I

.field private mNetworkExceptionLayout:Landroid/widget/LinearLayout;

.field private mPlayingImageView:Landroid/widget/ImageView;

.field private mProgressDialog:Lmiui/app/ProgressDialog;

.field private mRecyclerView:Landroid/support/v7/widget/RecyclerView;

.field private mUpdateLayout:Landroid/widget/LinearLayout;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 54
    const-class v0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 49
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    .line 176
    new-instance v0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager$2;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager$2;-><init>(Lcom/android/camera/fragment/music/FragmentLiveMusicPager;)V

    iput-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mMp3DownloadCallback:Lcom/android/camera/fragment/music/FragmentLiveMusic$Mp3DownloadCallback;

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/fragment/music/FragmentLiveMusicPager;)V
    .locals 0

    .line 49
    invoke-direct {p0}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->loadOnlineHotMusic()V

    return-void
.end method

.method static synthetic access$100(Lcom/android/camera/fragment/music/FragmentLiveMusicPager;)V
    .locals 0

    .line 49
    invoke-direct {p0}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->stopDownloadAnimation()V

    return-void
.end method

.method static synthetic access$1002(Lcom/android/camera/fragment/music/FragmentLiveMusicPager;Z)Z
    .locals 0

    .line 49
    iput-boolean p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mIsMediaPreparing:Z

    return p1
.end method

.method static synthetic access$1100(Lcom/android/camera/fragment/music/FragmentLiveMusicPager;)Landroid/media/MediaPlayer;
    .locals 0

    .line 49
    iget-object p0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mMediaPlayer:Landroid/media/MediaPlayer;

    return-object p0
.end method

.method static synthetic access$200(Lcom/android/camera/fragment/music/FragmentLiveMusicPager;)Lcom/android/camera/fragment/music/LiveMusicInfo;
    .locals 0

    .line 49
    iget-object p0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mCurrentSelectMusic:Lcom/android/camera/fragment/music/LiveMusicInfo;

    return-object p0
.end method

.method static synthetic access$300(Lcom/android/camera/fragment/music/FragmentLiveMusicPager;Lcom/android/camera/fragment/music/LiveMusicInfo;)V
    .locals 0

    .line 49
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->onSelectedMusic(Lcom/android/camera/fragment/music/LiveMusicInfo;)V

    return-void
.end method

.method static synthetic access$400()Ljava/lang/String;
    .locals 1

    .line 49
    sget-object v0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$500(Lcom/android/camera/fragment/music/FragmentLiveMusicPager;)Landroid/widget/LinearLayout;
    .locals 0

    .line 49
    iget-object p0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mCurrentSelectedMusicLayout:Landroid/widget/LinearLayout;

    return-object p0
.end method

.method static synthetic access$600(Lcom/android/camera/fragment/music/FragmentLiveMusicPager;Ljava/util/List;)V
    .locals 0

    .line 49
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->updateAdapter(Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$700(Lcom/android/camera/fragment/music/FragmentLiveMusicPager;)Landroid/widget/LinearLayout;
    .locals 0

    .line 49
    iget-object p0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mNetworkExceptionLayout:Landroid/widget/LinearLayout;

    return-object p0
.end method

.method static synthetic access$800(Lcom/android/camera/fragment/music/FragmentLiveMusicPager;)Landroid/widget/ProgressBar;
    .locals 0

    .line 49
    iget-object p0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mMediaLoadingProgressBar:Landroid/widget/ProgressBar;

    return-object p0
.end method

.method static synthetic access$900(Lcom/android/camera/fragment/music/FragmentLiveMusicPager;)Landroid/widget/ImageView;
    .locals 0

    .line 49
    iget-object p0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mPlayingImageView:Landroid/widget/ImageView;

    return-object p0
.end method

.method private initAdapter()V
    .locals 4

    .line 110
    iget v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mItemType:I

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 111
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mLiveMusicInfoList:Ljava/util/List;

    .line 112
    new-instance v0, Lcom/android/camera/fragment/music/MusicAdapter;

    invoke-virtual {p0}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mLiveMusicInfoList:Ljava/util/List;

    invoke-direct {v0, v2, p0, p0, v3}, Lcom/android/camera/fragment/music/MusicAdapter;-><init>(Landroid/content/Context;Landroid/view/View$OnClickListener;Landroid/view/View$OnTouchListener;Ljava/util/List;)V

    iput-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mMusicAdapter:Lcom/android/camera/fragment/music/MusicAdapter;

    .line 113
    invoke-virtual {p0}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    invoke-static {v0, v1, p0}, Lcom/android/camera/fragment/CtaNoticeFragment;->checkCta(Landroid/app/FragmentManager;ZLcom/android/camera/fragment/CtaNoticeFragment$OnCtaNoticeClickListener;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 114
    invoke-direct {p0}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->loadOnlineHotMusic()V

    goto :goto_0

    .line 117
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mNetworkExceptionLayout:Landroid/widget/LinearLayout;

    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 118
    iget-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mUpdateLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 119
    iget-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setVisibility(I)V

    .line 120
    sget-object v0, Lcom/android/camera/module/impl/component/FileUtils;->MUSIC_LOCAL:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/fragment/music/MusicUtils;->getMusicListFromLocalFolder(Ljava/lang/String;Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mLiveMusicInfoList:Ljava/util/List;

    .line 121
    new-instance v0, Lcom/android/camera/fragment/music/MusicAdapter;

    invoke-virtual {p0}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mLiveMusicInfoList:Ljava/util/List;

    invoke-direct {v0, v1, p0, p0, v2}, Lcom/android/camera/fragment/music/MusicAdapter;-><init>(Landroid/content/Context;Landroid/view/View$OnClickListener;Landroid/view/View$OnTouchListener;Ljava/util/List;)V

    iput-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mMusicAdapter:Lcom/android/camera/fragment/music/MusicAdapter;

    .line 123
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mMusicAdapter:Lcom/android/camera/fragment/music/MusicAdapter;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 124
    return-void
.end method

.method private loadOnlineHotMusic()V
    .locals 8

    .line 203
    new-instance v0, Lcom/android/camera/network/live/TTLiveMusicResourceRequest;

    invoke-direct {v0}, Lcom/android/camera/network/live/TTLiveMusicResourceRequest;-><init>()V

    .line 204
    invoke-virtual {p0}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/android/camera/network/NetworkDependencies;->isConnected(Landroid/content/Context;)Z

    move-result v1

    .line 205
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/runing/DataItemRunning;->getLiveMusicFirstRequestTime()J

    move-result-wide v2

    .line 206
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 207
    sub-long/2addr v4, v2

    .line 208
    if-eqz v1, :cond_1

    const-wide/16 v6, 0x0

    cmp-long v1, v2, v6

    if-lez v1, :cond_0

    const-wide/32 v1, 0xa4cb80

    cmp-long v1, v4, v1

    if-gez v1, :cond_0

    goto :goto_0

    .line 219
    :cond_0
    new-instance v1, Lcom/android/camera/fragment/music/FragmentLiveMusicPager$3;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager$3;-><init>(Lcom/android/camera/fragment/music/FragmentLiveMusicPager;)V

    invoke-virtual {v0, v1}, Lcom/android/camera/network/live/TTLiveMusicResourceRequest;->execute(Lcom/android/camera/network/net/base/ResponseListener;)V

    goto :goto_2

    .line 210
    :cond_1
    :goto_0
    :try_start_0
    invoke-virtual {v0}, Lcom/android/camera/network/live/TTLiveMusicResourceRequest;->loadFromCache()Ljava/util/List;

    move-result-object v0

    .line 211
    invoke-direct {p0, v0}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->updateAdapter(Ljava/util/List;)V
    :try_end_0
    .catch Lcom/android/camera/network/live/BaseRequestException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 212
    :catch_0
    move-exception v0

    .line 214
    iget-object v1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mNetworkExceptionLayout:Landroid/widget/LinearLayout;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 215
    sget-object v1, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "request online music failed "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Lcom/android/camera/network/live/BaseRequestException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 216
    :goto_1
    nop

    .line 249
    :goto_2
    return-void
.end method

.method private onSelectedMusic(Lcom/android/camera/fragment/music/LiveMusicInfo;)V
    .locals 4

    .line 355
    iget-object v0, p1, Lcom/android/camera/fragment/music/LiveMusicInfo;->mPlayUrl:Ljava/lang/String;

    .line 356
    iget v1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mItemType:I

    if-nez v1, :cond_0

    .line 357
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/android/camera/module/impl/component/FileUtils;->MUSIC_ONLINE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p1, Lcom/android/camera/fragment/music/LiveMusicInfo;->mTitle:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ".mp3"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 359
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xc9

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    .line 361
    if-eqz v1, :cond_1

    .line 362
    invoke-interface {v1, v0}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->onBGMChanged(Ljava/lang/String;)V

    .line 364
    :cond_1
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xac

    .line 365
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 366
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p1, Lcom/android/camera/fragment/music/LiveMusicInfo;->mTitle:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "-"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p1, Lcom/android/camera/fragment/music/LiveMusicInfo;->mAuthor:Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 367
    invoke-static {v0, p1}, Lcom/android/camera/CameraSettings;->setCurrentLiveMusic(Ljava/lang/String;Ljava/lang/String;)V

    .line 368
    new-instance p1, Lcom/android/camera/fragment/music/FragmentLiveMusicPager$4;

    invoke-direct {p1, p0, v1}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager$4;-><init>(Lcom/android/camera/fragment/music/FragmentLiveMusicPager;Lcom/android/camera/protocol/ModeProtocol$TopAlert;)V

    invoke-static {p1}, Lio/reactivex/Completable;->fromAction(Lio/reactivex/functions/Action;)Lio/reactivex/Completable;

    move-result-object p1

    .line 375
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Completable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 376
    return-void
.end method

.method private startDownloadAnimation()V
    .locals 3

    .line 422
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mIsLoadingAnimationStart:Z

    .line 423
    new-instance v0, Lmiui/app/ProgressDialog;

    invoke-virtual {p0}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Lmiui/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mProgressDialog:Lmiui/app/ProgressDialog;

    .line 424
    const v0, 0x7f09026b

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 425
    iget-object v1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mProgressDialog:Lmiui/app/ProgressDialog;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lmiui/app/ProgressDialog;->setCancelable(Z)V

    .line 426
    iget-object v1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mProgressDialog:Lmiui/app/ProgressDialog;

    invoke-virtual {v1, v0}, Lmiui/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 428
    iget-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mProgressDialog:Lmiui/app/ProgressDialog;

    invoke-virtual {v0}, Lmiui/app/ProgressDialog;->show()V

    .line 429
    return-void
.end method

.method private startDownloadMuusic(Lcom/android/camera/fragment/music/LiveMusicInfo;)V
    .locals 3

    .line 326
    iget-object v0, p1, Lcom/android/camera/fragment/music/LiveMusicInfo;->mPlayUrl:Ljava/lang/String;

    .line 327
    iget v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mItemType:I

    if-nez v0, :cond_2

    .line 328
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/android/camera/module/impl/component/FileUtils;->MUSIC_ONLINE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p1, Lcom/android/camera/fragment/music/LiveMusicInfo;->mTitle:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ".mp3"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 329
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 330
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_2

    .line 331
    invoke-virtual {p0}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/android/camera/network/NetworkDependencies;->isConnected(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 332
    invoke-direct {p0}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->startDownloadAnimation()V

    .line 333
    iget-object v1, p1, Lcom/android/camera/fragment/music/LiveMusicInfo;->mPlayUrl:Ljava/lang/String;

    iget-object v2, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mMp3DownloadCallback:Lcom/android/camera/fragment/music/FragmentLiveMusic$Mp3DownloadCallback;

    invoke-static {v1, v0, v2}, Lcom/android/camera/fragment/music/OkHttpUtils;->downloadMp3Async(Ljava/lang/String;Ljava/lang/String;Lcom/android/camera/fragment/music/FragmentLiveMusic$Mp3DownloadCallback;)V

    goto :goto_0

    .line 335
    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mCurrentSelectedMusicLayout:Landroid/widget/LinearLayout;

    if-eqz p1, :cond_1

    .line 336
    iget-object p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mCurrentSelectedMusicLayout:Landroid/widget/LinearLayout;

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 337
    iget-object p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mCurrentSelectedMusicLayout:Landroid/widget/LinearLayout;

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 339
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object p1

    const v0, 0x7f09026c

    const/4 v1, 0x1

    invoke-static {p1, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p1

    .line 340
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 341
    return-void

    .line 345
    :cond_2
    :goto_0
    iput-object p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mCurrentSelectMusic:Lcom/android/camera/fragment/music/LiveMusicInfo;

    .line 346
    iget-boolean v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mIsLoadingAnimationStart:Z

    if-nez v0, :cond_3

    .line 347
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->onSelectedMusic(Lcom/android/camera/fragment/music/LiveMusicInfo;)V

    .line 348
    invoke-virtual {p0}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->getParentFragment()Landroid/support/v4/app/Fragment;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/app/Fragment;->getFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object p1

    sget-object v0, Lcom/android/camera/fragment/music/FragmentLiveMusic;->TAG:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/android/camera/fragment/FragmentUtils;->removeFragmentByTag(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)Z

    .line 350
    :cond_3
    return-void
.end method

.method private startPlayMusic(Lcom/android/camera/fragment/music/LiveMusicInfo;)V
    .locals 4

    .line 379
    if-eqz p1, :cond_3

    iget-object v0, p1, Lcom/android/camera/fragment/music/LiveMusicInfo;->mPlayUrl:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    iget-boolean v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mIsDestroyed:Z

    if-eqz v0, :cond_0

    goto/16 :goto_1

    .line 382
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mCurrentSelectMusic:Lcom/android/camera/fragment/music/LiveMusicInfo;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mCurrentSelectMusic:Lcom/android/camera/fragment/music/LiveMusicInfo;

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 383
    iget-object p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->stop()V

    .line 384
    iget-object p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->reset()V

    .line 385
    return-void

    .line 388
    :cond_1
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 389
    iget-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    .line 390
    iget-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->reset()V

    .line 392
    :cond_2
    iget-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mPlayingImageView:Landroid/widget/ImageView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 393
    iget-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mMediaLoadingProgressBar:Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 394
    iget-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v1, p1, Lcom/android/camera/fragment/music/LiveMusicInfo;->mPlayUrl:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setDataSource(Ljava/lang/String;)V

    .line 395
    iget-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->prepareAsync()V

    .line 396
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mIsMediaPreparing:Z

    .line 397
    iget-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mMediaPlayer:Landroid/media/MediaPlayer;

    new-instance v1, Lcom/android/camera/fragment/music/FragmentLiveMusicPager$5;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager$5;-><init>(Lcom/android/camera/fragment/music/FragmentLiveMusicPager;)V

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 407
    iget-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mMediaPlayer:Landroid/media/MediaPlayer;

    new-instance v1, Lcom/android/camera/fragment/music/FragmentLiveMusicPager$6;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager$6;-><init>(Lcom/android/camera/fragment/music/FragmentLiveMusicPager;)V

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 417
    goto :goto_0

    .line 415
    :catch_0
    move-exception v0

    .line 416
    sget-object v1, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mediaplayer play failed "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 418
    :goto_0
    iput-object p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mCurrentSelectMusic:Lcom/android/camera/fragment/music/LiveMusicInfo;

    .line 419
    return-void

    .line 380
    :cond_3
    :goto_1
    return-void
.end method

.method private stopDownloadAnimation()V
    .locals 1

    .line 431
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mIsLoadingAnimationStart:Z

    .line 432
    iget-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mProgressDialog:Lmiui/app/ProgressDialog;

    invoke-virtual {v0}, Lmiui/app/ProgressDialog;->dismiss()V

    .line 433
    return-void
.end method

.method private updateAdapter(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/camera/fragment/music/LiveMusicInfo;",
            ">;)V"
        }
    .end annotation

    .line 252
    iget-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mLiveMusicInfoList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 253
    iget p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mItemType:I

    if-nez p1, :cond_0

    .line 254
    iget-object p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mUpdateLayout:Landroid/widget/LinearLayout;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 255
    iget-object p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mNetworkExceptionLayout:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 256
    iget-object p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView;->setVisibility(I)V

    .line 258
    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mMusicAdapter:Lcom/android/camera/fragment/music/MusicAdapter;

    invoke-virtual {p1}, Lcom/android/camera/fragment/music/MusicAdapter;->notifyDataSetChanged()V

    .line 259
    return-void
.end method


# virtual methods
.method protected initView(Landroid/view/View;)V
    .locals 2

    .line 86
    const v0, 0x7f0d005c

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    iput-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 87
    new-instance v0, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 88
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/LinearLayoutManager;->setOrientation(I)V

    .line 89
    iget-object v1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 90
    iget-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    new-instance v1, Lcom/android/camera/fragment/DefaultItemAnimator;

    invoke-direct {v1}, Lcom/android/camera/fragment/DefaultItemAnimator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setItemAnimator(Landroid/support/v7/widget/RecyclerView$ItemAnimator;)V

    .line 91
    const v0, 0x7f0d005b

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mUpdateLayout:Landroid/widget/LinearLayout;

    .line 92
    const v0, 0x7f0d005d

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    iput-object p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mNetworkExceptionLayout:Landroid/widget/LinearLayout;

    .line 93
    iget-object p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mNetworkExceptionLayout:Landroid/widget/LinearLayout;

    new-instance v0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager$1;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager$1;-><init>(Lcom/android/camera/fragment/music/FragmentLiveMusicPager;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 102
    invoke-virtual {p0}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "ITEM_TYPE"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mItemType:I

    .line 103
    new-instance p1, Landroid/media/MediaPlayer;

    invoke-direct {p1}, Landroid/media/MediaPlayer;-><init>()V

    iput-object p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 104
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mIsLoadingAnimationStart:Z

    .line 105
    iput-boolean p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mIsMediaPreparing:Z

    .line 106
    invoke-direct {p0}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->initAdapter()V

    .line 107
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 263
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f0d005d

    if-eq v0, v1, :cond_6

    const v1, 0x7f0d008e

    if-eq v0, v1, :cond_0

    goto/16 :goto_0

    .line 265
    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mIsMediaPreparing:Z

    if-eqz v0, :cond_1

    .line 266
    goto/16 :goto_0

    .line 268
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/fragment/music/LiveMusicInfo;

    .line 269
    iget v2, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mItemType:I

    if-nez v2, :cond_3

    invoke-virtual {p0}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/android/camera/network/NetworkDependencies;->isConnected(Landroid/content/Context;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 270
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/android/camera/module/impl/component/FileUtils;->MUSIC_ONLINE:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, v0, Lcom/android/camera/fragment/music/LiveMusicInfo;->mTitle:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ".mp3"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 271
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 272
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_2

    .line 273
    invoke-virtual {p0}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object p1

    const v0, 0x7f09026c

    const/4 v1, 0x1

    invoke-static {p1, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p1

    .line 274
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 275
    goto :goto_0

    .line 277
    :cond_2
    iput-object v2, v0, Lcom/android/camera/fragment/music/LiveMusicInfo;->mPlayUrl:Ljava/lang/String;

    .line 279
    :cond_3
    iget-object v2, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mPlayingImageView:Landroid/widget/ImageView;

    if-eqz v2, :cond_4

    .line 280
    iget-object v2, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mPlayingImageView:Landroid/widget/ImageView;

    const v3, 0x7f02010b

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    .line 282
    :cond_4
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 283
    iget-object v2, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mPlayingImageView:Landroid/widget/ImageView;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    .line 284
    iput-object v1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mPlayingImageView:Landroid/widget/ImageView;

    .line 286
    :cond_5
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    .line 287
    const v1, 0x7f0d008f

    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ProgressBar;

    iput-object p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mMediaLoadingProgressBar:Landroid/widget/ProgressBar;

    .line 288
    invoke-direct {p0, v0}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->startPlayMusic(Lcom/android/camera/fragment/music/LiveMusicInfo;)V

    .line 289
    goto :goto_0

    .line 291
    :cond_6
    iget-object p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mUpdateLayout:Landroid/widget/LinearLayout;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 292
    iget-object p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mNetworkExceptionLayout:Landroid/widget/LinearLayout;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 293
    invoke-direct {p0}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->loadOnlineHotMusic()V

    .line 294
    nop

    .line 298
    :goto_0
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1
    .param p2    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .line 80
    const p3, 0x7f04001d

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 81
    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->initView(Landroid/view/View;)V

    .line 82
    return-object p1
.end method

.method public onDestroy()V
    .locals 2

    .line 147
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onDestroy()V

    .line 148
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mIsDestroyed:Z

    .line 149
    iget-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 150
    iget-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 151
    return-void
.end method

.method public onNegativeClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 172
    iget-object p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mUpdateLayout:Landroid/widget/LinearLayout;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 173
    iget-object p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mNetworkExceptionLayout:Landroid/widget/LinearLayout;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 174
    return-void
.end method

.method public onPause()V
    .locals 1

    .line 128
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onPause()V

    .line 129
    iget-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 130
    iget-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    .line 131
    iget-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mMusicPlayPosition:I

    .line 133
    :cond_0
    return-void
.end method

.method public onPositiveClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 167
    invoke-direct {p0}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->loadOnlineHotMusic()V

    .line 168
    return-void
.end method

.method public onResume()V
    .locals 2

    .line 137
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onResume()V

    .line 138
    iget v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mMusicPlayPosition:I

    if-eqz v0, :cond_0

    .line 139
    iget-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget v1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mMusicPlayPosition:I

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 140
    iget-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 141
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mMusicPlayPosition:I

    .line 143
    :cond_0
    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1

    .line 302
    const v0, 0x7f0d008c

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mCurrentSelectedMusicLayout:Landroid/widget/LinearLayout;

    .line 303
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p2

    packed-switch p2, :pswitch_data_0

    goto :goto_0

    .line 311
    :pswitch_0
    iget-object p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mCurrentSelectedMusicLayout:Landroid/widget/LinearLayout;

    const/4 p2, -0x1

    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 312
    iget-object p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mCurrentSelectedMusicLayout:Landroid/widget/LinearLayout;

    const/high16 p2, 0x3f800000    # 1.0f

    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 313
    goto :goto_0

    .line 309
    :pswitch_1
    goto :goto_0

    .line 316
    :pswitch_2
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/camera/fragment/music/LiveMusicInfo;

    .line 317
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->startDownloadMuusic(Lcom/android/camera/fragment/music/LiveMusicInfo;)V

    .line 318
    goto :goto_0

    .line 305
    :pswitch_3
    iget-object p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mCurrentSelectedMusicLayout:Landroid/widget/LinearLayout;

    const p2, -0x333334

    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 306
    iget-object p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mCurrentSelectedMusicLayout:Landroid/widget/LinearLayout;

    const/high16 p2, 0x3f000000    # 0.5f

    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 307
    nop

    .line 322
    :goto_0
    const/4 p1, 0x1

    return p1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setUserVisibleHint(Z)V
    .locals 1

    .line 155
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->setUserVisibleHint(Z)V

    .line 156
    if-nez p1, :cond_0

    .line 157
    iget-object p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 158
    iget-object p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->stop()V

    .line 159
    iget-object p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->reset()V

    .line 160
    iget-object p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->mPlayingImageView:Landroid/widget/ImageView;

    const v0, 0x7f02010b

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    .line 163
    :cond_0
    return-void
.end method
