.class public final enum Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;
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
    name = "CAMERA_FLASH_MODE"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;",
        ">;",
        "Landroid/os/Parcelable;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;

.field public static final enum CAMERA_FLASH_AUTO:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;

.field public static final enum CAMERA_FLASH_OFF:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;

.field public static final enum CAMERA_FLASH_ON:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;

.field public static final enum CAMERA_FLASH_RED_EYE:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;

.field public static final enum CAMERA_FLASH_TORCH:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;

.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 139
    new-instance v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;

    const-string v1, "CAMERA_FLASH_OFF"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;->CAMERA_FLASH_OFF:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;

    .line 140
    new-instance v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;

    const-string v1, "CAMERA_FLASH_ON"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;->CAMERA_FLASH_ON:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;

    .line 141
    new-instance v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;

    const-string v1, "CAMERA_FLASH_TORCH"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;->CAMERA_FLASH_TORCH:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;

    .line 142
    new-instance v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;

    const-string v1, "CAMERA_FLASH_AUTO"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;->CAMERA_FLASH_AUTO:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;

    .line 143
    new-instance v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;

    const-string v1, "CAMERA_FLASH_RED_EYE"

    const/4 v6, 0x4

    invoke-direct {v0, v1, v6}, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;->CAMERA_FLASH_RED_EYE:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;

    .line 138
    const/4 v0, 0x5

    new-array v0, v0, [Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;

    sget-object v1, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;->CAMERA_FLASH_OFF:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;

    aput-object v1, v0, v2

    sget-object v1, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;->CAMERA_FLASH_ON:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;

    aput-object v1, v0, v3

    sget-object v1, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;->CAMERA_FLASH_TORCH:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;

    aput-object v1, v0, v4

    sget-object v1, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;->CAMERA_FLASH_AUTO:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;

    aput-object v1, v0, v5

    sget-object v1, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;->CAMERA_FLASH_RED_EYE:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;

    aput-object v1, v0, v6

    sput-object v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;->$VALUES:[Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;

    .line 146
    new-instance v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE$1;

    invoke-direct {v0}, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE$1;-><init>()V

    sput-object v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 138
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;
    .locals 1

    .line 138
    const-class v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;

    return-object p0
.end method

.method public static values()[Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;
    .locals 1

    .line 138
    sget-object v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;->$VALUES:[Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;

    invoke-virtual {v0}, [Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;

    return-object v0
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .line 160
    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 165
    invoke-virtual {p0}, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;->ordinal()I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 166
    return-void
.end method
