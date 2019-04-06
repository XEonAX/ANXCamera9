.class public Lcom/google/android/libraries/lens/lenslite/LensliteApi;
.super Ljava/lang/Object;
.source "LensliteApi.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "LensliteApi"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(Landroid/content/Context;Landroid/app/Activity;)Lcom/google/android/libraries/lens/lenslite/LensliteApi;
    .locals 3

    const-string v0, "LensliteApi"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "create: context = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ", activity = "

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public getUiController()Lcom/google/android/libraries/lens/lenslite/LensliteUiController;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public onNewImage(Landroid/media/Image;I)V
    .locals 0

    return-void
.end method

.method public onPause()V
    .locals 0

    return-void
.end method

.method public onResume()V
    .locals 0

    return-void
.end method

.method public onStart(Lcom/google/android/libraries/lens/lenslite/LensliteUiContainer;I)V
    .locals 0

    return-void
.end method

.method public onStop()V
    .locals 0

    return-void
.end method
