.class public Lcom/ss/android/vesdk/faceinfo/VEFaceAttributeInfo;
.super Ljava/lang/Object;
.source "VEFaceAttributeInfo.java"


# annotations
.annotation build Landroid/support/annotation/Keep;
.end annotation


# instance fields
.field info:[Lcom/ss/android/vesdk/faceinfo/VEFaceAttribute;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getInfo()[Lcom/ss/android/vesdk/faceinfo/VEFaceAttribute;
    .locals 1

    .line 17
    iget-object v0, p0, Lcom/ss/android/vesdk/faceinfo/VEFaceAttributeInfo;->info:[Lcom/ss/android/vesdk/faceinfo/VEFaceAttribute;

    return-object v0
.end method

.method public setInfo([Lcom/ss/android/vesdk/faceinfo/VEFaceAttribute;)V
    .locals 0

    .line 21
    iput-object p1, p0, Lcom/ss/android/vesdk/faceinfo/VEFaceAttributeInfo;->info:[Lcom/ss/android/vesdk/faceinfo/VEFaceAttribute;

    .line 22
    return-void
.end method
