.class Lcom/adobe/xmp/impl/XMPNode$1;
.super Ljava/lang/Object;
.source "XMPNode.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/xmp/impl/XMPNode;->iterateQualifier()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/xmp/impl/XMPNode;

.field final synthetic val$it:Ljava/util/Iterator;


# direct methods
.method constructor <init>(Lcom/adobe/xmp/impl/XMPNode;Ljava/util/Iterator;)V
    .locals 0

    .line 391
    iput-object p1, p0, Lcom/adobe/xmp/impl/XMPNode$1;->this$0:Lcom/adobe/xmp/impl/XMPNode;

    iput-object p2, p0, Lcom/adobe/xmp/impl/XMPNode$1;->val$it:Ljava/util/Iterator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    .line 394
    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPNode$1;->val$it:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    return v0
.end method

.method public next()Ljava/lang/Object;
    .locals 1

    .line 399
    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPNode$1;->val$it:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .locals 2

    .line 404
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "remove() is not allowed due to the internal contraints"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
