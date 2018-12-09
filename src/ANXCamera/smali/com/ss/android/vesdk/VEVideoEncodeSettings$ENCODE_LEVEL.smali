.class public final enum Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;
.super Ljava/lang/Enum;
.source "VEVideoEncodeSettings.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/android/vesdk/VEVideoEncodeSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ENCODE_LEVEL"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;",
        ">;",
        "Landroid/os/Parcelable;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;",
            ">;"
        }
    .end annotation
.end field

.field public static final enum ENCODE_LEVEL_FAST:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

.field public static final enum ENCODE_LEVEL_FASTER:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

.field public static final enum ENCODE_LEVEL_MEDIUM:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

.field public static final enum ENCODE_LEVEL_PLACEBO:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

.field public static final enum ENCODE_LEVEL_SLOW:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

.field public static final enum ENCODE_LEVEL_SLOWER:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

.field public static final enum ENCODE_LEVEL_SUPERFAST:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

.field public static final enum ENCODE_LEVEL_ULTRAFAST:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

.field public static final enum ENCODE_LEVEL_VERYFAST:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

.field public static final enum ENCODE_LEVEL_VERYSLOW:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .line 144
    new-instance v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

    const-string v1, "ENCODE_LEVEL_ULTRAFAST"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;->ENCODE_LEVEL_ULTRAFAST:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

    .line 145
    new-instance v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

    const-string v1, "ENCODE_LEVEL_SUPERFAST"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;->ENCODE_LEVEL_SUPERFAST:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

    .line 146
    new-instance v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

    const-string v1, "ENCODE_LEVEL_VERYFAST"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;->ENCODE_LEVEL_VERYFAST:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

    .line 147
    new-instance v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

    const-string v1, "ENCODE_LEVEL_FASTER"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;->ENCODE_LEVEL_FASTER:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

    .line 148
    new-instance v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

    const-string v1, "ENCODE_LEVEL_FAST"

    const/4 v6, 0x4

    invoke-direct {v0, v1, v6}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;->ENCODE_LEVEL_FAST:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

    .line 149
    new-instance v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

    const-string v1, "ENCODE_LEVEL_MEDIUM"

    const/4 v7, 0x5

    invoke-direct {v0, v1, v7}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;->ENCODE_LEVEL_MEDIUM:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

    .line 150
    new-instance v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

    const-string v1, "ENCODE_LEVEL_SLOW"

    const/4 v8, 0x6

    invoke-direct {v0, v1, v8}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;->ENCODE_LEVEL_SLOW:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

    .line 151
    new-instance v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

    const-string v1, "ENCODE_LEVEL_SLOWER"

    const/4 v9, 0x7

    invoke-direct {v0, v1, v9}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;->ENCODE_LEVEL_SLOWER:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

    .line 152
    new-instance v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

    const-string v1, "ENCODE_LEVEL_VERYSLOW"

    const/16 v10, 0x8

    invoke-direct {v0, v1, v10}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;->ENCODE_LEVEL_VERYSLOW:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

    .line 153
    new-instance v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

    const-string v1, "ENCODE_LEVEL_PLACEBO"

    const/16 v11, 0x9

    invoke-direct {v0, v1, v11}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;->ENCODE_LEVEL_PLACEBO:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

    .line 143
    const/16 v0, 0xa

    new-array v0, v0, [Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;->ENCODE_LEVEL_ULTRAFAST:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

    aput-object v1, v0, v2

    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;->ENCODE_LEVEL_SUPERFAST:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

    aput-object v1, v0, v3

    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;->ENCODE_LEVEL_VERYFAST:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

    aput-object v1, v0, v4

    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;->ENCODE_LEVEL_FASTER:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

    aput-object v1, v0, v5

    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;->ENCODE_LEVEL_FAST:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

    aput-object v1, v0, v6

    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;->ENCODE_LEVEL_MEDIUM:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

    aput-object v1, v0, v7

    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;->ENCODE_LEVEL_SLOW:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

    aput-object v1, v0, v8

    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;->ENCODE_LEVEL_SLOWER:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

    aput-object v1, v0, v9

    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;->ENCODE_LEVEL_VERYSLOW:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

    aput-object v1, v0, v10

    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;->ENCODE_LEVEL_PLACEBO:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

    aput-object v1, v0, v11

    sput-object v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;->$VALUES:[Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

    .line 165
    new-instance v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL$1;

    invoke-direct {v0}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL$1;-><init>()V

    sput-object v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 143
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;
    .locals 1

    .line 143
    const-class v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

    return-object p0
.end method

.method public static values()[Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;
    .locals 1

    .line 143
    sget-object v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;->$VALUES:[Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

    invoke-virtual {v0}, [Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

    return-object v0
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .line 162
    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 157
    invoke-virtual {p0}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;->ordinal()I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 158
    return-void
.end method
