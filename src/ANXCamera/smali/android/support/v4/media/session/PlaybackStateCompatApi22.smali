.class Landroid/support/v4/media/session/PlaybackStateCompatApi22;
.super Ljava/lang/Object;
.source "PlaybackStateCompatApi22.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getExtras(Ljava/lang/Object;)Landroid/os/Bundle;
    .registers 2
    .param p0, "stateObj"    # Ljava/lang/Object;

    .line 27
    move-object v0, p0

    check-cast v0, Landroid/media/session/PlaybackState;

    invoke-virtual {v0}, Landroid/media/session/PlaybackState;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method public static newInstance(IJJFJLjava/lang/CharSequence;JLjava/util/List;JLandroid/os/Bundle;)Ljava/lang/Object;
    .registers 25
    .param p0, "state"    # I
    .param p1, "position"    # J
    .param p3, "bufferedPosition"    # J
    .param p5, "speed"    # F
    .param p6, "actions"    # J
    .param p8, "errorMessage"    # Ljava/lang/CharSequence;
    .param p9, "updateTime"    # J
    .param p12, "activeItemId"    # J
    .param p14, "extras"    # Landroid/os/Bundle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IJJFJ",
            "Ljava/lang/CharSequence;",
            "J",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;J",
            "Landroid/os/Bundle;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 34
    .local p11, "customActions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    new-instance v0, Landroid/media/session/PlaybackState$Builder;

    invoke-direct {v0}, Landroid/media/session/PlaybackState$Builder;-><init>()V

    .line 35
    .local v0, "stateObj":Landroid/media/session/PlaybackState$Builder;
    move-object v1, v0

    move v2, p0

    move-wide v3, p1

    move v5, p5

    move-wide/from16 v6, p9

    invoke-virtual/range {v1 .. v7}, Landroid/media/session/PlaybackState$Builder;->setState(IJFJ)Landroid/media/session/PlaybackState$Builder;

    .line 36
    move-wide v1, p3

    invoke-virtual {v0, v1, v2}, Landroid/media/session/PlaybackState$Builder;->setBufferedPosition(J)Landroid/media/session/PlaybackState$Builder;

    .line 37
    move-wide/from16 v3, p6

    invoke-virtual {v0, v3, v4}, Landroid/media/session/PlaybackState$Builder;->setActions(J)Landroid/media/session/PlaybackState$Builder;

    .line 38
    move-object/from16 v5, p8

    invoke-virtual {v0, v5}, Landroid/media/session/PlaybackState$Builder;->setErrorMessage(Ljava/lang/CharSequence;)Landroid/media/session/PlaybackState$Builder;

    .line 39
    invoke-interface/range {p11 .. p11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :goto_20
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_31

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    .line 40
    .local v7, "customAction":Ljava/lang/Object;
    move-object v8, v7

    check-cast v8, Landroid/media/session/PlaybackState$CustomAction;

    invoke-virtual {v0, v8}, Landroid/media/session/PlaybackState$Builder;->addCustomAction(Landroid/media/session/PlaybackState$CustomAction;)Landroid/media/session/PlaybackState$Builder;

    .line 41
    .end local v7    # "customAction":Ljava/lang/Object;
    goto :goto_20

    .line 42
    .end local v6    # "i$":Ljava/util/Iterator;
    :cond_31
    move-wide/from16 v6, p12

    invoke-virtual {v0, v6, v7}, Landroid/media/session/PlaybackState$Builder;->setActiveQueueItemId(J)Landroid/media/session/PlaybackState$Builder;

    .line 43
    move-object/from16 v8, p14

    invoke-virtual {v0, v8}, Landroid/media/session/PlaybackState$Builder;->setExtras(Landroid/os/Bundle;)Landroid/media/session/PlaybackState$Builder;

    .line 44
    invoke-virtual {v0}, Landroid/media/session/PlaybackState$Builder;->build()Landroid/media/session/PlaybackState;

    move-result-object v9

    return-object v9
.end method
