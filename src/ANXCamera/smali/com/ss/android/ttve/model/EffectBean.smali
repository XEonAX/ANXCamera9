.class public Lcom/ss/android/ttve/model/EffectBean;
.super Ljava/lang/Object;
.source "EffectBean.java"


# instance fields
.field private mResPath:Ljava/lang/String;

.field private mWithoutFace:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 9
    const-string v0, ""

    invoke-direct {p0, v0}, Lcom/ss/android/ttve/model/EffectBean;-><init>(Ljava/lang/String;)V

    .line 10
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 13
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/ss/android/ttve/model/EffectBean;-><init>(Ljava/lang/String;Z)V

    .line 14
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-object p1, p0, Lcom/ss/android/ttve/model/EffectBean;->mResPath:Ljava/lang/String;

    .line 18
    iput-boolean p2, p0, Lcom/ss/android/ttve/model/EffectBean;->mWithoutFace:Z

    .line 19
    return-void
.end method


# virtual methods
.method public getResPath()Ljava/lang/String;
    .locals 1

    .line 23
    iget-object v0, p0, Lcom/ss/android/ttve/model/EffectBean;->mResPath:Ljava/lang/String;

    return-object v0
.end method

.method public isWithoutFace()Z
    .locals 1

    .line 31
    iget-boolean v0, p0, Lcom/ss/android/ttve/model/EffectBean;->mWithoutFace:Z

    return v0
.end method

.method public setResPath(Ljava/lang/String;)V
    .locals 0

    .line 27
    iput-object p1, p0, Lcom/ss/android/ttve/model/EffectBean;->mResPath:Ljava/lang/String;

    .line 28
    return-void
.end method

.method public setWithoutFace(Z)V
    .locals 0

    .line 35
    iput-boolean p1, p0, Lcom/ss/android/ttve/model/EffectBean;->mWithoutFace:Z

    .line 36
    return-void
.end method
