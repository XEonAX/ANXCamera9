.class Lcom/bef/effectsdk/AudioPlayer$3;
.super Ljava/lang/Object;
.source "AudioPlayer.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnPreparedListener;


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

    .line 63
    iput-object p1, p0, Lcom/bef/effectsdk/AudioPlayer$3;->this$0:Lcom/bef/effectsdk/AudioPlayer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPrepared(Landroid/media/MediaPlayer;)V
    .locals 2

    .line 66
    sget-object p1, Lcom/bef/effectsdk/AudioPlayer;->TAG:Ljava/lang/String;

    const-string v0, "MediaPlayer onPrepared..."

    invoke-static {p1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    iget-object p1, p0, Lcom/bef/effectsdk/AudioPlayer$3;->this$0:Lcom/bef/effectsdk/AudioPlayer;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/bef/effectsdk/AudioPlayer;->access$402(Lcom/bef/effectsdk/AudioPlayer;Z)Z

    .line 69
    iget-object p1, p0, Lcom/bef/effectsdk/AudioPlayer$3;->this$0:Lcom/bef/effectsdk/AudioPlayer;

    iget-object v0, p0, Lcom/bef/effectsdk/AudioPlayer$3;->this$0:Lcom/bef/effectsdk/AudioPlayer;

    invoke-static {v0}, Lcom/bef/effectsdk/AudioPlayer;->access$000(Lcom/bef/effectsdk/AudioPlayer;)J

    move-result-wide v0

    invoke-static {p1, v0, v1}, Lcom/bef/effectsdk/AudioPlayer;->access$500(Lcom/bef/effectsdk/AudioPlayer;J)V

    .line 70
    return-void
.end method
