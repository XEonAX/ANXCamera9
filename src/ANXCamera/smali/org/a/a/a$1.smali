.class Lorg/a/a/a$1;
.super Ljava/lang/Object;
.source "AudioPlayer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/a/a/a;->hN()I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic uc:Lorg/a/a/a;


# direct methods
.method constructor <init>(Lorg/a/a/a;)V
    .locals 0

    .line 153
    iput-object p1, p0, Lorg/a/a/a$1;->uc:Lorg/a/a/a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 158
    iget-object v0, p0, Lorg/a/a/a$1;->uc:Lorg/a/a/a;

    invoke-static {v0}, Lorg/a/a/a;->a(Lorg/a/a/a;)Landroid/media/AudioTrack;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/a/a/a$1;->uc:Lorg/a/a/a;

    invoke-static {v0}, Lorg/a/a/a;->b(Lorg/a/a/a;)I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 159
    iget-object v0, p0, Lorg/a/a/a$1;->uc:Lorg/a/a/a;

    invoke-static {v0}, Lorg/a/a/a;->a(Lorg/a/a/a;)Landroid/media/AudioTrack;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/AudioTrack;->play()V

    .line 162
    :cond_0
    nop

    .line 163
    :cond_1
    :goto_0
    iget-object v0, p0, Lorg/a/a/a$1;->uc:Lorg/a/a/a;

    invoke-static {v0}, Lorg/a/a/a;->b(Lorg/a/a/a;)I

    move-result v0

    const/4 v1, 0x4

    if-eq v0, v1, :cond_4

    .line 165
    iget-object v0, p0, Lorg/a/a/a$1;->uc:Lorg/a/a/a;

    invoke-static {v0}, Lorg/a/a/a;->b(Lorg/a/a/a;)I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_2

    const/4 v0, 0x0

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lorg/a/a/a$1;->uc:Lorg/a/a/a;

    invoke-static {v0}, Lorg/a/a/a;->d(Lorg/a/a/a;)Lorg/a/a/b;

    move-result-object v0

    iget-object v1, p0, Lorg/a/a/a$1;->uc:Lorg/a/a/a;

    invoke-static {v1}, Lorg/a/a/a;->c(Lorg/a/a/a;)J

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Lorg/a/a/b;->playAudioSamples(J)[B

    move-result-object v0

    .line 167
    :goto_1
    if-eqz v0, :cond_3

    array-length v1, v0

    if-lez v1, :cond_3

    .line 169
    iget-object v1, p0, Lorg/a/a/a$1;->uc:Lorg/a/a/a;

    invoke-static {v1}, Lorg/a/a/a;->a(Lorg/a/a/a;)Landroid/media/AudioTrack;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 171
    :try_start_0
    iget-object v1, p0, Lorg/a/a/a$1;->uc:Lorg/a/a/a;

    invoke-static {v1}, Lorg/a/a/a;->a(Lorg/a/a/a;)Landroid/media/AudioTrack;

    move-result-object v1

    const/4 v2, 0x0

    array-length v3, v0

    invoke-virtual {v1, v0, v2, v3}, Landroid/media/AudioTrack;->write([BII)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 172
    :catch_0
    move-exception v0

    .line 174
    :goto_2
    goto :goto_0

    .line 178
    :cond_3
    const-wide/16 v0, 0xa

    :try_start_1
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1

    .line 181
    goto :goto_0

    .line 179
    :catch_1
    move-exception v0

    .line 180
    return-void

    .line 184
    :cond_4
    return-void
.end method
