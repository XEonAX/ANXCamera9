.class Landroid/support/v4/media/MediaDescriptionCompatApi23$Builder;
.super Landroid/support/v4/media/MediaDescriptionCompatApi21$Builder;
.source "MediaDescriptionCompatApi23.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/MediaDescriptionCompatApi23;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Builder"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 29
    invoke-direct {p0}, Landroid/support/v4/media/MediaDescriptionCompatApi21$Builder;-><init>()V

    return-void
.end method

.method public static setMediaUri(Ljava/lang/Object;Landroid/net/Uri;)V
    .registers 3
    .param p0, "builderObj"    # Ljava/lang/Object;
    .param p1, "mediaUri"    # Landroid/net/Uri;

    .line 31
    move-object v0, p0

    check-cast v0, Landroid/media/MediaDescription$Builder;

    invoke-virtual {v0, p1}, Landroid/media/MediaDescription$Builder;->setMediaUri(Landroid/net/Uri;)Landroid/media/MediaDescription$Builder;

    .line 32
    return-void
.end method
