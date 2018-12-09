.class public Lcom/android/camera/fragment/sticker/StickerAdapter;
.super Lcom/android/camera/fragment/sticker/BaseSelectAdapter;
.source "StickerAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/sticker/StickerAdapter$StickerHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/camera/fragment/sticker/BaseSelectAdapter<",
        "Lcom/android/camera/sticker/StickerInfo;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 18
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/sticker/BaseSelectAdapter;-><init>(Landroid/content/Context;)V

    .line 19
    return-void
.end method


# virtual methods
.method protected getHolder(Landroid/view/View;)Lcom/android/camera/fragment/sticker/BaseSelectAdapter$BaseSelectHolder;
    .locals 1

    .line 28
    new-instance v0, Lcom/android/camera/fragment/sticker/StickerAdapter$StickerHolder;

    invoke-direct {v0, p0, p1}, Lcom/android/camera/fragment/sticker/StickerAdapter$StickerHolder;-><init>(Lcom/android/camera/fragment/sticker/StickerAdapter;Landroid/view/View;)V

    return-object v0
.end method

.method protected getLayoutId()I
    .locals 1

    .line 23
    const v0, 0x7f04002c

    return v0
.end method
