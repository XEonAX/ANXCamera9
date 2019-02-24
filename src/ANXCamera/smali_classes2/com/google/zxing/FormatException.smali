.class public final Lcom/google/zxing/FormatException;
.super Lcom/google/zxing/ReaderException;
.source "FormatException.java"


# static fields
.field private static final instance:Lcom/google/zxing/FormatException;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 28
    new-instance v0, Lcom/google/zxing/FormatException;

    invoke-direct {v0}, Lcom/google/zxing/FormatException;-><init>()V

    sput-object v0, Lcom/google/zxing/FormatException;->instance:Lcom/google/zxing/FormatException;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 30
    invoke-direct {p0}, Lcom/google/zxing/ReaderException;-><init>()V

    .line 32
    return-void
.end method

.method public static getFormatInstance()Lcom/google/zxing/FormatException;
    .registers 1

    .line 35
    sget-object v0, Lcom/google/zxing/FormatException;->instance:Lcom/google/zxing/FormatException;

    return-object v0
.end method
