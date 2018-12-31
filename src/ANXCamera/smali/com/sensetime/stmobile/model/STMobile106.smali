.class public Lcom/sensetime/stmobile/model/STMobile106;
.super Ljava/lang/Object;
.source "STMobile106.java"


# instance fields
.field ID:I

.field eye_dist:F

.field pitch:F

.field points_array:[Lcom/sensetime/stmobile/model/STPoint;

.field rect:Lcom/sensetime/stmobile/model/STRect;

.field roll:F

.field score:F

.field visibility_array:[F

.field yaw:F


# direct methods
.method public constructor <init>(Lcom/sensetime/stmobile/model/STRect;F[Lcom/sensetime/stmobile/model/STPoint;FFFFI)V
    .locals 2

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    const/16 v0, 0x6a

    new-array v1, v0, [Lcom/sensetime/stmobile/model/STPoint;

    iput-object v1, p0, Lcom/sensetime/stmobile/model/STMobile106;->points_array:[Lcom/sensetime/stmobile/model/STPoint;

    .line 12
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/sensetime/stmobile/model/STMobile106;->visibility_array:[F

    .line 20
    iput-object p1, p0, Lcom/sensetime/stmobile/model/STMobile106;->rect:Lcom/sensetime/stmobile/model/STRect;

    .line 21
    iput p2, p0, Lcom/sensetime/stmobile/model/STMobile106;->score:F

    .line 22
    iput-object p3, p0, Lcom/sensetime/stmobile/model/STMobile106;->points_array:[Lcom/sensetime/stmobile/model/STPoint;

    .line 23
    iput p4, p0, Lcom/sensetime/stmobile/model/STMobile106;->yaw:F

    .line 24
    iput p5, p0, Lcom/sensetime/stmobile/model/STMobile106;->pitch:F

    .line 25
    iput p6, p0, Lcom/sensetime/stmobile/model/STMobile106;->roll:F

    .line 26
    iput p7, p0, Lcom/sensetime/stmobile/model/STMobile106;->eye_dist:F

    .line 27
    iput p8, p0, Lcom/sensetime/stmobile/model/STMobile106;->ID:I

    .line 28
    return-void
.end method


# virtual methods
.method public getEye_dist()F
    .locals 1

    .line 83
    iget v0, p0, Lcom/sensetime/stmobile/model/STMobile106;->eye_dist:F

    return v0
.end method

.method public getID()I
    .locals 1

    .line 91
    iget v0, p0, Lcom/sensetime/stmobile/model/STMobile106;->ID:I

    return v0
.end method

.method public getPitch()F
    .locals 1

    .line 67
    iget v0, p0, Lcom/sensetime/stmobile/model/STMobile106;->pitch:F

    return v0
.end method

.method public getPoints_array()[Lcom/sensetime/stmobile/model/STPoint;
    .locals 1

    .line 47
    iget-object v0, p0, Lcom/sensetime/stmobile/model/STMobile106;->points_array:[Lcom/sensetime/stmobile/model/STPoint;

    return-object v0
.end method

.method public getRect()Lcom/sensetime/stmobile/model/STRect;
    .locals 1

    .line 31
    iget-object v0, p0, Lcom/sensetime/stmobile/model/STMobile106;->rect:Lcom/sensetime/stmobile/model/STRect;

    return-object v0
.end method

.method public getRoll()F
    .locals 1

    .line 75
    iget v0, p0, Lcom/sensetime/stmobile/model/STMobile106;->roll:F

    return v0
.end method

.method public getScore()F
    .locals 1

    .line 39
    iget v0, p0, Lcom/sensetime/stmobile/model/STMobile106;->score:F

    return v0
.end method

.method public getVisibilityArray()[F
    .locals 1

    .line 51
    iget-object v0, p0, Lcom/sensetime/stmobile/model/STMobile106;->visibility_array:[F

    return-object v0
.end method

.method public getYaw()F
    .locals 1

    .line 59
    iget v0, p0, Lcom/sensetime/stmobile/model/STMobile106;->yaw:F

    return v0
.end method

.method public setEye_dist(F)V
    .locals 0

    .line 87
    iput p1, p0, Lcom/sensetime/stmobile/model/STMobile106;->eye_dist:F

    .line 88
    return-void
.end method

.method public setID(I)V
    .locals 0

    .line 95
    iput p1, p0, Lcom/sensetime/stmobile/model/STMobile106;->ID:I

    .line 96
    return-void
.end method

.method public setPitch(F)V
    .locals 0

    .line 71
    iput p1, p0, Lcom/sensetime/stmobile/model/STMobile106;->pitch:F

    .line 72
    return-void
.end method

.method public setPoints_array([Lcom/sensetime/stmobile/model/STPoint;)V
    .locals 0

    .line 55
    iput-object p1, p0, Lcom/sensetime/stmobile/model/STMobile106;->points_array:[Lcom/sensetime/stmobile/model/STPoint;

    .line 56
    return-void
.end method

.method public setRect(Lcom/sensetime/stmobile/model/STRect;)V
    .locals 0

    .line 35
    iput-object p1, p0, Lcom/sensetime/stmobile/model/STMobile106;->rect:Lcom/sensetime/stmobile/model/STRect;

    .line 36
    return-void
.end method

.method public setRoll(F)V
    .locals 0

    .line 79
    iput p1, p0, Lcom/sensetime/stmobile/model/STMobile106;->roll:F

    .line 80
    return-void
.end method

.method public setScore(F)V
    .locals 0

    .line 43
    iput p1, p0, Lcom/sensetime/stmobile/model/STMobile106;->score:F

    .line 44
    return-void
.end method

.method public setYaw(F)V
    .locals 0

    .line 63
    iput p1, p0, Lcom/sensetime/stmobile/model/STMobile106;->yaw:F

    .line 64
    return-void
.end method
