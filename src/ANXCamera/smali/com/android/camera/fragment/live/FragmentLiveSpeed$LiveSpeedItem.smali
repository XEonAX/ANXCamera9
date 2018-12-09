.class Lcom/android/camera/fragment/live/FragmentLiveSpeed$LiveSpeedItem;
.super Ljava/lang/Object;
.source "FragmentLiveSpeed.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/live/FragmentLiveSpeed;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "LiveSpeedItem"
.end annotation


# instance fields
.field mTextId:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 126
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 127
    iput p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSpeed$LiveSpeedItem;->mTextId:I

    .line 128
    return-void
.end method


# virtual methods
.method public getTextId()I
    .locals 1

    .line 131
    iget v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSpeed$LiveSpeedItem;->mTextId:I

    return v0
.end method
