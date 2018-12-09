.class public Lcom/ss/android/ttve/model/ReshapeFaceBean;
.super Ljava/lang/Object;
.source "ReshapeFaceBean.java"


# instance fields
.field private mCheekIntensity:F

.field private mEyeIntensity:F

.field private mResPath:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 9
    const-string v0, ""

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, v1}, Lcom/ss/android/ttve/model/ReshapeFaceBean;-><init>(Ljava/lang/String;FF)V

    .line 10
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;FF)V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Lcom/ss/android/ttve/model/ReshapeFaceBean;->mResPath:Ljava/lang/String;

    .line 14
    iput p2, p0, Lcom/ss/android/ttve/model/ReshapeFaceBean;->mEyeIntensity:F

    .line 15
    iput p3, p0, Lcom/ss/android/ttve/model/ReshapeFaceBean;->mCheekIntensity:F

    .line 16
    return-void
.end method


# virtual methods
.method public getCheekIntensity()F
    .locals 1

    .line 35
    iget v0, p0, Lcom/ss/android/ttve/model/ReshapeFaceBean;->mCheekIntensity:F

    return v0
.end method

.method public getEyeIntensity()F
    .locals 1

    .line 27
    iget v0, p0, Lcom/ss/android/ttve/model/ReshapeFaceBean;->mEyeIntensity:F

    return v0
.end method

.method public getResPath()Ljava/lang/String;
    .locals 1

    .line 19
    iget-object v0, p0, Lcom/ss/android/ttve/model/ReshapeFaceBean;->mResPath:Ljava/lang/String;

    return-object v0
.end method

.method public setCheekIntensity(F)V
    .locals 0

    .line 39
    iput p1, p0, Lcom/ss/android/ttve/model/ReshapeFaceBean;->mCheekIntensity:F

    .line 40
    return-void
.end method

.method public setEyeIntensity(F)V
    .locals 0

    .line 31
    iput p1, p0, Lcom/ss/android/ttve/model/ReshapeFaceBean;->mEyeIntensity:F

    .line 32
    return-void
.end method

.method public setResPath(Ljava/lang/String;)V
    .locals 0

    .line 23
    iput-object p1, p0, Lcom/ss/android/ttve/model/ReshapeFaceBean;->mResPath:Ljava/lang/String;

    .line 24
    return-void
.end method
