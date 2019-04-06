.class Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$3;
.super Ljava/lang/Object;
.source "FragmentMimojiEdit.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->updateThumbnail()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

.field final synthetic val$list:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;Ljava/util/ArrayList;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$3;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

    iput-object p2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$3;->val$list:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$3;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

    invoke-static {v0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->access$200(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$3;->val$list:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->refreshData(Ljava/util/List;)V

    return-void
.end method
