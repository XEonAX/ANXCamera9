.class public Landroid/support/v4/app/NotificationManagerCompat;
.super Ljava/lang/Object;
.source "NotificationManagerCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/app/NotificationManagerCompat$CancelTask;,
        Landroid/support/v4/app/NotificationManagerCompat$NotifyTask;,
        Landroid/support/v4/app/NotificationManagerCompat$Task;,
        Landroid/support/v4/app/NotificationManagerCompat$ServiceConnectedEvent;,
        Landroid/support/v4/app/NotificationManagerCompat$SideChannelManager;,
        Landroid/support/v4/app/NotificationManagerCompat$ImplIceCreamSandwich;,
        Landroid/support/v4/app/NotificationManagerCompat$ImplEclair;,
        Landroid/support/v4/app/NotificationManagerCompat$ImplBase;,
        Landroid/support/v4/app/NotificationManagerCompat$Impl;
    }
.end annotation


# static fields
.field public static final ACTION_BIND_SIDE_CHANNEL:Ljava/lang/String; = "android.support.BIND_NOTIFICATION_SIDE_CHANNEL"

.field public static final EXTRA_USE_SIDE_CHANNEL:Ljava/lang/String; = "android.support.useSideChannel"

.field private static final IMPL:Landroid/support/v4/app/NotificationManagerCompat$Impl;

.field static final MAX_SIDE_CHANNEL_SDK_VERSION:I = 0x13

.field private static final SETTING_ENABLED_NOTIFICATION_LISTENERS:Ljava/lang/String; = "enabled_notification_listeners"

.field private static final SIDE_CHANNEL_BIND_FLAGS:I

.field private static final SIDE_CHANNEL_RETRY_BASE_INTERVAL_MS:I = 0x3e8

.field private static final SIDE_CHANNEL_RETRY_MAX_COUNT:I = 0x6

.field private static final TAG:Ljava/lang/String; = "NotifManCompat"

.field private static sEnabledNotificationListenerPackages:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static sEnabledNotificationListeners:Ljava/lang/String;

.field private static final sEnabledNotificationListenersLock:Ljava/lang/Object;

.field private static final sLock:Ljava/lang/Object;

.field private static sSideChannelManager:Landroid/support/v4/app/NotificationManagerCompat$SideChannelManager;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mNotificationManager:Landroid/app/NotificationManager;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 88
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Landroid/support/v4/app/NotificationManagerCompat;->sEnabledNotificationListenersLock:Ljava/lang/Object;

    .line 92
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Landroid/support/v4/app/NotificationManagerCompat;->sEnabledNotificationListenerPackages:Ljava/util/Set;

    .line 97
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Landroid/support/v4/app/NotificationManagerCompat;->sLock:Ljava/lang/Object;

    .line 165
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_23

    .line 166
    new-instance v0, Landroid/support/v4/app/NotificationManagerCompat$ImplIceCreamSandwich;

    invoke-direct {v0}, Landroid/support/v4/app/NotificationManagerCompat$ImplIceCreamSandwich;-><init>()V

    sput-object v0, Landroid/support/v4/app/NotificationManagerCompat;->IMPL:Landroid/support/v4/app/NotificationManagerCompat$Impl;

    goto :goto_37

    .line 167
    :cond_23
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v1, 0x5

    if-lt v0, v1, :cond_30

    .line 168
    new-instance v0, Landroid/support/v4/app/NotificationManagerCompat$ImplEclair;

    invoke-direct {v0}, Landroid/support/v4/app/NotificationManagerCompat$ImplEclair;-><init>()V

    sput-object v0, Landroid/support/v4/app/NotificationManagerCompat;->IMPL:Landroid/support/v4/app/NotificationManagerCompat$Impl;

    goto :goto_37

    .line 170
    :cond_30
    new-instance v0, Landroid/support/v4/app/NotificationManagerCompat$ImplBase;

    invoke-direct {v0}, Landroid/support/v4/app/NotificationManagerCompat$ImplBase;-><init>()V

    sput-object v0, Landroid/support/v4/app/NotificationManagerCompat;->IMPL:Landroid/support/v4/app/NotificationManagerCompat$Impl;

    .line 172
    :goto_37
    sget-object v0, Landroid/support/v4/app/NotificationManagerCompat;->IMPL:Landroid/support/v4/app/NotificationManagerCompat$Impl;

    invoke-interface {v0}, Landroid/support/v4/app/NotificationManagerCompat$Impl;->getSideChannelBindFlags()I

    move-result v0

    sput v0, Landroid/support/v4/app/NotificationManagerCompat;->SIDE_CHANNEL_BIND_FLAGS:I

    .line 173
    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 107
    iput-object p1, p0, Landroid/support/v4/app/NotificationManagerCompat;->mContext:Landroid/content/Context;

    .line 108
    iget-object v0, p0, Landroid/support/v4/app/NotificationManagerCompat;->mContext:Landroid/content/Context;

    const-string v1, "notification"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    iput-object v0, p0, Landroid/support/v4/app/NotificationManagerCompat;->mNotificationManager:Landroid/app/NotificationManager;

    .line 110
    return-void
.end method

.method static synthetic access$000()I
    .registers 1

    .line 54
    sget v0, Landroid/support/v4/app/NotificationManagerCompat;->SIDE_CHANNEL_BIND_FLAGS:I

    return v0
.end method

.method public static from(Landroid/content/Context;)Landroid/support/v4/app/NotificationManagerCompat;
    .registers 2
    .param p0, "context"    # Landroid/content/Context;

    .line 103
    new-instance v0, Landroid/support/v4/app/NotificationManagerCompat;

    invoke-direct {v0, p0}, Landroid/support/v4/app/NotificationManagerCompat;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method public static getEnabledListenerPackages(Landroid/content/Context;)Ljava/util/Set;
    .registers 10
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 233
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "enabled_notification_listeners"

    invoke-static {v0, v1}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 237
    .local v0, "enabledNotificationListeners":Ljava/lang/String;
    if-eqz v0, :cond_43

    sget-object v1, Landroid/support/v4/app/NotificationManagerCompat;->sEnabledNotificationListeners:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_43

    .line 239
    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 240
    .local v1, "components":[Ljava/lang/String;
    new-instance v2, Ljava/util/HashSet;

    array-length v3, v1

    invoke-direct {v2, v3}, Ljava/util/HashSet;-><init>(I)V

    .line 241
    .local v2, "packageNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    move-object v3, v1

    .local v3, "arr$":[Ljava/lang/String;
    array-length v4, v3

    .local v4, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    :goto_23
    if-ge v5, v4, :cond_37

    aget-object v6, v3, v5

    .line 242
    .local v6, "component":Ljava/lang/String;
    invoke-static {v6}, Landroid/content/ComponentName;->unflattenFromString(Ljava/lang/String;)Landroid/content/ComponentName;

    move-result-object v7

    .line 243
    .local v7, "componentName":Landroid/content/ComponentName;
    if-eqz v7, :cond_34

    .line 244
    invoke-virtual {v7}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v2, v8}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 241
    .end local v6    # "component":Ljava/lang/String;
    .end local v7    # "componentName":Landroid/content/ComponentName;
    :cond_34
    add-int/lit8 v5, v5, 0x1

    goto :goto_23

    .line 247
    .end local v3    # "arr$":[Ljava/lang/String;
    .end local v4    # "len$":I
    .end local v5    # "i$":I
    :cond_37
    sget-object v3, Landroid/support/v4/app/NotificationManagerCompat;->sEnabledNotificationListenersLock:Ljava/lang/Object;

    monitor-enter v3

    .line 248
    :try_start_3a
    sput-object v2, Landroid/support/v4/app/NotificationManagerCompat;->sEnabledNotificationListenerPackages:Ljava/util/Set;

    .line 249
    sput-object v0, Landroid/support/v4/app/NotificationManagerCompat;->sEnabledNotificationListeners:Ljava/lang/String;

    .line 250
    monitor-exit v3

    goto :goto_43

    :catchall_40
    move-exception v4

    monitor-exit v3
    :try_end_42
    .catchall {:try_start_3a .. :try_end_42} :catchall_40

    throw v4

    .line 252
    .end local v1    # "components":[Ljava/lang/String;
    .end local v2    # "packageNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_43
    :goto_43
    sget-object v1, Landroid/support/v4/app/NotificationManagerCompat;->sEnabledNotificationListenerPackages:Ljava/util/Set;

    return-object v1
.end method

.method private pushSideChannelQueue(Landroid/support/v4/app/NotificationManagerCompat$Task;)V
    .registers 5
    .param p1, "task"    # Landroid/support/v4/app/NotificationManagerCompat$Task;

    .line 267
    sget-object v0, Landroid/support/v4/app/NotificationManagerCompat;->sLock:Ljava/lang/Object;

    monitor-enter v0

    .line 268
    :try_start_3
    sget-object v1, Landroid/support/v4/app/NotificationManagerCompat;->sSideChannelManager:Landroid/support/v4/app/NotificationManagerCompat$SideChannelManager;

    if-nez v1, :cond_14

    .line 269
    new-instance v1, Landroid/support/v4/app/NotificationManagerCompat$SideChannelManager;

    iget-object v2, p0, Landroid/support/v4/app/NotificationManagerCompat;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/support/v4/app/NotificationManagerCompat$SideChannelManager;-><init>(Landroid/content/Context;)V

    sput-object v1, Landroid/support/v4/app/NotificationManagerCompat;->sSideChannelManager:Landroid/support/v4/app/NotificationManagerCompat$SideChannelManager;

    .line 271
    :cond_14
    monitor-exit v0
    :try_end_15
    .catchall {:try_start_3 .. :try_end_15} :catchall_1b

    .line 272
    sget-object v0, Landroid/support/v4/app/NotificationManagerCompat;->sSideChannelManager:Landroid/support/v4/app/NotificationManagerCompat$SideChannelManager;

    invoke-virtual {v0, p1}, Landroid/support/v4/app/NotificationManagerCompat$SideChannelManager;->queueTask(Landroid/support/v4/app/NotificationManagerCompat$Task;)V

    .line 273
    return-void

    .line 271
    :catchall_1b
    move-exception v1

    :try_start_1c
    monitor-exit v0
    :try_end_1d
    .catchall {:try_start_1c .. :try_end_1d} :catchall_1b

    throw v1
.end method

.method private static useSideChannelForNotification(Landroid/app/Notification;)Z
    .registers 3
    .param p0, "notification"    # Landroid/app/Notification;

    .line 259
    invoke-static {p0}, Landroid/support/v4/app/NotificationCompat;->getExtras(Landroid/app/Notification;)Landroid/os/Bundle;

    move-result-object v0

    .line 260
    .local v0, "extras":Landroid/os/Bundle;
    if-eqz v0, :cond_10

    const-string v1, "android.support.useSideChannel"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_10

    const/4 v1, 0x1

    goto :goto_11

    :cond_10
    const/4 v1, 0x0

    :goto_11
    return v1
.end method


# virtual methods
.method public cancel(I)V
    .registers 3
    .param p1, "id"    # I

    .line 180
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Landroid/support/v4/app/NotificationManagerCompat;->cancel(Ljava/lang/String;I)V

    .line 181
    return-void
.end method

.method public cancel(Ljava/lang/String;I)V
    .registers 5
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "id"    # I

    .line 189
    sget-object v0, Landroid/support/v4/app/NotificationManagerCompat;->IMPL:Landroid/support/v4/app/NotificationManagerCompat$Impl;

    iget-object v1, p0, Landroid/support/v4/app/NotificationManagerCompat;->mNotificationManager:Landroid/app/NotificationManager;

    invoke-interface {v0, v1, p1, p2}, Landroid/support/v4/app/NotificationManagerCompat$Impl;->cancelNotification(Landroid/app/NotificationManager;Ljava/lang/String;I)V

    .line 190
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-gt v0, v1, :cond_1b

    .line 191
    new-instance v0, Landroid/support/v4/app/NotificationManagerCompat$CancelTask;

    iget-object v1, p0, Landroid/support/v4/app/NotificationManagerCompat;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p2, p1}, Landroid/support/v4/app/NotificationManagerCompat$CancelTask;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    invoke-direct {p0, v0}, Landroid/support/v4/app/NotificationManagerCompat;->pushSideChannelQueue(Landroid/support/v4/app/NotificationManagerCompat$Task;)V

    .line 193
    :cond_1b
    return-void
.end method

.method public cancelAll()V
    .registers 3

    .line 197
    iget-object v0, p0, Landroid/support/v4/app/NotificationManagerCompat;->mNotificationManager:Landroid/app/NotificationManager;

    invoke-virtual {v0}, Landroid/app/NotificationManager;->cancelAll()V

    .line 198
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-gt v0, v1, :cond_19

    .line 199
    new-instance v0, Landroid/support/v4/app/NotificationManagerCompat$CancelTask;

    iget-object v1, p0, Landroid/support/v4/app/NotificationManagerCompat;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v4/app/NotificationManagerCompat$CancelTask;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Landroid/support/v4/app/NotificationManagerCompat;->pushSideChannelQueue(Landroid/support/v4/app/NotificationManagerCompat$Task;)V

    .line 201
    :cond_19
    return-void
.end method

.method public notify(ILandroid/app/Notification;)V
    .registers 4
    .param p1, "id"    # I
    .param p2, "notification"    # Landroid/app/Notification;

    .line 209
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1, p2}, Landroid/support/v4/app/NotificationManagerCompat;->notify(Ljava/lang/String;ILandroid/app/Notification;)V

    .line 210
    return-void
.end method

.method public notify(Ljava/lang/String;ILandroid/app/Notification;)V
    .registers 6
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "id"    # I
    .param p3, "notification"    # Landroid/app/Notification;

    .line 219
    invoke-static {p3}, Landroid/support/v4/app/NotificationManagerCompat;->useSideChannelForNotification(Landroid/app/Notification;)Z

    move-result v0

    if-eqz v0, :cond_1c

    .line 220
    new-instance v0, Landroid/support/v4/app/NotificationManagerCompat$NotifyTask;

    iget-object v1, p0, Landroid/support/v4/app/NotificationManagerCompat;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p2, p1, p3}, Landroid/support/v4/app/NotificationManagerCompat$NotifyTask;-><init>(Ljava/lang/String;ILjava/lang/String;Landroid/app/Notification;)V

    invoke-direct {p0, v0}, Landroid/support/v4/app/NotificationManagerCompat;->pushSideChannelQueue(Landroid/support/v4/app/NotificationManagerCompat$Task;)V

    .line 223
    sget-object v0, Landroid/support/v4/app/NotificationManagerCompat;->IMPL:Landroid/support/v4/app/NotificationManagerCompat$Impl;

    iget-object v1, p0, Landroid/support/v4/app/NotificationManagerCompat;->mNotificationManager:Landroid/app/NotificationManager;

    invoke-interface {v0, v1, p1, p2}, Landroid/support/v4/app/NotificationManagerCompat$Impl;->cancelNotification(Landroid/app/NotificationManager;Ljava/lang/String;I)V

    goto :goto_23

    .line 225
    :cond_1c
    sget-object v0, Landroid/support/v4/app/NotificationManagerCompat;->IMPL:Landroid/support/v4/app/NotificationManagerCompat$Impl;

    iget-object v1, p0, Landroid/support/v4/app/NotificationManagerCompat;->mNotificationManager:Landroid/app/NotificationManager;

    invoke-interface {v0, v1, p1, p2, p3}, Landroid/support/v4/app/NotificationManagerCompat$Impl;->postNotification(Landroid/app/NotificationManager;Ljava/lang/String;ILandroid/app/Notification;)V

    .line 227
    :goto_23
    return-void
.end method
