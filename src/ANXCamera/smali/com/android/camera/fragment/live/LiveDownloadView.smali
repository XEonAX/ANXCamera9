.class public Lcom/android/camera/fragment/live/LiveDownloadView;
.super Lcom/android/camera/fragment/sticker/download/DownloadView;
.source "LiveDownloadView.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/sticker/download/DownloadView;-><init>(Landroid/content/Context;)V

    .line 14
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/sticker/download/DownloadView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 18
    return-void
.end method


# virtual methods
.method protected getStateImageResource(I)I
    .locals 1

    .line 22
    const v0, 0x7f02016f

    if-eqz p1, :cond_0

    packed-switch p1, :pswitch_data_0

    .line 32
    const/4 p1, 0x0

    return p1

    .line 30
    :pswitch_0
    return v0

    .line 28
    :pswitch_1
    const p1, 0x7f020170

    return p1

    .line 26
    :pswitch_2
    const p1, 0x7f020171

    return p1

    .line 24
    :cond_0
    return v0

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
