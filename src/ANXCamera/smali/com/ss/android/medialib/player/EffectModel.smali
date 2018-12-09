.class public Lcom/ss/android/medialib/player/EffectModel;
.super Ljava/lang/Object;
.source "EffectModel.java"


# annotations
.annotation build Landroid/support/annotation/Keep;
.end annotation


# instance fields
.field private end:I

.field private index:I

.field private start:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(III)V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput p1, p0, Lcom/ss/android/medialib/player/EffectModel;->index:I

    .line 26
    iput p2, p0, Lcom/ss/android/medialib/player/EffectModel;->start:I

    .line 27
    iput p3, p0, Lcom/ss/android/medialib/player/EffectModel;->end:I

    .line 28
    return-void
.end method


# virtual methods
.method public getEnd()I
    .locals 1

    .line 51
    iget v0, p0, Lcom/ss/android/medialib/player/EffectModel;->end:I

    return v0
.end method

.method public getIndex()I
    .locals 1

    .line 43
    iget v0, p0, Lcom/ss/android/medialib/player/EffectModel;->index:I

    return v0
.end method

.method public getStart()I
    .locals 1

    .line 47
    iget v0, p0, Lcom/ss/android/medialib/player/EffectModel;->start:I

    return v0
.end method

.method public setEnd(I)V
    .locals 0

    .line 39
    iput p1, p0, Lcom/ss/android/medialib/player/EffectModel;->end:I

    .line 40
    return-void
.end method

.method public setIndex(I)V
    .locals 0

    .line 31
    iput p1, p0, Lcom/ss/android/medialib/player/EffectModel;->index:I

    .line 32
    return-void
.end method

.method public setStart(I)V
    .locals 0

    .line 35
    iput p1, p0, Lcom/ss/android/medialib/player/EffectModel;->start:I

    .line 36
    return-void
.end method
