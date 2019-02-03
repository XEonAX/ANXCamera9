.class Lcom/android/camera/fragment/music/FragmentLiveMusic$MusicPagerAdapter;
.super Landroid/support/v4/app/FragmentPagerAdapter;
.source "FragmentLiveMusic.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/music/FragmentLiveMusic;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MusicPagerAdapter"
.end annotation


# instance fields
.field private mFragmentList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/support/v4/app/Fragment;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/android/camera/fragment/music/FragmentLiveMusic;


# direct methods
.method public constructor <init>(Lcom/android/camera/fragment/music/FragmentLiveMusic;Landroid/support/v4/app/FragmentManager;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/app/FragmentManager;",
            "Ljava/util/List<",
            "Landroid/support/v4/app/Fragment;",
            ">;)V"
        }
    .end annotation

    .line 125
    iput-object p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusic$MusicPagerAdapter;->this$0:Lcom/android/camera/fragment/music/FragmentLiveMusic;

    .line 126
    invoke-direct {p0, p2}, Landroid/support/v4/app/FragmentPagerAdapter;-><init>(Landroid/support/v4/app/FragmentManager;)V

    .line 127
    iput-object p3, p0, Lcom/android/camera/fragment/music/FragmentLiveMusic$MusicPagerAdapter;->mFragmentList:Ljava/util/List;

    .line 128
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .line 137
    iget-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusic$MusicPagerAdapter;->mFragmentList:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusic$MusicPagerAdapter;->mFragmentList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    :goto_0
    return v0
.end method

.method public getItem(I)Landroid/support/v4/app/Fragment;
    .locals 1

    .line 132
    iget-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusic$MusicPagerAdapter;->mFragmentList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/support/v4/app/Fragment;

    return-object p1
.end method
