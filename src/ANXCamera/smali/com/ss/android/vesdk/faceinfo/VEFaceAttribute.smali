.class public Lcom/ss/android/vesdk/faceinfo/VEFaceAttribute;
.super Ljava/lang/Object;
.source "VEFaceAttribute.java"


# annotations
.annotation build Landroid/support/annotation/Keep;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/vesdk/faceinfo/VEFaceAttribute$ExpressionType;,
        Lcom/ss/android/vesdk/faceinfo/VEFaceAttribute$RacialType;
    }
.end annotation


# static fields
.field public static final EXPRESSION_NUM:I = 0x7

.field public static final RACIAL_NUM:I = 0x4


# instance fields
.field age:F

.field attractive:F

.field boyProb:F

.field expProbs:[F

.field expType:I

.field happyScore:F

.field racialProbs:[F

.field racialType:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getAge()F
    .locals 1

    .line 59
    iget v0, p0, Lcom/ss/android/vesdk/faceinfo/VEFaceAttribute;->age:F

    return v0
.end method

.method public getAttractive()F
    .locals 1

    .line 75
    iget v0, p0, Lcom/ss/android/vesdk/faceinfo/VEFaceAttribute;->attractive:F

    return v0
.end method

.method public getBoyProb()F
    .locals 1

    .line 67
    iget v0, p0, Lcom/ss/android/vesdk/faceinfo/VEFaceAttribute;->boyProb:F

    return v0
.end method

.method public getExpProbs()[F
    .locals 1

    .line 99
    iget-object v0, p0, Lcom/ss/android/vesdk/faceinfo/VEFaceAttribute;->expProbs:[F

    return-object v0
.end method

.method public getExpType()I
    .locals 1

    .line 91
    iget v0, p0, Lcom/ss/android/vesdk/faceinfo/VEFaceAttribute;->expType:I

    return v0
.end method

.method public getHappyScore()F
    .locals 1

    .line 83
    iget v0, p0, Lcom/ss/android/vesdk/faceinfo/VEFaceAttribute;->happyScore:F

    return v0
.end method

.method public getRacialType()I
    .locals 1

    .line 107
    iget v0, p0, Lcom/ss/android/vesdk/faceinfo/VEFaceAttribute;->racialType:I

    return v0
.end method

.method public getRacialrobs()[F
    .locals 1

    .line 115
    iget-object v0, p0, Lcom/ss/android/vesdk/faceinfo/VEFaceAttribute;->racialProbs:[F

    return-object v0
.end method

.method public setAge(F)V
    .locals 0

    .line 63
    iput p1, p0, Lcom/ss/android/vesdk/faceinfo/VEFaceAttribute;->age:F

    .line 64
    return-void
.end method

.method public setAttractive(F)V
    .locals 0

    .line 79
    iput p1, p0, Lcom/ss/android/vesdk/faceinfo/VEFaceAttribute;->attractive:F

    .line 80
    return-void
.end method

.method public setBoyProb(F)V
    .locals 0

    .line 71
    iput p1, p0, Lcom/ss/android/vesdk/faceinfo/VEFaceAttribute;->boyProb:F

    .line 72
    return-void
.end method

.method public setExpProbs([F)V
    .locals 0

    .line 103
    iput-object p1, p0, Lcom/ss/android/vesdk/faceinfo/VEFaceAttribute;->expProbs:[F

    .line 104
    return-void
.end method

.method public setExpType(I)V
    .locals 0

    .line 95
    iput p1, p0, Lcom/ss/android/vesdk/faceinfo/VEFaceAttribute;->expType:I

    .line 96
    return-void
.end method

.method public setHappyScore(F)V
    .locals 0

    .line 87
    iput p1, p0, Lcom/ss/android/vesdk/faceinfo/VEFaceAttribute;->happyScore:F

    .line 88
    return-void
.end method

.method public setRacialType(I)V
    .locals 0

    .line 111
    iput p1, p0, Lcom/ss/android/vesdk/faceinfo/VEFaceAttribute;->racialType:I

    .line 112
    return-void
.end method

.method public setRacialrobs([F)V
    .locals 0

    .line 119
    iput-object p1, p0, Lcom/ss/android/vesdk/faceinfo/VEFaceAttribute;->racialProbs:[F

    .line 120
    return-void
.end method
