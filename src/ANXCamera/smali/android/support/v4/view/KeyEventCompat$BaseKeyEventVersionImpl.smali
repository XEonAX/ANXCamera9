.class Landroid/support/v4/view/KeyEventCompat$BaseKeyEventVersionImpl;
.super Ljava/lang/Object;
.source "KeyEventCompat.java"

# interfaces
.implements Landroid/support/v4/view/KeyEventCompat$KeyEventVersionImpl;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/view/KeyEventCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "BaseKeyEventVersionImpl"
.end annotation


# static fields
.field private static final META_ALL_MASK:I = 0xf7

.field private static final META_MODIFIER_MASK:I = 0xf7


# direct methods
.method constructor <init>()V
    .registers 1

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static metaStateFilterDirectionalModifiers(IIIII)I
    .registers 10
    .param p0, "metaState"    # I
    .param p1, "modifiers"    # I
    .param p2, "basic"    # I
    .param p3, "left"    # I
    .param p4, "right"    # I

    .line 55
    and-int v0, p1, p2

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_8

    move v0, v2

    goto :goto_9

    :cond_8
    move v0, v1

    .line 56
    .local v0, "wantBasic":Z
    :goto_9
    or-int v3, p3, p4

    .line 57
    .local v3, "directional":I
    and-int v4, p1, v3

    if-eqz v4, :cond_11

    move v1, v2

    nop

    .line 59
    .local v1, "wantLeftOrRight":Z
    :cond_11
    if-eqz v0, :cond_20

    .line 60
    if-nez v1, :cond_18

    .line 63
    not-int v2, v3

    and-int/2addr v2, p0

    return v2

    .line 61
    :cond_18
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v4, "bad arguments"

    invoke-direct {v2, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 64
    :cond_20
    if-eqz v1, :cond_25

    .line 65
    not-int v2, p2

    and-int/2addr v2, p0

    return v2

    .line 67
    :cond_25
    return p0
.end method


# virtual methods
.method public dispatch(Landroid/view/KeyEvent;Landroid/view/KeyEvent$Callback;Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 6
    .param p1, "event"    # Landroid/view/KeyEvent;
    .param p2, "receiver"    # Landroid/view/KeyEvent$Callback;
    .param p3, "state"    # Ljava/lang/Object;
    .param p4, "target"    # Ljava/lang/Object;

    .line 114
    invoke-virtual {p1, p2}, Landroid/view/KeyEvent;->dispatch(Landroid/view/KeyEvent$Callback;)Z

    move-result v0

    return v0
.end method

.method public getKeyDispatcherState(Landroid/view/View;)Ljava/lang/Object;
    .registers 3
    .param p1, "view"    # Landroid/view/View;

    .line 108
    const/4 v0, 0x0

    return-object v0
.end method

.method public isTracking(Landroid/view/KeyEvent;)Z
    .registers 3
    .param p1, "event"    # Landroid/view/KeyEvent;

    .line 103
    const/4 v0, 0x0

    return v0
.end method

.method public metaStateHasModifiers(II)Z
    .registers 7
    .param p1, "metaState"    # I
    .param p2, "modifiers"    # I

    .line 84
    invoke-virtual {p0, p1}, Landroid/support/v4/view/KeyEventCompat$BaseKeyEventVersionImpl;->normalizeMetaState(I)I

    move-result v0

    and-int/lit16 p1, v0, 0xf7

    .line 85
    const/4 v0, 0x1

    const/16 v1, 0x40

    const/16 v2, 0x80

    invoke-static {p1, p2, v0, v1, v2}, Landroid/support/v4/view/KeyEventCompat$BaseKeyEventVersionImpl;->metaStateFilterDirectionalModifiers(IIIII)I

    move-result p1

    .line 87
    const/4 v1, 0x2

    const/16 v2, 0x10

    const/16 v3, 0x20

    invoke-static {p1, p2, v1, v2, v3}, Landroid/support/v4/view/KeyEventCompat$BaseKeyEventVersionImpl;->metaStateFilterDirectionalModifiers(IIIII)I

    move-result p1

    .line 89
    if-ne p1, p2, :cond_1b

    goto :goto_1c

    :cond_1b
    const/4 v0, 0x0

    :goto_1c
    return v0
.end method

.method public metaStateHasNoModifiers(I)Z
    .registers 3
    .param p1, "metaState"    # I

    .line 94
    invoke-virtual {p0, p1}, Landroid/support/v4/view/KeyEventCompat$BaseKeyEventVersionImpl;->normalizeMetaState(I)I

    move-result v0

    and-int/lit16 v0, v0, 0xf7

    if-nez v0, :cond_a

    const/4 v0, 0x1

    goto :goto_b

    :cond_a
    const/4 v0, 0x0

    :goto_b
    return v0
.end method

.method public normalizeMetaState(I)I
    .registers 3
    .param p1, "metaState"    # I

    .line 73
    and-int/lit16 v0, p1, 0xc0

    if-eqz v0, :cond_6

    .line 74
    or-int/lit8 p1, p1, 0x1

    .line 76
    :cond_6
    and-int/lit8 v0, p1, 0x30

    if-eqz v0, :cond_c

    .line 77
    or-int/lit8 p1, p1, 0x2

    .line 79
    :cond_c
    and-int/lit16 v0, p1, 0xf7

    return v0
.end method

.method public startTracking(Landroid/view/KeyEvent;)V
    .registers 2
    .param p1, "event"    # Landroid/view/KeyEvent;

    .line 99
    return-void
.end method
