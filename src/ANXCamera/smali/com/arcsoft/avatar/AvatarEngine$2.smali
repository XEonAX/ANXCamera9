.class Lcom/arcsoft/avatar/AvatarEngine$2;
.super Ljava/lang/Object;
.source "AvatarEngine.java"

# interfaces
.implements Lcom/arcsoft/avatar/AvatarConfig$k;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/arcsoft/avatar/AvatarEngine;->a(II)Ljava/util/ArrayList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic b:I

.field final synthetic bF:Ljava/util/ArrayList;

.field final synthetic bH:Lcom/arcsoft/avatar/AvatarEngine;


# direct methods
.method constructor <init>(Lcom/arcsoft/avatar/AvatarEngine;Ljava/util/ArrayList;I)V
    .locals 0

    iput-object p1, p0, Lcom/arcsoft/avatar/AvatarEngine$2;->bH:Lcom/arcsoft/avatar/AvatarEngine;

    iput-object p2, p0, Lcom/arcsoft/avatar/AvatarEngine$2;->bF:Ljava/util/ArrayList;

    iput p3, p0, Lcom/arcsoft/avatar/AvatarEngine$2;->b:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(IIILjava/lang/String;Ljava/lang/String;IZZZF)V
    .locals 1

    new-instance v0, Lcom/arcsoft/avatar/AvatarConfig$c;

    invoke-direct {v0}, Lcom/arcsoft/avatar/AvatarConfig$c;-><init>()V

    iput p1, v0, Lcom/arcsoft/avatar/AvatarConfig$c;->ag:I

    iput p2, v0, Lcom/arcsoft/avatar/AvatarConfig$c;->ah:I

    iput p3, v0, Lcom/arcsoft/avatar/AvatarConfig$c;->gender:I

    iput-object p4, v0, Lcom/arcsoft/avatar/AvatarConfig$c;->name:Ljava/lang/String;

    iput-object p5, v0, Lcom/arcsoft/avatar/AvatarConfig$c;->ai:Ljava/lang/String;

    iput-boolean p7, v0, Lcom/arcsoft/avatar/AvatarConfig$c;->isDefault:Z

    iput-boolean p8, v0, Lcom/arcsoft/avatar/AvatarConfig$c;->aj:Z

    iput-boolean p9, v0, Lcom/arcsoft/avatar/AvatarConfig$c;->ak:Z

    iput p10, v0, Lcom/arcsoft/avatar/AvatarConfig$c;->al:F

    iput p6, v0, Lcom/arcsoft/avatar/AvatarConfig$c;->am:I

    iget-object p1, p0, Lcom/arcsoft/avatar/AvatarEngine$2;->bF:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string p1, "AvatarEngine"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "type = "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p3, p0, Lcom/arcsoft/avatar/AvatarEngine$2;->b:I

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p3, " info = "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/AvatarConfig$c;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/arcsoft/avatar/d/g;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
