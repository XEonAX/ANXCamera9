.class public Lcom/android/camera/fragment/live/FragmentLiveMusic;
.super Lcom/android/camera/fragment/dialog/BaseDialogFragment;
.source "FragmentLiveMusic.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/live/FragmentLiveMusic$Mp3DownloadCallback;
    }
.end annotation


# static fields
.field private static final LOCAL_MUSIC:I = 0x0

.field private static final ONLINE_MUSIC:I = 0x1

.field public static final TAG:Ljava/lang/String;


# instance fields
.field private mAdapter:Lcom/android/camera/fragment/music/MusicAdapter;

.field private mCloseImageView:Landroid/widget/ImageView;

.field private mCurrentItemIndex:I

.field private mCurrentSelectMusic:Lcom/android/camera/fragment/music/LiveMusicInfo;

.field private mHotMusicText:Landroid/widget/TextView;

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

.field private mMediaPlayer:Landroid/media/MediaPlayer;

.field private mMp3DownloadCallback:Lcom/android/camera/fragment/live/FragmentLiveMusic$Mp3DownloadCallback;

.field private mMusicPlayPosition:I

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

.field private mRecyclerView:Landroid/support/v7/widget/RecyclerView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 38
    const-class v0, Lcom/android/camera/fragment/live/FragmentLiveMusic;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 36
    invoke-direct {p0}, Lcom/android/camera/fragment/dialog/BaseDialogFragment;-><init>()V

    .line 120
    new-instance v0, Lcom/android/camera/fragment/live/FragmentLiveMusic$2;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/live/FragmentLiveMusic$2;-><init>(Lcom/android/camera/fragment/live/FragmentLiveMusic;)V

    iput-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMp3DownloadCallback:Lcom/android/camera/fragment/live/FragmentLiveMusic$Mp3DownloadCallback;

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/fragment/live/FragmentLiveMusic;Ljava/util/List;)V
    .locals 0

    .line 36
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/live/FragmentLiveMusic;->updateOnlineMusicList(Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$100(Lcom/android/camera/fragment/live/FragmentLiveMusic;)V
    .locals 0

    .line 36
    invoke-direct {p0}, Lcom/android/camera/fragment/live/FragmentLiveMusic;->stopDownloadAnimation()V

    return-void
.end method

.method private initMusicAdapter()V
    .locals 3

    .line 88
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mOnlineMusicInfoList:Ljava/util/List;

    .line 89
    new-instance v0, Lcom/android/camera/fragment/music/MusicAdapter;

    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveMusic;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mOnlineMusicInfoList:Ljava/util/List;

    invoke-direct {v0, v1, p0, v2}, Lcom/android/camera/fragment/music/MusicAdapter;-><init>(Landroid/content/Context;Landroid/view/View$OnClickListener;Ljava/util/List;)V

    iput-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mAdapter:Lcom/android/camera/fragment/music/MusicAdapter;

    .line 90
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mAdapter:Lcom/android/camera/fragment/music/MusicAdapter;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 91
    new-instance v0, Landroid/media/MediaPlayer;

    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 92
    const/4 v0, 0x1

    iput v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mCurrentItemIndex:I

    .line 93
    new-instance v0, Lcom/android/camera/network/live/TTLiveMusicResourceRequest;

    invoke-direct {v0}, Lcom/android/camera/network/live/TTLiveMusicResourceRequest;-><init>()V

    .line 94
    new-instance v1, Lcom/android/camera/fragment/live/FragmentLiveMusic$1;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/live/FragmentLiveMusic$1;-><init>(Lcom/android/camera/fragment/live/FragmentLiveMusic;)V

    invoke-virtual {v0, v1}, Lcom/android/camera/network/live/TTLiveMusicResourceRequest;->execute(Lcom/android/camera/network/net/base/ResponseListener;)V

    .line 111
    return-void
.end method

.method private loadLoaclMusicList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/camera/fragment/music/LiveMusicInfo;",
            ">;"
        }
    .end annotation

    .line 153
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 157
    return-object v0
.end method

.method private startDownloadAnimation()V
    .locals 0

    .line 250
    return-void
.end method

.method private startPlayMusic(Lcom/android/camera/fragment/music/LiveMusicInfo;)V
    .locals 4

    .line 133
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

    .line 134
    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->stop()V

    .line 135
    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->reset()V

    .line 136
    return-void

    .line 139
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 140
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    .line 141
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->reset()V

    .line 143
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v1, p1, Lcom/android/camera/fragment/music/LiveMusicInfo;->mPlayUrl:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setDataSource(Ljava/lang/String;)V

    .line 144
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->prepare()V

    .line 145
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 148
    goto :goto_0

    .line 146
    :catch_0
    move-exception v0

    .line 147
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

    .line 149
    :goto_0
    iput-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mCurrentSelectMusic:Lcom/android/camera/fragment/music/LiveMusicInfo;

    .line 150
    return-void
.end method

.method private stopDownloadAnimation()V
    .locals 0

    .line 253
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

    .line 114
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mOnlineMusicInfoList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 115
    iget p1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mCurrentItemIndex:I

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 116
    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mAdapter:Lcom/android/camera/fragment/music/MusicAdapter;

    invoke-virtual {p1}, Lcom/android/camera/fragment/music/MusicAdapter;->notifyDataSetChanged()V

    .line 118
    :cond_0
    return-void
.end method


# virtual methods
.method protected initView(Landroid/view/View;)V
    .locals 2

    .line 71
    const v0, 0x7f0d0044

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    iput-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 72
    new-instance v0, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveMusic;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 73
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/LinearLayoutManager;->setOrientation(I)V

    .line 74
    iget-object v1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 75
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    new-instance v1, Lcom/android/camera/fragment/DefaultItemAnimator;

    invoke-direct {v1}, Lcom/android/camera/fragment/DefaultItemAnimator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setItemAnimator(Landroid/support/v7/widget/RecyclerView$ItemAnimator;)V

    .line 77
    const v0, 0x7f0d0042

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mHotMusicText:Landroid/widget/TextView;

    .line 78
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mHotMusicText:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 79
    const v0, 0x7f0d0043

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mLocalMusicText:Landroid/widget/TextView;

    .line 80
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mLocalMusicText:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 81
    const v0, 0x7f0d0041

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mCloseImageView:Landroid/widget/ImageView;

    .line 82
    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mCloseImageView:Landroid/widget/ImageView;

    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 84
    invoke-direct {p0}, Lcom/android/camera/fragment/live/FragmentLiveMusic;->initMusicAdapter()V

    .line 85
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 7

    .line 189
    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveMusic;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0a005a

    invoke-static {v0, v1}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v0

    .line 190
    nop

    .line 191
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    const v2, 0x7f0d0079

    if-eq v1, v2, :cond_1

    const/high16 v2, -0x1000000

    const v3, 0x3e19999a    # 0.15f

    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v5, 0x1

    const/4 v6, 0x0

    packed-switch v1, :pswitch_data_0

    .line 233
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/camera/fragment/music/LiveMusicInfo;

    .line 234
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/RecordDemo/music/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p1, Lcom/android/camera/fragment/music/LiveMusicInfo;->mTitle:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ".mp3"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 235
    sget-object v1, Lcom/android/camera/fragment/live/FragmentLiveMusic;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "save music: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 236
    invoke-direct {p0}, Lcom/android/camera/fragment/live/FragmentLiveMusic;->startDownloadAnimation()V

    .line 237
    iget-object v1, p1, Lcom/android/camera/fragment/music/LiveMusicInfo;->mPlayUrl:Ljava/lang/String;

    iget-object v2, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMp3DownloadCallback:Lcom/android/camera/fragment/live/FragmentLiveMusic$Mp3DownloadCallback;

    invoke-static {v1, v0, v2}, Lcom/android/camera/fragment/music/OkHttpUtils;->downloadMp3Async(Ljava/lang/String;Ljava/lang/String;Lcom/android/camera/fragment/live/FragmentLiveMusic$Mp3DownloadCallback;)V

    .line 238
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xc9

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    .line 239
    invoke-interface {v1, v0}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->onBGMChanged(Ljava/lang/String;)V

    .line 240
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xac

    .line 241
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 242
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p1, Lcom/android/camera/fragment/music/LiveMusicInfo;->mTitle:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "-"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p1, Lcom/android/camera/fragment/music/LiveMusicInfo;->mAuthor:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 243
    invoke-interface {v0, v6, p1}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertTopMusicHint(ILjava/lang/String;)V

    goto/16 :goto_1

    .line 206
    :pswitch_0
    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mLocalMusicInfoList:Ljava/util/List;

    if-nez p1, :cond_0

    .line 207
    invoke-direct {p0}, Lcom/android/camera/fragment/live/FragmentLiveMusic;->loadLoaclMusicList()Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mLocalMusicInfoList:Ljava/util/List;

    .line 209
    :cond_0
    iget p1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mCurrentItemIndex:I

    if-ne p1, v5, :cond_5

    .line 210
    iput v6, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mCurrentItemIndex:I

    .line 211
    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mAdapter:Lcom/android/camera/fragment/music/MusicAdapter;

    iget-object v1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mLocalMusicInfoList:Ljava/util/List;

    invoke-virtual {p1, v1}, Lcom/android/camera/fragment/music/MusicAdapter;->setData(Ljava/util/List;)V

    .line 212
    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mLocalMusicText:Landroid/widget/TextView;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 213
    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mLocalMusicText:Landroid/widget/TextView;

    invoke-virtual {p1, v4}, Landroid/widget/TextView;->setAlpha(F)V

    .line 214
    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mHotMusicText:Landroid/widget/TextView;

    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setAlpha(F)V

    .line 215
    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mHotMusicText:Landroid/widget/TextView;

    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_1

    .line 196
    :pswitch_1
    iget p1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mCurrentItemIndex:I

    if-nez p1, :cond_5

    .line 197
    iput v5, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mCurrentItemIndex:I

    .line 198
    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mAdapter:Lcom/android/camera/fragment/music/MusicAdapter;

    iget-object v1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mOnlineMusicInfoList:Ljava/util/List;

    invoke-virtual {p1, v1}, Lcom/android/camera/fragment/music/MusicAdapter;->setData(Ljava/util/List;)V

    .line 199
    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mLocalMusicText:Landroid/widget/TextView;

    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 200
    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mLocalMusicText:Landroid/widget/TextView;

    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setAlpha(F)V

    .line 201
    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mHotMusicText:Landroid/widget/TextView;

    invoke-virtual {p1, v4}, Landroid/widget/TextView;->setAlpha(F)V

    .line 202
    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mHotMusicText:Landroid/widget/TextView;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_1

    .line 193
    :pswitch_2
    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveMusic;->getFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object p1

    sget-object v0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->TAG:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/android/camera/fragment/FragmentUtils;->removeFragmentByTag(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)Z

    .line 194
    goto :goto_1

    .line 219
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/fragment/music/LiveMusicInfo;

    .line 220
    iget-object v1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mPlayingImageView:Landroid/widget/ImageView;

    if-eqz v1, :cond_2

    .line 221
    iget-object v1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mPlayingImageView:Landroid/widget/ImageView;

    const v3, 0x7f0200f5

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    .line 223
    :cond_2
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    .line 224
    iget-object v1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mPlayingImageView:Landroid/widget/ImageView;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    const v2, 0x7f0200f4

    if-nez v1, :cond_3

    .line 225
    iput-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mPlayingImageView:Landroid/widget/ImageView;

    .line 226
    invoke-virtual {p1, v2}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    goto :goto_0

    .line 227
    :cond_3
    iget-object v1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v1

    if-nez v1, :cond_4

    .line 228
    invoke-virtual {p1, v2}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    .line 230
    :cond_4
    :goto_0
    invoke-direct {p0, v0}, Lcom/android/camera/fragment/live/FragmentLiveMusic;->startPlayMusic(Lcom/android/camera/fragment/music/LiveMusicInfo;)V

    .line 231
    nop

    .line 246
    :cond_5
    :goto_1
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x7f0d0041
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

    .line 64
    const p3, 0x7f040014

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 65
    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/live/FragmentLiveMusic;->initView(Landroid/view/View;)V

    .line 66
    return-object p1
.end method

.method public onDestroy()V
    .locals 2

    .line 182
    invoke-super {p0}, Lcom/android/camera/fragment/dialog/BaseDialogFragment;->onDestroy()V

    .line 183
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 184
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 185
    return-void
.end method

.method public onPause()V
    .locals 1

    .line 162
    invoke-super {p0}, Lcom/android/camera/fragment/dialog/BaseDialogFragment;->onPause()V

    .line 163
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 164
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    .line 165
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMusicPlayPosition:I

    .line 168
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 2

    .line 172
    invoke-super {p0}, Lcom/android/camera/fragment/dialog/BaseDialogFragment;->onResume()V

    .line 173
    iget v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMusicPlayPosition:I

    if-eqz v0, :cond_0

    .line 174
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget v1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMusicPlayPosition:I

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 175
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 176
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->mMusicPlayPosition:I

    .line 178
    :cond_0
    return-void
.end method
