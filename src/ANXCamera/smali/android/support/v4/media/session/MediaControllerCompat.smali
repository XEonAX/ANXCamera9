.class public final Landroid/support/v4/media/session/MediaControllerCompat;
.super Ljava/lang/Object;
.source "MediaControllerCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/media/session/MediaControllerCompat$TransportControlsApi23;,
        Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImplApi23;,
        Landroid/support/v4/media/session/MediaControllerCompat$TransportControlsApi21;,
        Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImplApi21;,
        Landroid/support/v4/media/session/MediaControllerCompat$TransportControlsBase;,
        Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImplBase;,
        Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;,
        Landroid/support/v4/media/session/MediaControllerCompat$PlaybackInfo;,
        Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;,
        Landroid/support/v4/media/session/MediaControllerCompat$Callback;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "MediaControllerCompat"


# instance fields
.field private final mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

.field private final mToken:Landroid/support/v4/media/session/MediaSessionCompat$Token;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/support/v4/media/session/MediaSessionCompat$Token;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "sessionToken"    # Landroid/support/v4/media/session/MediaSessionCompat$Token;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    if-eqz p2, :cond_1f

    .line 93
    iput-object p2, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mToken:Landroid/support/v4/media/session/MediaSessionCompat$Token;

    .line 95
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_15

    .line 96
    new-instance v0, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImplApi21;

    invoke-direct {v0, p1, p2}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImplApi21;-><init>(Landroid/content/Context;Landroid/support/v4/media/session/MediaSessionCompat$Token;)V

    iput-object v0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    goto :goto_1e

    .line 98
    :cond_15
    new-instance v0, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImplBase;

    iget-object v1, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mToken:Landroid/support/v4/media/session/MediaSessionCompat$Token;

    invoke-direct {v0, v1}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImplBase;-><init>(Landroid/support/v4/media/session/MediaSessionCompat$Token;)V

    iput-object v0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    .line 100
    :goto_1e
    return-void

    .line 91
    :cond_1f
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "sessionToken must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/support/v4/media/session/MediaSessionCompat;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "session"    # Landroid/support/v4/media/session/MediaSessionCompat;

    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    if-eqz p2, :cond_31

    .line 70
    invoke-virtual {p2}, Landroid/support/v4/media/session/MediaSessionCompat;->getSessionToken()Landroid/support/v4/media/session/MediaSessionCompat$Token;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mToken:Landroid/support/v4/media/session/MediaSessionCompat$Token;

    .line 72
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_19

    .line 73
    new-instance v0, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImplApi23;

    invoke-direct {v0, p1, p2}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImplApi23;-><init>(Landroid/content/Context;Landroid/support/v4/media/session/MediaSessionCompat;)V

    iput-object v0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    goto :goto_30

    .line 74
    :cond_19
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_27

    .line 75
    new-instance v0, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImplApi21;

    invoke-direct {v0, p1, p2}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImplApi21;-><init>(Landroid/content/Context;Landroid/support/v4/media/session/MediaSessionCompat;)V

    iput-object v0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    goto :goto_30

    .line 77
    :cond_27
    new-instance v0, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImplBase;

    iget-object v1, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mToken:Landroid/support/v4/media/session/MediaSessionCompat$Token;

    invoke-direct {v0, v1}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImplBase;-><init>(Landroid/support/v4/media/session/MediaSessionCompat$Token;)V

    iput-object v0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    .line 79
    :goto_30
    return-void

    .line 68
    :cond_31
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "session must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public adjustVolume(II)V
    .registers 4
    .param p1, "direction"    # I
    .param p2, "flags"    # I

    .line 252
    iget-object v0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    invoke-interface {v0, p1, p2}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;->adjustVolume(II)V

    .line 253
    return-void
.end method

.method public dispatchMediaButtonEvent(Landroid/view/KeyEvent;)Z
    .registers 4
    .param p1, "keyEvent"    # Landroid/view/KeyEvent;

    .line 119
    if-eqz p1, :cond_9

    .line 122
    iget-object v0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    invoke-interface {v0, p1}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;->dispatchMediaButtonEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    return v0

    .line 120
    :cond_9
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "KeyEvent may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getExtras()Landroid/os/Bundle;
    .registers 2

    .line 164
    iget-object v0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    invoke-interface {v0}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method public getFlags()J
    .registers 3

    .line 192
    iget-object v0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    invoke-interface {v0}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;->getFlags()J

    move-result-wide v0

    return-wide v0
.end method

.method public getMediaController()Ljava/lang/Object;
    .registers 2

    .line 332
    iget-object v0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    invoke-interface {v0}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;->getMediaController()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getMetadata()Landroid/support/v4/media/MediaMetadataCompat;
    .registers 2

    .line 140
    iget-object v0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    invoke-interface {v0}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;->getMetadata()Landroid/support/v4/media/MediaMetadataCompat;

    move-result-object v0

    return-object v0
.end method

.method public getPackageName()Ljava/lang/String;
    .registers 2

    .line 318
    iget-object v0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    invoke-interface {v0}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;->getPackageName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPlaybackInfo()Landroid/support/v4/media/session/MediaControllerCompat$PlaybackInfo;
    .registers 2

    .line 201
    iget-object v0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    invoke-interface {v0}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;->getPlaybackInfo()Landroid/support/v4/media/session/MediaControllerCompat$PlaybackInfo;

    move-result-object v0

    return-object v0
.end method

.method public getPlaybackState()Landroid/support/v4/media/session/PlaybackStateCompat;
    .registers 2

    .line 131
    iget-object v0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    invoke-interface {v0}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;->getPlaybackState()Landroid/support/v4/media/session/PlaybackStateCompat;

    move-result-object v0

    return-object v0
.end method

.method public getQueue()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/support/v4/media/session/MediaSessionCompat$QueueItem;",
            ">;"
        }
    .end annotation

    .line 150
    iget-object v0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    invoke-interface {v0}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;->getQueue()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getQueueTitle()Ljava/lang/CharSequence;
    .registers 2

    .line 157
    iget-object v0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    invoke-interface {v0}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;->getQueueTitle()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public getRatingType()I
    .registers 2

    .line 182
    iget-object v0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    invoke-interface {v0}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;->getRatingType()I

    move-result v0

    return v0
.end method

.method public getSessionActivity()Landroid/app/PendingIntent;
    .registers 2

    .line 211
    iget-object v0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    invoke-interface {v0}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;->getSessionActivity()Landroid/app/PendingIntent;

    move-result-object v0

    return-object v0
.end method

.method public getSessionToken()Landroid/support/v4/media/session/MediaSessionCompat$Token;
    .registers 2

    .line 220
    iget-object v0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mToken:Landroid/support/v4/media/session/MediaSessionCompat$Token;

    return-object v0
.end method

.method public getTransportControls()Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;
    .registers 2

    .line 108
    iget-object v0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    invoke-interface {v0}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;->getTransportControls()Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;

    move-result-object v0

    return-object v0
.end method

.method public registerCallback(Landroid/support/v4/media/session/MediaControllerCompat$Callback;)V
    .registers 3
    .param p1, "callback"    # Landroid/support/v4/media/session/MediaControllerCompat$Callback;

    .line 262
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/support/v4/media/session/MediaControllerCompat;->registerCallback(Landroid/support/v4/media/session/MediaControllerCompat$Callback;Landroid/os/Handler;)V

    .line 263
    return-void
.end method

.method public registerCallback(Landroid/support/v4/media/session/MediaControllerCompat$Callback;Landroid/os/Handler;)V
    .registers 5
    .param p1, "callback"    # Landroid/support/v4/media/session/MediaControllerCompat$Callback;
    .param p2, "handler"    # Landroid/os/Handler;

    .line 274
    if-eqz p1, :cond_10

    .line 277
    if-nez p2, :cond_a

    .line 278
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    move-object p2, v0

    .line 280
    :cond_a
    iget-object v0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    invoke-interface {v0, p1, p2}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;->registerCallback(Landroid/support/v4/media/session/MediaControllerCompat$Callback;Landroid/os/Handler;)V

    .line 281
    return-void

    .line 275
    :cond_10
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "callback cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public sendCommand(Ljava/lang/String;Landroid/os/Bundle;Landroid/os/ResultReceiver;)V
    .registers 6
    .param p1, "command"    # Ljava/lang/String;
    .param p2, "params"    # Landroid/os/Bundle;
    .param p3, "cb"    # Landroid/os/ResultReceiver;

    .line 306
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_c

    .line 309
    iget-object v0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    invoke-interface {v0, p1, p2, p3}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;->sendCommand(Ljava/lang/String;Landroid/os/Bundle;Landroid/os/ResultReceiver;)V

    .line 310
    return-void

    .line 307
    :cond_c
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "command cannot be null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setVolumeTo(II)V
    .registers 4
    .param p1, "value"    # I
    .param p2, "flags"    # I

    .line 235
    iget-object v0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    invoke-interface {v0, p1, p2}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;->setVolumeTo(II)V

    .line 236
    return-void
.end method

.method public unregisterCallback(Landroid/support/v4/media/session/MediaControllerCompat$Callback;)V
    .registers 4
    .param p1, "callback"    # Landroid/support/v4/media/session/MediaControllerCompat$Callback;

    .line 290
    if-eqz p1, :cond_8

    .line 293
    iget-object v0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    invoke-interface {v0, p1}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;->unregisterCallback(Landroid/support/v4/media/session/MediaControllerCompat$Callback;)V

    .line 294
    return-void

    .line 291
    :cond_8
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "callback cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
