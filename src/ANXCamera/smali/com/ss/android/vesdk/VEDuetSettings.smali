.class public final Lcom/ss/android/vesdk/VEDuetSettings;
.super Ljava/lang/Object;
.source "VEDuetSettings.java"


# instance fields
.field private mAlpha:F

.field private mDuetAudioPath:Ljava/lang/String;

.field private mDuetVideoPath:Ljava/lang/String;

.field private mIsFitMode:Z

.field private mXInPercent:F

.field private mYInPercent:F


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;FFFZ)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lcom/ss/android/vesdk/VEDuetSettings;->mDuetVideoPath:Ljava/lang/String;

    .line 35
    iput-object p2, p0, Lcom/ss/android/vesdk/VEDuetSettings;->mDuetAudioPath:Ljava/lang/String;

    .line 36
    iput p3, p0, Lcom/ss/android/vesdk/VEDuetSettings;->mXInPercent:F

    .line 37
    iput p4, p0, Lcom/ss/android/vesdk/VEDuetSettings;->mYInPercent:F

    .line 38
    iput p5, p0, Lcom/ss/android/vesdk/VEDuetSettings;->mAlpha:F

    .line 39
    iput-boolean p6, p0, Lcom/ss/android/vesdk/VEDuetSettings;->mIsFitMode:Z

    .line 40
    return-void
.end method


# virtual methods
.method public getAlpha()F
    .locals 1

    .line 113
    iget v0, p0, Lcom/ss/android/vesdk/VEDuetSettings;->mAlpha:F

    return v0
.end method

.method public getDuetAudioPath()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .line 69
    iget-object v0, p0, Lcom/ss/android/vesdk/VEDuetSettings;->mDuetAudioPath:Ljava/lang/String;

    return-object v0
.end method

.method public getDuetVideoPath()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .line 54
    iget-object v0, p0, Lcom/ss/android/vesdk/VEDuetSettings;->mDuetVideoPath:Ljava/lang/String;

    return-object v0
.end method

.method public getIsFitMode()Z
    .locals 1

    .line 129
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEDuetSettings;->mIsFitMode:Z

    return v0
.end method

.method public getXInPercent()F
    .locals 1

    .line 83
    iget v0, p0, Lcom/ss/android/vesdk/VEDuetSettings;->mXInPercent:F

    return v0
.end method

.method public getYInPercent()F
    .locals 1

    .line 97
    iget v0, p0, Lcom/ss/android/vesdk/VEDuetSettings;->mYInPercent:F

    return v0
.end method
