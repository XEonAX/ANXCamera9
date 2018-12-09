.class public Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;
.super Ljava/lang/Object;
.source "EyeLightSingleCheckAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "EyeLightItem"
.end annotation


# instance fields
.field private mImageResource:I

.field private mTextResource:I

.field private mType:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;II)V
    .locals 0

    .line 173
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 174
    iput p2, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;->mImageResource:I

    .line 175
    iput p3, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;->mTextResource:I

    .line 176
    iput-object p1, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;->mType:Ljava/lang/String;

    .line 177
    return-void
.end method


# virtual methods
.method public getImageResource()I
    .locals 1

    .line 180
    iget v0, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;->mImageResource:I

    return v0
.end method

.method public getTextResource()I
    .locals 1

    .line 184
    iget v0, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;->mTextResource:I

    return v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .line 188
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;->mType:Ljava/lang/String;

    return-object v0
.end method
