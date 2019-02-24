.class final enum Lcom/sensetime/stmobile/STMobileStickerNative$RenderStatus;
.super Ljava/lang/Enum;
.source "STMobileStickerNative.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sensetime/stmobile/STMobileStickerNative;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "RenderStatus"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sensetime/stmobile/STMobileStickerNative$RenderStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sensetime/stmobile/STMobileStickerNative$RenderStatus;

.field public static final enum ST_MATERIAL_BEGIN_RENDER:Lcom/sensetime/stmobile/STMobileStickerNative$RenderStatus;

.field public static final enum ST_MATERIAL_NO_RENDERING:Lcom/sensetime/stmobile/STMobileStickerNative$RenderStatus;

.field public static final enum ST_MATERIAL_RENDERING:Lcom/sensetime/stmobile/STMobileStickerNative$RenderStatus;


# instance fields
.field private final status:I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 16
    new-instance v0, Lcom/sensetime/stmobile/STMobileStickerNative$RenderStatus;

    const-string v1, "ST_MATERIAL_BEGIN_RENDER"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lcom/sensetime/stmobile/STMobileStickerNative$RenderStatus;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/sensetime/stmobile/STMobileStickerNative$RenderStatus;->ST_MATERIAL_BEGIN_RENDER:Lcom/sensetime/stmobile/STMobileStickerNative$RenderStatus;

    .line 17
    new-instance v0, Lcom/sensetime/stmobile/STMobileStickerNative$RenderStatus;

    const-string v1, "ST_MATERIAL_RENDERING"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3, v3}, Lcom/sensetime/stmobile/STMobileStickerNative$RenderStatus;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/sensetime/stmobile/STMobileStickerNative$RenderStatus;->ST_MATERIAL_RENDERING:Lcom/sensetime/stmobile/STMobileStickerNative$RenderStatus;

    .line 18
    new-instance v0, Lcom/sensetime/stmobile/STMobileStickerNative$RenderStatus;

    const-string v1, "ST_MATERIAL_NO_RENDERING"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4, v4}, Lcom/sensetime/stmobile/STMobileStickerNative$RenderStatus;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/sensetime/stmobile/STMobileStickerNative$RenderStatus;->ST_MATERIAL_NO_RENDERING:Lcom/sensetime/stmobile/STMobileStickerNative$RenderStatus;

    .line 15
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/sensetime/stmobile/STMobileStickerNative$RenderStatus;

    sget-object v1, Lcom/sensetime/stmobile/STMobileStickerNative$RenderStatus;->ST_MATERIAL_BEGIN_RENDER:Lcom/sensetime/stmobile/STMobileStickerNative$RenderStatus;

    aput-object v1, v0, v2

    sget-object v1, Lcom/sensetime/stmobile/STMobileStickerNative$RenderStatus;->ST_MATERIAL_RENDERING:Lcom/sensetime/stmobile/STMobileStickerNative$RenderStatus;

    aput-object v1, v0, v3

    sget-object v1, Lcom/sensetime/stmobile/STMobileStickerNative$RenderStatus;->ST_MATERIAL_NO_RENDERING:Lcom/sensetime/stmobile/STMobileStickerNative$RenderStatus;

    aput-object v1, v0, v4

    sput-object v0, Lcom/sensetime/stmobile/STMobileStickerNative$RenderStatus;->$VALUES:[Lcom/sensetime/stmobile/STMobileStickerNative$RenderStatus;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 22
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 23
    iput p3, p0, Lcom/sensetime/stmobile/STMobileStickerNative$RenderStatus;->status:I

    .line 24
    return-void
.end method

.method public static fromStatus(I)Lcom/sensetime/stmobile/STMobileStickerNative$RenderStatus;
    .locals 5

    .line 31
    invoke-static {}, Lcom/sensetime/stmobile/STMobileStickerNative$RenderStatus;->values()[Lcom/sensetime/stmobile/STMobileStickerNative$RenderStatus;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 32
    invoke-virtual {v3}, Lcom/sensetime/stmobile/STMobileStickerNative$RenderStatus;->getStatus()I

    move-result v4

    if-ne v4, p0, :cond_0

    .line 33
    return-object v3

    .line 31
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 36
    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/sensetime/stmobile/STMobileStickerNative$RenderStatus;
    .locals 1

    .line 15
    const-class v0, Lcom/sensetime/stmobile/STMobileStickerNative$RenderStatus;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sensetime/stmobile/STMobileStickerNative$RenderStatus;

    return-object p0
.end method

.method public static values()[Lcom/sensetime/stmobile/STMobileStickerNative$RenderStatus;
    .locals 1

    .line 15
    sget-object v0, Lcom/sensetime/stmobile/STMobileStickerNative$RenderStatus;->$VALUES:[Lcom/sensetime/stmobile/STMobileStickerNative$RenderStatus;

    invoke-virtual {v0}, [Lcom/sensetime/stmobile/STMobileStickerNative$RenderStatus;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sensetime/stmobile/STMobileStickerNative$RenderStatus;

    return-object v0
.end method


# virtual methods
.method public getStatus()I
    .locals 1

    .line 27
    iget v0, p0, Lcom/sensetime/stmobile/STMobileStickerNative$RenderStatus;->status:I

    return v0
.end method
