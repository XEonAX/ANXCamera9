.class Lcom/android/camera/fragment/fullscreen/FragmentFullScreen$14;
.super Ljava/lang/Object;
.source "FragmentFullScreen.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/fullscreen/FragmentFullScreen;->showShareSheet()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/android/camera/fragment/fullscreen/ShareInfo;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/fullscreen/FragmentFullScreen;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/fullscreen/FragmentFullScreen;)V
    .locals 0

    .line 961
    iput-object p1, p0, Lcom/android/camera/fragment/fullscreen/FragmentFullScreen$14;->this$0:Lcom/android/camera/fragment/fullscreen/FragmentFullScreen;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/android/camera/fragment/fullscreen/ShareInfo;Lcom/android/camera/fragment/fullscreen/ShareInfo;)I
    .locals 2

    .line 964
    iget v0, p1, Lcom/android/camera/fragment/fullscreen/ShareInfo;->index:I

    iget v1, p2, Lcom/android/camera/fragment/fullscreen/ShareInfo;->index:I

    if-ne v0, v1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    .line 965
    :cond_0
    iget p1, p1, Lcom/android/camera/fragment/fullscreen/ShareInfo;->index:I

    iget p2, p2, Lcom/android/camera/fragment/fullscreen/ShareInfo;->index:I

    if-le p1, p2, :cond_1

    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, -0x1

    .line 964
    :goto_0
    return p1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 961
    check-cast p1, Lcom/android/camera/fragment/fullscreen/ShareInfo;

    check-cast p2, Lcom/android/camera/fragment/fullscreen/ShareInfo;

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/fullscreen/FragmentFullScreen$14;->compare(Lcom/android/camera/fragment/fullscreen/ShareInfo;Lcom/android/camera/fragment/fullscreen/ShareInfo;)I

    move-result p1

    return p1
.end method
