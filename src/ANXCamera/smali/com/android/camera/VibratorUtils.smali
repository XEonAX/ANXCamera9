.class public Lcom/android/camera/VibratorUtils;
.super Ljava/lang/Object;
.source "VibratorUtils.java"


# static fields
.field public static final DEFAULT_AMPLITUDE:I = 0x50

.field public static final DEFAULT_MILLISECONDS:I = 0x64

.field private static final INSTANCE:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lcom/android/camera/VibratorUtils;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mDefaultVibrationEffect:Landroid/os/VibrationEffect;

.field private mVibrator:Landroid/os/Vibrator;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    sput-object v0, Lcom/android/camera/VibratorUtils;->INSTANCE:Ljava/util/concurrent/atomic/AtomicReference;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    const-string v0, "vibrator"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/Vibrator;

    iput-object p1, p0, Lcom/android/camera/VibratorUtils;->mVibrator:Landroid/os/Vibrator;

    const-wide/16 v0, 0x64

    const/16 p1, 0x50

    invoke-static {v0, v1, p1}, Landroid/os/VibrationEffect;->createOneShot(JI)Landroid/os/VibrationEffect;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/VibratorUtils;->mDefaultVibrationEffect:Landroid/os/VibrationEffect;

    return-void
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/android/camera/VibratorUtils;
    .locals 3

    :goto_0
    sget-object v0, Lcom/android/camera/VibratorUtils;->INSTANCE:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/VibratorUtils;

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    new-instance v0, Lcom/android/camera/VibratorUtils;

    invoke-direct {v0, p0}, Lcom/android/camera/VibratorUtils;-><init>(Landroid/content/Context;)V

    sget-object v1, Lcom/android/camera/VibratorUtils;->INSTANCE:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    return-object v0

    :cond_1
    goto :goto_0
.end method


# virtual methods
.method public cancel()V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/VibratorUtils;->mVibrator:Landroid/os/Vibrator;

    invoke-virtual {v0}, Landroid/os/Vibrator;->cancel()V

    return-void
.end method

.method public vibrate()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/VibratorUtils;->mVibrator:Landroid/os/Vibrator;

    iget-object v1, p0, Lcom/android/camera/VibratorUtils;->mDefaultVibrationEffect:Landroid/os/VibrationEffect;

    invoke-virtual {v0, v1}, Landroid/os/Vibrator;->vibrate(Landroid/os/VibrationEffect;)V

    return-void
.end method

.method public vibrate(JI)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/VibratorUtils;->mVibrator:Landroid/os/Vibrator;

    invoke-static {p1, p2, p3}, Landroid/os/VibrationEffect;->createOneShot(JI)Landroid/os/VibrationEffect;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/os/Vibrator;->vibrate(Landroid/os/VibrationEffect;)V

    return-void
.end method

.method public vibrate([JI)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/VibratorUtils;->mVibrator:Landroid/os/Vibrator;

    invoke-static {p1, p2}, Landroid/os/VibrationEffect;->createWaveform([JI)Landroid/os/VibrationEffect;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/os/Vibrator;->vibrate(Landroid/os/VibrationEffect;)V

    return-void
.end method
