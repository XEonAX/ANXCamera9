.class Landroid/support/v4/view/KeyEventCompatEclair;
.super Ljava/lang/Object;
.source "KeyEventCompatEclair.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static dispatch(Landroid/view/KeyEvent;Landroid/view/KeyEvent$Callback;Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 5
    .param p0, "event"    # Landroid/view/KeyEvent;
    .param p1, "receiver"    # Landroid/view/KeyEvent$Callback;
    .param p2, "state"    # Ljava/lang/Object;
    .param p3, "target"    # Ljava/lang/Object;

    .line 30
    move-object v0, p2

    check-cast v0, Landroid/view/KeyEvent$DispatcherState;

    invoke-virtual {p0, p1, v0, p3}, Landroid/view/KeyEvent;->dispatch(Landroid/view/KeyEvent$Callback;Landroid/view/KeyEvent$DispatcherState;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static getKeyDispatcherState(Landroid/view/View;)Ljava/lang/Object;
    .registers 2
    .param p0, "view"    # Landroid/view/View;

    .line 25
    invoke-virtual {p0}, Landroid/view/View;->getKeyDispatcherState()Landroid/view/KeyEvent$DispatcherState;

    move-result-object v0

    return-object v0
.end method

.method public static isTracking(Landroid/view/KeyEvent;)Z
    .registers 2
    .param p0, "event"    # Landroid/view/KeyEvent;

    .line 38
    invoke-virtual {p0}, Landroid/view/KeyEvent;->isTracking()Z

    move-result v0

    return v0
.end method

.method public static startTracking(Landroid/view/KeyEvent;)V
    .registers 1
    .param p0, "event"    # Landroid/view/KeyEvent;

    .line 34
    invoke-virtual {p0}, Landroid/view/KeyEvent;->startTracking()V

    .line 35
    return-void
.end method
