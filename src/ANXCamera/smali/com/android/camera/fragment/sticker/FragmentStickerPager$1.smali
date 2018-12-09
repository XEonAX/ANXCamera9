.class Lcom/android/camera/fragment/sticker/FragmentStickerPager$1;
.super Ljava/lang/Object;
.source "FragmentStickerPager.java"

# interfaces
.implements Lcom/android/camera/fragment/sticker/BaseSelectAdapter$ItemSelectChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/sticker/FragmentStickerPager;->initView(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/sticker/FragmentStickerPager;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/sticker/FragmentStickerPager;)V
    .locals 0

    .line 69
    iput-object p1, p0, Lcom/android/camera/fragment/sticker/FragmentStickerPager$1;->this$0:Lcom/android/camera/fragment/sticker/FragmentStickerPager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemSelect(Lcom/android/camera/fragment/sticker/BaseSelectAdapter$BaseSelectHolder;IZ)Z
    .locals 4

    .line 72
    iget-object p3, p0, Lcom/android/camera/fragment/sticker/FragmentStickerPager$1;->this$0:Lcom/android/camera/fragment/sticker/FragmentStickerPager;

    invoke-static {p3}, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->access$000(Lcom/android/camera/fragment/sticker/FragmentStickerPager;)Lcom/android/camera/fragment/sticker/StickerAdapter;

    move-result-object p3

    invoke-virtual {p3, p2}, Lcom/android/camera/fragment/sticker/StickerAdapter;->getItemData(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/android/camera/sticker/StickerInfo;

    .line 73
    invoke-virtual {p3}, Lcom/android/camera/sticker/StickerInfo;->getDownloadState()I

    move-result v0

    .line 74
    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eq v0, v2, :cond_4

    const/4 v3, 0x3

    if-ne v0, v3, :cond_0

    goto :goto_1

    .line 95
    :cond_0
    if-eqz v0, :cond_2

    const/4 v2, 0x4

    if-ne v0, v2, :cond_1

    goto :goto_0

    .line 104
    :cond_1
    return v1

    .line 96
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/FragmentStickerPager$1;->this$0:Lcom/android/camera/fragment/sticker/FragmentStickerPager;

    invoke-virtual {v0}, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/fragment/CtaNoticeFragment;->checkCta(Landroid/app/FragmentManager;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 97
    check-cast p1, Lcom/android/camera/fragment/sticker/StickerAdapter$StickerHolder;

    .line 98
    iget-object p1, p1, Lcom/android/camera/fragment/sticker/StickerAdapter$StickerHolder;->mDownloadView:Lcom/android/camera/fragment/sticker/download/DownloadView;

    invoke-virtual {p1}, Lcom/android/camera/fragment/sticker/download/DownloadView;->startDownload()V

    .line 99
    const/4 p1, 0x2

    iput p1, p3, Lcom/android/camera/sticker/StickerInfo;->downloadState:I

    .line 100
    invoke-static {}, Lcom/android/camera/network/resource/ResourceDownloadManager;->getInstance()Lcom/android/camera/network/resource/ResourceDownloadManager;

    move-result-object p1

    iget-object p3, p0, Lcom/android/camera/fragment/sticker/FragmentStickerPager$1;->this$0:Lcom/android/camera/fragment/sticker/FragmentStickerPager;

    invoke-static {p3}, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->access$200(Lcom/android/camera/fragment/sticker/FragmentStickerPager;)Ljava/util/List;

    move-result-object p3

    invoke-interface {p3, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/android/camera/network/resource/Resource;

    iget-object p3, p0, Lcom/android/camera/fragment/sticker/FragmentStickerPager$1;->this$0:Lcom/android/camera/fragment/sticker/FragmentStickerPager;

    invoke-static {p3}, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->access$300(Lcom/android/camera/fragment/sticker/FragmentStickerPager;)Lcom/android/camera/network/resource/DownloadHelper;

    move-result-object p3

    invoke-virtual {p1, p2, p3}, Lcom/android/camera/network/resource/ResourceDownloadManager;->download(Lcom/android/camera/network/resource/Resource;Lcom/android/camera/network/resource/DownloadHelper;)V

    .line 102
    :cond_3
    return v1

    .line 75
    :cond_4
    :goto_1
    invoke-virtual {p3}, Lcom/android/camera/sticker/StickerInfo;->getSrcPath()Ljava/lang/String;

    move-result-object p1

    .line 76
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/FragmentStickerPager$1;->this$0:Lcom/android/camera/fragment/sticker/FragmentStickerPager;

    invoke-static {v0, p1}, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->access$100(Lcom/android/camera/fragment/sticker/FragmentStickerPager;Ljava/lang/String;)V

    .line 77
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/camera/effect/EffectController;->setCurrentSticker(Ljava/lang/String;)V

    .line 78
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v0

    if-nez p2, :cond_5

    move v1, v2

    nop

    :cond_5
    invoke-virtual {v0, v1}, Lcom/android/camera/effect/EffectController;->enableMakeup(Z)V

    .line 80
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p2

    const/16 v0, 0xb2

    invoke-virtual {p2, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p2

    check-cast p2, Lcom/android/camera/protocol/ModeProtocol$StickerProtocol;

    .line 82
    if-eqz p2, :cond_6

    .line 83
    invoke-interface {p2, p1}, Lcom/android/camera/protocol/ModeProtocol$StickerProtocol;->onStickerChanged(Ljava/lang/String;)V

    .line 86
    :cond_6
    invoke-virtual {p3}, Lcom/android/camera/sticker/StickerInfo;->getFilterId()I

    move-result p1

    .line 87
    sget p2, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    if-eq p1, p2, :cond_7

    .line 89
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p2

    const/16 p3, 0xa5

    invoke-virtual {p2, p3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p2

    check-cast p2, Lcom/android/camera/protocol/ModeProtocol$FilterProtocol;

    .line 90
    if-eqz p2, :cond_7

    .line 91
    invoke-interface {p2, v2, p1}, Lcom/android/camera/protocol/ModeProtocol$FilterProtocol;->onFilterChanged(II)V

    .line 94
    :cond_7
    return v2
.end method
