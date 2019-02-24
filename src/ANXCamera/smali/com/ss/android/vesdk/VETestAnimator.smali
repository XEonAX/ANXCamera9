.class public Lcom/ss/android/vesdk/VETestAnimator;
.super Ljava/lang/Object;
.source "VETestAnimator.java"

# interfaces
.implements Lcom/ss/android/vesdk/VEStickerAnimator;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getDegree(I)F
    .locals 3

    .line 8
    const-string v0, "VETestAnimator"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "timestamp: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    int-to-float p1, p1

    const/high16 v0, 0x447a0000    # 1000.0f

    div-float/2addr p1, v0

    const/high16 v0, 0x42100000    # 36.0f

    mul-float/2addr p1, v0

    return p1
.end method

.method public getScaleX(I)F
    .locals 1

    .line 24
    int-to-float p1, p1

    const/high16 v0, 0x447a0000    # 1000.0f

    div-float/2addr p1, v0

    const v0, 0x3dcccccd    # 0.1f

    mul-float/2addr p1, v0

    const/high16 v0, 0x3f800000    # 1.0f

    add-float/2addr v0, p1

    return v0
.end method

.method public getScaleY(I)F
    .locals 1

    .line 30
    int-to-float p1, p1

    const/high16 v0, 0x447a0000    # 1000.0f

    div-float/2addr p1, v0

    const v0, 0x3dcccccd    # 0.1f

    mul-float/2addr p1, v0

    const/high16 v0, 0x3f800000    # 1.0f

    add-float/2addr v0, p1

    return v0
.end method

.method public getTransX(I)F
    .locals 1

    .line 14
    int-to-float p1, p1

    const/high16 v0, 0x447a0000    # 1000.0f

    div-float/2addr p1, v0

    const v0, 0x3dcccccd    # 0.1f

    mul-float/2addr p1, v0

    return p1
.end method

.method public getTransY(I)F
    .locals 1

    .line 19
    int-to-float p1, p1

    const/high16 v0, 0x447a0000    # 1000.0f

    div-float/2addr p1, v0

    const v0, 0x3dcccccd    # 0.1f

    mul-float/2addr p1, v0

    return p1
.end method
