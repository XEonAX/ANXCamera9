.class public Lcom/ss/android/vesdk/VEException;
.super Ljava/lang/RuntimeException;
.source "VEException.java"


# instance fields
.field private msgDes:Ljava/lang/String;

.field private ret:I


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

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
