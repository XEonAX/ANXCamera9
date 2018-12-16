.class public Landroid/hardware/camera2/marshal/impl/MarshalQueryableString;
.super Ljava/lang/Object;
.source "MarshalQueryableString.java"

# interfaces
.implements Landroid/hardware/camera2/marshal/MarshalQueryable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/hardware/camera2/marshal/impl/MarshalQueryableString$MarshalerString;,
        Landroid/hardware/camera2/marshal/impl/MarshalQueryableString$PreloadHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/hardware/camera2/marshal/MarshalQueryable<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field private static final NUL:B

.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 33
    const-class v0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableString;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableString;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createMarshaler(Landroid/hardware/camera2/utils/TypeReference;I)Landroid/hardware/camera2/marshal/Marshaler;
    .registers 4
    .param p2, "nativeType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/camera2/utils/TypeReference<",
            "Ljava/lang/String;",
            ">;I)",
            "Landroid/hardware/camera2/marshal/Marshaler<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 105
    .local p1, "managedType":Landroid/hardware/camera2/utils/TypeReference;, "Landroid/hardware/camera2/utils/TypeReference<Ljava/lang/String;>;"
    new-instance v0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableString$MarshalerString;

    invoke-direct {v0, p0, p1, p2}, Landroid/hardware/camera2/marshal/impl/MarshalQueryableString$MarshalerString;-><init>(Landroid/hardware/camera2/marshal/impl/MarshalQueryableString;Landroid/hardware/camera2/utils/TypeReference;I)V

    return-object v0
.end method

.method public isTypeMappingSupported(Landroid/hardware/camera2/utils/TypeReference;I)Z
    .registers 5
    .param p2, "nativeType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/camera2/utils/TypeReference<",
            "Ljava/lang/String;",
            ">;I)Z"
        }
    .end annotation

    .line 110
    .local p1, "managedType":Landroid/hardware/camera2/utils/TypeReference;, "Landroid/hardware/camera2/utils/TypeReference<Ljava/lang/String;>;"
    if-nez p2, :cond_10

    const-class v0, Ljava/lang/String;

    invoke-virtual {p1}, Landroid/hardware/camera2/utils/TypeReference;->getType()Ljava/lang/reflect/Type;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    const/4 v0, 0x1

    goto :goto_11

    :cond_10
    const/4 v0, 0x0

    :goto_11
    return v0
.end method
