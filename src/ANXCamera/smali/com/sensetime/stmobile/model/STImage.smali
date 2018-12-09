.class public Lcom/sensetime/stmobile/model/STImage;
.super Ljava/lang/Object;
.source "STImage.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sensetime/stmobile/model/STImage$STTime;
    }
.end annotation


# instance fields
.field public height:I

.field public imageData:[B

.field public pixelFormat:I

.field public stride:I

.field public timeStamp:Lcom/sensetime/stmobile/model/STImage$STTime;

.field public width:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
