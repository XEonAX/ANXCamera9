.class Landroid/support/v4/content/ContentResolverCompat$ContentResolverCompatImplJB;
.super Landroid/support/v4/content/ContentResolverCompat$ContentResolverCompatImplBase;
.source "ContentResolverCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/content/ContentResolverCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ContentResolverCompatImplJB"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 51
    invoke-direct {p0}, Landroid/support/v4/content/ContentResolverCompat$ContentResolverCompatImplBase;-><init>()V

    return-void
.end method


# virtual methods
.method public query(Landroid/content/ContentResolver;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Landroid/support/v4/os/CancellationSignal;)Landroid/database/Cursor;
    .registers 16
    .param p1, "resolver"    # Landroid/content/ContentResolver;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "projection"    # [Ljava/lang/String;
    .param p4, "selection"    # Ljava/lang/String;
    .param p5, "selectionArgs"    # [Ljava/lang/String;
    .param p6, "sortOrder"    # Ljava/lang/String;
    .param p7, "cancellationSignal"    # Landroid/support/v4/os/CancellationSignal;

    .line 57
    if-eqz p7, :cond_9

    :try_start_2
    invoke-virtual {p7}, Landroid/support/v4/os/CancellationSignal;->getCancellationSignalObject()Ljava/lang/Object;

    move-result-object v0

    goto :goto_a

    .line 61
    :catch_7
    move-exception v0

    goto :goto_16

    .line 57
    :cond_9
    const/4 v0, 0x0

    :goto_a
    move-object v7, v0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-static/range {v1 .. v7}, Landroid/support/v4/content/ContentResolverCompatJellybean;->query(Landroid/content/ContentResolver;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Landroid/database/Cursor;

    move-result-object v0
    :try_end_15
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_15} :catch_7

    return-object v0

    .line 61
    :goto_16
    nop

    .line 62
    .local v0, "e":Ljava/lang/RuntimeException;
    invoke-static {v0}, Landroid/support/v4/content/ContentResolverCompatJellybean;->isFrameworkOperationCanceledException(Ljava/lang/Exception;)Z

    move-result v1

    if-eqz v1, :cond_23

    .line 65
    new-instance v1, Landroid/support/v4/os/OperationCanceledException;

    invoke-direct {v1}, Landroid/support/v4/os/OperationCanceledException;-><init>()V

    throw v1

    .line 68
    :cond_23
    throw v0
.end method
