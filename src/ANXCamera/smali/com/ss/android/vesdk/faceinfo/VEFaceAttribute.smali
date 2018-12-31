.class public Lcom/ss/android/vesdk/faceinfo/VEFaceAttribute;
.super Ljava/lang/Object;
.source "VEFaceAttribute.java"


# annotations
.annotation build Landroid/support/annotation/Keep;
.end annotation


# instance fields
.field faceItems:[Lcom/ss/android/vesdk/faceinfo/VEFaceAttributeItem;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getFaceItems()[Lcom/ss/android/vesdk/faceinfo/VEFaceAttributeItem;
    .locals 1

    .line 18
    iget-object v0, p0, Lcom/ss/android/vesdk/faceinfo/VEFaceAttribute;->faceItems:[Lcom/ss/android/vesdk/faceinfo/VEFaceAttributeItem;

    return-object v0
.end method

.method public setFaceItems([Lcom/ss/android/vesdk/faceinfo/VEFaceAttributeItem;)V
    .locals 0

    .line 22
    iput-object p1, p0, Lcom/ss/android/vesdk/faceinfo/VEFaceAttribute;->faceItems:[Lcom/ss/android/vesdk/faceinfo/VEFaceAttributeItem;

    .line 23
    return-void
.end method
