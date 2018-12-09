.class Lcom/android/zxing/QRCodeManager$Singleton;
.super Ljava/lang/Object;
.source "QRCodeManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/zxing/QRCodeManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Singleton"
.end annotation


# static fields
.field public static final INSTANCE:Lcom/android/zxing/QRCodeManager;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 238
    new-instance v0, Lcom/android/zxing/QRCodeManager;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/android/zxing/QRCodeManager;-><init>(Lcom/android/zxing/QRCodeManager$1;)V

    sput-object v0, Lcom/android/zxing/QRCodeManager$Singleton;->INSTANCE:Lcom/android/zxing/QRCodeManager;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 237
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
