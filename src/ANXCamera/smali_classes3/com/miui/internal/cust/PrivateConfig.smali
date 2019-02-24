.class public Lcom/miui/internal/cust/PrivateConfig;
.super Ljava/lang/Object;
.source "PrivateConfig.java"


# static fields
.field public static IS_PRIVATE_BUILD:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 5
    const/4 v0, 0x0

    sput-boolean v0, Lcom/miui/internal/cust/PrivateConfig;->IS_PRIVATE_BUILD:Z

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
