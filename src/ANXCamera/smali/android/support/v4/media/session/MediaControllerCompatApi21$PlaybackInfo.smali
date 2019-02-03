.class public Landroid/support/v4/media/session/MediaControllerCompatApi21$PlaybackInfo;
.super Ljava/lang/Object;
.source "MediaControllerCompatApi21.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/session/MediaControllerCompatApi21;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PlaybackInfo"
.end annotation


# static fields
.field private static final FLAG_SCO:I = 0x4

.field private static final STREAM_BLUETOOTH_SCO:I = 0x6

.field private static final STREAM_SYSTEM_ENFORCED:I = 0x7


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 175
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAudioAttributes(Ljava/lang/Object;)Landroid/media/AudioAttributes;
    .registers 2
    .param p0, "volumeInfoObj"    # Ljava/lang/Object;

    .line 181
    move-object v0, p0

    check-cast v0, Landroid/media/session/MediaController$PlaybackInfo;

    invoke-virtual {v0}, Landroid/media/session/MediaController$PlaybackInfo;->getAudioAttributes()Landroid/media/AudioAttributes;

    move-result-object v0

    return-object v0
.end method

.method public static getCurrentVolume(Ljava/lang/Object;)I
    .registers 2
    .param p0, "volumeInfoObj"    # Ljava/lang/Object;

    .line 198
    move-object v0, p0

    check-cast v0, Landroid/media/session/MediaController$PlaybackInfo;

    invoke-virtual {v0}, Landroid/media/session/MediaController$PlaybackInfo;->getCurrentVolume()I

    move-result v0

    return v0
.end method

.method public static getLegacyAudioStream(Ljava/lang/Object;)I
    .registers 3
    .param p0, "volumeInfoObj"    # Ljava/lang/Object;

    .line 185
    invoke-static {p0}, Landroid/support/v4/media/session/MediaControllerCompatApi21$PlaybackInfo;->getAudioAttributes(Ljava/lang/Object;)Landroid/media/AudioAttributes;

    move-result-object v0

    .line 186
    .local v0, "attrs":Landroid/media/AudioAttributes;
    invoke-static {v0}, Landroid/support/v4/media/session/MediaControllerCompatApi21$PlaybackInfo;->toLegacyStreamType(Landroid/media/AudioAttributes;)I

    move-result v1

    return v1
.end method

.method public static getMaxVolume(Ljava/lang/Object;)I
    .registers 2
    .param p0, "volumeInfoObj"    # Ljava/lang/Object;

    .line 194
    move-object v0, p0

    check-cast v0, Landroid/media/session/MediaController$PlaybackInfo;

    invoke-virtual {v0}, Landroid/media/session/MediaController$PlaybackInfo;->getMaxVolume()I

    move-result v0

    return v0
.end method

.method public static getPlaybackType(Ljava/lang/Object;)I
    .registers 2
    .param p0, "volumeInfoObj"    # Ljava/lang/Object;

    .line 177
    move-object v0, p0

    check-cast v0, Landroid/media/session/MediaController$PlaybackInfo;

    invoke-virtual {v0}, Landroid/media/session/MediaController$PlaybackInfo;->getPlaybackType()I

    move-result v0

    return v0
.end method

.method public static getVolumeControl(Ljava/lang/Object;)I
    .registers 2
    .param p0, "volumeInfoObj"    # Ljava/lang/Object;

    .line 190
    move-object v0, p0

    check-cast v0, Landroid/media/session/MediaController$PlaybackInfo;

    invoke-virtual {v0}, Landroid/media/session/MediaController$PlaybackInfo;->getVolumeControl()I

    move-result v0

    return v0
.end method

.method private static toLegacyStreamType(Landroid/media/AudioAttributes;)I
    .registers 5
    .param p0, "aa"    # Landroid/media/AudioAttributes;

    .line 209
    invoke-virtual {p0}, Landroid/media/AudioAttributes;->getFlags()I

    move-result v0

    const/4 v1, 0x1

    and-int/2addr v0, v1

    if-ne v0, v1, :cond_a

    .line 211
    const/4 v0, 0x7

    return v0

    .line 213
    :cond_a
    invoke-virtual {p0}, Landroid/media/AudioAttributes;->getFlags()I

    move-result v0

    const/4 v2, 0x4

    and-int/2addr v0, v2

    if-ne v0, v2, :cond_14

    .line 214
    const/4 v0, 0x6

    return v0

    .line 218
    :cond_14
    invoke-virtual {p0}, Landroid/media/AudioAttributes;->getUsage()I

    move-result v0

    const/4 v3, 0x3

    packed-switch v0, :pswitch_data_2a

    .line 242
    return v3

    .line 225
    :pswitch_1d
    return v1

    .line 233
    :pswitch_1e
    const/4 v0, 0x2

    return v0

    .line 239
    :pswitch_20
    const/4 v0, 0x5

    return v0

    .line 231
    :pswitch_22
    return v2

    .line 229
    :pswitch_23
    const/16 v0, 0x8

    return v0

    .line 227
    :pswitch_26
    const/4 v0, 0x0

    return v0

    .line 223
    :pswitch_28
    return v3

    nop

    :pswitch_data_2a
    .packed-switch 0x1
        :pswitch_28
        :pswitch_26
        :pswitch_23
        :pswitch_22
        :pswitch_20
        :pswitch_1e
        :pswitch_20
        :pswitch_20
        :pswitch_20
        :pswitch_20
        :pswitch_28
        :pswitch_28
        :pswitch_1d
        :pswitch_28
    .end packed-switch
.end method
