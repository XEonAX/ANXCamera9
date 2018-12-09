.class final Lcom/android/camera/UserDefineWatermarkActivity$AllCapTransformationMethod;
.super Landroid/text/method/ReplacementTransformationMethod;
.source "UserDefineWatermarkActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/UserDefineWatermarkActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "AllCapTransformationMethod"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/UserDefineWatermarkActivity;


# direct methods
.method private constructor <init>(Lcom/android/camera/UserDefineWatermarkActivity;)V
    .locals 0

    .line 272
    iput-object p1, p0, Lcom/android/camera/UserDefineWatermarkActivity$AllCapTransformationMethod;->this$0:Lcom/android/camera/UserDefineWatermarkActivity;

    invoke-direct {p0}, Landroid/text/method/ReplacementTransformationMethod;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/camera/UserDefineWatermarkActivity;Lcom/android/camera/UserDefineWatermarkActivity$1;)V
    .locals 0

    .line 272
    invoke-direct {p0, p1}, Lcom/android/camera/UserDefineWatermarkActivity$AllCapTransformationMethod;-><init>(Lcom/android/camera/UserDefineWatermarkActivity;)V

    return-void
.end method


# virtual methods
.method protected getOriginal()[C
    .locals 1

    .line 275
    const/16 v0, 0x1a

    new-array v0, v0, [C

    fill-array-data v0, :array_0

    .line 277
    return-object v0

    :array_0
    .array-data 2
        0x61s
        0x62s
        0x63s
        0x64s
        0x65s
        0x66s
        0x67s
        0x68s
        0x69s
        0x6as
        0x6bs
        0x6cs
        0x6ds
        0x6es
        0x6fs
        0x70s
        0x71s
        0x72s
        0x73s
        0x74s
        0x75s
        0x76s
        0x77s
        0x78s
        0x79s
        0x7as
    .end array-data
.end method

.method protected getReplacement()[C
    .locals 1

    .line 282
    const/16 v0, 0x1a

    new-array v0, v0, [C

    fill-array-data v0, :array_0

    .line 284
    return-object v0

    :array_0
    .array-data 2
        0x41s
        0x42s
        0x43s
        0x44s
        0x45s
        0x46s
        0x47s
        0x48s
        0x49s
        0x4as
        0x4bs
        0x4cs
        0x4ds
        0x4es
        0x4fs
        0x50s
        0x51s
        0x52s
        0x53s
        0x54s
        0x55s
        0x56s
        0x57s
        0x58s
        0x59s
        0x5as
    .end array-data
.end method
