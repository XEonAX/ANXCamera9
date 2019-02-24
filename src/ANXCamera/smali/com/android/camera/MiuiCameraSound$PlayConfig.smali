.class public Lcom/android/camera/MiuiCameraSound$PlayConfig;
.super Ljava/lang/Object;
.source "MiuiCameraSound.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/MiuiCameraSound;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PlayConfig"
.end annotation


# instance fields
.field public soundId:I

.field public volume:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 216
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 218
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/android/camera/MiuiCameraSound$PlayConfig;->volume:F

    return-void
.end method
