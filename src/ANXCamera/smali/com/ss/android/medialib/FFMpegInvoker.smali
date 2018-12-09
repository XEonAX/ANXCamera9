.class public Lcom/ss/android/medialib/FFMpegInvoker;
.super Ljava/lang/Object;
.source "FFMpegInvoker.java"


# annotations
.annotation build Landroid/support/annotation/Keep;
.end annotation


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 18
    invoke-static {}, Lcom/ss/android/medialib/NativePort/NativeLibsLoader;->loadLibrary()V

    .line 19
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    return-void
.end method


# virtual methods
.method public native MusicLength(Ljava/lang/String;)J
.end method

.method public native resampleAudioToWav(Ljava/lang/String;Ljava/lang/String;JJ)I
.end method

.method public native resampleAudioToWav2(Ljava/lang/String;Ljava/lang/String;J)I
.end method

.method public native resampleCycleAudioToWav(Ljava/lang/String;Ljava/lang/String;JJ)I
.end method
