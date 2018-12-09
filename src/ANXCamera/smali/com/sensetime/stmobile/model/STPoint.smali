.class public Lcom/sensetime/stmobile/model/STPoint;
.super Ljava/lang/Object;
.source "STPoint.java"


# instance fields
.field private x:F

.field private y:F


# direct methods
.method public constructor <init>(FF)V
    .locals 0

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    iput p1, p0, Lcom/sensetime/stmobile/model/STPoint;->x:F

    .line 9
    iput p2, p0, Lcom/sensetime/stmobile/model/STPoint;->y:F

    .line 10
    return-void
.end method


# virtual methods
.method public getX()F
    .locals 1

    .line 13
    iget v0, p0, Lcom/sensetime/stmobile/model/STPoint;->x:F

    return v0
.end method

.method public getY()F
    .locals 1

    .line 21
    iget v0, p0, Lcom/sensetime/stmobile/model/STPoint;->y:F

    return v0
.end method

.method public setX(F)V
    .locals 0

    .line 17
    iput p1, p0, Lcom/sensetime/stmobile/model/STPoint;->x:F

    .line 18
    return-void
.end method

.method public setY(F)V
    .locals 0

    .line 25
    iput p1, p0, Lcom/sensetime/stmobile/model/STPoint;->y:F

    .line 26
    return-void
.end method
