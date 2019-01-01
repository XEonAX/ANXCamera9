.class Landroid/support/v4/app/ActivityCompat22;
.super Ljava/lang/Object;
.source "ActivityCompat22.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getReferrer(Landroid/app/Activity;)Landroid/net/Uri;
    .registers 2
    .param p0, "activity"    # Landroid/app/Activity;

    .line 24
    invoke-virtual {p0}, Landroid/app/Activity;->getReferrer()Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method
