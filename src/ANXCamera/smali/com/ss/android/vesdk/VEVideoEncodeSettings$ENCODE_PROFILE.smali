.class public final enum Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;
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
    name = "ENCODE_PROFILE"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;",
        ">;",
        "Landroid/os/Parcelable;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;

.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;",
            ">;"
        }
    .end annotation
.end field

.field public static final enum ENCODE_PROFILE_BASELINE:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;

.field public static final enum ENCODE_PROFILE_HIGH:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;

.field public static final enum ENCODE_PROFILE_MAIN:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 103
    new-instance v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;

    const-string v1, "ENCODE_PROFILE_BASELINE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;->ENCODE_PROFILE_BASELINE:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;

    .line 104
    new-instance v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;

    const-string v1, "ENCODE_PROFILE_MAIN"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;->ENCODE_PROFILE_MAIN:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;

    .line 105
    new-instance v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;

    const-string v1, "ENCODE_PROFILE_HIGH"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;->ENCODE_PROFILE_HIGH:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;

    .line 102
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;

    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;->ENCODE_PROFILE_BASELINE:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;

    aput-object v1, v0, v2

    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;->ENCODE_PROFILE_MAIN:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;

    aput-object v1, v0, v3

    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;->ENCODE_PROFILE_HIGH:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;

    aput-object v1, v0, v4

    sput-object v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;->$VALUES:[Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;

    .line 117
    new-instance v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE$1;

    invoke-direct {v0}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE$1;-><init>()V

    sput-object v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 102
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;
    .locals 1

    .line 102
    const-class v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;

    return-object p0
.end method

.method public static values()[Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;
    .locals 1

    .line 102
    sget-object v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;->$VALUES:[Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;

    invoke-virtual {v0}, [Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;

    return-object v0
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .line 114
    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 109
    invoke-virtual {p0}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;->ordinal()I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 110
    return-void
.end method
