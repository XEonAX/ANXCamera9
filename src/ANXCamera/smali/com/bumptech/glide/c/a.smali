.class public abstract Lcom/bumptech/glide/c/a;
.super Lcom/bumptech/glide/c/d;
.source "AppGlideModule.java"

# interfaces
.implements Lcom/bumptech/glide/c/b;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Lcom/bumptech/glide/c/d;-><init>()V

    return-void
.end method


# virtual methods
.method public b(Landroid/content/Context;Lcom/bumptech/glide/d;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/d;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 42
    return-void
.end method

.method public da()Z
    .locals 1

    .line 36
    const/4 v0, 0x1

    return v0
.end method
