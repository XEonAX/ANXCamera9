.class Landroid/support/v4/app/NotificationCompatApi21;
.super Ljava/lang/Object;
.source "NotificationCompatApi21.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/app/NotificationCompatApi21$Builder;
    }
.end annotation


# static fields
.field public static final CATEGORY_ALARM:Ljava/lang/String; = "alarm"

.field public static final CATEGORY_CALL:Ljava/lang/String; = "call"

.field public static final CATEGORY_EMAIL:Ljava/lang/String; = "email"

.field public static final CATEGORY_ERROR:Ljava/lang/String; = "err"

.field public static final CATEGORY_EVENT:Ljava/lang/String; = "event"

.field public static final CATEGORY_MESSAGE:Ljava/lang/String; = "msg"

.field public static final CATEGORY_PROGRESS:Ljava/lang/String; = "progress"

.field public static final CATEGORY_PROMO:Ljava/lang/String; = "promo"

.field public static final CATEGORY_RECOMMENDATION:Ljava/lang/String; = "recommendation"

.field public static final CATEGORY_SERVICE:Ljava/lang/String; = "service"

.field public static final CATEGORY_SOCIAL:Ljava/lang/String; = "social"

.field public static final CATEGORY_STATUS:Ljava/lang/String; = "status"

.field public static final CATEGORY_SYSTEM:Ljava/lang/String; = "sys"

.field public static final CATEGORY_TRANSPORT:Ljava/lang/String; = "transport"

.field private static final KEY_AUTHOR:Ljava/lang/String; = "author"

.field private static final KEY_MESSAGES:Ljava/lang/String; = "messages"

.field private static final KEY_ON_READ:Ljava/lang/String; = "on_read"

.field private static final KEY_ON_REPLY:Ljava/lang/String; = "on_reply"

.field private static final KEY_PARTICIPANTS:Ljava/lang/String; = "participants"

.field private static final KEY_REMOTE_INPUT:Ljava/lang/String; = "remote_input"

.field private static final KEY_TEXT:Ljava/lang/String; = "text"

.field private static final KEY_TIMESTAMP:Ljava/lang/String; = "timestamp"


# direct methods
.method constructor <init>()V
    .registers 1

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    return-void
.end method

.method private static fromCompatRemoteInput(Landroid/support/v4/app/RemoteInputCompatBase$RemoteInput;)Landroid/app/RemoteInput;
    .registers 3
    .param p0, "src"    # Landroid/support/v4/app/RemoteInputCompatBase$RemoteInput;

    .line 206
    new-instance v0, Landroid/app/RemoteInput$Builder;

    invoke-virtual {p0}, Landroid/support/v4/app/RemoteInputCompatBase$RemoteInput;->getResultKey()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/RemoteInput$Builder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/support/v4/app/RemoteInputCompatBase$RemoteInput;->getLabel()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/RemoteInput$Builder;->setLabel(Ljava/lang/CharSequence;)Landroid/app/RemoteInput$Builder;

    move-result-object v0

    invoke-virtual {p0}, Landroid/support/v4/app/RemoteInputCompatBase$RemoteInput;->getChoices()[Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/RemoteInput$Builder;->setChoices([Ljava/lang/CharSequence;)Landroid/app/RemoteInput$Builder;

    move-result-object v0

    invoke-virtual {p0}, Landroid/support/v4/app/RemoteInputCompatBase$RemoteInput;->getAllowFreeFormInput()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/app/RemoteInput$Builder;->setAllowFreeFormInput(Z)Landroid/app/RemoteInput$Builder;

    move-result-object v0

    invoke-virtual {p0}, Landroid/support/v4/app/RemoteInputCompatBase$RemoteInput;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/RemoteInput$Builder;->addExtras(Landroid/os/Bundle;)Landroid/app/RemoteInput$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/RemoteInput$Builder;->build()Landroid/app/RemoteInput;

    move-result-object v0

    return-object v0
.end method

.method static getBundleForUnreadConversation(Landroid/support/v4/app/NotificationCompatBase$UnreadConversation;)Landroid/os/Bundle;
    .registers 8
    .param p0, "uc"    # Landroid/support/v4/app/NotificationCompatBase$UnreadConversation;

    .line 129
    if-nez p0, :cond_4

    .line 130
    const/4 v0, 0x0

    return-object v0

    .line 132
    :cond_4
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 133
    .local v0, "b":Landroid/os/Bundle;
    const/4 v1, 0x0

    .line 134
    .local v1, "author":Ljava/lang/String;
    invoke-virtual {p0}, Landroid/support/v4/app/NotificationCompatBase$UnreadConversation;->getParticipants()[Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    if-eqz v2, :cond_1f

    invoke-virtual {p0}, Landroid/support/v4/app/NotificationCompatBase$UnreadConversation;->getParticipants()[Ljava/lang/String;

    move-result-object v2

    array-length v2, v2

    const/4 v4, 0x1

    if-le v2, v4, :cond_1f

    .line 135
    invoke-virtual {p0}, Landroid/support/v4/app/NotificationCompatBase$UnreadConversation;->getParticipants()[Ljava/lang/String;

    move-result-object v2

    aget-object v1, v2, v3

    .line 137
    :cond_1f
    invoke-virtual {p0}, Landroid/support/v4/app/NotificationCompatBase$UnreadConversation;->getMessages()[Ljava/lang/String;

    move-result-object v2

    array-length v2, v2

    new-array v2, v2, [Landroid/os/Parcelable;

    .line 138
    .local v2, "messages":[Landroid/os/Parcelable;
    nop

    .local v3, "i":I
    :goto_27
    array-length v4, v2

    if-ge v3, v4, :cond_44

    .line 139
    new-instance v4, Landroid/os/Bundle;

    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    .line 140
    .local v4, "m":Landroid/os/Bundle;
    const-string v5, "text"

    invoke-virtual {p0}, Landroid/support/v4/app/NotificationCompatBase$UnreadConversation;->getMessages()[Ljava/lang/String;

    move-result-object v6

    aget-object v6, v6, v3

    invoke-virtual {v4, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 141
    const-string v5, "author"

    invoke-virtual {v4, v5, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    aput-object v4, v2, v3

    .line 138
    .end local v4    # "m":Landroid/os/Bundle;
    add-int/lit8 v3, v3, 0x1

    goto :goto_27

    .line 144
    .end local v3    # "i":I
    :cond_44
    const-string v3, "messages"

    invoke-virtual {v0, v3, v2}, Landroid/os/Bundle;->putParcelableArray(Ljava/lang/String;[Landroid/os/Parcelable;)V

    .line 145
    invoke-virtual {p0}, Landroid/support/v4/app/NotificationCompatBase$UnreadConversation;->getRemoteInput()Landroid/support/v4/app/RemoteInputCompatBase$RemoteInput;

    move-result-object v3

    .line 146
    .local v3, "remoteInput":Landroid/support/v4/app/RemoteInputCompatBase$RemoteInput;
    if-eqz v3, :cond_58

    .line 147
    const-string v4, "remote_input"

    invoke-static {v3}, Landroid/support/v4/app/NotificationCompatApi21;->fromCompatRemoteInput(Landroid/support/v4/app/RemoteInputCompatBase$RemoteInput;)Landroid/app/RemoteInput;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 149
    :cond_58
    const-string v4, "on_reply"

    invoke-virtual {p0}, Landroid/support/v4/app/NotificationCompatBase$UnreadConversation;->getReplyPendingIntent()Landroid/app/PendingIntent;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 150
    const-string v4, "on_read"

    invoke-virtual {p0}, Landroid/support/v4/app/NotificationCompatBase$UnreadConversation;->getReadPendingIntent()Landroid/app/PendingIntent;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 151
    const-string v4, "participants"

    invoke-virtual {p0}, Landroid/support/v4/app/NotificationCompatBase$UnreadConversation;->getParticipants()[Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    .line 152
    const-string v4, "timestamp"

    invoke-virtual {p0}, Landroid/support/v4/app/NotificationCompatBase$UnreadConversation;->getLatestTimestamp()J

    move-result-wide v5

    invoke-virtual {v0, v4, v5, v6}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 153
    return-object v0
.end method

.method public static getCategory(Landroid/app/Notification;)Ljava/lang/String;
    .registers 2
    .param p0, "notif"    # Landroid/app/Notification;

    .line 125
    iget-object v0, p0, Landroid/app/Notification;->category:Ljava/lang/String;

    return-object v0
.end method

.method static getUnreadConversationFromBundle(Landroid/os/Bundle;Landroid/support/v4/app/NotificationCompatBase$UnreadConversation$Factory;Landroid/support/v4/app/RemoteInputCompatBase$RemoteInput$Factory;)Landroid/support/v4/app/NotificationCompatBase$UnreadConversation;
    .registers 21
    .param p0, "b"    # Landroid/os/Bundle;
    .param p1, "factory"    # Landroid/support/v4/app/NotificationCompatBase$UnreadConversation$Factory;
    .param p2, "remoteInputFactory"    # Landroid/support/v4/app/RemoteInputCompatBase$RemoteInput$Factory;

    move-object/from16 v0, p0

    .line 159
    const/4 v1, 0x0

    if-nez v0, :cond_6

    .line 160
    return-object v1

    .line 162
    :cond_6
    const-string v2, "messages"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getParcelableArray(Ljava/lang/String;)[Landroid/os/Parcelable;

    move-result-object v2

    .line 163
    .local v2, "parcelableMessages":[Landroid/os/Parcelable;
    const/4 v3, 0x0

    .line 164
    .local v3, "messages":[Ljava/lang/String;
    if-eqz v2, :cond_39

    .line 165
    array-length v4, v2

    new-array v4, v4, [Ljava/lang/String;

    .line 166
    .local v4, "tmp":[Ljava/lang/String;
    const/4 v5, 0x1

    .line 167
    .local v5, "success":Z
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_14
    array-length v7, v4

    if-ge v6, v7, :cond_34

    .line 168
    aget-object v7, v2, v6

    instance-of v7, v7, Landroid/os/Bundle;

    if-nez v7, :cond_1f

    .line 169
    const/4 v5, 0x0

    .line 170
    goto :goto_34

    .line 172
    :cond_1f
    aget-object v7, v2, v6

    check-cast v7, Landroid/os/Bundle;

    const-string v8, "text"

    invoke-virtual {v7, v8}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v4, v6

    .line 173
    aget-object v7, v4, v6

    if-nez v7, :cond_31

    .line 174
    const/4 v5, 0x0

    .line 175
    goto :goto_34

    .line 167
    :cond_31
    add-int/lit8 v6, v6, 0x1

    goto :goto_14

    .line 178
    .end local v6    # "i":I
    :cond_34
    :goto_34
    if-eqz v5, :cond_38

    .line 179
    move-object v3, v4

    goto :goto_39

    .line 181
    :cond_38
    return-object v1

    .line 185
    .end local v4    # "tmp":[Ljava/lang/String;
    .end local v5    # "success":Z
    :cond_39
    :goto_39
    const-string v4, "on_read"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v4

    check-cast v4, Landroid/app/PendingIntent;

    .line 186
    .local v4, "onRead":Landroid/app/PendingIntent;
    const-string v5, "on_reply"

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v5

    check-cast v5, Landroid/app/PendingIntent;

    .line 188
    .local v5, "onReply":Landroid/app/PendingIntent;
    const-string v6, "remote_input"

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v6

    move-object v14, v6

    check-cast v14, Landroid/app/RemoteInput;

    .line 190
    .local v14, "remoteInput":Landroid/app/RemoteInput;
    const-string v6, "participants"

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 191
    .local v15, "participants":[Ljava/lang/String;
    if-eqz v15, :cond_7f

    array-length v6, v15

    const/4 v7, 0x1

    if-eq v6, v7, :cond_5f

    goto :goto_7f

    .line 196
    :cond_5f
    if-eqz v14, :cond_69

    move-object/from16 v12, p2

    invoke-static {v14, v12}, Landroid/support/v4/app/NotificationCompatApi21;->toCompatRemoteInput(Landroid/app/RemoteInput;Landroid/support/v4/app/RemoteInputCompatBase$RemoteInput$Factory;)Landroid/support/v4/app/RemoteInputCompatBase$RemoteInput;

    move-result-object v1

    :goto_67
    move-object v8, v1

    goto :goto_6c

    :cond_69
    move-object/from16 v12, p2

    goto :goto_67

    :goto_6c
    const-string v1, "timestamp"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v16

    move-object/from16 v6, p1

    move-object v7, v3

    move-object v9, v5

    move-object v10, v4

    move-object v11, v15

    move-wide/from16 v12, v16

    invoke-interface/range {v6 .. v13}, Landroid/support/v4/app/NotificationCompatBase$UnreadConversation$Factory;->build([Ljava/lang/String;Landroid/support/v4/app/RemoteInputCompatBase$RemoteInput;Landroid/app/PendingIntent;Landroid/app/PendingIntent;[Ljava/lang/String;J)Landroid/support/v4/app/NotificationCompatBase$UnreadConversation;

    move-result-object v1

    return-object v1

    .line 192
    :cond_7f
    :goto_7f
    return-object v1
.end method

.method private static toCompatRemoteInput(Landroid/app/RemoteInput;Landroid/support/v4/app/RemoteInputCompatBase$RemoteInput$Factory;)Landroid/support/v4/app/RemoteInputCompatBase$RemoteInput;
    .registers 8
    .param p0, "remoteInput"    # Landroid/app/RemoteInput;
    .param p1, "factory"    # Landroid/support/v4/app/RemoteInputCompatBase$RemoteInput$Factory;

    .line 217
    invoke-virtual {p0}, Landroid/app/RemoteInput;->getResultKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Landroid/app/RemoteInput;->getLabel()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {p0}, Landroid/app/RemoteInput;->getChoices()[Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {p0}, Landroid/app/RemoteInput;->getAllowFreeFormInput()Z

    move-result v4

    invoke-virtual {p0}, Landroid/app/RemoteInput;->getExtras()Landroid/os/Bundle;

    move-result-object v5

    move-object v0, p1

    invoke-interface/range {v0 .. v5}, Landroid/support/v4/app/RemoteInputCompatBase$RemoteInput$Factory;->build(Ljava/lang/String;Ljava/lang/CharSequence;[Ljava/lang/CharSequence;ZLandroid/os/Bundle;)Landroid/support/v4/app/RemoteInputCompatBase$RemoteInput;

    move-result-object v0

    return-object v0
.end method
