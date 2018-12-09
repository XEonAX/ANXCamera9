.class Lcom/android/camera/fragment/sticker/FragmentSticker$1;
.super Ljava/lang/Object;
.source "FragmentSticker.java"

# interfaces
.implements Landroid/support/v4/view/ViewPager$OnPageChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/sticker/FragmentSticker;->initView(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/sticker/FragmentSticker;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/sticker/FragmentSticker;)V
    .locals 0

    .line 54
    iput-object p1, p0, Lcom/android/camera/fragment/sticker/FragmentSticker$1;->this$0:Lcom/android/camera/fragment/sticker/FragmentSticker;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .locals 0

    .line 73
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    .line 57
    return-void
.end method

.method public onPageSelected(I)V
    .locals 1

    .line 61
    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 66
    :pswitch_0
    iget-object p1, p0, Lcom/android/camera/fragment/sticker/FragmentSticker$1;->this$0:Lcom/android/camera/fragment/sticker/FragmentSticker;

    invoke-static {p1}, Lcom/android/camera/fragment/sticker/FragmentSticker;->access$000(Lcom/android/camera/fragment/sticker/FragmentSticker;)Landroid/widget/RadioGroup;

    move-result-object p1

    const v0, 0x7f0d0082

    invoke-virtual {p1, v0}, Landroid/widget/RadioGroup;->check(I)V

    goto :goto_0

    .line 63
    :pswitch_1
    iget-object p1, p0, Lcom/android/camera/fragment/sticker/FragmentSticker$1;->this$0:Lcom/android/camera/fragment/sticker/FragmentSticker;

    invoke-static {p1}, Lcom/android/camera/fragment/sticker/FragmentSticker;->access$000(Lcom/android/camera/fragment/sticker/FragmentSticker;)Landroid/widget/RadioGroup;

    move-result-object p1

    const v0, 0x7f0d0081

    invoke-virtual {p1, v0}, Landroid/widget/RadioGroup;->check(I)V

    .line 64
    nop

    .line 69
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
