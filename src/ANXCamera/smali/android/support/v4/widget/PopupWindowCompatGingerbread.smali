.class Landroid/support/v4/widget/PopupWindowCompatGingerbread;
.super Ljava/lang/Object;
.source "PopupWindowCompatGingerbread.java"


# static fields
.field private static sGetWindowLayoutTypeMethod:Ljava/lang/reflect/Method;

.field private static sGetWindowLayoutTypeMethodAttempted:Z

.field private static sSetWindowLayoutTypeMethod:Ljava/lang/reflect/Method;

.field private static sSetWindowLayoutTypeMethodAttempted:Z


# direct methods
.method constructor <init>()V
    .registers 1

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static getWindowLayoutType(Landroid/widget/PopupWindow;)I
    .registers 6
    .param p0, "popupWindow"    # Landroid/widget/PopupWindow;

    .line 55
    sget-boolean v0, Landroid/support/v4/widget/PopupWindowCompatGingerbread;->sGetWindowLayoutTypeMethodAttempted:Z

    const/4 v1, 0x0

    if-nez v0, :cond_1b

    .line 57
    const/4 v0, 0x1

    :try_start_6
    const-class v2, Landroid/widget/PopupWindow;

    const-string v3, "getWindowLayoutType"

    new-array v4, v1, [Ljava/lang/Class;

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    sput-object v2, Landroid/support/v4/widget/PopupWindowCompatGingerbread;->sGetWindowLayoutTypeMethod:Ljava/lang/reflect/Method;

    .line 59
    sget-object v2, Landroid/support/v4/widget/PopupWindowCompatGingerbread;->sGetWindowLayoutTypeMethod:Ljava/lang/reflect/Method;

    invoke-virtual {v2, v0}, Ljava/lang/reflect/Method;->setAccessible(Z)V
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_17} :catch_18

    .line 62
    goto :goto_19

    .line 60
    :catch_18
    move-exception v2

    .line 63
    :goto_19
    sput-boolean v0, Landroid/support/v4/widget/PopupWindowCompatGingerbread;->sGetWindowLayoutTypeMethodAttempted:Z

    .line 66
    :cond_1b
    sget-object v0, Landroid/support/v4/widget/PopupWindowCompatGingerbread;->sGetWindowLayoutTypeMethod:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_2f

    .line 68
    :try_start_1f
    sget-object v0, Landroid/support/v4/widget/PopupWindowCompatGingerbread;->sGetWindowLayoutTypeMethod:Ljava/lang/reflect/Method;

    new-array v2, v1, [Ljava/lang/Object;

    invoke-virtual {v0, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0
    :try_end_2d
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_2d} :catch_2e

    return v0

    .line 69
    :catch_2e
    move-exception v0

    .line 73
    :cond_2f
    return v1
.end method

.method static setWindowLayoutType(Landroid/widget/PopupWindow;I)V
    .registers 8
    .param p0, "popupWindow"    # Landroid/widget/PopupWindow;
    .param p1, "layoutType"    # I

    .line 34
    sget-boolean v0, Landroid/support/v4/widget/PopupWindowCompatGingerbread;->sSetWindowLayoutTypeMethodAttempted:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_1f

    .line 36
    :try_start_6
    const-class v0, Landroid/widget/PopupWindow;

    const-string v3, "setWindowLayoutType"

    new-array v4, v2, [Ljava/lang/Class;

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v5, v4, v1

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Landroid/support/v4/widget/PopupWindowCompatGingerbread;->sSetWindowLayoutTypeMethod:Ljava/lang/reflect/Method;

    .line 38
    sget-object v0, Landroid/support/v4/widget/PopupWindowCompatGingerbread;->sSetWindowLayoutTypeMethod:Ljava/lang/reflect/Method;

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_1b} :catch_1c

    .line 41
    goto :goto_1d

    .line 39
    :catch_1c
    move-exception v0

    .line 42
    :goto_1d
    sput-boolean v2, Landroid/support/v4/widget/PopupWindowCompatGingerbread;->sSetWindowLayoutTypeMethodAttempted:Z

    .line 45
    :cond_1f
    sget-object v0, Landroid/support/v4/widget/PopupWindowCompatGingerbread;->sSetWindowLayoutTypeMethod:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_32

    .line 47
    :try_start_23
    sget-object v0, Landroid/support/v4/widget/PopupWindowCompatGingerbread;->sSetWindowLayoutTypeMethod:Ljava/lang/reflect/Method;

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v1

    invoke-virtual {v0, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_30
    .catch Ljava/lang/Exception; {:try_start_23 .. :try_end_30} :catch_31

    .line 50
    goto :goto_32

    .line 48
    :catch_31
    move-exception v0

    .line 52
    :cond_32
    :goto_32
    return-void
.end method
