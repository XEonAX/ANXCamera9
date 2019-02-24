.class public Lcom/android/camera/fragment/beauty/BeautyFragmentManager;
.super Ljava/lang/Object;
.source "BeautyFragmentManager.java"


# instance fields
.field private mBeautyBusinessArray:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/android/camera/fragment/beauty/IBeautyFragmentBusiness;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyFragmentManager;->mBeautyBusinessArray:Landroid/util/SparseArray;

    return-void
.end method


# virtual methods
.method public getBeautyFragmentBusiness(I)Lcom/android/camera/fragment/beauty/IBeautyFragmentBusiness;
    .locals 2

    .line 10
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyFragmentManager;->mBeautyBusinessArray:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/fragment/beauty/IBeautyFragmentBusiness;

    .line 11
    if-eqz v0, :cond_0

    .line 12
    return-object v0

    .line 14
    :cond_0
    packed-switch p1, :pswitch_data_0

    .line 25
    new-instance v0, Lcom/android/camera/fragment/beauty/FrontFragmentBusiness;

    invoke-direct {v0}, Lcom/android/camera/fragment/beauty/FrontFragmentBusiness;-><init>()V

    goto :goto_0

    .line 22
    :pswitch_0
    new-instance v0, Lcom/android/camera/fragment/beauty/LiveBeautyFragmentBusiness;

    invoke-direct {v0}, Lcom/android/camera/fragment/beauty/LiveBeautyFragmentBusiness;-><init>()V

    .line 23
    goto :goto_0

    .line 19
    :pswitch_1
    new-instance v0, Lcom/android/camera/fragment/beauty/BackMainFragmentBusiness;

    invoke-direct {v0}, Lcom/android/camera/fragment/beauty/BackMainFragmentBusiness;-><init>()V

    .line 20
    goto :goto_0

    .line 16
    :pswitch_2
    new-instance v0, Lcom/android/camera/fragment/beauty/FrontFragmentBusiness;

    invoke-direct {v0}, Lcom/android/camera/fragment/beauty/FrontFragmentBusiness;-><init>()V

    .line 17
    nop

    .line 28
    :goto_0
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/BeautyFragmentManager;->mBeautyBusinessArray:Landroid/util/SparseArray;

    invoke-virtual {v1, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 29
    return-object v0

    :pswitch_data_0
    .packed-switch 0xa1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
