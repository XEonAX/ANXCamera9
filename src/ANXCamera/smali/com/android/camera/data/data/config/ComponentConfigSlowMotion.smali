.class public Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;
.super Lcom/android/camera/data/data/ComponentData;
.source "ComponentConfigSlowMotion.java"


# static fields
.field public static final DATA_CONFIG_NEW_SLOW_MOTION_120:Ljava/lang/String; = "slow_motion_120"

.field public static final DATA_CONFIG_NEW_SLOW_MOTION_240:Ljava/lang/String; = "slow_motion_240"

.field public static final DATA_CONFIG_NEW_SLOW_MOTION_960:Ljava/lang/String; = "slow_motion_960"

.field public static final DATA_CONFIG_NEW_SLOW_MOTION_KEY:Ljava/lang/String; = "key_new_slow_motion"

.field private static final SLOW_MOTION_MODE:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 37
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fs()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 38
    const-string v0, "slow_motion_960"

    const-string v1, "slow_motion_120"

    const-string v2, "slow_motion_240"

    filled-new-array {v0, v1, v2}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;->SLOW_MOTION_MODE:[Ljava/lang/String;

    goto :goto_0

    .line 41
    :cond_0
    const-string v0, "slow_motion_120"

    const-string v1, "slow_motion_240"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;->SLOW_MOTION_MODE:[Ljava/lang/String;

    .line 44
    :goto_0
    return-void
.end method

.method public constructor <init>(Lcom/android/camera/data/data/config/DataItemConfig;)V
    .locals 0

    .line 47
    invoke-direct {p0, p1}, Lcom/android/camera/data/data/ComponentData;-><init>(Lcom/android/camera/data/data/DataItemBase;)V

    .line 48
    return-void
.end method


# virtual methods
.method public getContentDesc()I
    .locals 2

    .line 106
    const/16 v0, 0xac

    invoke-virtual {p0, v0}, Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    .line 107
    const-string v1, "slow_motion_120"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 108
    const v0, 0x7f090100

    return v0

    .line 109
    :cond_0
    const-string v1, "slow_motion_240"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 110
    const v0, 0x7f090101

    return v0

    .line 112
    :cond_1
    const v0, 0x7f090102

    return v0
.end method

.method public getDefaultValue(I)Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 63
    sget-object p1, Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;->SLOW_MOTION_MODE:[Ljava/lang/String;

    const/4 v0, 0x0

    aget-object p1, p1, v0

    return-object p1
.end method

.method public getDisplayTitleString()I
    .locals 1

    .line 52
    const/4 v0, 0x0

    return v0
.end method

.method public getImageResource()I
    .locals 2

    .line 95
    const/16 v0, 0xac

    invoke-virtual {p0, v0}, Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    .line 96
    const-string v1, "slow_motion_120"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 97
    const v0, 0x7f02013f

    return v0

    .line 98
    :cond_0
    const-string v1, "slow_motion_240"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 99
    const v0, 0x7f020140

    return v0

    .line 101
    :cond_1
    const v0, 0x7f020141

    return v0
.end method

.method public getItems()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/camera/data/data/ComponentDataItem;",
            ">;"
        }
    .end annotation

    .line 68
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    return-object v0
.end method

.method public getKey(I)Ljava/lang/String;
    .locals 0

    .line 57
    const-string p1, "key_new_slow_motion"

    return-object p1
.end method

.method public getNextValue(I)Ljava/lang/String;
    .locals 4

    .line 85
    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    .line 86
    sget-object v1, Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;->SLOW_MOTION_MODE:[Ljava/lang/String;

    array-length v1, v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    .line 87
    sget-object v3, Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;->SLOW_MOTION_MODE:[Ljava/lang/String;

    aget-object v3, v3, v2

    invoke-static {v3, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 88
    sget-object p1, Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;->SLOW_MOTION_MODE:[Ljava/lang/String;

    add-int/lit8 v2, v2, 0x1

    rem-int/2addr v2, v1

    aget-object p1, p1, v2

    return-object p1

    .line 86
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 91
    :cond_1
    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;->getDefaultValue(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public isSlowMotionFps120()Z
    .locals 2

    .line 77
    const-string v0, "slow_motion_120"

    const/16 v1, 0xac

    invoke-virtual {p0, v1}, Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;->getComponentValue(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isSlowMotionFps960()Z
    .locals 2

    .line 81
    const-string v0, "slow_motion_960"

    const/16 v1, 0xac

    invoke-virtual {p0, v1}, Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;->getComponentValue(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public setVideoNewSlowMotionFPS(Ljava/lang/String;)V
    .locals 1

    .line 73
    const/16 v0, 0xac

    invoke-virtual {p0, v0, p1}, Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;->setComponentValue(ILjava/lang/String;)V

    .line 74
    return-void
.end method
