.class public interface abstract Lcom/android/camera/ui/SeekBarCompat$OnSeekBarCompatChangeListener;
.super Ljava/lang/Object;
.source "SeekBarCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/ui/SeekBarCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "OnSeekBarCompatChangeListener"
.end annotation


# virtual methods
.method public abstract onProgressChanged(Landroid/widget/SeekBar;IZ)V
.end method

.method public abstract onStartTrackingTouch(Landroid/widget/SeekBar;)V
.end method

.method public abstract onStopTrackingTouch(Landroid/widget/SeekBar;)V
.end method
