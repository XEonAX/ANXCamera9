.class Lcom/android/camera/BasePreferenceActivity$4;
.super Ljava/lang/Object;
.source "BasePreferenceActivity.java"

# interfaces
.implements Lcom/android/camera/lib/compatibility/util/CompatibilityUtils$PackageInstallerListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/BasePreferenceActivity;
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

    .line 586
    iput-object p1, p0, Lcom/android/camera/BasePreferenceActivity$4;->this$0:Lcom/android/camera/BasePreferenceActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPackageInstalled(Ljava/lang/String;Z)V
    .locals 1

    .line 589
    if-eqz p2, :cond_0

    const-string p2, "com.xiaomi.scanner"

    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 590
    iget-object p1, p0, Lcom/android/camera/BasePreferenceActivity$4;->this$0:Lcom/android/camera/BasePreferenceActivity;

    iget-object p1, p1, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string p2, "pref_scan_qrcode_key"

    .line 591
    invoke-virtual {p1, p2}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    check-cast p1, Landroid/preference/CheckBoxPreference;

    .line 592
    if-eqz p1, :cond_0

    .line 593
    iget-object p2, p0, Lcom/android/camera/BasePreferenceActivity$4;->this$0:Lcom/android/camera/BasePreferenceActivity;

    new-instance v0, Lcom/android/camera/BasePreferenceActivity$4$1;

    invoke-direct {v0, p0, p1}, Lcom/android/camera/BasePreferenceActivity$4$1;-><init>(Lcom/android/camera/BasePreferenceActivity$4;Landroid/preference/CheckBoxPreference;)V

    invoke-virtual {p2, v0}, Lcom/android/camera/BasePreferenceActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 602
    :cond_0
    return-void
.end method
