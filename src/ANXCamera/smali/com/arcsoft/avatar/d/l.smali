.class public Lcom/arcsoft/avatar/d/l;
.super Ljava/lang/Object;
.source "LogUtil.java"


# instance fields
.field private a:Z

.field private b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/arcsoft/avatar/d/l;->b:Ljava/lang/String;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/arcsoft/avatar/d/l;->a:Z

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)V
    .locals 1

    iget-boolean v0, p0, Lcom/arcsoft/avatar/d/l;->a:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/arcsoft/avatar/d/l;->b:Ljava/lang/String;

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return-void
.end method

.method public b(Ljava/lang/String;)V
    .locals 1

    iget-boolean v0, p0, Lcom/arcsoft/avatar/d/l;->a:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/arcsoft/avatar/d/l;->b:Ljava/lang/String;

    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return-void
.end method

.method public c(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/arcsoft/avatar/d/l;->b:Ljava/lang/String;

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
