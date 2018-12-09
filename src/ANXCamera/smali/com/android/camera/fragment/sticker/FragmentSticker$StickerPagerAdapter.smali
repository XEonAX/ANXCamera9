.class Lcom/android/camera/fragment/sticker/FragmentSticker$StickerPagerAdapter;
.super Landroid/support/v4/app/FragmentPagerAdapter;
.source "FragmentSticker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/sticker/FragmentSticker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "StickerPagerAdapter"
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

.field final synthetic this$0:Lcom/android/camera/fragment/sticker/FragmentSticker;


# direct methods
.method public constructor <init>(Lcom/android/camera/fragment/sticker/FragmentSticker;Landroid/support/v4/app/FragmentManager;Ljava/util/List;)V
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

    .line 152
    iput-object p1, p0, Lcom/android/camera/fragment/sticker/FragmentSticker$StickerPagerAdapter;->this$0:Lcom/android/camera/fragment/sticker/FragmentSticker;

    .line 153
    invoke-direct {p0, p2}, Landroid/support/v4/app/FragmentPagerAdapter;-><init>(Landroid/support/v4/app/FragmentManager;)V

    .line 154
    iput-object p3, p0, Lcom/android/camera/fragment/sticker/FragmentSticker$StickerPagerAdapter;->mFragmentList:Ljava/util/List;

    .line 155
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .line 164
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/FragmentSticker$StickerPagerAdapter;->mFragmentList:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/FragmentSticker$StickerPagerAdapter;->mFragmentList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    :goto_0
    return v0
.end method

.method public getItem(I)Landroid/support/v4/app/Fragment;
    .locals 1

    .line 159
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/FragmentSticker$StickerPagerAdapter;->mFragmentList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/support/v4/app/Fragment;

    return-object p1
.end method
