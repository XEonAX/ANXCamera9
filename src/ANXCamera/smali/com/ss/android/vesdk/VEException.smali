.class public Lcom/ss/android/vesdk/VEException;
.super Ljava/lang/RuntimeException;
.source "VEException.java"


# instance fields
.field private msgDes:Ljava/lang/String;

.field private ret:I


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .locals 2

    .line 15
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "VESDK exception ret: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "msg: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 16
    iput p1, p0, Lcom/ss/android/vesdk/VEException;->ret:I

    .line 17
    iput-object p2, p0, Lcom/ss/android/vesdk/VEException;->msgDes:Ljava/lang/String;

    .line 18
    return-void
.end method


# virtual methods
.method public getMsgDes()Ljava/lang/String;
    .locals 1

    .line 35
    iget-object v0, p0, Lcom/ss/android/vesdk/VEException;->msgDes:Ljava/lang/String;

    return-object v0
.end method

.method public getRetCd()I
    .locals 1

    .line 26
    iget v0, p0, Lcom/ss/android/vesdk/VEException;->ret:I

    return v0
.end method
