.class Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$5;
.super Ljava/lang/Object;
.source "FragmentPopupMakeup.java"

# interfaces
.implements Lcom/android/camera/ui/SeekBarCompat$OnSeekBarCompatTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->initView(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;)V
    .locals 0

    .line 126
    iput-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$5;->this$0:Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 4

    .line 129
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    const/4 v0, 0x1

    const/4 v1, 0x0

    packed-switch p1, :pswitch_data_0

    .line 166
    return v1

    .line 131
    :pswitch_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    float-to-int p1, p1

    .line 132
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    float-to-int v2, v2

    .line 133
    iget-object v3, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$5;->this$0:Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;

    invoke-static {v3}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->access$300(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;)Lcom/android/camera/ui/SeekBarCompat;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/ui/SeekBarCompat;->getThumb()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v3

    .line 134
    invoke-virtual {v3, p1, v2}, Landroid/graphics/Rect;->contains(II)Z

    move-result p1

    if-nez p1, :cond_0

    .line 135
    return v0

    .line 140
    :cond_0
    :pswitch_1
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$5;->this$0:Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;

    invoke-static {p1}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->access$300(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;)Lcom/android/camera/ui/SeekBarCompat;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/ui/SeekBarCompat;->getWidth()I

    move-result p1

    .line 141
    iget-object v2, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$5;->this$0:Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;

    invoke-static {v2}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->access$400(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;)Z

    move-result v2

    if-eqz v2, :cond_1

    int-to-float v2, p1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    sub-float/2addr v2, v3

    goto :goto_0

    :cond_1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    .line 142
    :goto_0
    int-to-float p1, p1

    div-float/2addr v2, p1

    invoke-static {}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->access$100()I

    move-result p1

    int-to-float p1, p1

    mul-float/2addr v2, p1

    float-to-int p1, v2

    .line 143
    iget-object v2, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$5;->this$0:Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;

    invoke-static {v2}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->access$300(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;)Lcom/android/camera/ui/SeekBarCompat;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/ui/SeekBarCompat;->isCenterSeekBarMode()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 145
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p2

    if-ne p2, v0, :cond_4

    .line 146
    iget-object p2, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$5;->this$0:Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;

    const/16 v2, -0xf

    invoke-static {p2, v2}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->access$500(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;I)I

    move-result p2

    if-lt p1, p2, :cond_2

    iget-object p2, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$5;->this$0:Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;

    const/16 v2, 0xf

    .line 147
    invoke-static {p2, v2}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->access$500(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;I)I

    move-result p2

    if-gt p1, p2, :cond_2

    iget-object p2, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$5;->this$0:Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;

    .line 148
    invoke-static {p2, v1}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->access$500(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;I)I

    move-result p2

    if-eq p1, p2, :cond_2

    .line 149
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$5;->this$0:Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;

    invoke-static {p1, v1}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->access$500(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;I)I

    move-result p1

    goto :goto_1

    .line 150
    :cond_2
    iget-object p2, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$5;->this$0:Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;

    const/16 v2, -0x55

    invoke-static {p2, v2}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->access$500(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;I)I

    move-result p2

    if-gt p1, p2, :cond_3

    iget-object p2, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$5;->this$0:Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;

    .line 151
    const/16 v2, -0x64

    invoke-static {p2, v2}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->access$500(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;I)I

    move-result p2

    if-eq p1, p2, :cond_3

    .line 152
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$5;->this$0:Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;

    invoke-static {p1, v2}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->access$500(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;I)I

    move-result p1

    goto :goto_1

    .line 153
    :cond_3
    iget-object p2, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$5;->this$0:Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;

    const/16 v2, 0x55

    invoke-static {p2, v2}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->access$500(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;I)I

    move-result p2

    if-lt p1, p2, :cond_4

    iget-object p2, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$5;->this$0:Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;

    .line 154
    const/16 v2, 0x64

    invoke-static {p2, v2}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->access$500(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;I)I

    move-result p2

    if-eq p1, p2, :cond_4

    .line 155
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$5;->this$0:Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;

    invoke-static {p1, v2}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->access$500(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;I)I

    move-result p1

    .line 158
    :cond_4
    :goto_1
    invoke-static {}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->access$100()I

    move-result p2

    invoke-static {p1, v1, p2}, Lcom/android/camera/Util;->clamp(III)I

    move-result p1

    invoke-static {}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->access$100()I

    move-result p2

    div-int/lit8 p2, p2, 0x2

    sub-int/2addr p1, p2

    goto :goto_2

    .line 160
    :cond_5
    invoke-static {}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->access$100()I

    move-result p2

    invoke-static {p1, v1, p2}, Lcom/android/camera/Util;->clamp(III)I

    move-result p1

    .line 162
    :goto_2
    iget-object p2, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$5;->this$0:Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;

    invoke-static {p2}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->access$300(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;)Lcom/android/camera/ui/SeekBarCompat;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/android/camera/ui/SeekBarCompat;->setProgress(I)V

    .line 163
    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method
