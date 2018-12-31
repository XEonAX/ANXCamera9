.class Lcom/android/camera/BasePreferenceActivity$1;
.super Ljava/lang/Object;
.source "BasePreferenceActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/BasePreferenceActivity;->onPreferenceClick(Landroid/preference/Preference;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/BasePreferenceActivity;


# direct methods
.method constructor <init>(Lcom/android/camera/BasePreferenceActivity;)V
    .locals 0

    .line 495
    iput-object p1, p0, Lcom/android/camera/BasePreferenceActivity$1;->this$0:Lcom/android/camera/BasePreferenceActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 498
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity$1;->this$0:Lcom/android/camera/BasePreferenceActivity;

    invoke-static {v0}, Lcom/android/camera/BasePreferenceActivity;->access$000(Lcom/android/camera/BasePreferenceActivity;)V

    .line 499
    return-void
.end method
