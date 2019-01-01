.class public abstract Landroid/support/v4/media/TransportPerformer;
.super Ljava/lang/Object;
.source "TransportPerformer.java"


# static fields
.field static final AUDIOFOCUS_GAIN:I = 0x1

.field static final AUDIOFOCUS_GAIN_TRANSIENT:I = 0x2

.field static final AUDIOFOCUS_GAIN_TRANSIENT_MAY_DUCK:I = 0x3

.field static final AUDIOFOCUS_LOSS:I = -0x1

.field static final AUDIOFOCUS_LOSS_TRANSIENT:I = -0x2

.field static final AUDIOFOCUS_LOSS_TRANSIENT_CAN_DUCK:I = -0x3


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAudioFocusChange(I)V
    .locals 12
    .param p1, "focusChange"    # I

    .line 188
    const/4 v0, 0x0

    .line 189
    .local v0, "keyCode":I
    const/4 v1, -0x1

    if-eq p1, v1, :cond_0

    goto :goto_0

    .line 193
    :cond_0
    const/16 v0, 0x7f

    .line 196
    :goto_0
    if-eqz v0, :cond_1

    .line 197
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v9

    .line 198
    .local v9, "now":J
    new-instance v11, Landroid/view/KeyEvent;

    const/4 v6, 0x0

    const/4 v8, 0x0

    move-object v1, v11

    move-wide v2, v9

    move-wide v4, v9

    move v7, v0

    invoke-direct/range {v1 .. v8}, Landroid/view/KeyEvent;-><init>(JJIII)V

    invoke-virtual {p0, v0, v11}, Landroid/support/v4/media/TransportPerformer;->onMediaButtonDown(ILandroid/view/KeyEvent;)Z

    .line 199
    new-instance v11, Landroid/view/KeyEvent;

    const/4 v6, 0x1

    move-object v1, v11

    invoke-direct/range {v1 .. v8}, Landroid/view/KeyEvent;-><init>(JJIII)V

    invoke-virtual {p0, v0, v11}, Landroid/support/v4/media/TransportPerformer;->onMediaButtonUp(ILandroid/view/KeyEvent;)Z

    .line 201
    .end local v9    # "now":J
    :cond_1
    return-void
.end method

.method public onGetBufferPercentage()I
    .locals 1

    .line 76
    const/16 v0, 0x64

    return v0
.end method

.method public abstract onGetCurrentPosition()J
.end method

.method public abstract onGetDuration()J
.end method

.method public onGetTransportControlFlags()I
    .locals 1

    .line 98
    const/16 v0, 0x3c

    return v0
.end method

.method public abstract onIsPlaying()Z
.end method

.method public onMediaButtonDown(ILandroid/view/KeyEvent;)Z
    .locals 2
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .line 127
    const/4 v0, 0x1

    sparse-switch p1, :sswitch_data_0

    goto :goto_0

    .line 132
    :sswitch_0
    invoke-virtual {p0}, Landroid/support/v4/media/TransportPerformer;->onPause()V

    .line 133
    return v0

    .line 129
    :sswitch_1
    invoke-virtual {p0}, Landroid/support/v4/media/TransportPerformer;->onStart()V

    .line 130
    return v0

    .line 135
    :sswitch_2
    invoke-virtual {p0}, Landroid/support/v4/media/TransportPerformer;->onStop()V

    .line 136
    return v0

    .line 139
    :sswitch_3
    invoke-virtual {p0}, Landroid/support/v4/media/TransportPerformer;->onIsPlaying()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 140
    invoke-virtual {p0}, Landroid/support/v4/media/TransportPerformer;->onPause()V

    goto :goto_0

    .line 142
    :cond_0
    invoke-virtual {p0}, Landroid/support/v4/media/TransportPerformer;->onStart()V

    .line 145
    :goto_0
    return v0

    nop

    :sswitch_data_0
    .sparse-switch
        0x4f -> :sswitch_3
        0x55 -> :sswitch_3
        0x56 -> :sswitch_2
        0x7e -> :sswitch_1
        0x7f -> :sswitch_0
    .end sparse-switch
.end method

.method public onMediaButtonUp(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .line 164
    const/4 v0, 0x1

    return v0
.end method

.method public abstract onPause()V
.end method

.method public abstract onSeekTo(J)V
.end method

.method public abstract onStart()V
.end method

.method public abstract onStop()V
.end method
