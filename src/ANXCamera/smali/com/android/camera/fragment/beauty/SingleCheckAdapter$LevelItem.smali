.class public Lcom/android/camera/fragment/beauty/SingleCheckAdapter$LevelItem;
.super Ljava/lang/Object;
.source "SingleCheckAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/beauty/SingleCheckAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LevelItem"
.end annotation


# instance fields
.field private mText:Ljava/lang/String;

.field private mTextResource:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 224
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 225
    iput p1, p0, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$LevelItem;->mTextResource:I

    .line 226
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 227
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 228
    iput-object p1, p0, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$LevelItem;->mText:Ljava/lang/String;

    .line 229
    return-void
.end method

.method static synthetic access$100(Lcom/android/camera/fragment/beauty/SingleCheckAdapter$LevelItem;)Ljava/lang/String;
    .locals 0

    .line 220
    iget-object p0, p0, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$LevelItem;->mText:Ljava/lang/String;

    return-object p0
.end method


# virtual methods
.method public getText()Ljava/lang/String;
    .locals 1

    .line 237
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$LevelItem;->mText:Ljava/lang/String;

    return-object v0
.end method

.method public getTextResource()I
    .locals 1

    .line 233
    iget v0, p0, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$LevelItem;->mTextResource:I

    return v0
.end method
