.class Lcom/bef/effectsdk/AudioPlayer$4;
.super Ljava/lang/Object;
.source "AudioPlayer.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnCompletionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bef/effectsdk/AudioPlayer;->init()I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bef/effectsdk/AudioPlayer;


# direct methods
.method constructor <init>(Lcom/bef/effectsdk/AudioPlayer;)V
    .locals 0

    .line 73
    iput-object p1, p0, Lcom/bef/effectsdk/AudioPlayer$4;->this$0:Lcom/bef/effectsdk/AudioPlayer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 2

    .line 76
    sget-object p1, Lcom/bef/effectsdk/AudioPlayer;->TAG:Ljava/lang/String;

    const-string v0, "MediaPlayer onCompletion..."

    invoke-static {p1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    iget-object p1, p0, Lcom/bef/effectsdk/AudioPlayer$4;->this$0:Lcom/bef/effectsdk/AudioPlayer;

    iget-object v0, p0, Lcom/bef/effectsdk/AudioPlayer$4;->this$0:Lcom/bef/effectsdk/AudioPlayer;

    invoke-static {v0}, Lcom/bef/effectsdk/AudioPlayer;->access$000(Lcom/bef/effectsdk/AudioPlayer;)J

    move-result-wide v0

    invoke-static {p1, v0, v1}, Lcom/bef/effectsdk/AudioPlayer;->access$600(Lcom/bef/effectsdk/AudioPlayer;J)V

    .line 78
    return-void
.end method
