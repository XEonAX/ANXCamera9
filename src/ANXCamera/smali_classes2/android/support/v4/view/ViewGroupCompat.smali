.class public Landroid/support/v4/view/ViewGroupCompat;
.super Ljava/lang/Object;
.source "ViewGroupCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatLollipopImpl;,
        Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatJellybeanMR2Impl;,
        Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatIcsImpl;,
        Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatHCImpl;,
        Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatStubImpl;,
        Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatImpl;
    }
.end annotation


# static fields
.field static final IMPL:Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatImpl;

.field public static final LAYOUT_MODE_CLIP_BOUNDS:I = 0x0

.field public static final LAYOUT_MODE_OPTICAL_BOUNDS:I = 0x1


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 141
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 142
    .local v0, "version":I
    const/16 v1, 0x15

    if-lt v0, v1, :cond_e

    .line 143
    new-instance v1, Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatLollipopImpl;

    invoke-direct {v1}, Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatLollipopImpl;-><init>()V

    sput-object v1, Landroid/support/v4/view/ViewGroupCompat;->IMPL:Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatImpl;

    goto :goto_39

    .line 144
    :cond_e
    const/16 v1, 0x12

    if-lt v0, v1, :cond_1a

    .line 145
    new-instance v1, Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatJellybeanMR2Impl;

    invoke-direct {v1}, Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatJellybeanMR2Impl;-><init>()V

    sput-object v1, Landroid/support/v4/view/ViewGroupCompat;->IMPL:Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatImpl;

    goto :goto_39

    .line 146
    :cond_1a
    const/16 v1, 0xe

    if-lt v0, v1, :cond_26

    .line 147
    new-instance v1, Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatIcsImpl;

    invoke-direct {v1}, Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatIcsImpl;-><init>()V

    sput-object v1, Landroid/support/v4/view/ViewGroupCompat;->IMPL:Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatImpl;

    goto :goto_39

    .line 148
    :cond_26
    const/16 v1, 0xb

    if-lt v0, v1, :cond_32

    .line 149
    new-instance v1, Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatHCImpl;

    invoke-direct {v1}, Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatHCImpl;-><init>()V

    sput-object v1, Landroid/support/v4/view/ViewGroupCompat;->IMPL:Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatImpl;

    goto :goto_39

    .line 151
    :cond_32
    new-instance v1, Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatStubImpl;

    invoke-direct {v1}, Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatStubImpl;-><init>()V

    sput-object v1, Landroid/support/v4/view/ViewGroupCompat;->IMPL:Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatImpl;

    .line 153
    .end local v0    # "version":I
    :goto_39
    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 158
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 160
    return-void
.end method

.method public static getLayoutMode(Landroid/view/ViewGroup;)I
    .registers 2
    .param p0, "group"    # Landroid/view/ViewGroup;

    .line 215
    sget-object v0, Landroid/support/v4/view/ViewGroupCompat;->IMPL:Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatImpl;

    invoke-interface {v0, p0}, Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatImpl;->getLayoutMode(Landroid/view/ViewGroup;)I

    move-result v0

    return v0
.end method

.method public static getNestedScrollAxes(Landroid/view/ViewGroup;)I
    .registers 2
    .param p0, "group"    # Landroid/view/ViewGroup;

    .line 265
    sget-object v0, Landroid/support/v4/view/ViewGroupCompat;->IMPL:Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatImpl;

    invoke-interface {v0, p0}, Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatImpl;->getNestedScrollAxes(Landroid/view/ViewGroup;)I

    move-result v0

    return v0
.end method

.method public static isTransitionGroup(Landroid/view/ViewGroup;)Z
    .registers 2
    .param p0, "group"    # Landroid/view/ViewGroup;

    .line 249
    sget-object v0, Landroid/support/v4/view/ViewGroupCompat;->IMPL:Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatImpl;

    invoke-interface {v0, p0}, Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatImpl;->isTransitionGroup(Landroid/view/ViewGroup;)Z

    move-result v0

    return v0
.end method

.method public static onRequestSendAccessibilityEvent(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z
    .registers 4
    .param p0, "group"    # Landroid/view/ViewGroup;
    .param p1, "child"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/accessibility/AccessibilityEvent;

    .line 179
    sget-object v0, Landroid/support/v4/view/ViewGroupCompat;->IMPL:Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatImpl;

    invoke-interface {v0, p0, p1, p2}, Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatImpl;->onRequestSendAccessibilityEvent(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result v0

    return v0
.end method

.method public static setLayoutMode(Landroid/view/ViewGroup;I)V
    .registers 3
    .param p0, "group"    # Landroid/view/ViewGroup;
    .param p1, "mode"    # I

    .line 228
    sget-object v0, Landroid/support/v4/view/ViewGroupCompat;->IMPL:Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatImpl;

    invoke-interface {v0, p0, p1}, Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatImpl;->setLayoutMode(Landroid/view/ViewGroup;I)V

    .line 229
    return-void
.end method

.method public static setMotionEventSplittingEnabled(Landroid/view/ViewGroup;Z)V
    .registers 3
    .param p0, "group"    # Landroid/view/ViewGroup;
    .param p1, "split"    # Z

    .line 199
    sget-object v0, Landroid/support/v4/view/ViewGroupCompat;->IMPL:Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatImpl;

    invoke-interface {v0, p0, p1}, Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatImpl;->setMotionEventSplittingEnabled(Landroid/view/ViewGroup;Z)V

    .line 200
    return-void
.end method

.method public static setTransitionGroup(Landroid/view/ViewGroup;Z)V
    .registers 3
    .param p0, "group"    # Landroid/view/ViewGroup;
    .param p1, "isTransitionGroup"    # Z

    .line 240
    sget-object v0, Landroid/support/v4/view/ViewGroupCompat;->IMPL:Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatImpl;

    invoke-interface {v0, p0, p1}, Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatImpl;->setTransitionGroup(Landroid/view/ViewGroup;Z)V

    .line 241
    return-void
.end method
