.class Landroid/support/v4/app/NotificationCompat$NotificationCompatImplJellybean;
.super Landroid/support/v4/app/NotificationCompat$NotificationCompatImplBase;
.source "NotificationCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/app/NotificationCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "NotificationCompatImplJellybean"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 589
    invoke-direct {p0}, Landroid/support/v4/app/NotificationCompat$NotificationCompatImplBase;-><init>()V

    return-void
.end method


# virtual methods
.method public build(Landroid/support/v4/app/NotificationCompat$Builder;Landroid/support/v4/app/NotificationCompat$BuilderExtender;)Landroid/app/Notification;
    .registers 33
    .param p1, "b"    # Landroid/support/v4/app/NotificationCompat$Builder;
    .param p2, "extender"    # Landroid/support/v4/app/NotificationCompat$BuilderExtender;

    move-object/from16 v0, p1

    .line 592
    new-instance v23, Landroid/support/v4/app/NotificationCompatJellybean$Builder;

    iget-object v2, v0, Landroid/support/v4/app/NotificationCompat$Builder;->mContext:Landroid/content/Context;

    iget-object v3, v0, Landroid/support/v4/app/NotificationCompat$Builder;->mNotification:Landroid/app/Notification;

    iget-object v4, v0, Landroid/support/v4/app/NotificationCompat$Builder;->mContentTitle:Ljava/lang/CharSequence;

    iget-object v5, v0, Landroid/support/v4/app/NotificationCompat$Builder;->mContentText:Ljava/lang/CharSequence;

    iget-object v6, v0, Landroid/support/v4/app/NotificationCompat$Builder;->mContentInfo:Ljava/lang/CharSequence;

    iget-object v7, v0, Landroid/support/v4/app/NotificationCompat$Builder;->mTickerView:Landroid/widget/RemoteViews;

    iget v8, v0, Landroid/support/v4/app/NotificationCompat$Builder;->mNumber:I

    iget-object v9, v0, Landroid/support/v4/app/NotificationCompat$Builder;->mContentIntent:Landroid/app/PendingIntent;

    iget-object v10, v0, Landroid/support/v4/app/NotificationCompat$Builder;->mFullScreenIntent:Landroid/app/PendingIntent;

    iget-object v11, v0, Landroid/support/v4/app/NotificationCompat$Builder;->mLargeIcon:Landroid/graphics/Bitmap;

    iget v12, v0, Landroid/support/v4/app/NotificationCompat$Builder;->mProgressMax:I

    iget v13, v0, Landroid/support/v4/app/NotificationCompat$Builder;->mProgress:I

    iget-boolean v14, v0, Landroid/support/v4/app/NotificationCompat$Builder;->mProgressIndeterminate:Z

    iget-boolean v15, v0, Landroid/support/v4/app/NotificationCompat$Builder;->mUseChronometer:Z

    iget v1, v0, Landroid/support/v4/app/NotificationCompat$Builder;->mPriority:I

    move/from16 v24, v15

    iget-object v15, v0, Landroid/support/v4/app/NotificationCompat$Builder;->mSubText:Ljava/lang/CharSequence;

    move-object/from16 v25, v15

    iget-boolean v15, v0, Landroid/support/v4/app/NotificationCompat$Builder;->mLocalOnly:Z

    move/from16 v26, v15

    iget-object v15, v0, Landroid/support/v4/app/NotificationCompat$Builder;->mExtras:Landroid/os/Bundle;

    move-object/from16 v27, v15

    iget-object v15, v0, Landroid/support/v4/app/NotificationCompat$Builder;->mGroupKey:Ljava/lang/String;

    move-object/from16 v28, v15

    iget-boolean v15, v0, Landroid/support/v4/app/NotificationCompat$Builder;->mGroupSummary:Z

    move/from16 v29, v15

    iget-object v15, v0, Landroid/support/v4/app/NotificationCompat$Builder;->mSortKey:Ljava/lang/String;

    move/from16 v16, v1

    move-object/from16 v1, v23

    move-object/from16 v22, v15

    move-object/from16 v17, v25

    move/from16 v18, v26

    move-object/from16 v19, v27

    move-object/from16 v20, v28

    move/from16 v21, v29

    move/from16 v15, v24

    invoke-direct/range {v1 .. v22}, Landroid/support/v4/app/NotificationCompatJellybean$Builder;-><init>(Landroid/content/Context;Landroid/app/Notification;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/widget/RemoteViews;ILandroid/app/PendingIntent;Landroid/app/PendingIntent;Landroid/graphics/Bitmap;IIZZILjava/lang/CharSequence;ZLandroid/os/Bundle;Ljava/lang/String;ZLjava/lang/String;)V

    .line 598
    .local v1, "builder":Landroid/support/v4/app/NotificationCompatJellybean$Builder;
    iget-object v2, v0, Landroid/support/v4/app/NotificationCompat$Builder;->mActions:Ljava/util/ArrayList;

    # invokes: Landroid/support/v4/app/NotificationCompat;->addActionsToBuilder(Landroid/support/v4/app/NotificationBuilderWithActions;Ljava/util/ArrayList;)V
    invoke-static {v1, v2}, Landroid/support/v4/app/NotificationCompat;->access$000(Landroid/support/v4/app/NotificationBuilderWithActions;Ljava/util/ArrayList;)V

    .line 599
    iget-object v2, v0, Landroid/support/v4/app/NotificationCompat$Builder;->mStyle:Landroid/support/v4/app/NotificationCompat$Style;

    # invokes: Landroid/support/v4/app/NotificationCompat;->addStyleToBuilderJellybean(Landroid/support/v4/app/NotificationBuilderWithBuilderAccessor;Landroid/support/v4/app/NotificationCompat$Style;)V
    invoke-static {v1, v2}, Landroid/support/v4/app/NotificationCompat;->access$100(Landroid/support/v4/app/NotificationBuilderWithBuilderAccessor;Landroid/support/v4/app/NotificationCompat$Style;)V

    .line 600
    move-object/from16 v2, p2

    invoke-virtual {v2, v0, v1}, Landroid/support/v4/app/NotificationCompat$BuilderExtender;->build(Landroid/support/v4/app/NotificationCompat$Builder;Landroid/support/v4/app/NotificationBuilderWithBuilderAccessor;)Landroid/app/Notification;

    move-result-object v3

    return-object v3
.end method

.method public getAction(Landroid/app/Notification;I)Landroid/support/v4/app/NotificationCompat$Action;
    .registers 5
    .param p1, "n"    # Landroid/app/Notification;
    .param p2, "actionIndex"    # I

    .line 615
    sget-object v0, Landroid/support/v4/app/NotificationCompat$Action;->FACTORY:Landroid/support/v4/app/NotificationCompatBase$Action$Factory;

    sget-object v1, Landroid/support/v4/app/RemoteInput;->FACTORY:Landroid/support/v4/app/RemoteInputCompatBase$RemoteInput$Factory;

    invoke-static {p1, p2, v0, v1}, Landroid/support/v4/app/NotificationCompatJellybean;->getAction(Landroid/app/Notification;ILandroid/support/v4/app/NotificationCompatBase$Action$Factory;Landroid/support/v4/app/RemoteInputCompatBase$RemoteInput$Factory;)Landroid/support/v4/app/NotificationCompatBase$Action;

    move-result-object v0

    check-cast v0, Landroid/support/v4/app/NotificationCompat$Action;

    return-object v0
.end method

.method public getActionCount(Landroid/app/Notification;)I
    .registers 3
    .param p1, "n"    # Landroid/app/Notification;

    .line 610
    invoke-static {p1}, Landroid/support/v4/app/NotificationCompatJellybean;->getActionCount(Landroid/app/Notification;)I

    move-result v0

    return v0
.end method

.method public getActionsFromParcelableArrayList(Ljava/util/ArrayList;)[Landroid/support/v4/app/NotificationCompat$Action;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/os/Parcelable;",
            ">;)[",
            "Landroid/support/v4/app/NotificationCompat$Action;"
        }
    .end annotation

    .line 622
    .local p1, "parcelables":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/os/Parcelable;>;"
    sget-object v0, Landroid/support/v4/app/NotificationCompat$Action;->FACTORY:Landroid/support/v4/app/NotificationCompatBase$Action$Factory;

    sget-object v1, Landroid/support/v4/app/RemoteInput;->FACTORY:Landroid/support/v4/app/RemoteInputCompatBase$RemoteInput$Factory;

    invoke-static {p1, v0, v1}, Landroid/support/v4/app/NotificationCompatJellybean;->getActionsFromParcelableArrayList(Ljava/util/ArrayList;Landroid/support/v4/app/NotificationCompatBase$Action$Factory;Landroid/support/v4/app/RemoteInputCompatBase$RemoteInput$Factory;)[Landroid/support/v4/app/NotificationCompatBase$Action;

    move-result-object v0

    check-cast v0, [Landroid/support/v4/app/NotificationCompat$Action;

    return-object v0
.end method

.method public getExtras(Landroid/app/Notification;)Landroid/os/Bundle;
    .registers 3
    .param p1, "n"    # Landroid/app/Notification;

    .line 605
    invoke-static {p1}, Landroid/support/v4/app/NotificationCompatJellybean;->getExtras(Landroid/app/Notification;)Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method public getGroup(Landroid/app/Notification;)Ljava/lang/String;
    .registers 3
    .param p1, "n"    # Landroid/app/Notification;

    .line 639
    invoke-static {p1}, Landroid/support/v4/app/NotificationCompatJellybean;->getGroup(Landroid/app/Notification;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLocalOnly(Landroid/app/Notification;)Z
    .registers 3
    .param p1, "n"    # Landroid/app/Notification;

    .line 634
    invoke-static {p1}, Landroid/support/v4/app/NotificationCompatJellybean;->getLocalOnly(Landroid/app/Notification;)Z

    move-result v0

    return v0
.end method

.method public getParcelableArrayListForActions([Landroid/support/v4/app/NotificationCompat$Action;)Ljava/util/ArrayList;
    .registers 3
    .param p1, "actions"    # [Landroid/support/v4/app/NotificationCompat$Action;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Landroid/support/v4/app/NotificationCompat$Action;",
            ")",
            "Ljava/util/ArrayList<",
            "Landroid/os/Parcelable;",
            ">;"
        }
    .end annotation

    .line 629
    invoke-static {p1}, Landroid/support/v4/app/NotificationCompatJellybean;->getParcelableArrayListForActions([Landroid/support/v4/app/NotificationCompatBase$Action;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public getSortKey(Landroid/app/Notification;)Ljava/lang/String;
    .registers 3
    .param p1, "n"    # Landroid/app/Notification;

    .line 649
    invoke-static {p1}, Landroid/support/v4/app/NotificationCompatJellybean;->getSortKey(Landroid/app/Notification;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isGroupSummary(Landroid/app/Notification;)Z
    .registers 3
    .param p1, "n"    # Landroid/app/Notification;

    .line 644
    invoke-static {p1}, Landroid/support/v4/app/NotificationCompatJellybean;->isGroupSummary(Landroid/app/Notification;)Z

    move-result v0

    return v0
.end method
