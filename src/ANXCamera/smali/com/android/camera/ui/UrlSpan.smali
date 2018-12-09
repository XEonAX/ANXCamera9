.class public Lcom/android/camera/ui/UrlSpan;
.super Landroid/text/style/ClickableSpan;
.source "UrlSpan.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/ui/UrlSpan$UrlSpanOnClickListener;
    }
.end annotation


# instance fields
.field private mOnClickListener:Lcom/android/camera/ui/UrlSpan$UrlSpanOnClickListener;


# direct methods
.method public constructor <init>(Lcom/android/camera/ui/UrlSpan$UrlSpanOnClickListener;)V
    .locals 0

    .line 16
    invoke-direct {p0}, Landroid/text/style/ClickableSpan;-><init>()V

    .line 17
    iput-object p1, p0, Lcom/android/camera/ui/UrlSpan;->mOnClickListener:Lcom/android/camera/ui/UrlSpan$UrlSpanOnClickListener;

    .line 18
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 28
    iget-object p1, p0, Lcom/android/camera/ui/UrlSpan;->mOnClickListener:Lcom/android/camera/ui/UrlSpan$UrlSpanOnClickListener;

    if-eqz p1, :cond_0

    .line 29
    iget-object p1, p0, Lcom/android/camera/ui/UrlSpan;->mOnClickListener:Lcom/android/camera/ui/UrlSpan$UrlSpanOnClickListener;

    invoke-interface {p1}, Lcom/android/camera/ui/UrlSpan$UrlSpanOnClickListener;->onClick()V

    .line 31
    :cond_0
    return-void
.end method

.method public updateDrawState(Landroid/text/TextPaint;)V
    .locals 1

    .line 22
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/text/TextPaint;->setUnderlineText(Z)V

    .line 23
    const v0, -0xffff01

    invoke-virtual {p1, v0}, Landroid/text/TextPaint;->setColor(I)V

    .line 24
    return-void
.end method
