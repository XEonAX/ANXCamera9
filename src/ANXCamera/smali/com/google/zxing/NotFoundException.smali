.class public final Lcom/google/zxing/NotFoundException;
.super Lcom/google/zxing/ReaderException;
.source "NotFoundException.java"


# static fields
.field private static final instance:Lcom/google/zxing/NotFoundException;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 27
    new-instance v0, Lcom/google/zxing/NotFoundException;

    invoke-direct {v0}, Lcom/google/zxing/NotFoundException;-><init>()V

    sput-object v0, Lcom/google/zxing/NotFoundException;->instance:Lcom/google/zxing/NotFoundException;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 29
    invoke-direct {p0}, Lcom/google/zxing/ReaderException;-><init>()V

    .line 31
    return-void
.end method

.method public static getNotFoundInstance()Lcom/google/zxing/NotFoundException;
    .registers 1

    .line 34
    sget-object v0, Lcom/google/zxing/NotFoundException;->instance:Lcom/google/zxing/NotFoundException;

    return-object v0
.end method
