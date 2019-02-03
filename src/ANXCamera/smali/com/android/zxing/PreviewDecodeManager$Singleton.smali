.class Lcom/android/zxing/PreviewDecodeManager$Singleton;
.super Ljava/lang/Object;
.source "PreviewDecodeManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/zxing/PreviewDecodeManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Singleton"
.end annotation


# static fields
.field public static final INSTANCE:Lcom/android/zxing/PreviewDecodeManager;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 135
    new-instance v0, Lcom/android/zxing/PreviewDecodeManager;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/android/zxing/PreviewDecodeManager;-><init>(Lcom/android/zxing/PreviewDecodeManager$1;)V

    sput-object v0, Lcom/android/zxing/PreviewDecodeManager$Singleton;->INSTANCE:Lcom/android/zxing/PreviewDecodeManager;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 134
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
