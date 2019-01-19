.class public Lcom/ss/android/medialib/SpdLogInvoker;
.super Ljava/lang/Object;
.source "SpdLogInvoker.java"


# annotations
.annotation build Landroid/support/annotation/Keep;
.end annotation


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 14
    invoke-static {}, Lcom/ss/android/medialib/NativePort/NativeLibsLoader;->loadLibrary()V

    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public native close()V
.end method

.method public native err(Ljava/lang/String;)I
.end method

.method public native getLogFiles(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public native info(ILjava/lang/String;)I
.end method

.method public native initSpdLog(Ljava/lang/String;II)I
.end method

.method public native setLevel(I)V
.end method

.method public native warn(Ljava/lang/String;)I
.end method
