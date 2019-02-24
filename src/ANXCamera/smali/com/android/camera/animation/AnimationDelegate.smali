.class public Lcom/android/camera/animation/AnimationDelegate;
.super Ljava/lang/Object;
.source "AnimationDelegate.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/animation/AnimationDelegate$AnimationResource;,
        Lcom/android/camera/animation/AnimationDelegate$AnimationType;
    }
.end annotation


# static fields
.field public static final ANIMATE_TYPE_ALPHA_IN:I = 0xa1

.field public static final ANIMATE_TYPE_ALPHA_OUT:I = 0xa2

.field public static final ANIMATE_TYPE_NULL:I = -0x1

.field public static final ANIMATE_TYPE_SCALE:I = 0xa4

.field public static final ANIMATE_TYPE_SLIDE_IN_BOTTOM:I = 0xa7

.field public static final ANIMATE_TYPE_SLIDE_LEFT:I = 0xa5

.field public static final ANIMATE_TYPE_SLIDE_OUT_BOTTOM:I = 0xa8

.field public static final ANIMATE_TYPE_SLIDE_RIGHT:I = 0xa6

.field public static final ANIMATE_TYPE_TRANSITION:I = 0xa3

.field public static final DEFAULT_ANIMATION_DURATION:I = 0x12c

.field public static final DEFAULT_INTERPOLATOR:Landroid/view/animation/Interpolator;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 21
    new-instance v0, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    sput-object v0, Lcom/android/camera/animation/AnimationDelegate;->DEFAULT_INTERPOLATOR:Landroid/view/animation/Interpolator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
