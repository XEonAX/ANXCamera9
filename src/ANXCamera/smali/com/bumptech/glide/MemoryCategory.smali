.class public final enum Lcom/bumptech/glide/MemoryCategory;
.super Ljava/lang/Enum;
.source "MemoryCategory.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/bumptech/glide/MemoryCategory;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum aj:Lcom/bumptech/glide/MemoryCategory;

.field public static final enum ak:Lcom/bumptech/glide/MemoryCategory;

.field public static final enum al:Lcom/bumptech/glide/MemoryCategory;

.field private static final synthetic am:[Lcom/bumptech/glide/MemoryCategory;


# instance fields
.field private final multiplier:F


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 10
    new-instance v0, Lcom/bumptech/glide/MemoryCategory;

    const-string v1, "LOW"

    const/4 v2, 0x0

    const/high16 v3, 0x3f000000    # 0.5f

    invoke-direct {v0, v1, v2, v3}, Lcom/bumptech/glide/MemoryCategory;-><init>(Ljava/lang/String;IF)V

    sput-object v0, Lcom/bumptech/glide/MemoryCategory;->aj:Lcom/bumptech/glide/MemoryCategory;

    .line 14
    new-instance v0, Lcom/bumptech/glide/MemoryCategory;

    const-string v1, "NORMAL"

    const/4 v3, 0x1

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v3, v4}, Lcom/bumptech/glide/MemoryCategory;-><init>(Ljava/lang/String;IF)V

    sput-object v0, Lcom/bumptech/glide/MemoryCategory;->ak:Lcom/bumptech/glide/MemoryCategory;

    .line 19
    new-instance v0, Lcom/bumptech/glide/MemoryCategory;

    const-string v1, "HIGH"

    const/4 v4, 0x2

    const/high16 v5, 0x3fc00000    # 1.5f

    invoke-direct {v0, v1, v4, v5}, Lcom/bumptech/glide/MemoryCategory;-><init>(Ljava/lang/String;IF)V

    sput-object v0, Lcom/bumptech/glide/MemoryCategory;->al:Lcom/bumptech/glide/MemoryCategory;

    .line 6
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/bumptech/glide/MemoryCategory;

    sget-object v1, Lcom/bumptech/glide/MemoryCategory;->aj:Lcom/bumptech/glide/MemoryCategory;

    aput-object v1, v0, v2

    sget-object v1, Lcom/bumptech/glide/MemoryCategory;->ak:Lcom/bumptech/glide/MemoryCategory;

    aput-object v1, v0, v3

    sget-object v1, Lcom/bumptech/glide/MemoryCategory;->al:Lcom/bumptech/glide/MemoryCategory;

    aput-object v1, v0, v4

    sput-object v0, Lcom/bumptech/glide/MemoryCategory;->am:[Lcom/bumptech/glide/MemoryCategory;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IF)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)V"
        }
    .end annotation

    .line 23
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 24
    iput p3, p0, Lcom/bumptech/glide/MemoryCategory;->multiplier:F

    .line 25
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/bumptech/glide/MemoryCategory;
    .locals 1

    .line 6
    const-class v0, Lcom/bumptech/glide/MemoryCategory;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/bumptech/glide/MemoryCategory;

    return-object p0
.end method

.method public static values()[Lcom/bumptech/glide/MemoryCategory;
    .locals 1

    .line 6
    sget-object v0, Lcom/bumptech/glide/MemoryCategory;->am:[Lcom/bumptech/glide/MemoryCategory;

    invoke-virtual {v0}, [Lcom/bumptech/glide/MemoryCategory;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/bumptech/glide/MemoryCategory;

    return-object v0
.end method


# virtual methods
.method public p()F
    .locals 1

    .line 32
    iget v0, p0, Lcom/bumptech/glide/MemoryCategory;->multiplier:F

    return v0
.end method
