.class public interface abstract Lcom/android/camera/constant/BeautyConstant;
.super Ljava/lang/Object;
.source "BeautyConstant.java"


# static fields
.field public static final LEVEL_ADVANCED:Ljava/lang/String;

.field public static final LEVEL_CLOSE:Ljava/lang/String;

.field public static final LEVEL_HIGH:Ljava/lang/String;

.field public static final LEVEL_LOW:Ljava/lang/String;

.field public static final LEVEL_MEDIUM:Ljava/lang/String;

.field public static final LEVEL_XHIGH:Ljava/lang/String;

.field public static final LEVEL_XXHIGH:Ljava/lang/String;

.field public static final LEVEL_XXXHIGH:Ljava/lang/String;

.field public static final res:Landroid/content/res/Resources;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 9
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sput-object v0, Lcom/android/camera/constant/BeautyConstant;->res:Landroid/content/res/Resources;

    .line 10
    sget-object v0, Lcom/android/camera/constant/BeautyConstant;->res:Landroid/content/res/Resources;

    const v1, 0x7f0b0144

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/constant/BeautyConstant;->LEVEL_CLOSE:Ljava/lang/String;

    .line 11
    sget-object v0, Lcom/android/camera/constant/BeautyConstant;->res:Landroid/content/res/Resources;

    const v1, 0x7f0b0145

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/constant/BeautyConstant;->LEVEL_LOW:Ljava/lang/String;

    .line 12
    sget-object v0, Lcom/android/camera/constant/BeautyConstant;->res:Landroid/content/res/Resources;

    const v1, 0x7f0b0146

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/constant/BeautyConstant;->LEVEL_MEDIUM:Ljava/lang/String;

    .line 13
    sget-object v0, Lcom/android/camera/constant/BeautyConstant;->res:Landroid/content/res/Resources;

    const v1, 0x7f0b0147

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/constant/BeautyConstant;->LEVEL_HIGH:Ljava/lang/String;

    .line 14
    sget-object v0, Lcom/android/camera/constant/BeautyConstant;->res:Landroid/content/res/Resources;

    const v1, 0x7f0b0148

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/constant/BeautyConstant;->LEVEL_XHIGH:Ljava/lang/String;

    .line 15
    sget-object v0, Lcom/android/camera/constant/BeautyConstant;->res:Landroid/content/res/Resources;

    const v1, 0x7f0b0149

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/constant/BeautyConstant;->LEVEL_XXHIGH:Ljava/lang/String;

    .line 16
    sget-object v0, Lcom/android/camera/constant/BeautyConstant;->res:Landroid/content/res/Resources;

    const v1, 0x7f0b014a

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/constant/BeautyConstant;->LEVEL_XXXHIGH:Ljava/lang/String;

    .line 17
    sget-object v0, Lcom/android/camera/constant/BeautyConstant;->res:Landroid/content/res/Resources;

    const v1, 0x7f0b014b

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/constant/BeautyConstant;->LEVEL_ADVANCED:Ljava/lang/String;

    return-void
.end method
