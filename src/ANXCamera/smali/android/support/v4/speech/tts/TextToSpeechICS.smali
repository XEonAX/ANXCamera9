.class Landroid/support/v4/speech/tts/TextToSpeechICS;
.super Ljava/lang/Object;
.source "TextToSpeechICS.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "android.support.v4.speech.tts"


# direct methods
.method constructor <init>()V
    .registers 1

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static construct(Landroid/content/Context;Landroid/speech/tts/TextToSpeech$OnInitListener;Ljava/lang/String;)Landroid/speech/tts/TextToSpeech;
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "onInitListener"    # Landroid/speech/tts/TextToSpeech$OnInitListener;
    .param p2, "engineName"    # Ljava/lang/String;

    .line 15
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-ge v0, v1, :cond_1b

    .line 16
    if-nez p2, :cond_e

    .line 17
    new-instance v0, Landroid/speech/tts/TextToSpeech;

    invoke-direct {v0, p0, p1}, Landroid/speech/tts/TextToSpeech;-><init>(Landroid/content/Context;Landroid/speech/tts/TextToSpeech$OnInitListener;)V

    return-object v0

    .line 19
    :cond_e
    const-string v0, "android.support.v4.speech.tts"

    const-string v1, "Can\'t specify tts engine on this device"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    new-instance v0, Landroid/speech/tts/TextToSpeech;

    invoke-direct {v0, p0, p1}, Landroid/speech/tts/TextToSpeech;-><init>(Landroid/content/Context;Landroid/speech/tts/TextToSpeech$OnInitListener;)V

    return-object v0

    .line 23
    :cond_1b
    new-instance v0, Landroid/speech/tts/TextToSpeech;

    invoke-direct {v0, p0, p1, p2}, Landroid/speech/tts/TextToSpeech;-><init>(Landroid/content/Context;Landroid/speech/tts/TextToSpeech$OnInitListener;Ljava/lang/String;)V

    return-object v0
.end method
