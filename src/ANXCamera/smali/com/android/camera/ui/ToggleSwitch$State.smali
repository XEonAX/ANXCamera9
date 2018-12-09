.class final enum Lcom/android/camera/ui/ToggleSwitch$State;
.super Ljava/lang/Enum;
.source "ToggleSwitch.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/ui/ToggleSwitch;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "State"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/android/camera/ui/ToggleSwitch$State;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/android/camera/ui/ToggleSwitch$State;

.field public static final enum SWITCHING_ANIM_OFF:Lcom/android/camera/ui/ToggleSwitch$State;

.field public static final enum SWITCHING_ANIM_ON:Lcom/android/camera/ui/ToggleSwitch$State;

.field public static final enum SWITCH_OFF:Lcom/android/camera/ui/ToggleSwitch$State;

.field public static final enum SWITCH_ON:Lcom/android/camera/ui/ToggleSwitch$State;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 93
    new-instance v0, Lcom/android/camera/ui/ToggleSwitch$State;

    const-string v1, "SWITCHING_ANIM_OFF"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/android/camera/ui/ToggleSwitch$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/camera/ui/ToggleSwitch$State;->SWITCHING_ANIM_OFF:Lcom/android/camera/ui/ToggleSwitch$State;

    new-instance v0, Lcom/android/camera/ui/ToggleSwitch$State;

    const-string v1, "SWITCHING_ANIM_ON"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/android/camera/ui/ToggleSwitch$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/camera/ui/ToggleSwitch$State;->SWITCHING_ANIM_ON:Lcom/android/camera/ui/ToggleSwitch$State;

    new-instance v0, Lcom/android/camera/ui/ToggleSwitch$State;

    const-string v1, "SWITCH_ON"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/android/camera/ui/ToggleSwitch$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/camera/ui/ToggleSwitch$State;->SWITCH_ON:Lcom/android/camera/ui/ToggleSwitch$State;

    new-instance v0, Lcom/android/camera/ui/ToggleSwitch$State;

    const-string v1, "SWITCH_OFF"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Lcom/android/camera/ui/ToggleSwitch$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/camera/ui/ToggleSwitch$State;->SWITCH_OFF:Lcom/android/camera/ui/ToggleSwitch$State;

    .line 92
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/android/camera/ui/ToggleSwitch$State;

    sget-object v1, Lcom/android/camera/ui/ToggleSwitch$State;->SWITCHING_ANIM_OFF:Lcom/android/camera/ui/ToggleSwitch$State;

    aput-object v1, v0, v2

    sget-object v1, Lcom/android/camera/ui/ToggleSwitch$State;->SWITCHING_ANIM_ON:Lcom/android/camera/ui/ToggleSwitch$State;

    aput-object v1, v0, v3

    sget-object v1, Lcom/android/camera/ui/ToggleSwitch$State;->SWITCH_ON:Lcom/android/camera/ui/ToggleSwitch$State;

    aput-object v1, v0, v4

    sget-object v1, Lcom/android/camera/ui/ToggleSwitch$State;->SWITCH_OFF:Lcom/android/camera/ui/ToggleSwitch$State;

    aput-object v1, v0, v5

    sput-object v0, Lcom/android/camera/ui/ToggleSwitch$State;->$VALUES:[Lcom/android/camera/ui/ToggleSwitch$State;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 92
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/android/camera/ui/ToggleSwitch$State;
    .locals 1

    .line 92
    const-class v0, Lcom/android/camera/ui/ToggleSwitch$State;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/android/camera/ui/ToggleSwitch$State;

    return-object p0
.end method

.method public static values()[Lcom/android/camera/ui/ToggleSwitch$State;
    .locals 1

    .line 92
    sget-object v0, Lcom/android/camera/ui/ToggleSwitch$State;->$VALUES:[Lcom/android/camera/ui/ToggleSwitch$State;

    invoke-virtual {v0}, [Lcom/android/camera/ui/ToggleSwitch$State;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/android/camera/ui/ToggleSwitch$State;

    return-object v0
.end method
