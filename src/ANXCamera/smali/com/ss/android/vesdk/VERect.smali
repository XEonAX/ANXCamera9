.class public Lcom/ss/android/vesdk/VERect;
.super Ljava/lang/Object;
.source "VERect.java"


# instance fields
.field public height:I

.field public width:I

.field public x:I

.field public y:I


# direct methods
.method public constructor <init>(IIII)V
    .locals 1

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    const/4 v0, 0x0

    iput v0, p0, Lcom/ss/android/vesdk/VERect;->x:I

    .line 15
    iput v0, p0, Lcom/ss/android/vesdk/VERect;->y:I

    .line 16
    const/16 v0, 0x2d0

    iput v0, p0, Lcom/ss/android/vesdk/VERect;->width:I

    .line 17
    const/16 v0, 0x500

    iput v0, p0, Lcom/ss/android/vesdk/VERect;->height:I

    .line 9
    iput p1, p0, Lcom/ss/android/vesdk/VERect;->x:I

    .line 10
    iput p2, p0, Lcom/ss/android/vesdk/VERect;->y:I

    .line 11
    iput p3, p0, Lcom/ss/android/vesdk/VERect;->width:I

    .line 12
    iput p4, p0, Lcom/ss/android/vesdk/VERect;->height:I

    .line 13
    return-void
.end method
