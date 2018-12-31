.class public Lcom/ss/android/vesdk/VEPreviewSettings;
.super Ljava/lang/Object;
.source "VEPreviewSettings.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/vesdk/VEPreviewSettings$CAMERA_FACING_ID;
    }
.end annotation


# instance fields
.field private facingID:Lcom/ss/android/vesdk/VEPreviewSettings$CAMERA_FACING_ID;

.field private rotation:I

.field private size:Lcom/ss/android/vesdk/VESize;


# direct methods
.method public constructor <init>(Lcom/ss/android/vesdk/VEPreviewSettings$CAMERA_FACING_ID;ILcom/ss/android/vesdk/VESize;)V
    .locals 0

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput-object p1, p0, Lcom/ss/android/vesdk/VEPreviewSettings;->facingID:Lcom/ss/android/vesdk/VEPreviewSettings$CAMERA_FACING_ID;

    .line 58
    iput p2, p0, Lcom/ss/android/vesdk/VEPreviewSettings;->rotation:I

    .line 59
    iput-object p3, p0, Lcom/ss/android/vesdk/VEPreviewSettings;->size:Lcom/ss/android/vesdk/VESize;

    .line 60
    return-void
.end method


# virtual methods
.method public getFacingID()Lcom/ss/android/vesdk/VEPreviewSettings$CAMERA_FACING_ID;
    .locals 1

    .line 63
    iget-object v0, p0, Lcom/ss/android/vesdk/VEPreviewSettings;->facingID:Lcom/ss/android/vesdk/VEPreviewSettings$CAMERA_FACING_ID;

    return-object v0
.end method

.method public getRotation()I
    .locals 1

    .line 67
    iget v0, p0, Lcom/ss/android/vesdk/VEPreviewSettings;->rotation:I

    return v0
.end method

.method public getSize()Lcom/ss/android/vesdk/VESize;
    .locals 1

    .line 71
    iget-object v0, p0, Lcom/ss/android/vesdk/VEPreviewSettings;->size:Lcom/ss/android/vesdk/VESize;

    return-object v0
.end method
