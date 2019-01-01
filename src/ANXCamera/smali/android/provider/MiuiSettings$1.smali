.class synthetic Landroid/provider/MiuiSettings$1;
.super Ljava/lang/Object;
.source "MiuiSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/provider/MiuiSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$android$provider$MiuiSettings$System$SmallWindowType:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 2070
    invoke-static {}, Landroid/provider/MiuiSettings$System$SmallWindowType;->values()[Landroid/provider/MiuiSettings$System$SmallWindowType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Landroid/provider/MiuiSettings$1;->$SwitchMap$android$provider$MiuiSettings$System$SmallWindowType:[I

    :try_start_0
    sget-object v0, Landroid/provider/MiuiSettings$1;->$SwitchMap$android$provider$MiuiSettings$System$SmallWindowType:[I

    sget-object v1, Landroid/provider/MiuiSettings$System$SmallWindowType;->X7_STYLE:Landroid/provider/MiuiSettings$System$SmallWindowType;

    invoke-virtual {v1}, Landroid/provider/MiuiSettings$System$SmallWindowType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    :goto_0
    :try_start_1
    sget-object v0, Landroid/provider/MiuiSettings$1;->$SwitchMap$android$provider$MiuiSettings$System$SmallWindowType:[I

    sget-object v1, Landroid/provider/MiuiSettings$System$SmallWindowType;->A1_STYLE:Landroid/provider/MiuiSettings$System$SmallWindowType;

    invoke-virtual {v1}, Landroid/provider/MiuiSettings$System$SmallWindowType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception v0

    :goto_1
    :try_start_2
    sget-object v0, Landroid/provider/MiuiSettings$1;->$SwitchMap$android$provider$MiuiSettings$System$SmallWindowType:[I

    sget-object v1, Landroid/provider/MiuiSettings$System$SmallWindowType;->A7_LATTICE:Landroid/provider/MiuiSettings$System$SmallWindowType;

    invoke-virtual {v1}, Landroid/provider/MiuiSettings$System$SmallWindowType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_2

    :catch_2
    move-exception v0

    :goto_2
    :try_start_3
    sget-object v0, Landroid/provider/MiuiSettings$1;->$SwitchMap$android$provider$MiuiSettings$System$SmallWindowType:[I

    sget-object v1, Landroid/provider/MiuiSettings$System$SmallWindowType;->B7_FULL:Landroid/provider/MiuiSettings$System$SmallWindowType;

    invoke-virtual {v1}, Landroid/provider/MiuiSettings$System$SmallWindowType;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_3

    :catch_3
    move-exception v0

    :goto_3
    return-void
.end method
