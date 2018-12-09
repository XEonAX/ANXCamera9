.class public abstract Lcom/android/camera/effect/draw_mode/DrawAttribute;
.super Ljava/lang/Object;
.source "DrawAttribute.java"


# static fields
.field public static final BASIC_TEXTURE:I = 0x5

.field public static final BLUR_TEXTURE:I = 0xa

.field public static final EXT_TEXTURE:I = 0x8

.field public static final FILL_RECT:I = 0x4

.field public static final INT_TEXTURE:I = 0x6

.field public static final JPEG:I = 0x9

.field public static final LINE:I = 0x0

.field public static final MESH:I = 0x2

.field public static final MIXED:I = 0x3

.field public static final NONE:I = -0x1

.field public static final RECT:I = 0x1

.field public static final RECTF_TEXTURE:I = 0x7

.field public static final YUV_TEXTURE:I = 0xb


# instance fields
.field protected mTarget:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/effect/draw_mode/DrawAttribute;->mTarget:I

    return-void
.end method


# virtual methods
.method public getTarget()I
    .locals 1

    .line 21
    iget v0, p0, Lcom/android/camera/effect/draw_mode/DrawAttribute;->mTarget:I

    return v0
.end method
