.class public Lcom/sensetime/stmobile/STHumanAction;
.super Ljava/lang/Object;
.source "STHumanAction.java"


# instance fields
.field public backGroundRet:I

.field public faceCount:I

.field public faces:[Lcom/sensetime/stmobile/model/STMobileFaceAction;

.field public handCount:I

.field public hands:[Lcom/sensetime/stmobile/model/STMobileHandAction;

.field public image:Lcom/sensetime/stmobile/model/STImage;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getMobileFaces()[Lcom/sensetime/stmobile/model/STMobile106;
    .locals 3

    .line 23
    iget v0, p0, Lcom/sensetime/stmobile/STHumanAction;->faceCount:I

    if-nez v0, :cond_0

    .line 24
    const/4 v0, 0x0

    return-object v0

    .line 27
    :cond_0
    iget v0, p0, Lcom/sensetime/stmobile/STHumanAction;->faceCount:I

    new-array v0, v0, [Lcom/sensetime/stmobile/model/STMobile106;

    .line 28
    const/4 v1, 0x0

    :goto_0
    iget v2, p0, Lcom/sensetime/stmobile/STHumanAction;->faceCount:I

    if-ge v1, v2, :cond_1

    .line 29
    iget-object v2, p0, Lcom/sensetime/stmobile/STHumanAction;->faces:[Lcom/sensetime/stmobile/model/STMobileFaceAction;

    aget-object v2, v2, v1

    iget-object v2, v2, Lcom/sensetime/stmobile/model/STMobileFaceAction;->face:Lcom/sensetime/stmobile/model/STMobile106;

    aput-object v2, v0, v1

    .line 28
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 32
    :cond_1
    return-object v0
.end method

.method public replaceMobile106([Lcom/sensetime/stmobile/model/STMobile106;)Z
    .locals 3

    .line 36
    const/4 v0, 0x0

    if-eqz p1, :cond_2

    array-length v1, p1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/sensetime/stmobile/STHumanAction;->faces:[Lcom/sensetime/stmobile/model/STMobileFaceAction;

    if-eqz v1, :cond_2

    iget v1, p0, Lcom/sensetime/stmobile/STHumanAction;->faceCount:I

    array-length v2, p1

    if-eq v1, v2, :cond_0

    goto :goto_1

    .line 41
    :cond_0
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_1

    .line 42
    iget-object v1, p0, Lcom/sensetime/stmobile/STHumanAction;->faces:[Lcom/sensetime/stmobile/model/STMobileFaceAction;

    aget-object v1, v1, v0

    aget-object v2, p1, v0

    iput-object v2, v1, Lcom/sensetime/stmobile/model/STMobileFaceAction;->face:Lcom/sensetime/stmobile/model/STMobile106;

    .line 41
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 44
    :cond_1
    const/4 p1, 0x1

    return p1

    .line 38
    :cond_2
    :goto_1
    return v0
.end method
