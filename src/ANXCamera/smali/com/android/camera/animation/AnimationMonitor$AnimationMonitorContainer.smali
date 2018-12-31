.class Lcom/android/camera/animation/AnimationMonitor$AnimationMonitorContainer;
.super Ljava/lang/Object;
.source "AnimationMonitor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/animation/AnimationMonitor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AnimationMonitorContainer"
.end annotation


# static fields
.field private static sInstance:Lcom/android/camera/animation/AnimationMonitor;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 19
    new-instance v0, Lcom/android/camera/animation/AnimationMonitor;

    invoke-direct {v0}, Lcom/android/camera/animation/AnimationMonitor;-><init>()V

    sput-object v0, Lcom/android/camera/animation/AnimationMonitor$AnimationMonitorContainer;->sInstance:Lcom/android/camera/animation/AnimationMonitor;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Lcom/android/camera/animation/AnimationMonitor;
    .locals 1

    .line 18
    sget-object v0, Lcom/android/camera/animation/AnimationMonitor$AnimationMonitorContainer;->sInstance:Lcom/android/camera/animation/AnimationMonitor;

    return-object v0
.end method
