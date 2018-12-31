.class public final enum Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;
.super Ljava/lang/Enum;
.source "ImageHeaderParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/ImageHeaderParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ImageType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum cI:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

.field public static final enum cJ:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

.field public static final enum cK:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

.field public static final enum cL:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

.field public static final enum cM:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

.field public static final enum cN:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

.field public static final enum cO:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

.field public static final enum cP:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

.field private static final synthetic cQ:[Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;


# instance fields
.field private final hasAlpha:Z


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 25
    new-instance v0, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    const-string v1, "GIF"

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-direct {v0, v1, v3, v2}, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->cI:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    .line 26
    new-instance v0, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    const-string v1, "JPEG"

    invoke-direct {v0, v1, v2, v3}, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->cJ:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    .line 27
    new-instance v0, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    const-string v1, "RAW"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4, v3}, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->cK:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    .line 29
    new-instance v0, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    const-string v1, "PNG_A"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5, v2}, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->cL:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    .line 31
    new-instance v0, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    const-string v1, "PNG"

    const/4 v6, 0x4

    invoke-direct {v0, v1, v6, v3}, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->cM:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    .line 33
    new-instance v0, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    const-string v1, "WEBP_A"

    const/4 v7, 0x5

    invoke-direct {v0, v1, v7, v2}, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->cN:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    .line 35
    new-instance v0, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    const-string v1, "WEBP"

    const/4 v8, 0x6

    invoke-direct {v0, v1, v8, v3}, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->cO:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    .line 37
    new-instance v0, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    const-string v1, "UNKNOWN"

    const/4 v9, 0x7

    invoke-direct {v0, v1, v9, v3}, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->cP:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    .line 24
    const/16 v0, 0x8

    new-array v0, v0, [Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    sget-object v1, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->cI:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->cJ:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->cK:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->cL:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->cM:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    aput-object v1, v0, v6

    sget-object v1, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->cN:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    aput-object v1, v0, v7

    sget-object v1, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->cO:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    aput-object v1, v0, v8

    sget-object v1, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->cP:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    aput-object v1, v0, v9

    sput-object v0, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->cQ:[Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)V"
        }
    .end annotation

    .line 41
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 42
    iput-boolean p3, p0, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->hasAlpha:Z

    .line 43
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;
    .locals 1

    .line 24
    const-class v0, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    return-object p0
.end method

.method public static values()[Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;
    .locals 1

    .line 24
    sget-object v0, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->cQ:[Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    invoke-virtual {v0}, [Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    return-object v0
.end method


# virtual methods
.method public hasAlpha()Z
    .locals 1

    .line 46
    iget-boolean v0, p0, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->hasAlpha:Z

    return v0
.end method
