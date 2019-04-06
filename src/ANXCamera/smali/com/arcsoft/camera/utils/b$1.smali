.class final Lcom/arcsoft/camera/utils/b$1;
.super Ljava/lang/Object;
.source "MPoint.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/arcsoft/camera/utils/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public b(Landroid/os/Parcel;)Lcom/arcsoft/camera/utils/b;
    .locals 1

    new-instance v0, Lcom/arcsoft/camera/utils/b;

    invoke-direct {v0}, Lcom/arcsoft/camera/utils/b;-><init>()V

    invoke-virtual {v0, p1}, Lcom/arcsoft/camera/utils/b;->a(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public synthetic c(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/arcsoft/camera/utils/b$1;->b(Landroid/os/Parcel;)Lcom/arcsoft/camera/utils/b;

    move-result-object p1

    return-object p1
.end method

.method public m(I)[Lcom/arcsoft/camera/utils/b;
    .locals 0

    new-array p1, p1, [Lcom/arcsoft/camera/utils/b;

    return-object p1
.end method

.method public synthetic n(I)[Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/arcsoft/camera/utils/b$1;->m(I)[Lcom/arcsoft/camera/utils/b;

    move-result-object p1

    return-object p1
.end method
