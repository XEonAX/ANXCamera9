.class public Lcom/android/camera/fragment/live/FragmentLiveMusic;
.super Lcom/android/camera/fragment/dialog/BaseDialogFragment;
.source "FragmentLiveMusic.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnTouchListener;
.implements Lcom/android/camera/fragment/CtaNoticeFragment$OnCtaNoticeClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/live/FragmentLiveMusic$Mp3DownloadCallback;
    }
.end annotation


# static fields
.field private static final LOCAL_MUSIC:I = 0x0

.field private static final MAX_REQUEST_TIME:J = 0xa4cb80L

.field private static final ONLINE_MUSIC:I = 0x1

.field public static final TAG:Ljava/lang/String;


# instance fields
.field private mAdapter:Lcom/android/camera/fragment/music/MusicAdapter;

.field private mCloseImageView:Landroid/widget/ImageView;

.field private mCurrentItemIndex:I

.field private mCurrentMusicLayout:Landroid/widget/LinearLayout;

.field private mCurrentSelectMusic:Lcom/android/camera/fragment/music/LiveMusicInfo;

.field private mCurrentTouchMusic:Lcom/android/camera/fragment/music/LiveMusicInfo;

.field private mHotMusicText:Landroid/widget/TextView;

.field private mIsLoadingAnimationStart:Z

.field private mIsMediaPreparing:Z

.field private mLocalMusicInfoList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/camera/fragment/music/LiveMusicInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mLocalMusicText:Landroid/widget/TextView;

.field private mMediaLoadingProgressBar:Landroid/widget/ProgressBar;

.field private mMediaPlayer:Landroid/media/MediaPlayer;

.field private mMp3DownloadCallback:Lcom/android/camera/fragment/live/FragmentLiveMusic$Mp3DownloadCallback;

.field private mMusicPlayPosition:I

.field private mOldOriginVolumeStream:I

.field private mOnlineMusicInfoList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/camera/fragment/music/LiveMusicInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mPlayingImageView:Landroid/widget/ImageView;

.field private mProgressDialog:Lmiui/app/ProgressDialog;

.field private mRecyclerView:Landroid/support/v7/widget/RecyclerView;

.field private mUpdateLayout:Landroid/widget/LinearLayout;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 63
    const-class v0, Lcom/android/camera/fragment/live/FragmentLiveMusic;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 60
    invoke-direct {p0}, Lcom/android/camera/fragment/dialog/BaseDialogFragment;-><init>()V

    .line 199
    new-instance v0, Lcom/android/camera/fragment/live/FragmentLiveMusic$2;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/live/FragmentLiveMusic$2;-><init>(Lcom/android/camera/fragment/live/FragmentLiveMusic;)V

    iput-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMp3DownloadCallback:Lcom/android/camera/fragment/live/FragmentLiveMusic$Mp3DownloadCallback;

    return-void
.end method

.method private InitOnlineMusicList()V
    .locals 8

    .line 151
    new-instance v0, Lcom/android/camera/network/live/TTLiveMusicResourceRequest;

    invoke-direct {v0}, Lcom/android/camera/network/live/TTLiveMusicResourceRequest;-><init>()V

    .line 152
    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveMusic;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/android/camera/network/NetworkDependencies;->isConnected(Landroid/content/Context;)Z

    move-result v1

    .line 153
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/runing/DataItemRunning;->getLiveMusicFirstRequestTime()J

    move-result-wide v2

    .line 154
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 155
    sub-long/2addr v4, v2

    .line 157
    if-eqz v1, :cond_1

    const-wide/16 v6, 0x0

    cmp-long v1, v2, v6

    if-lez v1, :cond_0

    const-wide/32 v1, 0xa4cb80

    cmp-long v1, v4, v1

    if-gez v1, :cond_0

    goto :goto_0

    .line 166
    :cond_0
    new-instance v1, Lcom/android/camera/fragment/live/FragmentLiveMusic$1;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/live/FragmentLiveMusic$1;-><init>(Lcom/android/camera/fragment/live/FragmentLiveMusic;)V

    invoke-virtual {v0, v1}, Lcom/android/camera/network/live/TTLiveMusicResourceRequest;->execute(Lcom/android/camera/network/net/base/ResponseListener;)V

    goto :goto_2

    .line 159
    :cond_1
    :goto_0
    :try_start_0
    invoke-virtual {v0}, Lcom/android/camera/network/live/TTLiveMusicResourceRequest;->loadFromCache()Ljava/util/List;

    move-result-object v0

    .line 160
    invoke-direct {p0, v0}, Lcom/android/camera/fragment/live/FragmentLiveMusic;->updateOnlineMusicList(Ljava/util/List;)V
    :try_end_0
    .catch Lcom/android/camera/network/live/BaseRequestException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 161
    :catch_0
    move-exception v0

    .line 162
    sget-object v1, Lcom/android/camera/fragment/live/FragmentLiveMusic;->TAG:Ljava/lang/String;

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

    .line 163
    :goto_1
    nop

    .line 188
    :goto_2
    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/fragment/live/FragmentLiveMusic;Ljava/util/List;)V
    .locals 0

    .line 60
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/live/FragmentLiveMusic;->updateOnlineMusicList(Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$100(Lcom/android/camera/fragment/live/FragmentLiveMusic;)V
    .locals 0

    .line 60
    invoke-direct {p0}, Lcom/android/camera/fragment/live/FragmentLiveMusic;->stopDownloadAnimation()V

    return-void
.end method

.method static synthetic access$200(Lcom/android/camera/fragment/live/FragmentLiveMusic;)Landroid/widget/ProgressBar;
    .locals 0

    .line 60
    iget-object p0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMediaLoadingProgressBar:Landroid/widget/ProgressBar;

    return-object p0
.end method

.method static synthetic access$300(Lcom/android/camera/fragment/live/FragmentLiveMusic;)Landroid/widget/ImageView;
    .locals 0

    .line 60
    iget-object p0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mPlayingImageView:Landroid/widget/ImageView;

    return-object p0
.end method

.method static synthetic access$402(Lcom/android/camera/fragment/live/FragmentLiveMusic;Z)Z
    .locals 0

    .line 60
    iput-boolean p1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mIsMediaPreparing:Z

    return p1
.end method

.method private initMusicAdapter()V
    .locals 3

    .line 129
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mOnlineMusicInfoList:Ljava/util/List;

    .line 130
    new-instance v0, Lcom/android/camera/fragment/music/MusicAdapter;

    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveMusic;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mOnlineMusicInfoList:Ljava/util/List;

    invoke-direct {v0, v1, p0, p0, v2}, Lcom/android/camera/fragment/music/MusicAdapter;-><init>(Landroid/content/Context;Landroid/view/View$OnClickListener;Landroid/view/View$OnTouchListener;Ljava/util/List;)V

    iput-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mAdapter:Lcom/android/camera/fragment/music/MusicAdapter;

    .line 131
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mAdapter:Lcom/android/camera/fragment/music/MusicAdapter;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 132
    new-instance v0, Landroid/media/MediaPlayer;

    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 133
    const/4 v0, 0x1

    iput v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mCurrentItemIndex:I

    .line 134
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mIsLoadingAnimationStart:Z

    .line 135
    iput-boolean v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mIsMediaPreparing:Z

    .line 136
    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveMusic;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    invoke-static {v1, v0, p0}, Lcom/android/camera/fragment/CtaNoticeFragment;->checkCta(Landroid/app/FragmentManager;ZLcom/android/camera/fragment/CtaNoticeFragment$OnCtaNoticeClickListener;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 137
    invoke-direct {p0}, Lcom/android/camera/fragment/live/FragmentLiveMusic;->InitOnlineMusicList()V

    .line 139
    :cond_0
    return-void
.end method

.method private startDownloadAnimation()V
    .locals 2

    .line 387
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mIsLoadingAnimationStart:Z

    .line 388
    new-instance v0, Lmiui/app/ProgressDialog;

    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveMusic;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Lmiui/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mProgressDialog:Lmiui/app/ProgressDialog;

    .line 389
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mProgressDialog:Lmiui/app/ProgressDialog;

    const-string v1, "\u6b63\u5728\u4e0b\u8f7d..."

    invoke-virtual {v0, v1}, Lmiui/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 391
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mProgressDialog:Lmiui/app/ProgressDialog;

    invoke-virtual {v0}, Lmiui/app/ProgressDialog;->show()V

    .line 392
    return-void
.end method

.method private startPlayMusic(Lcom/android/camera/fragment/music/LiveMusicInfo;)V
    .locals 4

    .line 212
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mCurrentSelectMusic:Lcom/android/camera/fragment/music/LiveMusicInfo;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mCurrentSelectMusic:Lcom/android/camera/fragment/music/LiveMusicInfo;

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 213
    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->stop()V

    .line 214
    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->reset()V

    .line 215
    return-void

    .line 218
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 219
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    .line 220
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->reset()V

    .line 222
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mPlayingImageView:Landroid/widget/ImageView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 223
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMediaLoadingProgressBar:Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 224
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v1, p1, Lcom/android/camera/fragment/music/LiveMusicInfo;->mPlayUrl:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setDataSource(Ljava/lang/String;)V

    .line 225
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->prepareAsync()V

    .line 226
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mIsMediaPreparing:Z

    .line 227
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    new-instance v1, Lcom/android/camera/fragment/live/FragmentLiveMusic$3;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/live/FragmentLiveMusic$3;-><init>(Lcom/android/camera/fragment/live/FragmentLiveMusic;)V

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 239
    goto :goto_0

    .line 237
    :catch_0
    move-exception v0

    .line 238
    sget-object v1, Lcom/android/camera/fragment/live/FragmentLiveMusic;->TAG:Ljava/lang/String;

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

    .line 240
    :goto_0
    iput-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mCurrentSelectMusic:Lcom/android/camera/fragment/music/LiveMusicInfo;

    .line 241
    return-void
.end method

.method private stopDownloadAnimation()V
    .locals 1

    .line 394
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mIsLoadingAnimationStart:Z

    .line 395
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mProgressDialog:Lmiui/app/ProgressDialog;

    invoke-virtual {v0}, Lmiui/app/ProgressDialog;->dismiss()V

    .line 396
    return-void
.end method

.method private updateOnlineMusicList(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/camera/fragment/music/LiveMusicInfo;",
            ">;)V"
        }
    .end annotation

    .line 191
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mOnlineMusicInfoList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 192
    iget p1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mCurrentItemIndex:I

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 193
    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mUpdateLayout:Landroid/widget/LinearLayout;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 194
    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView;->setVisibility(I)V

    .line 195
    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mAdapter:Lcom/android/camera/fragment/music/MusicAdapter;

    invoke-virtual {p1}, Lcom/android/camera/fragment/music/MusicAdapter;->notifyDataSetChanged()V

    .line 197
    :cond_0
    return-void
.end method


# virtual methods
.method protected initView(Landroid/view/View;)V
    .locals 2

    .line 103
    const v0, 0x7f0d004a

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    iput-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 104
    new-instance v0, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveMusic;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 105
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/LinearLayoutManager;->setOrientation(I)V

    .line 106
    iget-object v1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 107
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    new-instance v1, Lcom/android/camera/fragment/DefaultItemAnimator;

    invoke-direct {v1}, Lcom/android/camera/fragment/DefaultItemAnimator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setItemAnimator(Landroid/support/v7/widget/RecyclerView$ItemAnimator;)V

    .line 109
    const v0, 0x7f0d0047

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mHotMusicText:Landroid/widget/TextView;

    .line 110
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mHotMusicText:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 111
    const v0, 0x7f0d0048

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mLocalMusicText:Landroid/widget/TextView;

    .line 112
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mLocalMusicText:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 113
    const v0, 0x7f0d0046

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mCloseImageView:Landroid/widget/ImageView;

    .line 114
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mCloseImageView:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 115
    const v0, 0x7f0d0049

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    iput-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mUpdateLayout:Landroid/widget/LinearLayout;

    .line 116
    sget-boolean p1, Lcom/android/camera/Util;->isNotchDevice:Z

    if-eqz p1, :cond_0

    .line 118
    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveMusic;->getDialog()Landroid/app/Dialog;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-static {p1}, Lcom/android/camera/lib/compatibility/util/CompatibilityUtils;->setCutoutModeShortEdges(Landroid/view/Window;)V

    .line 120
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveMusic;->getDialog()Landroid/app/Dialog;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    const/16 v0, 0x300

    invoke-virtual {p1, v0}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 122
    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveMusic;->getDialog()Landroid/app/Dialog;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/high16 v0, -0x80000000

    invoke-virtual {p1, v0}, Landroid/view/Window;->addFlags(I)V

    .line 123
    invoke-direct {p0}, Lcom/android/camera/fragment/live/FragmentLiveMusic;->initMusicAdapter()V

    .line 124
    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveMusic;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/app/FragmentActivity;->getVolumeControlStream()I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mOldOriginVolumeStream:I

    .line 125
    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveMusic;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object p1

    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Landroid/support/v4/app/FragmentActivity;->setVolumeControlStream(I)V

    .line 126
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 6

    .line 273
    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveMusic;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0a005a

    invoke-static {v0, v1}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v0

    .line 274
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    const v2, 0x7f0d0085

    const/4 v3, 0x1

    if-eq v1, v2, :cond_1

    const/high16 p1, -0x1000000

    const/high16 v2, 0x3f000000    # 0.5f

    const/high16 v4, 0x3f800000    # 1.0f

    packed-switch v1, :pswitch_data_0

    goto/16 :goto_0

    .line 289
    :pswitch_0
    iget-object v1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mLocalMusicInfoList:Ljava/util/List;

    if-nez v1, :cond_0

    .line 290
    sget-object v1, Lcom/android/camera/module/impl/component/FileUtils;->MUSIC_LOCAL:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveMusic;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v1, v5}, Lcom/android/camera/fragment/music/MusicUtils;->getMusicListFromLocalFolder(Ljava/lang/String;Landroid/content/Context;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mLocalMusicInfoList:Ljava/util/List;

    .line 292
    :cond_0
    iget v1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mCurrentItemIndex:I

    if-ne v1, v3, :cond_7

    .line 293
    const/4 v1, 0x0

    iput v1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mCurrentItemIndex:I

    .line 294
    iget-object v1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mAdapter:Lcom/android/camera/fragment/music/MusicAdapter;

    iget-object v3, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mLocalMusicInfoList:Ljava/util/List;

    invoke-virtual {v1, v3}, Lcom/android/camera/fragment/music/MusicAdapter;->setData(Ljava/util/List;)V

    .line 295
    iget-object v1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mLocalMusicText:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 296
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mLocalMusicText:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setAlpha(F)V

    .line 297
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mHotMusicText:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setAlpha(F)V

    .line 298
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mHotMusicText:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    goto/16 :goto_0

    .line 279
    :pswitch_1
    iget v1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mCurrentItemIndex:I

    if-nez v1, :cond_7

    .line 280
    iput v3, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mCurrentItemIndex:I

    .line 281
    iget-object v1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mAdapter:Lcom/android/camera/fragment/music/MusicAdapter;

    iget-object v3, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mOnlineMusicInfoList:Ljava/util/List;

    invoke-virtual {v1, v3}, Lcom/android/camera/fragment/music/MusicAdapter;->setData(Ljava/util/List;)V

    .line 282
    iget-object v1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mLocalMusicText:Landroid/widget/TextView;

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 283
    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mLocalMusicText:Landroid/widget/TextView;

    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setAlpha(F)V

    .line 284
    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mHotMusicText:Landroid/widget/TextView;

    invoke-virtual {p1, v4}, Landroid/widget/TextView;->setAlpha(F)V

    .line 285
    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mHotMusicText:Landroid/widget/TextView;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    goto/16 :goto_0

    .line 276
    :pswitch_2
    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveMusic;->getFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object p1

    sget-object v0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->TAG:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/android/camera/fragment/FragmentUtils;->removeFragmentByTag(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)Z

    .line 277
    goto/16 :goto_0

    .line 302
    :cond_1
    iget-boolean v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mIsMediaPreparing:Z

    if-eqz v0, :cond_2

    .line 303
    goto/16 :goto_0

    .line 305
    :cond_2
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/fragment/music/LiveMusicInfo;

    .line 306
    iget v1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mCurrentItemIndex:I

    if-ne v1, v3, :cond_4

    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveMusic;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/android/camera/network/NetworkDependencies;->isConnected(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 307
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/android/camera/module/impl/component/FileUtils;->MUSIC_ONLINE:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, v0, Lcom/android/camera/fragment/music/LiveMusicInfo;->mTitle:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ".mp3"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 308
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 309
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_3

    .line 310
    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveMusic;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object p1

    const v0, 0x7f0b0267

    invoke-static {p1, v0, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p1

    .line 311
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 312
    goto :goto_0

    .line 314
    :cond_3
    iput-object v1, v0, Lcom/android/camera/fragment/music/LiveMusicInfo;->mPlayUrl:Ljava/lang/String;

    .line 316
    :cond_4
    iget-object v1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mPlayingImageView:Landroid/widget/ImageView;

    if-eqz v1, :cond_5

    .line 317
    iget-object v1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mPlayingImageView:Landroid/widget/ImageView;

    const v3, 0x7f020102

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    .line 319
    :cond_5
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 320
    iget-object v2, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mPlayingImageView:Landroid/widget/ImageView;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    .line 321
    iput-object v1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mPlayingImageView:Landroid/widget/ImageView;

    .line 323
    :cond_6
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    .line 324
    const v1, 0x7f0d0086

    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ProgressBar;

    iput-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMediaLoadingProgressBar:Landroid/widget/ProgressBar;

    .line 325
    invoke-direct {p0, v0}, Lcom/android/camera/fragment/live/FragmentLiveMusic;->startPlayMusic(Lcom/android/camera/fragment/music/LiveMusicInfo;)V

    .line 326
    nop

    .line 330
    :cond_7
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x7f0d0046
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
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

    .line 96
    const p3, 0x7f040014

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 97
    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/live/FragmentLiveMusic;->initView(Landroid/view/View;)V

    .line 98
    return-object p1
.end method

.method public onDestroy()V
    .locals 2

    .line 265
    invoke-super {p0}, Lcom/android/camera/fragment/dialog/BaseDialogFragment;->onDestroy()V

    .line 266
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 267
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 268
    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveMusic;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    iget v1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mOldOriginVolumeStream:I

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentActivity;->setVolumeControlStream(I)V

    .line 269
    return-void
.end method

.method public onNegativeClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 148
    return-void
.end method

.method public onPause()V
    .locals 1

    .line 245
    invoke-super {p0}, Lcom/android/camera/fragment/dialog/BaseDialogFragment;->onPause()V

    .line 246
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 247
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    .line 248
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMusicPlayPosition:I

    .line 251
    :cond_0
    return-void
.end method

.method public onPositiveClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 143
    invoke-direct {p0}, Lcom/android/camera/fragment/live/FragmentLiveMusic;->InitOnlineMusicList()V

    .line 144
    return-void
.end method

.method public onResume()V
    .locals 2

    .line 255
    invoke-super {p0}, Lcom/android/camera/fragment/dialog/BaseDialogFragment;->onResume()V

    .line 256
    iget v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMusicPlayPosition:I

    if-eqz v0, :cond_0

    .line 257
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget v1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMusicPlayPosition:I

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 258
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 259
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMusicPlayPosition:I

    .line 261
    :cond_0
    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 3

    .line 334
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p2

    const/4 v0, 0x1

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, -0x1

    packed-switch p2, :pswitch_data_0

    goto/16 :goto_1

    .line 348
    :pswitch_0
    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mCurrentMusicLayout:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v2}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 349
    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mCurrentMusicLayout:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 350
    goto/16 :goto_1

    .line 346
    :pswitch_1
    goto/16 :goto_1

    .line 353
    :pswitch_2
    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mCurrentMusicLayout:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v2}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 354
    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mCurrentMusicLayout:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 355
    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mCurrentTouchMusic:Lcom/android/camera/fragment/music/LiveMusicInfo;

    iget-object p1, p1, Lcom/android/camera/fragment/music/LiveMusicInfo;->mPlayUrl:Ljava/lang/String;

    .line 356
    iget p2, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mCurrentItemIndex:I

    if-eqz p2, :cond_1

    .line 357
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object p2, Lcom/android/camera/module/impl/component/FileUtils;->MUSIC_ONLINE:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p2, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mCurrentTouchMusic:Lcom/android/camera/fragment/music/LiveMusicInfo;

    iget-object p2, p2, Lcom/android/camera/fragment/music/LiveMusicInfo;->mTitle:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, ".mp3"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 358
    new-instance p2, Ljava/io/File;

    invoke-direct {p2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 359
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result p2

    if-nez p2, :cond_1

    .line 360
    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveMusic;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lcom/android/camera/network/NetworkDependencies;->isConnected(Landroid/content/Context;)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 361
    invoke-direct {p0}, Lcom/android/camera/fragment/live/FragmentLiveMusic;->startDownloadAnimation()V

    .line 362
    iget-object p2, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mCurrentTouchMusic:Lcom/android/camera/fragment/music/LiveMusicInfo;

    iget-object p2, p2, Lcom/android/camera/fragment/music/LiveMusicInfo;->mPlayUrl:Ljava/lang/String;

    iget-object v1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMp3DownloadCallback:Lcom/android/camera/fragment/live/FragmentLiveMusic$Mp3DownloadCallback;

    invoke-static {p2, p1, v1}, Lcom/android/camera/fragment/music/OkHttpUtils;->downloadMp3Async(Ljava/lang/String;Ljava/lang/String;Lcom/android/camera/fragment/live/FragmentLiveMusic$Mp3DownloadCallback;)V

    goto :goto_0

    .line 364
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveMusic;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object p1

    const p2, 0x7f0b0267

    invoke-static {p1, p2, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p1

    .line 365
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 366
    goto/16 :goto_1

    .line 370
    :cond_1
    :goto_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p2

    const/16 v1, 0xc9

    invoke-virtual {p2, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p2

    check-cast p2, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    .line 371
    invoke-interface {p2, p1}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->onBGMChanged(Ljava/lang/String;)V

    .line 372
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p2

    const/16 v1, 0xac

    .line 373
    invoke-virtual {p2, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p2

    check-cast p2, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 374
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mCurrentTouchMusic:Lcom/android/camera/fragment/music/LiveMusicInfo;

    iget-object v2, v2, Lcom/android/camera/fragment/music/LiveMusicInfo;->mTitle:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "-"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mCurrentTouchMusic:Lcom/android/camera/fragment/music/LiveMusicInfo;

    iget-object v2, v2, Lcom/android/camera/fragment/music/LiveMusicInfo;->mAuthor:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 375
    invoke-static {p1, v1}, Lcom/android/camera/CameraSettings;->setCurrentLiveMusic(Ljava/lang/String;Ljava/lang/String;)V

    .line 376
    new-array p1, v0, [I

    const/4 v1, 0x0

    const/16 v2, 0xf5

    aput v2, p1, v1

    invoke-interface {p2, p1}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->updateConfigItem([I)V

    .line 377
    iget-boolean p1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mIsLoadingAnimationStart:Z

    if-nez p1, :cond_3

    .line 378
    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveMusic;->getFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object p1

    sget-object p2, Lcom/android/camera/fragment/live/FragmentLiveMusic;->TAG:Ljava/lang/String;

    invoke-static {p1, p2}, Lcom/android/camera/fragment/FragmentUtils;->removeFragmentByTag(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)Z

    goto :goto_1

    .line 336
    :pswitch_3
    iget-object p2, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mCurrentMusicLayout:Landroid/widget/LinearLayout;

    if-eqz p2, :cond_2

    .line 337
    iget-object p2, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mCurrentMusicLayout:Landroid/widget/LinearLayout;

    invoke-virtual {p2, v2}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 338
    iget-object p2, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mCurrentMusicLayout:Landroid/widget/LinearLayout;

    invoke-virtual {p2, v1}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 340
    :cond_2
    const p2, 0x7f0d0083

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/LinearLayout;

    iput-object p2, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mCurrentMusicLayout:Landroid/widget/LinearLayout;

    .line 341
    iget-object p2, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mCurrentMusicLayout:Landroid/widget/LinearLayout;

    const v1, -0x333334

    invoke-virtual {p2, v1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 342
    iget-object p2, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mCurrentMusicLayout:Landroid/widget/LinearLayout;

    const/high16 v1, 0x3f000000    # 0.5f

    invoke-virtual {p2, v1}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 343
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/camera/fragment/music/LiveMusicInfo;

    iput-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mCurrentTouchMusic:Lcom/android/camera/fragment/music/LiveMusicInfo;

    .line 344
    nop

    .line 383
    :cond_3
    :goto_1
    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
