.class Landroid/support/v4/app/ActivityOptionsCompat$ActivityOptionsImpl21;
.super Landroid/support/v4/app/ActivityOptionsCompat;
.source "ActivityOptionsCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/app/ActivityOptionsCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ActivityOptionsImpl21"
.end annotation


# instance fields
.field private final mImpl:Landroid/support/v4/app/ActivityOptionsCompat21;


# direct methods
.method constructor <init>(Landroid/support/v4/app/ActivityOptionsCompat21;)V
    .registers 2
    .param p1, "impl"    # Landroid/support/v4/app/ActivityOptionsCompat21;

    .line 201
    invoke-direct {p0}, Landroid/support/v4/app/ActivityOptionsCompat;-><init>()V

    .line 202
    iput-object p1, p0, Landroid/support/v4/app/ActivityOptionsCompat$ActivityOptionsImpl21;->mImpl:Landroid/support/v4/app/ActivityOptionsCompat21;

    .line 203
    return-void
.end method


# virtual methods
.method public toBundle()Landroid/os/Bundle;
    .registers 2

    .line 207
    iget-object v0, p0, Landroid/support/v4/app/ActivityOptionsCompat$ActivityOptionsImpl21;->mImpl:Landroid/support/v4/app/ActivityOptionsCompat21;

    invoke-virtual {v0}, Landroid/support/v4/app/ActivityOptionsCompat21;->toBundle()Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method public update(Landroid/support/v4/app/ActivityOptionsCompat;)V
    .registers 5
    .param p1, "otherOptions"    # Landroid/support/v4/app/ActivityOptionsCompat;

    .line 212
    instance-of v0, p1, Landroid/support/v4/app/ActivityOptionsCompat$ActivityOptionsImpl21;

    if-eqz v0, :cond_e

    .line 214
    move-object v0, p1

    check-cast v0, Landroid/support/v4/app/ActivityOptionsCompat$ActivityOptionsImpl21;

    .line 215
    .local v0, "otherImpl":Landroid/support/v4/app/ActivityOptionsCompat$ActivityOptionsImpl21;
    iget-object v1, p0, Landroid/support/v4/app/ActivityOptionsCompat$ActivityOptionsImpl21;->mImpl:Landroid/support/v4/app/ActivityOptionsCompat21;

    iget-object v2, v0, Landroid/support/v4/app/ActivityOptionsCompat$ActivityOptionsImpl21;->mImpl:Landroid/support/v4/app/ActivityOptionsCompat21;

    invoke-virtual {v1, v2}, Landroid/support/v4/app/ActivityOptionsCompat21;->update(Landroid/support/v4/app/ActivityOptionsCompat21;)V

    .line 217
    .end local v0    # "otherImpl":Landroid/support/v4/app/ActivityOptionsCompat$ActivityOptionsImpl21;
    :cond_e
    return-void
.end method
