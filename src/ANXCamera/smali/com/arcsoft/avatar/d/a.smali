.class public Lcom/arcsoft/avatar/d/a;
.super Ljava/lang/Object;
.source "ASVLOFFSCREEN.java"


# static fields
.field public static final ASVL_PAF_NV21:I = 0x802

.field public static final ASVL_PAF_RGB32_R8G8B8A8:I = 0x305


# instance fields
.field private a:I

.field private b:I

.field private c:I

.field private ct:[I

.field private eP:[B

.field private eQ:[B

.field private eR:[B


# direct methods
.method public constructor <init>(II[B)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/arcsoft/avatar/d/a;->b:I

    iput p2, p0, Lcom/arcsoft/avatar/d/a;->c:I

    const/16 p1, 0x305

    iput p1, p0, Lcom/arcsoft/avatar/d/a;->a:I

    iput-object p3, p0, Lcom/arcsoft/avatar/d/a;->eR:[B

    return-void
.end method

.method public constructor <init>([BIII)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p3, p0, Lcom/arcsoft/avatar/d/a;->b:I

    iput p4, p0, Lcom/arcsoft/avatar/d/a;->c:I

    const/16 p3, 0x802

    iput p3, p0, Lcom/arcsoft/avatar/d/a;->a:I

    iput-object p1, p0, Lcom/arcsoft/avatar/d/a;->eP:[B

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/arcsoft/avatar/d/a;->eQ:[B

    const/4 p1, 0x3

    new-array p1, p1, [I

    const/4 p3, 0x0

    aput p2, p1, p3

    const/4 p3, 0x1

    aput p2, p1, p3

    const/4 p3, 0x2

    aput p2, p1, p3

    iput-object p1, p0, Lcom/arcsoft/avatar/d/a;->ct:[I

    return-void
.end method

.method public constructor <init>([BIIIZ)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/arcsoft/avatar/d/a;-><init>([BIII)V

    if-eqz p5, :cond_0

    array-length p2, p1

    new-array p2, p2, [B

    iput-object p2, p0, Lcom/arcsoft/avatar/d/a;->eP:[B

    iget-object p2, p0, Lcom/arcsoft/avatar/d/a;->eP:[B

    array-length p3, p1

    const/4 p4, 0x0

    invoke-static {p1, p4, p2, p4, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_0
    return-void
.end method

.method public constructor <init>([B[B[III)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p4, p0, Lcom/arcsoft/avatar/d/a;->b:I

    iput p5, p0, Lcom/arcsoft/avatar/d/a;->c:I

    const/16 p4, 0x802

    iput p4, p0, Lcom/arcsoft/avatar/d/a;->a:I

    iput-object p1, p0, Lcom/arcsoft/avatar/d/a;->eP:[B

    iput-object p2, p0, Lcom/arcsoft/avatar/d/a;->eQ:[B

    iput-object p3, p0, Lcom/arcsoft/avatar/d/a;->ct:[I

    return-void
.end method


# virtual methods
.method public N()[B
    .locals 1

    iget-object v0, p0, Lcom/arcsoft/avatar/d/a;->eR:[B

    return-object v0
.end method

.method public O()[B
    .locals 1

    iget-object v0, p0, Lcom/arcsoft/avatar/d/a;->eP:[B

    return-object v0
.end method

.method public P()[B
    .locals 1

    iget-object v0, p0, Lcom/arcsoft/avatar/d/a;->eQ:[B

    return-object v0
.end method

.method public Q()[I
    .locals 1

    iget-object v0, p0, Lcom/arcsoft/avatar/d/a;->ct:[I

    return-object v0
.end method

.method public getHeight()I
    .locals 1

    iget v0, p0, Lcom/arcsoft/avatar/d/a;->c:I

    return v0
.end method

.method public getPixelFormat()I
    .locals 1

    iget v0, p0, Lcom/arcsoft/avatar/d/a;->a:I

    return v0
.end method

.method public getWidth()I
    .locals 1

    iget v0, p0, Lcom/arcsoft/avatar/d/a;->b:I

    return v0
.end method
