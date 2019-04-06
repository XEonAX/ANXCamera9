.class public Lcom/google/android/libraries/lens/lenslite/LensliteUiController;
.super Ljava/lang/Object;
.source "LensliteUiController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/libraries/lens/lenslite/LensliteUiController$FocusType;,
        Lcom/google/android/libraries/lens/lenslite/LensliteUiController$VerticalPlacement;,
        Lcom/google/android/libraries/lens/lenslite/LensliteUiController$ResultType;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "LensliteUiController"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFocusChange(ILandroid/graphics/PointF;)Z
    .locals 3
    .param p1    # I
        .annotation build Lcom/google/android/libraries/lens/lenslite/LensliteUiController$FocusType;
        .end annotation
    .end param

    const-string v0, "LensliteUiController"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onFocusChange: type = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", focusLocation = "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x0

    return p1
.end method

.method public setChipDrawable(I)V
    .locals 0

    return-void
.end method

.method public setChipLocation(Landroid/graphics/PointF;)V
    .locals 0

    return-void
.end method

.method public setChipSidePadding(I)V
    .locals 0

    return-void
.end method

.method public setChipTextStyle(I)V
    .locals 0

    return-void
.end method

.method public setIconForResultType(ILandroid/graphics/drawable/Drawable;)V
    .locals 0
    .param p1    # I
        .annotation build Lcom/google/android/libraries/lens/lenslite/LensliteUiController$ResultType;
        .end annotation
    .end param

    return-void
.end method

.method public setIconSize(I)V
    .locals 0

    return-void
.end method

.method public setLensliteLayoutVisibility(Z)V
    .locals 0

    return-void
.end method

.method public setOobeLocation(IF)V
    .locals 0
    .param p1    # I
        .annotation build Lcom/google/android/libraries/lens/lenslite/LensliteUiController$VerticalPlacement;
        .end annotation
    .end param

    return-void
.end method

.method public setOobeTextStyles(III)V
    .locals 0

    return-void
.end method

.method public setPostCaptureEnabled(Z)V
    .locals 0

    return-void
.end method
