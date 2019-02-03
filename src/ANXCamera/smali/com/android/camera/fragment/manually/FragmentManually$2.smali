.class Lcom/android/camera/fragment/manually/FragmentManually$2;
.super Ljava/lang/Object;
.source "FragmentManually.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/manually/FragmentManually;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/manually/FragmentManually;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/manually/FragmentManually;)V
    .locals 0

    .line 186
    iput-object p1, p0, Lcom/android/camera/fragment/manually/FragmentManually$2;->this$0:Lcom/android/camera/fragment/manually/FragmentManually;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 189
    iget-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManually$2;->this$0:Lcom/android/camera/fragment/manually/FragmentManually;

    invoke-static {v0}, Lcom/android/camera/fragment/manually/FragmentManually;->access$200(Lcom/android/camera/fragment/manually/FragmentManually;)Landroid/widget/ImageView;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 190
    iget-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManually$2;->this$0:Lcom/android/camera/fragment/manually/FragmentManually;

    invoke-static {v0}, Lcom/android/camera/fragment/manually/FragmentManually;->access$200(Lcom/android/camera/fragment/manually/FragmentManually;)Landroid/widget/ImageView;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 191
    return-void
.end method
