.class public Lcom/sensetime/stmobile/model/STImage$STTime;
.super Ljava/lang/Object;
.source "STImage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sensetime/stmobile/model/STImage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "STTime"
.end annotation


# instance fields
.field microSeconds:J

.field second:J

.field final synthetic this$0:Lcom/sensetime/stmobile/model/STImage;


# direct methods
.method public constructor <init>(Lcom/sensetime/stmobile/model/STImage;)V
    .locals 0

    .line 15
    iput-object p1, p0, Lcom/sensetime/stmobile/model/STImage$STTime;->this$0:Lcom/sensetime/stmobile/model/STImage;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
