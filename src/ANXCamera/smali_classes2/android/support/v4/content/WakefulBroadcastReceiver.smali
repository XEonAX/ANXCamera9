.class public abstract Landroid/support/v4/content/WakefulBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "WakefulBroadcastReceiver.java"


# static fields
.field private static final EXTRA_WAKE_LOCK_ID:Ljava/lang/String; = "android.support.content.wakelockid"

.field private static final mActiveWakeLocks:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Landroid/os/PowerManager$WakeLock;",
            ">;"
        }
    .end annotation
.end field

.field private static mNextId:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 62
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    sput-object v0, Landroid/support/v4/content/WakefulBroadcastReceiver;->mActiveWakeLocks:Landroid/util/SparseArray;

    .line 64
    const/4 v0, 0x1

    sput v0, Landroid/support/v4/content/WakefulBroadcastReceiver;->mNextId:I

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 59
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method public static completeWakefulIntent(Landroid/content/Intent;)Z
    .registers 8
    .param p0, "intent"    # Landroid/content/Intent;

    .line 113
    const-string v0, "android.support.content.wakelockid"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 114
    .local v0, "id":I
    if-nez v0, :cond_a

    .line 115
    return v1

    .line 117
    :cond_a
    sget-object v1, Landroid/support/v4/content/WakefulBroadcastReceiver;->mActiveWakeLocks:Landroid/util/SparseArray;

    monitor-enter v1

    .line 118
    :try_start_d
    sget-object v2, Landroid/support/v4/content/WakefulBroadcastReceiver;->mActiveWakeLocks:Landroid/util/SparseArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/PowerManager$WakeLock;

    .line 119
    .local v2, "wl":Landroid/os/PowerManager$WakeLock;
    const/4 v3, 0x1

    if-eqz v2, :cond_22

    .line 120
    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 121
    sget-object v4, Landroid/support/v4/content/WakefulBroadcastReceiver;->mActiveWakeLocks:Landroid/util/SparseArray;

    invoke-virtual {v4, v0}, Landroid/util/SparseArray;->remove(I)V

    .line 122
    monitor-exit v1

    return v3

    .line 130
    :cond_22
    const-string v4, "WakefulBroadcastReceiver"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "No active wake lock id #"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    monitor-exit v1

    return v3

    .line 132
    .end local v2    # "wl":Landroid/os/PowerManager$WakeLock;
    :catchall_3a
    move-exception v2

    monitor-exit v1
    :try_end_3c
    .catchall {:try_start_d .. :try_end_3c} :catchall_3a

    throw v2
.end method

.method public static startWakefulService(Landroid/content/Context;Landroid/content/Intent;)Landroid/content/ComponentName;
    .registers 9
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "intent"    # Landroid/content/Intent;

    .line 81
    sget-object v0, Landroid/support/v4/content/WakefulBroadcastReceiver;->mActiveWakeLocks:Landroid/util/SparseArray;

    monitor-enter v0

    .line 82
    :try_start_3
    sget v1, Landroid/support/v4/content/WakefulBroadcastReceiver;->mNextId:I

    .line 83
    .local v1, "id":I
    sget v2, Landroid/support/v4/content/WakefulBroadcastReceiver;->mNextId:I

    const/4 v3, 0x1

    add-int/2addr v2, v3

    sput v2, Landroid/support/v4/content/WakefulBroadcastReceiver;->mNextId:I

    .line 84
    sget v2, Landroid/support/v4/content/WakefulBroadcastReceiver;->mNextId:I

    if-gtz v2, :cond_11

    .line 85
    sput v3, Landroid/support/v4/content/WakefulBroadcastReceiver;->mNextId:I

    .line 88
    :cond_11
    const-string v2, "android.support.content.wakelockid"

    invoke-virtual {p1, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 89
    invoke-virtual {p0, p1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    move-result-object v2

    .line 90
    .local v2, "comp":Landroid/content/ComponentName;
    if-nez v2, :cond_1f

    .line 91
    const/4 v3, 0x0

    monitor-exit v0

    return-object v3

    .line 94
    :cond_1f
    const-string v4, "power"

    invoke-virtual {p0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/os/PowerManager;

    .line 95
    .local v4, "pm":Landroid/os/PowerManager;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "wake:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Landroid/content/ComponentName;->flattenToShortString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v3, v5}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v3

    .line 97
    .local v3, "wl":Landroid/os/PowerManager$WakeLock;
    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Landroid/os/PowerManager$WakeLock;->setReferenceCounted(Z)V

    .line 98
    const-wide/32 v5, 0xea60

    invoke-virtual {v3, v5, v6}, Landroid/os/PowerManager$WakeLock;->acquire(J)V

    .line 99
    sget-object v5, Landroid/support/v4/content/WakefulBroadcastReceiver;->mActiveWakeLocks:Landroid/util/SparseArray;

    invoke-virtual {v5, v1, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 100
    monitor-exit v0

    return-object v2

    .line 101
    .end local v1    # "id":I
    .end local v2    # "comp":Landroid/content/ComponentName;
    .end local v3    # "wl":Landroid/os/PowerManager$WakeLock;
    .end local v4    # "pm":Landroid/os/PowerManager;
    :catchall_51
    move-exception v1

    monitor-exit v0
    :try_end_53
    .catchall {:try_start_3 .. :try_end_53} :catchall_51

    throw v1
.end method
