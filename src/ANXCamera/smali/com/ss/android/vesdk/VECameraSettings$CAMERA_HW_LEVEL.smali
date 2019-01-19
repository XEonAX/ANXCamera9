.class public final enum Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;
.super Ljava/lang/Enum;
.source "VECameraSettings.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/android/vesdk/VECameraSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "CAMERA_HW_LEVEL"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;",
        ">;",
        "Landroid/os/Parcelable;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

.field public static final enum CAMERA_HW_LEVEL_FULL:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

.field public static final enum CAMERA_HW_LEVEL_LEGACY:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

.field public static final enum CAMERA_HW_LEVEL_LEVEL_3:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

.field public static final enum CAMERA_HW_LEVEL_LIMITED:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 104
    new-instance v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    const-string v1, "CAMERA_HW_LEVEL_LEGACY"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;->CAMERA_HW_LEVEL_LEGACY:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    .line 105
    new-instance v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    const-string v1, "CAMERA_HW_LEVEL_LIMITED"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;->CAMERA_HW_LEVEL_LIMITED:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    .line 106
    new-instance v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    const-string v1, "CAMERA_HW_LEVEL_FULL"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;->CAMERA_HW_LEVEL_FULL:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    .line 107
    new-instance v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    const-string v1, "CAMERA_HW_LEVEL_LEVEL_3"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;->CAMERA_HW_LEVEL_LEVEL_3:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    .line 103
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    sget-object v1, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;->CAMERA_HW_LEVEL_LEGACY:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    aput-object v1, v0, v2

    sget-object v1, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;->CAMERA_HW_LEVEL_LIMITED:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    aput-object v1, v0, v3

    sget-object v1, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;->CAMERA_HW_LEVEL_FULL:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    aput-object v1, v0, v4

    sget-object v1, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;->CAMERA_HW_LEVEL_LEVEL_3:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    aput-object v1, v0, v5

    sput-object v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;->$VALUES:[Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    .line 119
    new-instance v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL$1;

    invoke-direct {v0}, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL$1;-><init>()V

    sput-object v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 103
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;
    .locals 1

    .line 103
    const-class v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    return-object p0
.end method

.method public static values()[Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;
    .locals 1

    .line 103
    sget-object v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;->$VALUES:[Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    invoke-virtual {v0}, [Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    return-object v0
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .line 116
    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 111
    invoke-virtual {p0}, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;->ordinal()I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 112
    return-void
.end method
