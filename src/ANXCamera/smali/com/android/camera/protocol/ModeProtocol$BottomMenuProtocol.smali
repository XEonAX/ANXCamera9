.class public interface abstract Lcom/android/camera/protocol/ModeProtocol$BottomMenuProtocol;
.super Ljava/lang/Object;
.source "ModeProtocol.java"

# interfaces
.implements Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/protocol/ModeProtocol;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "BottomMenuProtocol"
.end annotation


# static fields
.field public static final TYPE_TAG:I = 0xc5


# virtual methods
.method public abstract getBeautyActionMenuType()I
.end method

.method public abstract getMenuData()Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/SparseArray<",
            "Lcom/android/camera/fragment/beauty/MenuItem;",
            ">;"
        }
    .end annotation
.end method

.method public abstract onBottomMenuAnimate(II)V
.end method

.method public abstract onSwitchBeautyActionMenu(I)V
.end method

.method public abstract onSwitchCameraActionMenu(I)V
.end method

.method public abstract onSwitchLiveActionMenu(I)V
.end method
