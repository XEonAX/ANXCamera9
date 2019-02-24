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

    .line 127
    iput-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$5;->this$0:Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getNextProgress(Landroid/view/MotionEvent;)I
    .locals 4

    .line 151
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$5;->this$0:Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;

    invoke-static {v0}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->access$300(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;)Lcom/android/camera/ui/SeekBarCompat;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ui/SeekBarCompat;->getWidth()I

    move-result v0

    .line 152
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$5;->this$0:Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;

    invoke-static {v1}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->access$400(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;)Z

    move-result v1

    if-eqz v1, :cond_0

    int-to-float v1, v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    sub-float/2addr v1, v2

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    .line 153
    :goto_0
    int-to-float v0, v0

    div-float/2addr v1, v0

    invoke-static {}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->access$100()I

    move-result v0

    int-to-float v0, v0

    mul-float/2addr v1, v0

    float-to-int v0, v1

    .line 154
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$5;->this$0:Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;

    invoke-static {v1}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->access$300(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;)Lcom/android/camera/ui/SeekBarCompat;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/ui/SeekBarCompat;->isCenterSeekBarMode()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_5

    .line 155
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    const/4 v3, 0x2

    if-eq v1, v3, :cond_1

    .line 156
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    const/4 v1, 0x1

    if-ne p1, v1, :cond_4

    .line 157
    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$5;->this$0:Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;

    const/4 v1, -0x5

    invoke-static {p1, v1}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->access$500(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;I)I

    move-result p1

    if-lt v0, p1, :cond_2

    iget-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$5;->this$0:Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;

    const/4 v1, 0x5

    .line 158
    invoke-static {p1, v1}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->access$500(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;I)I

    move-result p1

    if-gt v0, p1, :cond_2

    iget-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$5;->this$0:Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;

    .line 159
    invoke-static {p1, v2}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->access$500(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;I)I

    move-result p1

    if-eq v0, p1, :cond_2

    .line 160
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$5;->this$0:Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;

    invoke-static {p1, v2}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->access$500(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;I)I

    move-result v0

    goto :goto_1

    .line 161
    :cond_2
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$5;->this$0:Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;

    const/16 v1, -0x5f

    invoke-static {p1, v1}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->access$500(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;I)I

    move-result p1

    if-gt v0, p1, :cond_3

    iget-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$5;->this$0:Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;

    .line 162
    const/16 v1, -0x64

    invoke-static {p1, v1}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->access$500(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;I)I

    move-result p1

    if-eq v0, p1, :cond_3

    .line 163
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$5;->this$0:Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;

    invoke-static {p1, v1}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->access$500(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;I)I

    move-result v0

    goto :goto_1

    .line 164
    :cond_3
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$5;->this$0:Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;

    const/16 v1, 0x5f

    invoke-static {p1, v1}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->access$500(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;I)I

    move-result p1

    if-lt v0, p1, :cond_4

    iget-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$5;->this$0:Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;

    .line 165
    const/16 v1, 0x64

    invoke-static {p1, v1}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->access$500(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;I)I

    move-result p1

    if-eq v0, p1, :cond_4

    .line 166
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$5;->this$0:Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;

    invoke-static {p1, v1}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->access$500(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;I)I

    move-result v0

    .line 169
    :cond_4
    :goto_1
    invoke-static {}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->access$100()I

    move-result p1

    invoke-static {v0, v2, p1}, Lcom/android/camera/Util;->clamp(III)I

    move-result p1

    invoke-static {}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->access$100()I

    move-result v0

    div-int/2addr v0, v3

    sub-int/2addr p1, v0

    goto :goto_2

    .line 171
    :cond_5
    invoke-static {}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->access$100()I

    move-result p1

    invoke-static {v0, v2, p1}, Lcom/android/camera/Util;->clamp(III)I

    move-result p1

    .line 173
    :goto_2
    return p1
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 3

    .line 130
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    const/4 v0, 0x1

    packed-switch p1, :pswitch_data_0

    .line 146
    const/4 p1, 0x0

    return p1

    .line 132
    :pswitch_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    float-to-int p1, p1

    .line 133
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    float-to-int v1, v1

    .line 134
    iget-object v2, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$5;->this$0:Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;

    invoke-static {v2}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->access$300(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;)Lcom/android/camera/ui/SeekBarCompat;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/ui/SeekBarCompat;->getThumb()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v2

    .line 135
    invoke-virtual {v2, p1, v1}, Landroid/graphics/Rect;->contains(II)Z

    move-result p1

    if-nez p1, :cond_0

    .line 136
    return v0

    .line 141
    :cond_0
    :pswitch_1
    invoke-direct {p0, p2}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$5;->getNextProgress(Landroid/view/MotionEvent;)I

    move-result p1

    .line 142
    iget-object p2, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$5;->this$0:Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;

    invoke-static {p2}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->access$300(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;)Lcom/android/camera/ui/SeekBarCompat;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/android/camera/ui/SeekBarCompat;->setProgress(I)V

    .line 143
    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method
