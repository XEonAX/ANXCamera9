.class public Lcom/arcsoft/camera/utils/b;
.super Ljava/lang/Object;
.source "MPoint.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final gk:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/arcsoft/camera/utils/b;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public a:I

.field public b:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/arcsoft/camera/utils/b$1;

    invoke-direct {v0}, Lcom/arcsoft/camera/utils/b$1;-><init>()V

    sput-object v0, Lcom/arcsoft/camera/utils/b;->gk:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(II)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/arcsoft/camera/utils/b;->a:I

    iput p2, p0, Lcom/arcsoft/camera/utils/b;->b:I

    return-void
.end method

.method public constructor <init>(Lcom/arcsoft/camera/utils/b;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget v0, p1, Lcom/arcsoft/camera/utils/b;->a:I

    iput v0, p0, Lcom/arcsoft/camera/utils/b;->a:I

    iget p1, p1, Lcom/arcsoft/camera/utils/b;->b:I

    iput p1, p0, Lcom/arcsoft/camera/utils/b;->b:I

    return-void
.end method


# virtual methods
.method public a()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public a(Landroid/os/Parcel;)V
    .locals 1

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/arcsoft/camera/utils/b;->a:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lcom/arcsoft/camera/utils/b;->b:I

    return-void
.end method

.method public a(Landroid/os/Parcel;I)V
    .locals 0

    iget p2, p0, Lcom/arcsoft/camera/utils/b;->a:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget p2, p0, Lcom/arcsoft/camera/utils/b;->b:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method

.method public a(Ljava/lang/Object;)Z
    .locals 3

    if-eq p0, p1, :cond_3

    const/4 v0, 0x0

    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-eq v1, v2, :cond_0

    goto :goto_0

    :cond_0
    check-cast p1, Lcom/arcsoft/camera/utils/b;

    iget v1, p0, Lcom/arcsoft/camera/utils/b;->a:I

    iget v2, p1, Lcom/arcsoft/camera/utils/b;->a:I

    if-eq v1, v2, :cond_1

    return v0

    :cond_1
    iget v1, p0, Lcom/arcsoft/camera/utils/b;->b:I

    iget p1, p1, Lcom/arcsoft/camera/utils/b;->b:I

    if-eq v1, p1, :cond_3

    return v0

    :cond_2
    :goto_0
    return v0

    :cond_3
    const/4 p1, 0x1

    return p1
.end method

.method public b()I
    .locals 2

    iget v0, p0, Lcom/arcsoft/camera/utils/b;->a:I

    const/16 v1, 0x1f

    mul-int/2addr v1, v0

    iget v0, p0, Lcom/arcsoft/camera/utils/b;->b:I

    add-int/2addr v1, v0

    return v1
.end method

.method public final c()V
    .locals 1

    iget v0, p0, Lcom/arcsoft/camera/utils/b;->a:I

    neg-int v0, v0

    iput v0, p0, Lcom/arcsoft/camera/utils/b;->a:I

    iget v0, p0, Lcom/arcsoft/camera/utils/b;->b:I

    neg-int v0, v0

    iput v0, p0, Lcom/arcsoft/camera/utils/b;->b:I

    return-void
.end method

.method public d()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Point("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/arcsoft/camera/utils/b;->a:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/arcsoft/camera/utils/b;->b:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final d(II)Z
    .locals 1

    iget v0, p0, Lcom/arcsoft/camera/utils/b;->a:I

    if-ne v0, p1, :cond_0

    iget p1, p0, Lcom/arcsoft/camera/utils/b;->b:I

    if-ne p1, p2, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public final e(II)V
    .locals 1

    iget v0, p0, Lcom/arcsoft/camera/utils/b;->a:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/arcsoft/camera/utils/b;->a:I

    iget p1, p0, Lcom/arcsoft/camera/utils/b;->b:I

    add-int/2addr p1, p2

    iput p1, p0, Lcom/arcsoft/camera/utils/b;->b:I

    return-void
.end method

.method public f(II)V
    .locals 0

    iput p1, p0, Lcom/arcsoft/camera/utils/b;->a:I

    iput p2, p0, Lcom/arcsoft/camera/utils/b;->b:I

    return-void
.end method
