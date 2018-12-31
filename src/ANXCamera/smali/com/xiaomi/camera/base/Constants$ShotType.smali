.class public interface abstract annotation Lcom/xiaomi/camera/base/Constants$ShotType;
.super Ljava/lang/Object;
.source "Constants.java"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/camera/base/Constants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2609
    name = "ShotType"
.end annotation

.annotation runtime Ljava/lang/annotation/Retention;
    value = .enum Ljava/lang/annotation/RetentionPolicy;->SOURCE:Ljava/lang/annotation/RetentionPolicy;
.end annotation


# static fields
.field public static final BURST_SHOT:I = 0x3

.field public static final INTENT_NORMAL_DUAL_SHOT:I = -0x3

.field public static final INTENT_NORMAL_SINGLE_SHOT:I = -0x2

.field public static final NORMAL_DUAL_SHOT:I = 0x2

.field public static final NORMAL_LIVE_SHOT:I = 0x1

.field public static final NORMAL_SINGLE_SHOT:I = 0x0

.field public static final PARALLEL_BURST:I = 0x7

.field public static final PARALLEL_DUAL:I = 0x6

.field public static final PARALLEL_REPEATING:I = 0x8

.field public static final PARALLEL_SINGLE:I = 0x5

.field public static final PREVIEW_SHOT:I = -0x1

.field public static final VIDEO_SHOT:I = 0x4
