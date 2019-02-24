.class public Lcom/ss/android/vesdk/runtime/VERecorderResManager;
.super Ljava/lang/Object;
.source "VERecorderResManager.java"


# instance fields
.field private mConcatSegmentAudioPath:Ljava/lang/String;

.field private mConcatSegmentVideoPath:Ljava/lang/String;

.field private mConcatSementAudioVideoMixedVideoPath:Ljava/lang/String;

.field private mSegmentAudioPathList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mSegmentDirPath:Ljava/lang/String;

.field private mSegmentVideoPathList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mWorkspace:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    iput-object p1, p0, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->mWorkspace:Ljava/lang/String;

    .line 69
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->mWorkspace:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v0, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "segments"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->mSegmentDirPath:Ljava/lang/String;

    .line 70
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->mSegmentVideoPathList:Ljava/util/List;

    .line 71
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->mSegmentAudioPathList:Ljava/util/List;

    .line 72
    return-void
.end method


# virtual methods
.method public addSegmentAudioPath(Ljava/lang/String;)V
    .locals 1

    .line 156
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->mSegmentAudioPathList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 157
    return-void
.end method

.method public addSegmentVideoPath(Ljava/lang/String;)V
    .locals 1

    .line 107
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->mSegmentVideoPathList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 108
    return-void
.end method

.method public delSegmentAudioPath()Ljava/lang/String;
    .locals 2

    .line 166
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->mSegmentAudioPathList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 167
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->mSegmentAudioPathList:Ljava/util/List;

    iget-object v1, p0, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->mSegmentAudioPathList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0

    .line 168
    :cond_0
    const-string v0, ""

    return-object v0
.end method

.method public delSegmentVideoPath()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/VEException;
        }
    .end annotation

    .line 117
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->mSegmentVideoPathList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 118
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->mSegmentVideoPathList:Ljava/util/List;

    iget-object v1, p0, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->mSegmentVideoPathList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0

    .line 120
    :cond_0
    new-instance v0, Lcom/ss/android/vesdk/VEException;

    const/16 v1, -0x69

    const-string v2, "segment video list size is 0"

    invoke-direct {v0, v1, v2}, Lcom/ss/android/vesdk/VEException;-><init>(ILjava/lang/String;)V

    throw v0
.end method

.method public genConcatSegmentAudioPath()V
    .locals 3

    .line 229
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->mWorkspace:Ljava/lang/String;

    const-string v2, "concat"

    invoke-static {v1, v2}, Lcom/ss/android/vesdk/runtime/VEResManager;->getFolder(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "concat"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ".wav"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->mConcatSegmentAudioPath:Ljava/lang/String;

    .line 233
    return-void
.end method

.method public genConcatSegmentVideoPath()V
    .locals 3

    .line 197
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->mWorkspace:Ljava/lang/String;

    const-string v2, "concat"

    invoke-static {v1, v2}, Lcom/ss/android/vesdk/runtime/VEResManager;->getFolder(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "concat"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ".mp4"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->mConcatSegmentVideoPath:Ljava/lang/String;

    .line 201
    return-void
.end method

.method public genSegmentAudioPath(I)Ljava/lang/String;
    .locals 3

    .line 142
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->mWorkspace:Ljava/lang/String;

    const-string v2, "segments"

    invoke-static {v1, v2}, Lcom/ss/android/vesdk/runtime/VEResManager;->getFolder(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ".wav"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 146
    return-object p1
.end method

.method public genSegmentVideoPath(I)Ljava/lang/String;
    .locals 3

    .line 93
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->mWorkspace:Ljava/lang/String;

    const-string v2, "segments"

    invoke-static {v1, v2}, Lcom/ss/android/vesdk/runtime/VEResManager;->getFolder(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ".mp4"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 97
    return-object p1
.end method

.method public getConcatSegmentAudioPath()Ljava/lang/String;
    .locals 1

    .line 220
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->mConcatSegmentAudioPath:Ljava/lang/String;

    return-object v0
.end method

.method public getConcatSegmentVideoPath()Ljava/lang/String;
    .locals 1

    .line 210
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->mConcatSegmentVideoPath:Ljava/lang/String;

    return-object v0
.end method

.method public getSegmentAudioPathList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 178
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->mSegmentAudioPathList:Ljava/util/List;

    return-object v0
.end method

.method public getSegmentDirPath()Ljava/lang/String;
    .locals 1

    .line 188
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->mSegmentDirPath:Ljava/lang/String;

    return-object v0
.end method

.method public getSegmentVideoPathList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 131
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->mSegmentVideoPathList:Ljava/util/List;

    return-object v0
.end method

.method public release()V
    .locals 2

    .line 75
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->mSegmentVideoPathList:Ljava/util/List;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 76
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->mSegmentVideoPathList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 77
    iput-object v1, p0, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->mSegmentVideoPathList:Ljava/util/List;

    .line 80
    :cond_0
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->mSegmentAudioPathList:Ljava/util/List;

    if-eqz v0, :cond_1

    .line 81
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->mSegmentAudioPathList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 82
    iput-object v1, p0, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->mSegmentAudioPathList:Ljava/util/List;

    .line 84
    :cond_1
    return-void
.end method
