.class public Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;
.super Ljava/lang/Object;
.source "CameraIndicatorState.java"


# instance fields
.field public mAEAFHeadPosition:F

.field public mCenterFlag:I

.field public mCurrentAngle:F

.field public mCurrentMinusCircleCenter:I

.field public mCurrentMinusCircleRadius:F

.field public mCurrentRadius:I

.field public mCurrentRayBottom:I

.field public mCurrentRayHeight:I

.field public mCurrentRayWidth:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCenterFlag:I

    return-void
.end method
