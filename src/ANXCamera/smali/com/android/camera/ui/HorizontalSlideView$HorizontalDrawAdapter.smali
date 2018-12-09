.class public abstract Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;
.super Ljava/lang/Object;
.source "HorizontalSlideView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/ui/HorizontalSlideView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "HorizontalDrawAdapter"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 369
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract draw(ILandroid/graphics/Canvas;Z)V
.end method

.method public abstract getAlign(I)Landroid/graphics/Paint$Align;
.end method

.method public abstract getCount()I
.end method

.method public abstract measureGap(I)F
.end method

.method public abstract measureWidth(I)F
.end method
