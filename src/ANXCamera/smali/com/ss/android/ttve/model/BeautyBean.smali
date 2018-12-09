.class public Lcom/ss/android/ttve/model/BeautyBean;
.super Ljava/lang/Object;
.source "BeautyBean.java"


# instance fields
.field private mBeautyFaceType:I

.field private mResPath:Ljava/lang/String;

.field private mSmoothIntensity:F

.field private mWhiteIntensity:F


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 10
    const-string v0, ""

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {p0, v2, v0, v1, v1}, Lcom/ss/android/ttve/model/BeautyBean;-><init>(ILjava/lang/String;FF)V

    .line 11
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;FF)V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput p1, p0, Lcom/ss/android/ttve/model/BeautyBean;->mBeautyFaceType:I

    .line 15
    iput-object p2, p0, Lcom/ss/android/ttve/model/BeautyBean;->mResPath:Ljava/lang/String;

    .line 16
    iput p3, p0, Lcom/ss/android/ttve/model/BeautyBean;->mSmoothIntensity:F

    .line 17
    iput p4, p0, Lcom/ss/android/ttve/model/BeautyBean;->mWhiteIntensity:F

    .line 18
    return-void
.end method


# virtual methods
.method public getResPath()Ljava/lang/String;
    .locals 1

    .line 25
    iget-object v0, p0, Lcom/ss/android/ttve/model/BeautyBean;->mResPath:Ljava/lang/String;

    return-object v0
.end method

.method public getSmoothIntensity()F
    .locals 1

    .line 30
    iget v0, p0, Lcom/ss/android/ttve/model/BeautyBean;->mSmoothIntensity:F

    return v0
.end method

.method public getType()I
    .locals 1

    .line 46
    iget v0, p0, Lcom/ss/android/ttve/model/BeautyBean;->mBeautyFaceType:I

    return v0
.end method

.method public getWhiteIntensity()F
    .locals 1

    .line 38
    iget v0, p0, Lcom/ss/android/ttve/model/BeautyBean;->mWhiteIntensity:F

    return v0
.end method

.method public setResPath(Ljava/lang/String;)V
    .locals 0

    .line 21
    iput-object p1, p0, Lcom/ss/android/ttve/model/BeautyBean;->mResPath:Ljava/lang/String;

    .line 22
    return-void
.end method

.method public setSmoothIntensity(F)V
    .locals 0

    .line 34
    iput p1, p0, Lcom/ss/android/ttve/model/BeautyBean;->mSmoothIntensity:F

    .line 35
    return-void
.end method

.method public setType(I)V
    .locals 0

    .line 50
    iput p1, p0, Lcom/ss/android/ttve/model/BeautyBean;->mBeautyFaceType:I

    .line 51
    return-void
.end method

.method public setWhiteIntensity(F)V
    .locals 0

    .line 42
    iput p1, p0, Lcom/ss/android/ttve/model/BeautyBean;->mWhiteIntensity:F

    .line 43
    return-void
.end method
