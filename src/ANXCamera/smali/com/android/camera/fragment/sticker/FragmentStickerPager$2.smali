.class Lcom/android/camera/fragment/sticker/FragmentStickerPager$2;
.super Ljava/lang/Object;
.source "FragmentStickerPager.java"

# interfaces
.implements Lcom/android/camera/network/net/base/ResponseListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/sticker/FragmentStickerPager;->loadData()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/sticker/FragmentStickerPager;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/sticker/FragmentStickerPager;)V
    .locals 0

    .line 130
    iput-object p1, p0, Lcom/android/camera/fragment/sticker/FragmentStickerPager$2;->this$0:Lcom/android/camera/fragment/sticker/FragmentStickerPager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs onResponse([Ljava/lang/Object;)V
    .locals 4

    .line 133
    const/4 v0, 0x0

    aget-object p1, p1, v0

    check-cast p1, Ljava/util/List;

    .line 134
    iget-object v1, p0, Lcom/android/camera/fragment/sticker/FragmentStickerPager$2;->this$0:Lcom/android/camera/fragment/sticker/FragmentStickerPager;

    invoke-static {v1, p1}, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->access$400(Lcom/android/camera/fragment/sticker/FragmentStickerPager;Ljava/util/List;)V

    .line 135
    iget-object v1, p0, Lcom/android/camera/fragment/sticker/FragmentStickerPager$2;->this$0:Lcom/android/camera/fragment/sticker/FragmentStickerPager;

    invoke-static {v1, p1}, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->access$500(Lcom/android/camera/fragment/sticker/FragmentStickerPager;Ljava/util/List;)V

    .line 136
    const-string v1, "FragmentStickerPager"

    const-string v2, "getStickerList %d "

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    if-nez p1, :cond_0

    const/4 p1, -0x1

    goto :goto_0

    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    :goto_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v3, v0

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 137
    return-void
.end method

.method public onResponseError(Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 3

    .line 141
    iget-object p3, p0, Lcom/android/camera/fragment/sticker/FragmentStickerPager$2;->this$0:Lcom/android/camera/fragment/sticker/FragmentStickerPager;

    const/4 v0, 0x0

    invoke-static {p3, v0}, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->access$500(Lcom/android/camera/fragment/sticker/FragmentStickerPager;Ljava/util/List;)V

    .line 142
    const-string p3, "FragmentStickerPager"

    const-string v0, "errorCode %d msg:%s"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    iget p1, p1, Lcom/android/camera/network/net/base/ErrorCode;->CODE:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 p1, 0x1

    aput-object p2, v1, p1

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p3, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    return-void
.end method
