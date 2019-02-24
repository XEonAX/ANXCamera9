.class public Lcom/sensetime/stmobile/model/STRect;
.super Ljava/lang/Object;
.source "STRect.java"


# instance fields
.field private bottom:I

.field private left:I

.field private right:I

.field private top:I


# direct methods
.method public constructor <init>(IIII)V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput p1, p0, Lcom/sensetime/stmobile/model/STRect;->left:I

    .line 11
    iput p2, p0, Lcom/sensetime/stmobile/model/STRect;->top:I

    .line 12
    iput p3, p0, Lcom/sensetime/stmobile/model/STRect;->right:I

    .line 13
    iput p4, p0, Lcom/sensetime/stmobile/model/STRect;->bottom:I

    .line 14
    return-void
.end method
