.class Landroid/support/v4/widget/CompoundButtonCompatDonut;
.super Ljava/lang/Object;
.source "CompoundButtonCompatDonut.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "CompoundButtonCompatDonut"

.field private static sButtonDrawableField:Ljava/lang/reflect/Field;

.field private static sButtonDrawableFieldFetched:Z


# direct methods
.method constructor <init>()V
    .registers 1

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static getButtonDrawable(Landroid/widget/CompoundButton;)Landroid/graphics/drawable/Drawable;
    .registers 5
    .param p0, "button"    # Landroid/widget/CompoundButton;

    .line 61
    sget-boolean v0, Landroid/support/v4/widget/CompoundButtonCompatDonut;->sButtonDrawableFieldFetched:Z

    if-nez v0, :cond_1f

    .line 63
    const/4 v0, 0x1

    :try_start_5
    const-class v1, Landroid/widget/CompoundButton;

    const-string v2, "mButtonDrawable"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    sput-object v1, Landroid/support/v4/widget/CompoundButtonCompatDonut;->sButtonDrawableField:Ljava/lang/reflect/Field;

    .line 64
    sget-object v1, Landroid/support/v4/widget/CompoundButtonCompatDonut;->sButtonDrawableField:Ljava/lang/reflect/Field;

    invoke-virtual {v1, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_14
    .catch Ljava/lang/NoSuchFieldException; {:try_start_5 .. :try_end_14} :catch_15

    .line 67
    goto :goto_1d

    .line 65
    :catch_15
    move-exception v1

    .line 66
    .local v1, "e":Ljava/lang/NoSuchFieldException;
    const-string v2, "CompoundButtonCompatDonut"

    const-string v3, "Failed to retrieve mButtonDrawable field"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 68
    .end local v1    # "e":Ljava/lang/NoSuchFieldException;
    :goto_1d
    sput-boolean v0, Landroid/support/v4/widget/CompoundButtonCompatDonut;->sButtonDrawableFieldFetched:Z

    .line 71
    :cond_1f
    sget-object v0, Landroid/support/v4/widget/CompoundButtonCompatDonut;->sButtonDrawableField:Ljava/lang/reflect/Field;

    const/4 v1, 0x0

    if-eqz v0, :cond_37

    .line 73
    :try_start_24
    sget-object v0, Landroid/support/v4/widget/CompoundButtonCompatDonut;->sButtonDrawableField:Ljava/lang/reflect/Field;

    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/Drawable;
    :try_end_2c
    .catch Ljava/lang/IllegalAccessException; {:try_start_24 .. :try_end_2c} :catch_2d

    return-object v0

    .line 74
    :catch_2d
    move-exception v0

    .line 75
    .local v0, "e":Ljava/lang/IllegalAccessException;
    const-string v2, "CompoundButtonCompatDonut"

    const-string v3, "Failed to get button drawable via reflection"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 76
    sput-object v1, Landroid/support/v4/widget/CompoundButtonCompatDonut;->sButtonDrawableField:Ljava/lang/reflect/Field;

    .line 79
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :cond_37
    return-object v1
.end method

.method static getButtonTintList(Landroid/widget/CompoundButton;)Landroid/content/res/ColorStateList;
    .registers 2
    .param p0, "button"    # Landroid/widget/CompoundButton;

    .line 41
    instance-of v0, p0, Landroid/support/v4/widget/TintableCompoundButton;

    if-eqz v0, :cond_c

    .line 42
    move-object v0, p0

    check-cast v0, Landroid/support/v4/widget/TintableCompoundButton;

    invoke-interface {v0}, Landroid/support/v4/widget/TintableCompoundButton;->getSupportButtonTintList()Landroid/content/res/ColorStateList;

    move-result-object v0

    return-object v0

    .line 44
    :cond_c
    const/4 v0, 0x0

    return-object v0
.end method

.method static getButtonTintMode(Landroid/widget/CompoundButton;)Landroid/graphics/PorterDuff$Mode;
    .registers 2
    .param p0, "button"    # Landroid/widget/CompoundButton;

    .line 54
    instance-of v0, p0, Landroid/support/v4/widget/TintableCompoundButton;

    if-eqz v0, :cond_c

    .line 55
    move-object v0, p0

    check-cast v0, Landroid/support/v4/widget/TintableCompoundButton;

    invoke-interface {v0}, Landroid/support/v4/widget/TintableCompoundButton;->getSupportButtonTintMode()Landroid/graphics/PorterDuff$Mode;

    move-result-object v0

    return-object v0

    .line 57
    :cond_c
    const/4 v0, 0x0

    return-object v0
.end method

.method static setButtonTintList(Landroid/widget/CompoundButton;Landroid/content/res/ColorStateList;)V
    .registers 3
    .param p0, "button"    # Landroid/widget/CompoundButton;
    .param p1, "tint"    # Landroid/content/res/ColorStateList;

    .line 35
    instance-of v0, p0, Landroid/support/v4/widget/TintableCompoundButton;

    if-eqz v0, :cond_a

    .line 36
    move-object v0, p0

    check-cast v0, Landroid/support/v4/widget/TintableCompoundButton;

    invoke-interface {v0, p1}, Landroid/support/v4/widget/TintableCompoundButton;->setSupportButtonTintList(Landroid/content/res/ColorStateList;)V

    .line 38
    :cond_a
    return-void
.end method

.method static setButtonTintMode(Landroid/widget/CompoundButton;Landroid/graphics/PorterDuff$Mode;)V
    .registers 3
    .param p0, "button"    # Landroid/widget/CompoundButton;
    .param p1, "tintMode"    # Landroid/graphics/PorterDuff$Mode;

    .line 48
    instance-of v0, p0, Landroid/support/v4/widget/TintableCompoundButton;

    if-eqz v0, :cond_a

    .line 49
    move-object v0, p0

    check-cast v0, Landroid/support/v4/widget/TintableCompoundButton;

    invoke-interface {v0, p1}, Landroid/support/v4/widget/TintableCompoundButton;->setSupportButtonTintMode(Landroid/graphics/PorterDuff$Mode;)V

    .line 51
    :cond_a
    return-void
.end method
