.class Landroid/support/v4/graphics/drawable/DrawableCompatApi23;
.super Ljava/lang/Object;
.source "DrawableCompatApi23.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getLayoutDirection(Landroid/graphics/drawable/Drawable;)I
    .registers 2
    .param p0, "drawable"    # Landroid/graphics/drawable/Drawable;

    .line 30
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getLayoutDirection()I

    move-result v0

    return v0
.end method

.method public static setLayoutDirection(Landroid/graphics/drawable/Drawable;I)V
    .registers 2
    .param p0, "drawable"    # Landroid/graphics/drawable/Drawable;
    .param p1, "layoutDirection"    # I

    .line 26
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setLayoutDirection(I)Z

    .line 27
    return-void
.end method
