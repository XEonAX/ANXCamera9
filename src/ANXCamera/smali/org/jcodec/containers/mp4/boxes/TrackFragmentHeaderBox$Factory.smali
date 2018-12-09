.class public Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox$Factory;
.super Ljava/lang/Object;
.source "TrackFragmentHeaderBox.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Factory"
.end annotation


# instance fields
.field private box:Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;)V
    .locals 0

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    iput-object p1, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox$Factory;->box:Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;

    .line 72
    return-void
.end method


# virtual methods
.method public baseDataOffset(J)Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox$Factory;
    .locals 2

    .line 75
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox$Factory;->box:Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;

    iget v1, v0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->flags:I

    or-int/lit8 v1, v1, 0x1

    iput v1, v0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->flags:I

    .line 76
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox$Factory;->box:Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;

    long-to-int p1, p1

    int-to-long p1, p1

    invoke-static {v0, p1, p2}, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->access$002(Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;J)J

    .line 77
    return-object p0
.end method

.method public create()Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;
    .locals 2

    .line 106
    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox$Factory;->box:Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 108
    iput-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox$Factory;->box:Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;

    return-object v1

    :catchall_0
    move-exception v1

    iput-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox$Factory;->box:Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;

    throw v1
.end method

.method public defaultSampleDuration(J)Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox$Factory;
    .locals 2

    .line 87
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox$Factory;->box:Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;

    iget v1, v0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->flags:I

    or-int/lit8 v1, v1, 0x8

    iput v1, v0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->flags:I

    .line 88
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox$Factory;->box:Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;

    long-to-int p1, p1

    invoke-static {v0, p1}, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->access$202(Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;I)I

    .line 89
    return-object p0
.end method

.method public defaultSampleFlags(J)Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox$Factory;
    .locals 2

    .line 99
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox$Factory;->box:Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;

    iget v1, v0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->flags:I

    or-int/lit8 v1, v1, 0x20

    iput v1, v0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->flags:I

    .line 100
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox$Factory;->box:Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;

    long-to-int p1, p1

    invoke-static {v0, p1}, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->access$402(Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;I)I

    .line 101
    return-object p0
.end method

.method public defaultSampleSize(J)Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox$Factory;
    .locals 2

    .line 93
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox$Factory;->box:Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;

    iget v1, v0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->flags:I

    or-int/lit8 v1, v1, 0x10

    iput v1, v0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->flags:I

    .line 94
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox$Factory;->box:Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;

    long-to-int p1, p1

    invoke-static {v0, p1}, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->access$302(Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;I)I

    .line 95
    return-object p0
.end method

.method public sampleDescriptionIndex(J)Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox$Factory;
    .locals 2

    .line 81
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox$Factory;->box:Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;

    iget v1, v0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->flags:I

    or-int/lit8 v1, v1, 0x2

    iput v1, v0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->flags:I

    .line 82
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox$Factory;->box:Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;

    long-to-int p1, p1

    invoke-static {v0, p1}, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->access$102(Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;I)I

    .line 83
    return-object p0
.end method
