.class public final enum Lcom/android/camera/sticker/glutils/Rotation;
.super Ljava/lang/Enum;
.source "Rotation.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/android/camera/sticker/glutils/Rotation;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/android/camera/sticker/glutils/Rotation;

.field public static final enum NORMAL:Lcom/android/camera/sticker/glutils/Rotation;

.field public static final enum ROTATION_180:Lcom/android/camera/sticker/glutils/Rotation;

.field public static final enum ROTATION_270:Lcom/android/camera/sticker/glutils/Rotation;

.field public static final enum ROTATION_90:Lcom/android/camera/sticker/glutils/Rotation;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 5
    new-instance v0, Lcom/android/camera/sticker/glutils/Rotation;

    const-string v1, "NORMAL"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/android/camera/sticker/glutils/Rotation;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/camera/sticker/glutils/Rotation;->NORMAL:Lcom/android/camera/sticker/glutils/Rotation;

    new-instance v0, Lcom/android/camera/sticker/glutils/Rotation;

    const-string v1, "ROTATION_90"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/android/camera/sticker/glutils/Rotation;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/camera/sticker/glutils/Rotation;->ROTATION_90:Lcom/android/camera/sticker/glutils/Rotation;

    new-instance v0, Lcom/android/camera/sticker/glutils/Rotation;

    const-string v1, "ROTATION_180"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/android/camera/sticker/glutils/Rotation;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/camera/sticker/glutils/Rotation;->ROTATION_180:Lcom/android/camera/sticker/glutils/Rotation;

    new-instance v0, Lcom/android/camera/sticker/glutils/Rotation;

    const-string v1, "ROTATION_270"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Lcom/android/camera/sticker/glutils/Rotation;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/camera/sticker/glutils/Rotation;->ROTATION_270:Lcom/android/camera/sticker/glutils/Rotation;

    .line 4
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/android/camera/sticker/glutils/Rotation;

    sget-object v1, Lcom/android/camera/sticker/glutils/Rotation;->NORMAL:Lcom/android/camera/sticker/glutils/Rotation;

    aput-object v1, v0, v2

    sget-object v1, Lcom/android/camera/sticker/glutils/Rotation;->ROTATION_90:Lcom/android/camera/sticker/glutils/Rotation;

    aput-object v1, v0, v3

    sget-object v1, Lcom/android/camera/sticker/glutils/Rotation;->ROTATION_180:Lcom/android/camera/sticker/glutils/Rotation;

    aput-object v1, v0, v4

    sget-object v1, Lcom/android/camera/sticker/glutils/Rotation;->ROTATION_270:Lcom/android/camera/sticker/glutils/Rotation;

    aput-object v1, v0, v5

    sput-object v0, Lcom/android/camera/sticker/glutils/Rotation;->$VALUES:[Lcom/android/camera/sticker/glutils/Rotation;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 4
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static fromInt(I)Lcom/android/camera/sticker/glutils/Rotation;
    .locals 2

    .line 34
    if-eqz p0, :cond_4

    const/16 v0, 0x5a

    if-eq p0, v0, :cond_3

    const/16 v0, 0xb4

    if-eq p0, v0, :cond_2

    const/16 v0, 0x10e

    if-eq p0, v0, :cond_1

    const/16 v0, 0x168

    if-ne p0, v0, :cond_0

    .line 44
    sget-object p0, Lcom/android/camera/sticker/glutils/Rotation;->NORMAL:Lcom/android/camera/sticker/glutils/Rotation;

    return-object p0

    .line 46
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, " is an unknown rotation. Needs to be either 0, 90, 180 or 270!"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 42
    :cond_1
    sget-object p0, Lcom/android/camera/sticker/glutils/Rotation;->ROTATION_270:Lcom/android/camera/sticker/glutils/Rotation;

    return-object p0

    .line 40
    :cond_2
    sget-object p0, Lcom/android/camera/sticker/glutils/Rotation;->ROTATION_180:Lcom/android/camera/sticker/glutils/Rotation;

    return-object p0

    .line 38
    :cond_3
    sget-object p0, Lcom/android/camera/sticker/glutils/Rotation;->ROTATION_90:Lcom/android/camera/sticker/glutils/Rotation;

    return-object p0

    .line 36
    :cond_4
    sget-object p0, Lcom/android/camera/sticker/glutils/Rotation;->NORMAL:Lcom/android/camera/sticker/glutils/Rotation;

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/android/camera/sticker/glutils/Rotation;
    .locals 1

    .line 4
    const-class v0, Lcom/android/camera/sticker/glutils/Rotation;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/android/camera/sticker/glutils/Rotation;

    return-object p0
.end method

.method public static values()[Lcom/android/camera/sticker/glutils/Rotation;
    .locals 1

    .line 4
    sget-object v0, Lcom/android/camera/sticker/glutils/Rotation;->$VALUES:[Lcom/android/camera/sticker/glutils/Rotation;

    invoke-virtual {v0}, [Lcom/android/camera/sticker/glutils/Rotation;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/android/camera/sticker/glutils/Rotation;

    return-object v0
.end method


# virtual methods
.method public asInt()I
    .locals 2

    .line 13
    sget-object v0, Lcom/android/camera/sticker/glutils/Rotation$1;->$SwitchMap$com$android$camera$sticker$glutils$Rotation:[I

    invoke-virtual {p0}, Lcom/android/camera/sticker/glutils/Rotation;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 23
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Unknown Rotation!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 21
    :pswitch_0
    const/16 v0, 0x10e

    return v0

    .line 19
    :pswitch_1
    const/16 v0, 0xb4

    return v0

    .line 17
    :pswitch_2
    const/16 v0, 0x5a

    return v0

    .line 15
    :pswitch_3
    const/4 v0, 0x0

    return v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
