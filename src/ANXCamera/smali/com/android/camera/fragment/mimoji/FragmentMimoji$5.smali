.class Lcom/android/camera/fragment/mimoji/FragmentMimoji$5;
.super Ljava/lang/Object;
.source "FragmentMimoji.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/mimoji/FragmentMimoji;->showEditDialog(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/mimoji/FragmentMimoji;

.field final synthetic val$dialog:Landroid/app/AlertDialog;

.field final synthetic val$mimojiInfo:Lcom/android/camera/fragment/mimoji/MimojiInfo;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/mimoji/FragmentMimoji;Lcom/android/camera/fragment/mimoji/MimojiInfo;Landroid/app/AlertDialog;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$5;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimoji;

    iput-object p2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$5;->val$mimojiInfo:Lcom/android/camera/fragment/mimoji/MimojiInfo;

    iput-object p3, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$5;->val$dialog:Landroid/app/AlertDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$5;->val$mimojiInfo:Lcom/android/camera/fragment/mimoji/MimojiInfo;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$5;->val$mimojiInfo:Lcom/android/camera/fragment/mimoji/MimojiInfo;

    iget-object p1, p1, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mPackPath:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$5;->val$mimojiInfo:Lcom/android/camera/fragment/mimoji/MimojiInfo;

    iget-object p1, p1, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mPackPath:Ljava/lang/String;

    invoke-static {p1}, Lcom/android/camera/module/impl/component/FileUtils;->deleteFile(Ljava/lang/String;)Z

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$5;->val$dialog:Landroid/app/AlertDialog;

    invoke-virtual {p1}, Landroid/app/AlertDialog;->dismiss()V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$5;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimoji;

    const/4 v0, -0x1

    invoke-static {p1, v0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->access$202(Lcom/android/camera/fragment/mimoji/FragmentMimoji;I)I

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$5;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimoji;

    invoke-static {p1, v0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->access$102(Lcom/android/camera/fragment/mimoji/FragmentMimoji;I)I

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$5;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimoji;

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->access$300(Lcom/android/camera/fragment/mimoji/FragmentMimoji;)Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->setLongSelectIndex(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$5;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimoji;

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->access$300(Lcom/android/camera/fragment/mimoji/FragmentMimoji;)Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->setSelectIndex(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$5;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimoji;

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->access$300(Lcom/android/camera/fragment/mimoji/FragmentMimoji;)Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->notifyDataSetChanged()V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$5;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimoji;

    invoke-virtual {p1}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$5;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimoji;

    invoke-virtual {v0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0902b8

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/ToastUtils;->showToast(Landroid/content/Context;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$5;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimoji;

    invoke-virtual {p1}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->filelistToMinojiInfo()V

    :cond_0
    return-void
.end method
