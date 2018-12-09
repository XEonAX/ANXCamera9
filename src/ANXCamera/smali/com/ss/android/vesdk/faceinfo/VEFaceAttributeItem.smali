.class public Lcom/ss/android/vesdk/faceinfo/VEFaceAttributeItem;
.super Ljava/lang/Object;
.source "VEFaceAttributeItem.java"


# annotations
.annotation build Landroid/support/annotation/Keep;
.end annotation


# instance fields
.field category:Ljava/lang/String;

.field label:F

.field score:F


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getCategory()Ljava/lang/String;
    .locals 1

    .line 36
    iget-object v0, p0, Lcom/ss/android/vesdk/faceinfo/VEFaceAttributeItem;->category:Ljava/lang/String;

    return-object v0
.end method

.method public getLabel()F
    .locals 1

    .line 44
    iget v0, p0, Lcom/ss/android/vesdk/faceinfo/VEFaceAttributeItem;->label:F

    return v0
.end method

.method public getScore()F
    .locals 1

    .line 52
    iget v0, p0, Lcom/ss/android/vesdk/faceinfo/VEFaceAttributeItem;->score:F

    return v0
.end method

.method public setCategory(Ljava/lang/String;)V
    .locals 0

    .line 40
    iput-object p1, p0, Lcom/ss/android/vesdk/faceinfo/VEFaceAttributeItem;->category:Ljava/lang/String;

    .line 41
    return-void
.end method

.method public setLabel(F)V
    .locals 0

    .line 48
    iput p1, p0, Lcom/ss/android/vesdk/faceinfo/VEFaceAttributeItem;->label:F

    .line 49
    return-void
.end method

.method public setScore(F)V
    .locals 0

    .line 56
    iput p1, p0, Lcom/ss/android/vesdk/faceinfo/VEFaceAttributeItem;->score:F

    .line 57
    return-void
.end method
