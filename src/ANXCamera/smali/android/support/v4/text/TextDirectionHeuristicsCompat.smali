.class public Landroid/support/v4/text/TextDirectionHeuristicsCompat;
.super Ljava/lang/Object;
.source "TextDirectionHeuristicsCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/text/TextDirectionHeuristicsCompat$TextDirectionHeuristicLocale;,
        Landroid/support/v4/text/TextDirectionHeuristicsCompat$AnyStrong;,
        Landroid/support/v4/text/TextDirectionHeuristicsCompat$FirstStrong;,
        Landroid/support/v4/text/TextDirectionHeuristicsCompat$TextDirectionAlgorithm;,
        Landroid/support/v4/text/TextDirectionHeuristicsCompat$TextDirectionHeuristicInternal;,
        Landroid/support/v4/text/TextDirectionHeuristicsCompat$TextDirectionHeuristicImpl;
    }
.end annotation


# static fields
.field public static final ANYRTL_LTR:Landroid/support/v4/text/TextDirectionHeuristicCompat;

.field public static final FIRSTSTRONG_LTR:Landroid/support/v4/text/TextDirectionHeuristicCompat;

.field public static final FIRSTSTRONG_RTL:Landroid/support/v4/text/TextDirectionHeuristicCompat;

.field public static final LOCALE:Landroid/support/v4/text/TextDirectionHeuristicCompat;

.field public static final LTR:Landroid/support/v4/text/TextDirectionHeuristicCompat;

.field public static final RTL:Landroid/support/v4/text/TextDirectionHeuristicCompat;

.field private static final STATE_FALSE:I = 0x1

.field private static final STATE_TRUE:I = 0x0

.field private static final STATE_UNKNOWN:I = 0x2


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .line 33
    new-instance v0, Landroid/support/v4/text/TextDirectionHeuristicsCompat$TextDirectionHeuristicInternal;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {v0, v2, v1, v2}, Landroid/support/v4/text/TextDirectionHeuristicsCompat$TextDirectionHeuristicInternal;-><init>(Landroid/support/v4/text/TextDirectionHeuristicsCompat$TextDirectionAlgorithm;ZLandroid/support/v4/text/TextDirectionHeuristicsCompat$1;)V

    sput-object v0, Landroid/support/v4/text/TextDirectionHeuristicsCompat;->LTR:Landroid/support/v4/text/TextDirectionHeuristicCompat;

    .line 39
    new-instance v0, Landroid/support/v4/text/TextDirectionHeuristicsCompat$TextDirectionHeuristicInternal;

    const/4 v3, 0x1

    invoke-direct {v0, v2, v3, v2}, Landroid/support/v4/text/TextDirectionHeuristicsCompat$TextDirectionHeuristicInternal;-><init>(Landroid/support/v4/text/TextDirectionHeuristicsCompat$TextDirectionAlgorithm;ZLandroid/support/v4/text/TextDirectionHeuristicsCompat$1;)V

    sput-object v0, Landroid/support/v4/text/TextDirectionHeuristicsCompat;->RTL:Landroid/support/v4/text/TextDirectionHeuristicCompat;

    .line 47
    new-instance v0, Landroid/support/v4/text/TextDirectionHeuristicsCompat$TextDirectionHeuristicInternal;

    sget-object v4, Landroid/support/v4/text/TextDirectionHeuristicsCompat$FirstStrong;->INSTANCE:Landroid/support/v4/text/TextDirectionHeuristicsCompat$FirstStrong;

    invoke-direct {v0, v4, v1, v2}, Landroid/support/v4/text/TextDirectionHeuristicsCompat$TextDirectionHeuristicInternal;-><init>(Landroid/support/v4/text/TextDirectionHeuristicsCompat$TextDirectionAlgorithm;ZLandroid/support/v4/text/TextDirectionHeuristicsCompat$1;)V

    sput-object v0, Landroid/support/v4/text/TextDirectionHeuristicsCompat;->FIRSTSTRONG_LTR:Landroid/support/v4/text/TextDirectionHeuristicCompat;

    .line 55
    new-instance v0, Landroid/support/v4/text/TextDirectionHeuristicsCompat$TextDirectionHeuristicInternal;

    sget-object v4, Landroid/support/v4/text/TextDirectionHeuristicsCompat$FirstStrong;->INSTANCE:Landroid/support/v4/text/TextDirectionHeuristicsCompat$FirstStrong;

    invoke-direct {v0, v4, v3, v2}, Landroid/support/v4/text/TextDirectionHeuristicsCompat$TextDirectionHeuristicInternal;-><init>(Landroid/support/v4/text/TextDirectionHeuristicsCompat$TextDirectionAlgorithm;ZLandroid/support/v4/text/TextDirectionHeuristicsCompat$1;)V

    sput-object v0, Landroid/support/v4/text/TextDirectionHeuristicsCompat;->FIRSTSTRONG_RTL:Landroid/support/v4/text/TextDirectionHeuristicCompat;

    .line 62
    new-instance v0, Landroid/support/v4/text/TextDirectionHeuristicsCompat$TextDirectionHeuristicInternal;

    sget-object v3, Landroid/support/v4/text/TextDirectionHeuristicsCompat$AnyStrong;->INSTANCE_RTL:Landroid/support/v4/text/TextDirectionHeuristicsCompat$AnyStrong;

    invoke-direct {v0, v3, v1, v2}, Landroid/support/v4/text/TextDirectionHeuristicsCompat$TextDirectionHeuristicInternal;-><init>(Landroid/support/v4/text/TextDirectionHeuristicsCompat$TextDirectionAlgorithm;ZLandroid/support/v4/text/TextDirectionHeuristicsCompat$1;)V

    sput-object v0, Landroid/support/v4/text/TextDirectionHeuristicsCompat;->ANYRTL_LTR:Landroid/support/v4/text/TextDirectionHeuristicCompat;

    .line 68
    sget-object v0, Landroid/support/v4/text/TextDirectionHeuristicsCompat$TextDirectionHeuristicLocale;->INSTANCE:Landroid/support/v4/text/TextDirectionHeuristicsCompat$TextDirectionHeuristicLocale;

    sput-object v0, Landroid/support/v4/text/TextDirectionHeuristicsCompat;->LOCALE:Landroid/support/v4/text/TextDirectionHeuristicCompat;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 242
    return-void
.end method

.method static synthetic access$100(I)I
    .registers 2
    .param p0, "x0"    # I

    .line 28
    invoke-static {p0}, Landroid/support/v4/text/TextDirectionHeuristicsCompat;->isRtlTextOrFormat(I)I

    move-result v0

    return v0
.end method

.method static synthetic access$200(I)I
    .registers 2
    .param p0, "x0"    # I

    .line 28
    invoke-static {p0}, Landroid/support/v4/text/TextDirectionHeuristicsCompat;->isRtlText(I)I

    move-result v0

    return v0
.end method

.method private static isRtlText(I)I
    .registers 2
    .param p0, "directionality"    # I

    .line 79
    packed-switch p0, :pswitch_data_a

    .line 86
    const/4 v0, 0x2

    return v0

    .line 84
    :pswitch_5
    const/4 v0, 0x0

    return v0

    .line 81
    :pswitch_7
    const/4 v0, 0x1

    return v0

    nop

    :pswitch_data_a
    .packed-switch 0x0
        :pswitch_7
        :pswitch_5
        :pswitch_5
    .end packed-switch
.end method

.method private static isRtlTextOrFormat(I)I
    .registers 2
    .param p0, "directionality"    # I

    .line 91
    packed-switch p0, :pswitch_data_c

    packed-switch p0, :pswitch_data_16

    .line 102
    const/4 v0, 0x2

    return v0

    .line 100
    :pswitch_8
    const/4 v0, 0x0

    return v0

    .line 95
    :pswitch_a
    const/4 v0, 0x1

    return v0

    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_a
        :pswitch_8
        :pswitch_8
    .end packed-switch

    :pswitch_data_16
    .packed-switch 0xe
        :pswitch_a
        :pswitch_a
        :pswitch_8
        :pswitch_8
    .end packed-switch
.end method
