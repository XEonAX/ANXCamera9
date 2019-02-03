.class public Landroid/support/v4/util/Pair;
.super Ljava/lang/Object;
.source "Pair.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<F:",
        "Ljava/lang/Object;",
        "S:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public final first:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TF;"
        }
    .end annotation
.end field

.field public final second:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TS;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TF;TS;)V"
        }
    .end annotation

    .line 34
    .local p0, "this":Landroid/support/v4/util/Pair;, "Landroid/support/v4/util/Pair<TF;TS;>;"
    .local p1, "first":Ljava/lang/Object;, "TF;"
    .local p2, "second":Ljava/lang/Object;, "TS;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-object p1, p0, Landroid/support/v4/util/Pair;->first:Ljava/lang/Object;

    .line 36
    iput-object p2, p0, Landroid/support/v4/util/Pair;->second:Ljava/lang/Object;

    .line 37
    return-void
.end method

.method public static create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/support/v4/util/Pair;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<A:",
            "Ljava/lang/Object;",
            "B:",
            "Ljava/lang/Object;",
            ">(TA;TB;)",
            "Landroid/support/v4/util/Pair<",
            "TA;TB;>;"
        }
    .end annotation

    .line 77
    .local p0, "a":Ljava/lang/Object;, "TA;"
    .local p1, "b":Ljava/lang/Object;, "TB;"
    new-instance v0, Landroid/support/v4/util/Pair;

    invoke-direct {v0, p0, p1}, Landroid/support/v4/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v0
.end method

.method private static objectsEqual(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 3
    .param p0, "a"    # Ljava/lang/Object;
    .param p1, "b"    # Ljava/lang/Object;

    .line 57
    if-eq p0, p1, :cond_d

    if-eqz p0, :cond_b

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    goto :goto_d

    :cond_b
    const/4 v0, 0x0

    goto :goto_e

    :cond_d
    :goto_d
    const/4 v0, 0x1

    :goto_e
    return v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "o"    # Ljava/lang/Object;

    .line 49
    .local p0, "this":Landroid/support/v4/util/Pair;, "Landroid/support/v4/util/Pair<TF;TS;>;"
    instance-of v0, p1, Landroid/support/v4/util/Pair;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    .line 50
    return v1

    .line 52
    :cond_6
    move-object v0, p1

    check-cast v0, Landroid/support/v4/util/Pair;

    .line 53
    .local v0, "p":Landroid/support/v4/util/Pair;, "Landroid/support/v4/util/Pair<**>;"
    iget-object v2, v0, Landroid/support/v4/util/Pair;->first:Ljava/lang/Object;

    iget-object v3, p0, Landroid/support/v4/util/Pair;->first:Ljava/lang/Object;

    invoke-static {v2, v3}, Landroid/support/v4/util/Pair;->objectsEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1f

    iget-object v2, v0, Landroid/support/v4/util/Pair;->second:Ljava/lang/Object;

    iget-object v3, p0, Landroid/support/v4/util/Pair;->second:Ljava/lang/Object;

    invoke-static {v2, v3}, Landroid/support/v4/util/Pair;->objectsEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1f

    const/4 v1, 0x1

    nop

    :cond_1f
    return v1
.end method

.method public hashCode()I
    .registers 4

    .line 67
    .local p0, "this":Landroid/support/v4/util/Pair;, "Landroid/support/v4/util/Pair<TF;TS;>;"
    iget-object v0, p0, Landroid/support/v4/util/Pair;->first:Ljava/lang/Object;

    const/4 v1, 0x0

    if-nez v0, :cond_7

    move v0, v1

    goto :goto_d

    :cond_7
    iget-object v0, p0, Landroid/support/v4/util/Pair;->first:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :goto_d
    iget-object v2, p0, Landroid/support/v4/util/Pair;->second:Ljava/lang/Object;

    if-nez v2, :cond_12

    goto :goto_18

    :cond_12
    iget-object v1, p0, Landroid/support/v4/util/Pair;->second:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :goto_18
    xor-int/2addr v0, v1

    return v0
.end method
