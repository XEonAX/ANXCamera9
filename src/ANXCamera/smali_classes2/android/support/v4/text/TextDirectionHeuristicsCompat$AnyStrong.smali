.class Landroid/support/v4/text/TextDirectionHeuristicsCompat$AnyStrong;
.super Ljava/lang/Object;
.source "TextDirectionHeuristicsCompat.java"

# interfaces
.implements Landroid/support/v4/text/TextDirectionHeuristicsCompat$TextDirectionAlgorithm;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/text/TextDirectionHeuristicsCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AnyStrong"
.end annotation


# static fields
.field public static final INSTANCE_LTR:Landroid/support/v4/text/TextDirectionHeuristicsCompat$AnyStrong;

.field public static final INSTANCE_RTL:Landroid/support/v4/text/TextDirectionHeuristicsCompat$AnyStrong;


# instance fields
.field private final mLookForRtl:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 235
    new-instance v0, Landroid/support/v4/text/TextDirectionHeuristicsCompat$AnyStrong;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/support/v4/text/TextDirectionHeuristicsCompat$AnyStrong;-><init>(Z)V

    sput-object v0, Landroid/support/v4/text/TextDirectionHeuristicsCompat$AnyStrong;->INSTANCE_RTL:Landroid/support/v4/text/TextDirectionHeuristicsCompat$AnyStrong;

    .line 236
    new-instance v0, Landroid/support/v4/text/TextDirectionHeuristicsCompat$AnyStrong;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroid/support/v4/text/TextDirectionHeuristicsCompat$AnyStrong;-><init>(Z)V

    sput-object v0, Landroid/support/v4/text/TextDirectionHeuristicsCompat$AnyStrong;->INSTANCE_LTR:Landroid/support/v4/text/TextDirectionHeuristicsCompat$AnyStrong;

    return-void
.end method

.method private constructor <init>(Z)V
    .registers 2
    .param p1, "lookForRtl"    # Z

    .line 231
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 232
    iput-boolean p1, p0, Landroid/support/v4/text/TextDirectionHeuristicsCompat$AnyStrong;->mLookForRtl:Z

    .line 233
    return-void
.end method


# virtual methods
.method public checkRtl(Ljava/lang/CharSequence;II)I
    .registers 8
    .param p1, "cs"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I

    .line 206
    const/4 v0, 0x0

    .line 207
    .local v0, "haveUnlookedFor":Z
    move v1, p2

    .local v1, "i":I
    add-int v2, p2, p3

    .local v2, "e":I
    :goto_4
    if-ge v1, v2, :cond_29

    .line 208
    invoke-interface {p1, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->getDirectionality(C)B

    move-result v3

    # invokes: Landroid/support/v4/text/TextDirectionHeuristicsCompat;->isRtlText(I)I
    invoke-static {v3}, Landroid/support/v4/text/TextDirectionHeuristicsCompat;->access$200(I)I

    move-result v3

    packed-switch v3, :pswitch_data_30

    goto :goto_26

    .line 216
    :pswitch_16
    iget-boolean v3, p0, Landroid/support/v4/text/TextDirectionHeuristicsCompat$AnyStrong;->mLookForRtl:Z

    if-nez v3, :cond_1c

    .line 217
    const/4 v3, 0x1

    return v3

    .line 219
    :cond_1c
    const/4 v0, 0x1

    .line 220
    goto :goto_26

    .line 210
    :pswitch_1e
    iget-boolean v3, p0, Landroid/support/v4/text/TextDirectionHeuristicsCompat$AnyStrong;->mLookForRtl:Z

    if-eqz v3, :cond_24

    .line 211
    const/4 v3, 0x0

    return v3

    .line 213
    :cond_24
    const/4 v0, 0x1

    .line 214
    nop

    .line 207
    :goto_26
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 225
    .end local v1    # "i":I
    .end local v2    # "e":I
    :cond_29
    if-eqz v0, :cond_2e

    .line 226
    iget-boolean v1, p0, Landroid/support/v4/text/TextDirectionHeuristicsCompat$AnyStrong;->mLookForRtl:Z

    return v1

    .line 228
    :cond_2e
    const/4 v1, 0x2

    return v1

    :pswitch_data_30
    .packed-switch 0x0
        :pswitch_1e
        :pswitch_16
    .end packed-switch
.end method
