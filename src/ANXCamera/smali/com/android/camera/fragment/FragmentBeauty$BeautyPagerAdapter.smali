.class Lcom/android/camera/fragment/FragmentBeauty$BeautyPagerAdapter;
.super Landroid/support/v4/app/FragmentPagerAdapter;
.source "FragmentBeauty.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/FragmentBeauty;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BeautyPagerAdapter"
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

.field final synthetic this$0:Lcom/android/camera/fragment/FragmentBeauty;


# direct methods
.method public constructor <init>(Lcom/android/camera/fragment/FragmentBeauty;Landroid/support/v4/app/FragmentManager;Ljava/util/List;)V
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

    .line 308
    iput-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty$BeautyPagerAdapter;->this$0:Lcom/android/camera/fragment/FragmentBeauty;

    .line 309
    invoke-direct {p0, p2}, Landroid/support/v4/app/FragmentPagerAdapter;-><init>(Landroid/support/v4/app/FragmentManager;)V

    .line 310
    iput-object p3, p0, Lcom/android/camera/fragment/FragmentBeauty$BeautyPagerAdapter;->mFragmentList:Ljava/util/List;

    .line 311
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .line 331
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty$BeautyPagerAdapter;->mFragmentList:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty$BeautyPagerAdapter;->mFragmentList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    :goto_0
    return v0
.end method

.method public getItem(I)Landroid/support/v4/app/Fragment;
    .locals 3

    .line 315
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautyParameters;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "fragment item positon:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 316
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty$BeautyPagerAdapter;->mFragmentList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/support/v4/app/Fragment;

    .line 317
    if-nez p1, :cond_2

    .line 319
    invoke-static {}, Lcom/mi/config/b;->hA()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 320
    new-instance p1, Lcom/android/camera/fragment/beauty/LegacyBeautyLevelFragment;

    invoke-direct {p1}, Lcom/android/camera/fragment/beauty/LegacyBeautyLevelFragment;-><init>()V

    goto :goto_0

    .line 321
    :cond_0
    invoke-static {}, Lcom/mi/config/b;->hL()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 322
    new-instance p1, Lcom/android/camera/fragment/beauty/FrontBeautyLevelFragment;

    invoke-direct {p1}, Lcom/android/camera/fragment/beauty/FrontBeautyLevelFragment;-><init>()V

    .line 324
    :cond_1
    :goto_0
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautyParameters;->TAG:Ljava/lang/String;

    const-string v1, "beauty pager get fragment item is null!"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 326
    :cond_2
    return-object p1
.end method
