.class public final enum Lorg/jcodec/common/model/ChannelLabel;
.super Ljava/lang/Enum;
.source "ChannelLabel.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/jcodec/common/model/ChannelLabel;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/jcodec/common/model/ChannelLabel;

.field public static final enum CENTER:Lorg/jcodec/common/model/ChannelLabel;

.field public static final enum FRONT_CENTER_LEFT:Lorg/jcodec/common/model/ChannelLabel;

.field public static final enum FRONT_CENTER_RIGHT:Lorg/jcodec/common/model/ChannelLabel;

.field public static final enum FRONT_LEFT:Lorg/jcodec/common/model/ChannelLabel;

.field public static final enum FRONT_RIGHT:Lorg/jcodec/common/model/ChannelLabel;

.field public static final enum LEFT_TOTAL:Lorg/jcodec/common/model/ChannelLabel;

.field public static final enum LFE:Lorg/jcodec/common/model/ChannelLabel;

.field public static final enum MONO:Lorg/jcodec/common/model/ChannelLabel;

.field public static final enum REAR_CENTER:Lorg/jcodec/common/model/ChannelLabel;

.field public static final enum REAR_LEFT:Lorg/jcodec/common/model/ChannelLabel;

.field public static final enum REAR_RIGHT:Lorg/jcodec/common/model/ChannelLabel;

.field public static final enum RIGHT_TOTAL:Lorg/jcodec/common/model/ChannelLabel;

.field public static final enum SIDE_LEFT:Lorg/jcodec/common/model/ChannelLabel;

.field public static final enum SIDE_RIGHT:Lorg/jcodec/common/model/ChannelLabel;

.field public static final enum STEREO_LEFT:Lorg/jcodec/common/model/ChannelLabel;

.field public static final enum STEREO_RIGHT:Lorg/jcodec/common/model/ChannelLabel;


# direct methods
.method static constructor <clinit>()V
    .locals 17

    .line 11
    new-instance v0, Lorg/jcodec/common/model/ChannelLabel;

    const-string v1, "MONO"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lorg/jcodec/common/model/ChannelLabel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/jcodec/common/model/ChannelLabel;->MONO:Lorg/jcodec/common/model/ChannelLabel;

    new-instance v0, Lorg/jcodec/common/model/ChannelLabel;

    const-string v1, "STEREO_LEFT"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lorg/jcodec/common/model/ChannelLabel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/jcodec/common/model/ChannelLabel;->STEREO_LEFT:Lorg/jcodec/common/model/ChannelLabel;

    new-instance v0, Lorg/jcodec/common/model/ChannelLabel;

    const-string v1, "STEREO_RIGHT"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lorg/jcodec/common/model/ChannelLabel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/jcodec/common/model/ChannelLabel;->STEREO_RIGHT:Lorg/jcodec/common/model/ChannelLabel;

    new-instance v0, Lorg/jcodec/common/model/ChannelLabel;

    const-string v1, "LEFT_TOTAL"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Lorg/jcodec/common/model/ChannelLabel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/jcodec/common/model/ChannelLabel;->LEFT_TOTAL:Lorg/jcodec/common/model/ChannelLabel;

    new-instance v0, Lorg/jcodec/common/model/ChannelLabel;

    const-string v1, "RIGHT_TOTAL"

    const/4 v6, 0x4

    invoke-direct {v0, v1, v6}, Lorg/jcodec/common/model/ChannelLabel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/jcodec/common/model/ChannelLabel;->RIGHT_TOTAL:Lorg/jcodec/common/model/ChannelLabel;

    new-instance v0, Lorg/jcodec/common/model/ChannelLabel;

    const-string v1, "FRONT_LEFT"

    const/4 v7, 0x5

    invoke-direct {v0, v1, v7}, Lorg/jcodec/common/model/ChannelLabel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/jcodec/common/model/ChannelLabel;->FRONT_LEFT:Lorg/jcodec/common/model/ChannelLabel;

    new-instance v0, Lorg/jcodec/common/model/ChannelLabel;

    const-string v1, "FRONT_RIGHT"

    const/4 v8, 0x6

    invoke-direct {v0, v1, v8}, Lorg/jcodec/common/model/ChannelLabel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/jcodec/common/model/ChannelLabel;->FRONT_RIGHT:Lorg/jcodec/common/model/ChannelLabel;

    new-instance v0, Lorg/jcodec/common/model/ChannelLabel;

    const-string v1, "CENTER"

    const/4 v9, 0x7

    invoke-direct {v0, v1, v9}, Lorg/jcodec/common/model/ChannelLabel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/jcodec/common/model/ChannelLabel;->CENTER:Lorg/jcodec/common/model/ChannelLabel;

    new-instance v0, Lorg/jcodec/common/model/ChannelLabel;

    const-string v1, "LFE"

    const/16 v10, 0x8

    invoke-direct {v0, v1, v10}, Lorg/jcodec/common/model/ChannelLabel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/jcodec/common/model/ChannelLabel;->LFE:Lorg/jcodec/common/model/ChannelLabel;

    new-instance v0, Lorg/jcodec/common/model/ChannelLabel;

    const-string v1, "REAR_LEFT"

    const/16 v11, 0x9

    invoke-direct {v0, v1, v11}, Lorg/jcodec/common/model/ChannelLabel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/jcodec/common/model/ChannelLabel;->REAR_LEFT:Lorg/jcodec/common/model/ChannelLabel;

    new-instance v0, Lorg/jcodec/common/model/ChannelLabel;

    const-string v1, "REAR_RIGHT"

    const/16 v12, 0xa

    invoke-direct {v0, v1, v12}, Lorg/jcodec/common/model/ChannelLabel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/jcodec/common/model/ChannelLabel;->REAR_RIGHT:Lorg/jcodec/common/model/ChannelLabel;

    new-instance v0, Lorg/jcodec/common/model/ChannelLabel;

    const-string v1, "FRONT_CENTER_LEFT"

    const/16 v13, 0xb

    invoke-direct {v0, v1, v13}, Lorg/jcodec/common/model/ChannelLabel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/jcodec/common/model/ChannelLabel;->FRONT_CENTER_LEFT:Lorg/jcodec/common/model/ChannelLabel;

    new-instance v0, Lorg/jcodec/common/model/ChannelLabel;

    const-string v1, "FRONT_CENTER_RIGHT"

    const/16 v14, 0xc

    invoke-direct {v0, v1, v14}, Lorg/jcodec/common/model/ChannelLabel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/jcodec/common/model/ChannelLabel;->FRONT_CENTER_RIGHT:Lorg/jcodec/common/model/ChannelLabel;

    new-instance v0, Lorg/jcodec/common/model/ChannelLabel;

    const-string v1, "REAR_CENTER"

    const/16 v15, 0xd

    invoke-direct {v0, v1, v15}, Lorg/jcodec/common/model/ChannelLabel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/jcodec/common/model/ChannelLabel;->REAR_CENTER:Lorg/jcodec/common/model/ChannelLabel;

    new-instance v0, Lorg/jcodec/common/model/ChannelLabel;

    const-string v1, "SIDE_LEFT"

    const/16 v15, 0xe

    invoke-direct {v0, v1, v15}, Lorg/jcodec/common/model/ChannelLabel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/jcodec/common/model/ChannelLabel;->SIDE_LEFT:Lorg/jcodec/common/model/ChannelLabel;

    new-instance v0, Lorg/jcodec/common/model/ChannelLabel;

    const-string v1, "SIDE_RIGHT"

    const/16 v15, 0xf

    invoke-direct {v0, v1, v15}, Lorg/jcodec/common/model/ChannelLabel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/jcodec/common/model/ChannelLabel;->SIDE_RIGHT:Lorg/jcodec/common/model/ChannelLabel;

    .line 10
    const/16 v0, 0x10

    new-array v0, v0, [Lorg/jcodec/common/model/ChannelLabel;

    sget-object v1, Lorg/jcodec/common/model/ChannelLabel;->MONO:Lorg/jcodec/common/model/ChannelLabel;

    aput-object v1, v0, v2

    sget-object v1, Lorg/jcodec/common/model/ChannelLabel;->STEREO_LEFT:Lorg/jcodec/common/model/ChannelLabel;

    aput-object v1, v0, v3

    sget-object v1, Lorg/jcodec/common/model/ChannelLabel;->STEREO_RIGHT:Lorg/jcodec/common/model/ChannelLabel;

    aput-object v1, v0, v4

    sget-object v1, Lorg/jcodec/common/model/ChannelLabel;->LEFT_TOTAL:Lorg/jcodec/common/model/ChannelLabel;

    aput-object v1, v0, v5

    sget-object v1, Lorg/jcodec/common/model/ChannelLabel;->RIGHT_TOTAL:Lorg/jcodec/common/model/ChannelLabel;

    aput-object v1, v0, v6

    sget-object v1, Lorg/jcodec/common/model/ChannelLabel;->FRONT_LEFT:Lorg/jcodec/common/model/ChannelLabel;

    aput-object v1, v0, v7

    sget-object v1, Lorg/jcodec/common/model/ChannelLabel;->FRONT_RIGHT:Lorg/jcodec/common/model/ChannelLabel;

    aput-object v1, v0, v8

    sget-object v1, Lorg/jcodec/common/model/ChannelLabel;->CENTER:Lorg/jcodec/common/model/ChannelLabel;

    aput-object v1, v0, v9

    sget-object v1, Lorg/jcodec/common/model/ChannelLabel;->LFE:Lorg/jcodec/common/model/ChannelLabel;

    aput-object v1, v0, v10

    sget-object v1, Lorg/jcodec/common/model/ChannelLabel;->REAR_LEFT:Lorg/jcodec/common/model/ChannelLabel;

    aput-object v1, v0, v11

    sget-object v1, Lorg/jcodec/common/model/ChannelLabel;->REAR_RIGHT:Lorg/jcodec/common/model/ChannelLabel;

    aput-object v1, v0, v12

    sget-object v1, Lorg/jcodec/common/model/ChannelLabel;->FRONT_CENTER_LEFT:Lorg/jcodec/common/model/ChannelLabel;

    aput-object v1, v0, v13

    sget-object v1, Lorg/jcodec/common/model/ChannelLabel;->FRONT_CENTER_RIGHT:Lorg/jcodec/common/model/ChannelLabel;

    aput-object v1, v0, v14

    sget-object v1, Lorg/jcodec/common/model/ChannelLabel;->REAR_CENTER:Lorg/jcodec/common/model/ChannelLabel;

    const/16 v2, 0xd

    aput-object v1, v0, v2

    sget-object v1, Lorg/jcodec/common/model/ChannelLabel;->SIDE_LEFT:Lorg/jcodec/common/model/ChannelLabel;

    const/16 v2, 0xe

    aput-object v1, v0, v2

    sget-object v1, Lorg/jcodec/common/model/ChannelLabel;->SIDE_RIGHT:Lorg/jcodec/common/model/ChannelLabel;

    const/16 v2, 0xf

    aput-object v1, v0, v2

    sput-object v0, Lorg/jcodec/common/model/ChannelLabel;->$VALUES:[Lorg/jcodec/common/model/ChannelLabel;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 10
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/jcodec/common/model/ChannelLabel;
    .locals 1

    .line 10
    const-class v0, Lorg/jcodec/common/model/ChannelLabel;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lorg/jcodec/common/model/ChannelLabel;

    return-object p0
.end method

.method public static values()[Lorg/jcodec/common/model/ChannelLabel;
    .locals 1

    .line 10
    sget-object v0, Lorg/jcodec/common/model/ChannelLabel;->$VALUES:[Lorg/jcodec/common/model/ChannelLabel;

    invoke-virtual {v0}, [Lorg/jcodec/common/model/ChannelLabel;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/jcodec/common/model/ChannelLabel;

    return-object v0
.end method
