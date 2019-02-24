.class final enum Lcom/bumptech/glide/request/SingleRequest$Status;
.super Ljava/lang/Enum;
.source "SingleRequest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/request/SingleRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "Status"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/bumptech/glide/request/SingleRequest$Status;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum oe:Lcom/bumptech/glide/request/SingleRequest$Status;

.field public static final enum of:Lcom/bumptech/glide/request/SingleRequest$Status;

.field public static final enum og:Lcom/bumptech/glide/request/SingleRequest$Status;

.field public static final enum oh:Lcom/bumptech/glide/request/SingleRequest$Status;

.field public static final enum oi:Lcom/bumptech/glide/request/SingleRequest$Status;

.field public static final enum oj:Lcom/bumptech/glide/request/SingleRequest$Status;

.field public static final enum ok:Lcom/bumptech/glide/request/SingleRequest$Status;

.field public static final enum ol:Lcom/bumptech/glide/request/SingleRequest$Status;

.field private static final synthetic om:[Lcom/bumptech/glide/request/SingleRequest$Status;


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 58
    new-instance v0, Lcom/bumptech/glide/request/SingleRequest$Status;

    const-string v1, "PENDING"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/bumptech/glide/request/SingleRequest$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bumptech/glide/request/SingleRequest$Status;->oe:Lcom/bumptech/glide/request/SingleRequest$Status;

    .line 62
    new-instance v0, Lcom/bumptech/glide/request/SingleRequest$Status;

    const-string v1, "RUNNING"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/bumptech/glide/request/SingleRequest$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bumptech/glide/request/SingleRequest$Status;->of:Lcom/bumptech/glide/request/SingleRequest$Status;

    .line 66
    new-instance v0, Lcom/bumptech/glide/request/SingleRequest$Status;

    const-string v1, "WAITING_FOR_SIZE"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/bumptech/glide/request/SingleRequest$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bumptech/glide/request/SingleRequest$Status;->og:Lcom/bumptech/glide/request/SingleRequest$Status;

    .line 70
    new-instance v0, Lcom/bumptech/glide/request/SingleRequest$Status;

    const-string v1, "COMPLETE"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Lcom/bumptech/glide/request/SingleRequest$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bumptech/glide/request/SingleRequest$Status;->oh:Lcom/bumptech/glide/request/SingleRequest$Status;

    .line 74
    new-instance v0, Lcom/bumptech/glide/request/SingleRequest$Status;

    const-string v1, "FAILED"

    const/4 v6, 0x4

    invoke-direct {v0, v1, v6}, Lcom/bumptech/glide/request/SingleRequest$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bumptech/glide/request/SingleRequest$Status;->oi:Lcom/bumptech/glide/request/SingleRequest$Status;

    .line 78
    new-instance v0, Lcom/bumptech/glide/request/SingleRequest$Status;

    const-string v1, "CANCELLED"

    const/4 v7, 0x5

    invoke-direct {v0, v1, v7}, Lcom/bumptech/glide/request/SingleRequest$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bumptech/glide/request/SingleRequest$Status;->oj:Lcom/bumptech/glide/request/SingleRequest$Status;

    .line 82
    new-instance v0, Lcom/bumptech/glide/request/SingleRequest$Status;

    const-string v1, "CLEARED"

    const/4 v8, 0x6

    invoke-direct {v0, v1, v8}, Lcom/bumptech/glide/request/SingleRequest$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bumptech/glide/request/SingleRequest$Status;->ok:Lcom/bumptech/glide/request/SingleRequest$Status;

    .line 86
    new-instance v0, Lcom/bumptech/glide/request/SingleRequest$Status;

    const-string v1, "PAUSED"

    const/4 v9, 0x7

    invoke-direct {v0, v1, v9}, Lcom/bumptech/glide/request/SingleRequest$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bumptech/glide/request/SingleRequest$Status;->ol:Lcom/bumptech/glide/request/SingleRequest$Status;

    .line 54
    const/16 v0, 0x8

    new-array v0, v0, [Lcom/bumptech/glide/request/SingleRequest$Status;

    sget-object v1, Lcom/bumptech/glide/request/SingleRequest$Status;->oe:Lcom/bumptech/glide/request/SingleRequest$Status;

    aput-object v1, v0, v2

    sget-object v1, Lcom/bumptech/glide/request/SingleRequest$Status;->of:Lcom/bumptech/glide/request/SingleRequest$Status;

    aput-object v1, v0, v3

    sget-object v1, Lcom/bumptech/glide/request/SingleRequest$Status;->og:Lcom/bumptech/glide/request/SingleRequest$Status;

    aput-object v1, v0, v4

    sget-object v1, Lcom/bumptech/glide/request/SingleRequest$Status;->oh:Lcom/bumptech/glide/request/SingleRequest$Status;

    aput-object v1, v0, v5

    sget-object v1, Lcom/bumptech/glide/request/SingleRequest$Status;->oi:Lcom/bumptech/glide/request/SingleRequest$Status;

    aput-object v1, v0, v6

    sget-object v1, Lcom/bumptech/glide/request/SingleRequest$Status;->oj:Lcom/bumptech/glide/request/SingleRequest$Status;

    aput-object v1, v0, v7

    sget-object v1, Lcom/bumptech/glide/request/SingleRequest$Status;->ok:Lcom/bumptech/glide/request/SingleRequest$Status;

    aput-object v1, v0, v8

    sget-object v1, Lcom/bumptech/glide/request/SingleRequest$Status;->ol:Lcom/bumptech/glide/request/SingleRequest$Status;

    aput-object v1, v0, v9

    sput-object v0, Lcom/bumptech/glide/request/SingleRequest$Status;->om:[Lcom/bumptech/glide/request/SingleRequest$Status;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 54
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/bumptech/glide/request/SingleRequest$Status;
    .locals 1

    .line 54
    const-class v0, Lcom/bumptech/glide/request/SingleRequest$Status;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/bumptech/glide/request/SingleRequest$Status;

    return-object p0
.end method

.method public static values()[Lcom/bumptech/glide/request/SingleRequest$Status;
    .locals 1

    .line 54
    sget-object v0, Lcom/bumptech/glide/request/SingleRequest$Status;->om:[Lcom/bumptech/glide/request/SingleRequest$Status;

    invoke-virtual {v0}, [Lcom/bumptech/glide/request/SingleRequest$Status;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/bumptech/glide/request/SingleRequest$Status;

    return-object v0
.end method
