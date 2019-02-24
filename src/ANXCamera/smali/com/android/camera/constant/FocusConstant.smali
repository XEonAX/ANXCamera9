.class public Lcom/android/camera/constant/FocusConstant;
.super Ljava/lang/Object;
.source "FocusConstant.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/constant/FocusConstant$PendingState;
    }
.end annotation


# static fields
.field public static final PENDING_FAIL_AFTER_FOCUSING:I = 0x4

.field public static final PENDING_FAIL_AFTER_TOUCH_DOWN:I = 0x3

.field public static final PENDING_NULL:I = -0x1

.field public static final PENDING_SUCCESS_AFTER_FOCUSING:I = 0x2

.field public static final PENDING_SUCCESS_AFTER_TOUCH_DOWN:I = 0x1


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
