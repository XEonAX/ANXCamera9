.class public Lcom/mi/config/b;
.super Ljava/lang/Object;
.source "Device.java"


# static fields
.field public static final IS_HONGMI:Z

.field public static final IS_MI2A:Z

.field public static final IS_XIAOMI:Z

.field public static final pE:Ljava/lang/String;

.field public static final pF:Ljava/lang/String; = "qcom"

.field public static final pG:Ljava/lang/String; = "mediatek"

.field public static final pH:Ljava/lang/String; = "leadcore"

.field public static final pI:Ljava/lang/String; = "nvidia"

.field public static final pJ:Ljava/lang/String; = "intel"

.field private static final pK:I = 0x64

.field public static final pL:Ljava/lang/String;

.field public static final pM:Z

.field public static final pN:Z

.field public static final pO:Z

.field public static final pP:Z

.field public static final pQ:Z

.field public static final pR:Z

.field public static final pS:Z

.field public static final pT:Z

.field public static final pU:Z

.field public static final pV:Z

.field public static final pW:Z

.field public static final pX:Z

.field public static final pY:Z

.field public static final pZ:Z

.field public static final qA:Z

.field public static final qB:Z

.field public static final qC:Z

.field public static final qD:Z

.field public static final qE:Z

.field public static final qF:Z

.field public static final qG:Z

.field public static final qH:Z

.field public static final qI:Z

.field public static final qJ:Z

.field public static final qK:Z

.field public static final qL:Z

.field public static final qM:Z

.field public static final qN:Z

.field public static final qO:Z

.field public static final qP:Z

.field public static final qQ:Z

.field public static final qR:Z

.field public static final qS:Z

.field public static final qT:Z

.field public static final qU:Z

.field public static final qV:Z

.field public static final qW:Z

.field public static final qX:Z

.field public static final qY:Z

.field public static final qZ:Z

.field public static final qa:Z

.field public static final qb:Z

.field public static final qc:Z

.field public static final qe:Z

.field public static final qf:Z

.field public static final qg:Z

.field public static final qh:Z

.field public static final qi:Z

.field public static final qj:Z

.field public static final qk:Z

.field public static final ql:Z

.field public static final qm:Z

.field public static final qn:Z

.field public static final qo:Z

.field public static final qp:Z

.field public static final qq:Z

.field public static final qr:Z

.field public static final qt:Z

.field public static final qu:Z

.field public static final qv:Z

.field public static final qw:Z

.field public static final qx:Z

.field public static final qy:Z

.field public static final qz:Z

.field private static final ra:I = 0x1

.field private static final rb:I = 0x2

.field private static final rc:I = 0x4

.field private static final rd:I = 0x8

.field private static re:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 20
    sget-object v0, Lmiui/os/Build;->DEVICE:Ljava/lang/String;

    sput-object v0, Lcom/mi/config/b;->pE:Ljava/lang/String;

    .line 28
    sget-object v0, Lmiui/os/Build;->MODEL:Ljava/lang/String;

    sput-object v0, Lcom/mi/config/b;->pL:Ljava/lang/String;

    .line 29
    sget-boolean v0, Lmiui/os/Build;->IS_MITWO:Z

    sput-boolean v0, Lcom/mi/config/b;->pM:Z

    .line 30
    sget-boolean v0, Lmiui/os/Build;->IS_MI2A:Z

    sput-boolean v0, Lcom/mi/config/b;->IS_MI2A:Z

    .line 31
    const-string v0, "pisces"

    sget-object v1, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->pN:Z

    .line 32
    const-string v0, "cancro"

    sget-object v1, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    sget-object v0, Lmiui/os/Build;->MODEL:Ljava/lang/String;

    const-string v3, "MI 3"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    sput-boolean v0, Lcom/mi/config/b;->pO:Z

    .line 33
    sget-boolean v0, Lcom/mi/config/b;->pO:Z

    if-nez v0, :cond_2

    sget-boolean v0, Lcom/mi/config/b;->pN:Z

    if-eqz v0, :cond_1

    goto :goto_1

    :cond_1
    move v0, v2

    goto :goto_2

    :cond_2
    :goto_1
    move v0, v1

    :goto_2
    sput-boolean v0, Lcom/mi/config/b;->pP:Z

    .line 34
    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWO:Z

    if-eqz v0, :cond_3

    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWO_A:Z

    if-nez v0, :cond_3

    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWO_S:Z

    if-nez v0, :cond_3

    move v0, v1

    goto :goto_3

    :cond_3
    move v0, v2

    :goto_3
    sput-boolean v0, Lcom/mi/config/b;->pQ:Z

    .line 35
    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWO_S:Z

    sput-boolean v0, Lcom/mi/config/b;->pR:Z

    .line 36
    sget-boolean v0, Lcom/mi/config/b;->pQ:Z

    if-nez v0, :cond_5

    sget-boolean v0, Lcom/mi/config/b;->pR:Z

    if-eqz v0, :cond_4

    goto :goto_4

    :cond_4
    move v0, v2

    goto :goto_5

    :cond_5
    :goto_4
    move v0, v1

    :goto_5
    sput-boolean v0, Lcom/mi/config/b;->pS:Z

    .line 37
    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWOS_LTE_MTK:Z

    sput-boolean v0, Lcom/mi/config/b;->pT:Z

    .line 38
    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWO_A:Z

    sput-boolean v0, Lcom/mi/config/b;->pU:Z

    .line 39
    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_THREE:Z

    sput-boolean v0, Lcom/mi/config/b;->pV:Z

    .line 40
    const-string v0, "gucci"

    sget-object v3, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->pW:Z

    .line 41
    const-string v0, "hermes"

    sget-object v3, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->pX:Z

    .line 42
    const-string v0, "hennessy"

    sget-object v3, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->pY:Z

    .line 43
    const-string v0, "dior"

    sget-object v3, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->pZ:Z

    .line 44
    const-string v0, "kenzo"

    sget-object v3, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qa:Z

    .line 45
    const-string v0, "kate"

    sget-object v3, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qb:Z

    .line 46
    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWOX:Z

    if-nez v0, :cond_7

    const-string v0, "HM2014816"

    sget-object v3, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    goto :goto_6

    :cond_6
    move v1, v2

    nop

    :cond_7
    :goto_6
    sput-boolean v1, Lcom/mi/config/b;->qc:Z

    .line 47
    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWOX_LC:Z

    sput-boolean v0, Lcom/mi/config/b;->qe:Z

    .line 48
    sget-boolean v0, Lmiui/os/Build;->IS_MIFOUR:Z

    sput-boolean v0, Lcom/mi/config/b;->qf:Z

    .line 49
    sget-boolean v0, Lmiui/os/Build;->IS_MIPAD:Z

    sput-boolean v0, Lcom/mi/config/b;->qg:Z

    .line 50
    sget-boolean v0, Lmiui/os/Build;->IS_MIFIVE:Z

    sput-boolean v0, Lcom/mi/config/b;->qh:Z

    .line 51
    const-string v0, "leo"

    sget-object v1, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qi:Z

    .line 52
    const-string v0, "ferrari"

    sget-object v1, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qj:Z

    .line 53
    const-string v0, "ido"

    sget-object v1, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qk:Z

    .line 54
    const-string v0, "aqua"

    sget-object v1, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->ql:Z

    .line 55
    const-string v0, "gemini"

    sget-object v1, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qm:Z

    .line 56
    const-string v0, "gold"

    sget-object v1, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qn:Z

    .line 57
    const-string v0, "capricorn"

    sget-object v1, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qo:Z

    .line 58
    const-string v0, "natrium"

    sget-object v1, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qp:Z

    .line 59
    const-string v0, "lithium"

    sget-object v1, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qq:Z

    .line 60
    const-string v0, "scorpio"

    sget-object v1, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qr:Z

    .line 61
    const-string v0, "libra"

    sget-object v1, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qt:Z

    .line 62
    const-string v0, "land"

    sget-object v1, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qu:Z

    .line 63
    const-string v0, "hydrogen"

    sget-object v1, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qv:Z

    .line 64
    const-string v0, "helium"

    sget-object v1, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qw:Z

    .line 65
    const-string v0, "omega"

    sget-object v1, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qx:Z

    .line 66
    sget-object v0, Lcom/mi/config/b;->pE:Ljava/lang/String;

    const-string v1, "nike"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qy:Z

    .line 67
    sget-object v0, Lcom/mi/config/b;->pE:Ljava/lang/String;

    const-string v1, "mark"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qz:Z

    .line 68
    sget-object v0, Lcom/mi/config/b;->pE:Ljava/lang/String;

    const-string v1, "prada"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qA:Z

    .line 69
    sget-object v0, Lcom/mi/config/b;->pE:Ljava/lang/String;

    const-string v1, "mido"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qB:Z

    .line 70
    const-string v0, "rolex"

    sget-object v1, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qC:Z

    .line 71
    const-string v0, "sagit"

    sget-object v1, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qD:Z

    .line 72
    const-string v0, "centaur"

    sget-object v1, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qE:Z

    .line 73
    const-string v0, "achilles"

    sget-object v1, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qF:Z

    .line 74
    const-string v0, "jason"

    sget-object v1, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qG:Z

    .line 75
    const-string v0, "tiffany"

    sget-object v1, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qH:Z

    .line 76
    const-string v0, "ulysse"

    sget-object v1, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qI:Z

    .line 77
    const-string v0, "oxygen"

    sget-object v1, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qJ:Z

    .line 78
    const-string v0, "chiron"

    sget-object v1, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qK:Z

    .line 79
    const-string v0, "ugg"

    sget-object v1, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qL:Z

    .line 80
    const-string v0, "vince"

    sget-object v1, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qM:Z

    .line 81
    const-string v0, "whyred"

    sget-object v1, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qN:Z

    .line 82
    const-string v0, "beryllium"

    sget-object v1, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qO:Z

    .line 83
    const-string v0, "violet"

    sget-object v1, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qP:Z

    .line 84
    const-string v0, "pisces"

    sget-object v1, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qQ:Z

    .line 85
    const-string v0, "is_hongmi"

    invoke-static {v0, v2}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->IS_HONGMI:Z

    .line 86
    const-string v0, "is_xiaomi"

    invoke-static {v0, v2}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->IS_XIAOMI:Z

    .line 87
    const-string v0, "hammerhead"

    sget-object v1, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qR:Z

    .line 88
    const-string v0, "santoni"

    sget-object v1, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qS:Z

    .line 89
    const-string v0, "polaris"

    sget-object v1, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qT:Z

    .line 90
    const-string v0, "sirius"

    sget-object v1, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qU:Z

    .line 91
    const-string v0, "dipper"

    sget-object v1, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qV:Z

    .line 92
    const-string v0, "ursa"

    sget-object v1, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qW:Z

    .line 93
    const-string v0, "equuleus"

    sget-object v1, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qX:Z

    .line 95
    sget-boolean v0, Lmiui/os/Build;->IS_STABLE_VERSION:Z

    sput-boolean v0, Lcom/mi/config/b;->qY:Z

    .line 96
    sget-boolean v0, Lmiui/os/Build;->IS_CM_CUSTOMIZATION_TEST:Z

    sput-boolean v0, Lcom/mi/config/b;->qZ:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static fR()Z
    .locals 1

    .line 628
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fR()Z

    move-result v0

    return v0
.end method

.method public static fY()Z
    .locals 2

    .line 109
    invoke-static {}, Lcom/mi/config/b;->hY()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 110
    return v1

    .line 112
    :cond_0
    const-string v0, "support_camera_movie_solid"

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static fZ()Z
    .locals 2

    .line 116
    const-string v0, "is_camera_use_still_effect_image"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public static fx()Z
    .locals 1

    .line 624
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fx()Z

    move-result v0

    return v0
.end method

.method public static gA()Z
    .locals 2

    .line 236
    const-string v0, "support_camera_ubifocus"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static gB()Z
    .locals 3

    .line 240
    const-string v0, "camera_supported_asd"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getInteger(Ljava/lang/String;I)I

    move-result v0

    .line 241
    const/4 v2, 0x1

    and-int/2addr v0, v2

    if-eqz v0, :cond_0

    move v1, v2

    nop

    :cond_0
    return v1
.end method

.method public static gC()Z
    .locals 2

    .line 245
    const-string v0, "camera_supported_asd"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getInteger(Ljava/lang/String;I)I

    move-result v0

    .line 246
    and-int/lit8 v0, v0, 0xf

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    nop

    :cond_0
    return v1
.end method

.method public static gD()Z
    .locals 2

    .line 250
    const-string v0, "camera_supported_asd"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getInteger(Ljava/lang/String;I)I

    move-result v0

    .line 251
    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    nop

    :cond_0
    return v1
.end method

.method public static gE()Z
    .locals 1

    .line 255
    invoke-static {}, Lcom/mi/config/b;->gF()Z

    move-result v0

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->IS_HONGMI:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static gF()Z
    .locals 2

    .line 259
    const-string v0, "camera_supported_ai_scene"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static gG()Z
    .locals 2

    .line 263
    const-string v0, "camera_supported_asd"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getInteger(Ljava/lang/String;I)I

    move-result v0

    .line 264
    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    nop

    :cond_0
    return v1
.end method

.method public static gH()Z
    .locals 2

    .line 268
    const-string v0, "is_support_tele_asd_night"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 269
    invoke-static {}, Lcom/mi/config/b;->gI()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    nop

    .line 268
    :cond_0
    return v1
.end method

.method public static gI()Z
    .locals 1

    .line 275
    const/4 v0, 0x0

    return v0
.end method

.method public static gJ()Z
    .locals 2

    .line 279
    const-string v0, "support_camera_manual_function"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static gK()Z
    .locals 2

    .line 283
    const-string v0, "support_camera_audio_focus"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static gL()Z
    .locals 2

    .line 291
    sget-boolean v0, Lcom/mi/config/b;->pU:Z

    const/4 v1, 0x1

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->qe:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWOX:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->pO:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->pV:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->pQ:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->pR:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->pT:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->pM:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->IS_MI2A:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->pP:Z

    if-nez v0, :cond_0

    const-string v0, "is_front_video_quality_1080p"

    .line 293
    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 291
    :goto_0
    return v1
.end method

.method public static gM()Z
    .locals 1

    .line 298
    const/4 v0, 0x0

    return v0
.end method

.method public static gN()Z
    .locals 2

    .line 302
    const-string v0, "support_camera_torch_capture"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static gO()Z
    .locals 2

    .line 308
    invoke-static {}, Lcom/mi/config/b;->gq()Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x15

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-gt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static gP()Z
    .locals 2

    .line 312
    const-string v0, "is_camera_freeze_after_hdr_capture"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static gQ()Z
    .locals 2

    .line 316
    const-string v0, "is_camera_face_detection_need_orientation"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static gR()Z
    .locals 1

    .line 320
    sget-boolean v0, Lcom/mi/config/b;->IS_XIAOMI:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->IS_HONGMI:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static gS()Z
    .locals 2

    .line 324
    const-string v0, "is_capture_stop_face_detection"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static gT()Z
    .locals 2

    .line 328
    const-string v0, "is_camera_hold_blur_background"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static gU()Z
    .locals 2

    .line 332
    const-string v0, "support_camera_peaking_mf"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static gV()Z
    .locals 2

    .line 336
    sget-boolean v0, Lcom/mi/config/b;->pU:Z

    const/4 v1, 0x1

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->qe:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWOX:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->pO:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->pV:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->pQ:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->pR:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->pT:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->pM:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->IS_MI2A:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->pP:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->qf:Z

    if-nez v0, :cond_0

    const-string v0, "is_video_snapshot_size_limit"

    .line 338
    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 336
    :goto_0
    return v1
.end method

.method public static gW()Z
    .locals 2

    .line 342
    const-string v0, "is_surface_size_limit"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static gX()Z
    .locals 1

    .line 347
    sget-boolean v0, Lcom/mi/config/b;->pM:Z

    if-eqz v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->IS_MI2A:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static gY()Z
    .locals 2

    .line 351
    const-string v0, "support_camera_gradienter"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static gZ()I
    .locals 2

    .line 355
    const-string v0, "camera_hibernation_timeout_in_minutes"

    sget v1, Lcom/android/camera/AutoLockManager;->HIBERNATION_TIMEOUT:I

    invoke-static {v0, v1}, Lcom/mi/config/d;->getInteger(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static ga()Z
    .locals 2

    .line 120
    sget-boolean v0, Lcom/mi/config/b;->qe:Z

    const/4 v1, 0x0

    if-nez v0, :cond_1

    const-string v0, "is_need_force_recycle_effect"

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    goto :goto_1

    :cond_1
    :goto_0
    const/4 v1, 0x1

    :goto_1
    return v1
.end method

.method public static gb()Z
    .locals 2

    .line 124
    const-string v0, "support_camera_shader_effect"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static gd()Z
    .locals 1

    .line 130
    invoke-static {}, Lcom/mi/config/b;->ge()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public static ge()Z
    .locals 2

    .line 135
    sget-boolean v0, Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z

    if-eqz v0, :cond_1

    .line 136
    const-string v0, "ro.miui.region"

    invoke-static {v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 137
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 138
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v0

    const-string v1, "KR"

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    return v0

    .line 140
    :cond_0
    const-string v1, "KR"

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    return v0

    .line 142
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public static getBurstShootCount()I
    .locals 2

    .line 105
    const-string v0, "burst_shoot_count"

    const/16 v1, 0x64

    invoke-static {v0, v1}, Lcom/mi/config/d;->getInteger(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static getGivenName()Ljava/lang/String;
    .locals 3

    .line 649
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    const-string v1, "c_0x18"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 651
    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v2, "Explorer"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    .line 654
    const-string v0, "_a"

    return-object v0

    .line 659
    :cond_0
    const-string v0, ""

    return-object v0
.end method

.method public static gf()Z
    .locals 2

    .line 147
    const-string v0, "support_camera_burst_shoot"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static gg()Z
    .locals 2

    .line 151
    const-string v0, "support_camera_skin_beauty"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static gh()Z
    .locals 2

    .line 155
    sget-boolean v0, Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string v0, "support_camera_age_detection"

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    nop

    :cond_0
    return v1
.end method

.method public static gi()Z
    .locals 2

    .line 159
    const-string v0, "support_camera_record_location"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static gj()Z
    .locals 2

    .line 164
    const-string v0, "is_18x9_ratio_screen"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static gk()Z
    .locals 2

    .line 168
    const-string v0, "support_camera_water_mark"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static gl()Z
    .locals 2

    .line 172
    const-string v0, "support_camera_new_style_time_water_mark"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static gm()Z
    .locals 2

    .line 176
    const-string v0, "support_camera_face_info_water_mark"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static gn()Z
    .locals 2

    .line 180
    const-string v0, "support_camera_video_pause"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static go()Z
    .locals 2

    .line 184
    sget-boolean v0, Lcom/mi/config/b;->qZ:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string v0, "support_camera_boost_brightness"

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    nop

    :cond_0
    return v1
.end method

.method public static gp()Z
    .locals 2

    .line 188
    const-string v0, "is_lower_size_effect"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static gq()Z
    .locals 2

    .line 192
    const-string v0, "qcom"

    const-string v1, "vendor"

    invoke-static {v1}, Lcom/mi/config/d;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static gr()Z
    .locals 2

    .line 196
    const-string v0, "nvidia"

    const-string v1, "vendor"

    invoke-static {v1}, Lcom/mi/config/d;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static gs()Z
    .locals 2

    .line 200
    const-string v0, "leadcore"

    const-string v1, "vendor"

    invoke-static {v1}, Lcom/mi/config/d;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static gt()Z
    .locals 2

    .line 208
    const-string v0, "support_dual_sd_card"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static gu()Z
    .locals 1

    .line 212
    const/4 v0, 0x0

    return v0
.end method

.method public static gv()Z
    .locals 2

    .line 216
    const-string v0, "support_camera_aohdr"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static gw()Z
    .locals 2

    .line 220
    const-string v0, "support_camera_hfr"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static gx()Z
    .locals 2

    .line 224
    const-string v0, "support_chroma_flash"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static gy()Z
    .locals 2

    .line 228
    const-string v0, "support_object_track"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static gz()Z
    .locals 2

    .line 232
    const-string v0, "support_camera_4k_quality"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hA()Z
    .locals 2

    .line 492
    const-string v0, "is_support_fhd_fhr"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hB()Z
    .locals 2

    .line 496
    sget-boolean v0, Lcom/mi/config/b;->qN:Z

    if-eqz v0, :cond_0

    .line 497
    const-string v0, "ro.boot.hwc"

    invoke-static {v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 499
    const-string v1, "India"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0

    .line 501
    :cond_0
    const-string v0, "is_front_remosic_sensor"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hC()Z
    .locals 1

    .line 505
    sget-boolean v0, Lcom/mi/config/b;->qq:Z

    if-nez v0, :cond_1

    sget-boolean v0, Lcom/mi/config/b;->qK:Z

    if-nez v0, :cond_1

    sget-boolean v0, Lcom/mi/config/b;->qT:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public static hD()Z
    .locals 2

    .line 509
    const-string v0, "support_psensor_pocket_mode"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hE()Z
    .locals 2

    .line 514
    const-string v0, "is_rgb888_egl_prefer"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hF()Z
    .locals 2

    .line 518
    const-string v0, "support_front_flash"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hG()Z
    .locals 2

    .line 522
    const-string v0, "is_legacy_face_beauty"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hH()Z
    .locals 2

    .line 526
    invoke-static {}, Lcom/mi/config/b;->hF()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    const-string v0, "support_video_front_flash"

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method private static hI()Z
    .locals 2

    .line 543
    const-string v0, "ro.hardware.fp.fod"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method private static hJ()Z
    .locals 2

    .line 550
    const-string v0, "front_fingerprint_sensor"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_1

    .line 551
    invoke-static {}, Lcom/mi/config/b;->hI()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    goto :goto_1

    :cond_1
    :goto_0
    const/4 v1, 0x1

    .line 550
    :goto_1
    return v1
.end method

.method public static hK()Z
    .locals 2

    .line 555
    invoke-static {}, Lcom/mi/config/b;->hJ()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 556
    return v1

    .line 559
    :cond_0
    invoke-static {}, Lcom/mi/config/b;->hv()Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/mi/config/b;->hv()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 560
    const/4 v0, 0x1

    return v0

    .line 563
    :cond_1
    return v1
.end method

.method public static hL()Z
    .locals 2

    .line 567
    const-string v0, "support_screen_light"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hM()Z
    .locals 2

    .line 571
    const-string v0, "support_camera_dynamic_light_spot"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hN()Z
    .locals 2

    .line 575
    const-string v0, "support_front_beauty_mfnr"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hO()Z
    .locals 2

    .line 579
    const-string v0, "support_video_hfr_mode"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hP()Z
    .locals 2

    .line 583
    const-string v0, "support_3d_face_beauty"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hQ()Z
    .locals 2

    .line 587
    const-string v0, "support_mi_face_beauty"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hR()Z
    .locals 1

    .line 591
    invoke-static {}, Lcom/mi/config/b;->hP()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lcom/mi/config/b;->hQ()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public static hS()Z
    .locals 2

    .line 596
    const-string v0, "use_legacy_normal_filter"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hT()Z
    .locals 2

    .line 600
    const-string v0, "enable_algorithm_in_file_suffix"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hU()Z
    .locals 2

    .line 608
    const-string v0, "support_realtime_manual_exposure_time"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hV()Z
    .locals 2

    .line 612
    const-string v0, "support_picture_watermark"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hW()Z
    .locals 1

    .line 616
    sget-boolean v0, Lcom/mi/config/b;->qV:Z

    if-nez v0, :cond_1

    sget-boolean v0, Lcom/mi/config/b;->qT:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public static hX()Z
    .locals 2

    .line 620
    const-string v0, "sensor_has_latency"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hY()Z
    .locals 3

    .line 632
    const-string v0, "onc"

    sget-object v1, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 633
    const-string v0, "ro.boot.hwversion"

    invoke-static {v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 634
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 636
    const/16 v2, 0x32

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-ne v2, v0, :cond_0

    const/4 v1, 0x1

    nop

    :cond_0
    return v1

    .line 639
    :cond_1
    return v1
.end method

.method public static ha()Z
    .locals 2

    .line 360
    const-string v0, "is_camera_lower_qrscan_frequency"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hb()Z
    .locals 2

    .line 364
    const-string v0, "is_camera_preview_with_subthread_looper"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hc()Z
    .locals 1

    .line 368
    const/4 v0, 0x0

    return v0
.end method

.method public static hd()Z
    .locals 2

    .line 372
    const-string v0, "is_camera_app_water_mark"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static he()Z
    .locals 2

    .line 376
    const-string v0, "support_edge_handgrip"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hf()Z
    .locals 2

    .line 380
    const-string v0, "support_camera_tilt_shift"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hg()Z
    .locals 2

    .line 384
    sget-boolean v0, Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string v0, "support_camera_quick_snap"

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    nop

    :cond_0
    return v1
.end method

.method public static hh()Ljava/lang/String;
    .locals 1

    .line 392
    const-string v0, "camera_continuous_shot_callback_class"

    invoke-static {v0}, Lcom/mi/config/d;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static hi()Ljava/lang/String;
    .locals 1

    .line 396
    const-string v0, "camera_continuous_shot_callback_setter"

    invoke-static {v0}, Lcom/mi/config/d;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static hj()Z
    .locals 2

    .line 400
    const-string v0, "is_hal_does_caf_when_flash_on"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hk()Z
    .locals 2

    .line 404
    sget-boolean v0, Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string v0, "support_camera_magic_mirror"

    .line 405
    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    nop

    .line 404
    :cond_0
    return v1
.end method

.method public static hl()Z
    .locals 1

    .line 409
    sget-boolean v0, Lcom/mi/config/b;->qa:Z

    if-eqz v0, :cond_0

    sget-boolean v0, Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z

    if-nez v0, :cond_1

    :cond_0
    sget-boolean v0, Lcom/mi/config/b;->qu:Z

    if-eqz v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static hm()Z
    .locals 1

    .line 413
    const/4 v0, 0x1

    return v0
.end method

.method public static hn()Z
    .locals 2

    .line 417
    const-string v0, "support_camera_square_mode"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static ho()Z
    .locals 2

    .line 422
    sget-boolean v0, Lcom/mi/config/b;->pO:Z

    const/4 v1, 0x1

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->qf:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWOX:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->pU:Z

    if-nez v0, :cond_0

    const-string v0, "is_new_hdr_param_key_used"

    .line 423
    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 422
    :goto_0
    return v1
.end method

.method public static hp()Z
    .locals 2

    .line 427
    const-string v0, "support_full_size_panorama"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public static hq()Z
    .locals 2

    .line 431
    const-string v0, "is_hrf_video_capture_support"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    .line 432
    invoke-static {}, Lcom/mi/config/b;->isMTKPlatform()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v1, 0x1

    nop

    .line 431
    :cond_0
    return v1
.end method

.method public static hr()Z
    .locals 2

    .line 436
    const-string v0, "support_hfr_video_pause"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hs()Z
    .locals 2

    .line 440
    const-string v0, "is_support_stereo"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static ht()Z
    .locals 2

    .line 452
    const-string v0, "camera_is_support_portrait_front"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hu()Z
    .locals 1

    .line 456
    const/4 v0, 0x0

    return v0
.end method

.method public static hv()Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 460
    sget-object v0, Lcom/mi/config/b;->re:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 461
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/mi/config/b;->re:Ljava/util/ArrayList;

    .line 462
    const-string v0, "fp_nav_event_name_list"

    invoke-static {v0}, Lcom/mi/config/d;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 463
    if-eqz v0, :cond_0

    .line 464
    sget-object v1, Lcom/mi/config/b;->re:Ljava/util/ArrayList;

    invoke-static {v1, v0}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 467
    :cond_0
    sget-object v0, Lcom/mi/config/b;->re:Ljava/util/ArrayList;

    return-object v0
.end method

.method public static hw()Z
    .locals 2

    .line 471
    const-string v0, "is_full_size_effect"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hx()Z
    .locals 2

    .line 475
    const-string v0, "support_camera_burst_shoot_denoise"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hy()Z
    .locals 2

    .line 479
    const-string v0, "support_camera_groupshot"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hz()Z
    .locals 2

    .line 488
    const-string v0, "is_camera_isp_rotated"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isMTKPlatform()Z
    .locals 2

    .line 204
    const-string v0, "mediatek"

    const-string v1, "vendor"

    invoke-static {v1}, Lcom/mi/config/d;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static isPad()Z
    .locals 2

    .line 388
    const-string v0, "is_pad"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isSupportSuperResolution()Z
    .locals 2

    .line 604
    const-string v0, "support_super_resolution"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isSupportedOpticalZoom()Z
    .locals 2

    .line 444
    const-string v0, "is_support_optical_zoom"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isSupportedPortrait()Z
    .locals 2

    .line 448
    const-string v0, "is_support_portrait"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method
