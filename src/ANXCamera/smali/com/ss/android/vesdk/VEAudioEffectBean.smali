.class public Lcom/ss/android/vesdk/VEAudioEffectBean;
.super Ljava/lang/Object;
.source "VEAudioEffectBean.java"


# instance fields
.field public blockSize:I

.field public centtone:F

.field public formatShiftOn:Z

.field public octative:F

.field public phaseAdjustMethod:I

.field public phaseResetMode:I

.field public pitchTunerMode:I

.field public processChMode:I

.field public semiton:F

.field public smoothOn:Z

.field public speedRatio:F

.field public transientDetectMode:I

.field public type:I

.field public windowMode:I


# direct methods
.method public constructor <init>(IZZIIIIIIIFFFF)V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput p1, p0, Lcom/ss/android/vesdk/VEAudioEffectBean;->type:I

    .line 22
    iput-boolean p2, p0, Lcom/ss/android/vesdk/VEAudioEffectBean;->formatShiftOn:Z

    .line 23
    iput-boolean p3, p0, Lcom/ss/android/vesdk/VEAudioEffectBean;->smoothOn:Z

    .line 24
    iput p4, p0, Lcom/ss/android/vesdk/VEAudioEffectBean;->processChMode:I

    .line 25
    iput p5, p0, Lcom/ss/android/vesdk/VEAudioEffectBean;->transientDetectMode:I

    .line 26
    iput p6, p0, Lcom/ss/android/vesdk/VEAudioEffectBean;->phaseResetMode:I

    .line 27
    iput p7, p0, Lcom/ss/android/vesdk/VEAudioEffectBean;->phaseAdjustMethod:I

    .line 28
    iput p8, p0, Lcom/ss/android/vesdk/VEAudioEffectBean;->windowMode:I

    .line 29
    iput p9, p0, Lcom/ss/android/vesdk/VEAudioEffectBean;->pitchTunerMode:I

    .line 30
    iput p10, p0, Lcom/ss/android/vesdk/VEAudioEffectBean;->blockSize:I

    .line 31
    iput p11, p0, Lcom/ss/android/vesdk/VEAudioEffectBean;->centtone:F

    .line 32
    iput p12, p0, Lcom/ss/android/vesdk/VEAudioEffectBean;->semiton:F

    .line 33
    iput p13, p0, Lcom/ss/android/vesdk/VEAudioEffectBean;->octative:F

    .line 34
    iput p14, p0, Lcom/ss/android/vesdk/VEAudioEffectBean;->speedRatio:F

    .line 35
    return-void
.end method
