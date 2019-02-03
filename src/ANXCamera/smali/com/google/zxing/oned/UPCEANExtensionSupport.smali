.class final Lcom/google/zxing/oned/UPCEANExtensionSupport;
.super Ljava/lang/Object;
.source "UPCEANExtensionSupport.java"


# static fields
.field private static final EXTENSION_START_PATTERN:[I


# instance fields
.field private final fiveSupport:Lcom/google/zxing/oned/UPCEANExtension5Support;

.field private final twoSupport:Lcom/google/zxing/oned/UPCEANExtension2Support;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 26
    const/4 v0, 0x3

    new-array v0, v0, [I

    fill-array-data v0, :array_a

    sput-object v0, Lcom/google/zxing/oned/UPCEANExtensionSupport;->EXTENSION_START_PATTERN:[I

    return-void

    nop

    :array_a
    .array-data 4
        0x1
        0x1
        0x2
    .end array-data
.end method

.method constructor <init>()V
    .registers 2

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    new-instance v0, Lcom/google/zxing/oned/UPCEANExtension2Support;

    invoke-direct {v0}, Lcom/google/zxing/oned/UPCEANExtension2Support;-><init>()V

    iput-object v0, p0, Lcom/google/zxing/oned/UPCEANExtensionSupport;->twoSupport:Lcom/google/zxing/oned/UPCEANExtension2Support;

    .line 29
    new-instance v0, Lcom/google/zxing/oned/UPCEANExtension5Support;

    invoke-direct {v0}, Lcom/google/zxing/oned/UPCEANExtension5Support;-><init>()V

    iput-object v0, p0, Lcom/google/zxing/oned/UPCEANExtensionSupport;->fiveSupport:Lcom/google/zxing/oned/UPCEANExtension5Support;

    .line 24
    return-void
.end method


# virtual methods
.method decodeRow(ILcom/google/zxing/common/BitArray;I)Lcom/google/zxing/Result;
    .registers 7
    .param p1, "rowNumber"    # I
    .param p2, "row"    # Lcom/google/zxing/common/BitArray;
    .param p3, "rowOffset"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 32
    sget-object v0, Lcom/google/zxing/oned/UPCEANExtensionSupport;->EXTENSION_START_PATTERN:[I

    const/4 v1, 0x0

    invoke-static {p2, p3, v1, v0}, Lcom/google/zxing/oned/UPCEANReader;->findGuardPattern(Lcom/google/zxing/common/BitArray;IZ[I)[I

    move-result-object v0

    .line 34
    .local v0, "extensionStartRange":[I
    :try_start_7
    iget-object v1, p0, Lcom/google/zxing/oned/UPCEANExtensionSupport;->fiveSupport:Lcom/google/zxing/oned/UPCEANExtension5Support;

    invoke-virtual {v1, p1, p2, v0}, Lcom/google/zxing/oned/UPCEANExtension5Support;->decodeRow(ILcom/google/zxing/common/BitArray;[I)Lcom/google/zxing/Result;

    move-result-object v1
    :try_end_d
    .catch Lcom/google/zxing/ReaderException; {:try_start_7 .. :try_end_d} :catch_e

    return-object v1

    .line 35
    :catch_e
    move-exception v1

    .line 36
    .local v1, "ignored":Lcom/google/zxing/ReaderException;
    iget-object v2, p0, Lcom/google/zxing/oned/UPCEANExtensionSupport;->twoSupport:Lcom/google/zxing/oned/UPCEANExtension2Support;

    invoke-virtual {v2, p1, p2, v0}, Lcom/google/zxing/oned/UPCEANExtension2Support;->decodeRow(ILcom/google/zxing/common/BitArray;[I)Lcom/google/zxing/Result;

    move-result-object v2

    return-object v2
.end method
