.class public interface abstract Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;
.super Ljava/lang/Object;
.source "ModeProtocol.java"

# interfaces
.implements Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;
.implements Lcom/android/camera/protocol/ModeProtocol$EffectCropViewController;
.implements Lcom/android/camera/protocol/ModeProtocol$IndicatorProtocol;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/protocol/ModeProtocol;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "MainContentProtocol"
.end annotation


# static fields
.field public static final TYPE_TAG:I = 0xa6


# virtual methods
.method public abstract getFaceWaterMarkInfos()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/camera/watermark/WaterMarkData;",
            ">;"
        }
    .end annotation
.end method

.method public abstract hideDelayNumber()V
.end method

.method public abstract hideReviewViews()V
.end method

.method public abstract onViewTouchEvent(ILandroid/view/MotionEvent;)Z
.end method

.method public abstract performHapticFeedback(I)V
.end method

.method public abstract setCenterHint(ILjava/lang/String;Ljava/lang/String;I)V
.end method

.method public abstract setPreviewAspectRatio(F)V
.end method

.method public abstract showDelayNumber(I)V
.end method

.method public abstract showReviewViews(Landroid/graphics/Bitmap;)V
.end method

.method public abstract updateContentDescription()V
.end method
