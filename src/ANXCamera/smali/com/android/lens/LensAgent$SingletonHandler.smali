.class Lcom/android/lens/LensAgent$SingletonHandler;
.super Ljava/lang/Object;
.source "LensAgent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/lens/LensAgent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SingletonHandler"
.end annotation


# static fields
.field private static final sSingleton:Lcom/android/lens/LensAgent;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/android/lens/LensAgent;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/android/lens/LensAgent;-><init>(Lcom/android/lens/LensAgent$1;)V

    sput-object v0, Lcom/android/lens/LensAgent$SingletonHandler;->sSingleton:Lcom/android/lens/LensAgent;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$100()Lcom/android/lens/LensAgent;
    .locals 1

    sget-object v0, Lcom/android/lens/LensAgent$SingletonHandler;->sSingleton:Lcom/android/lens/LensAgent;

    return-object v0
.end method
