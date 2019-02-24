.class public Lcom/android/camera/CameraPreferenceActivity;
.super Lcom/android/camera/BasePreferenceActivity;
.source "CameraPreferenceActivity.java"


# static fields
.field public static final IS_IMAGE_CAPTURE_INTENT:Ljava/lang/String; = "IsCaptureIntent"


# instance fields
.field private mDoubleConfirmActionChooseDialog:Landroid/app/AlertDialog;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 18
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;-><init>()V

    .line 81
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/CameraPreferenceActivity;->mDoubleConfirmActionChooseDialog:Landroid/app/AlertDialog;

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/CameraPreferenceActivity;)Landroid/app/AlertDialog;
    .locals 0

    .line 18
    iget-object p0, p0, Lcom/android/camera/CameraPreferenceActivity;->mDoubleConfirmActionChooseDialog:Landroid/app/AlertDialog;

    return-object p0
.end method

.method static synthetic access$002(Lcom/android/camera/CameraPreferenceActivity;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;
    .locals 0

    .line 18
    iput-object p1, p0, Lcom/android/camera/CameraPreferenceActivity;->mDoubleConfirmActionChooseDialog:Landroid/app/AlertDialog;

    return-object p1
.end method

.method private bringUpDoubleConfirmDlg(Lcom/android/camera/ui/PreviewListPreference;Ljava/lang/String;)V
    .locals 1

    .line 84
    iget-object v0, p0, Lcom/android/camera/CameraPreferenceActivity;->mDoubleConfirmActionChooseDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    .line 85
    return-void

    .line 88
    :cond_0
    new-instance v0, Lcom/android/camera/CameraPreferenceActivity$1;

    invoke-direct {v0, p0, p2, p1}, Lcom/android/camera/CameraPreferenceActivity$1;-><init>(Lcom/android/camera/CameraPreferenceActivity;Ljava/lang/String;Lcom/android/camera/ui/PreviewListPreference;)V

    invoke-static {v0}, Lcom/android/camera2/DetachableClickListener;->wrap(Landroid/content/DialogInterface$OnClickListener;)Lcom/android/camera2/DetachableClickListener;

    move-result-object p1

    .line 106
    new-instance p2, Landroid/app/AlertDialog$Builder;

    invoke-direct {p2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v0, 0x7f0901b3

    .line 107
    invoke-virtual {p2, v0}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    const v0, 0x7f0901b4

    .line 108
    invoke-virtual {p2, v0}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    const v0, 0x7f0901b5

    .line 109
    invoke-virtual {p2, v0, p1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    const v0, 0x7f0901b6

    .line 110
    invoke-virtual {p2, v0, p1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    const/4 v0, 0x0

    .line 111
    invoke-virtual {p2, v0}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    invoke-virtual {p2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p2

    iput-object p2, p0, Lcom/android/camera/CameraPreferenceActivity;->mDoubleConfirmActionChooseDialog:Landroid/app/AlertDialog;

    .line 112
    iget-object p2, p0, Lcom/android/camera/CameraPreferenceActivity;->mDoubleConfirmActionChooseDialog:Landroid/app/AlertDialog;

    invoke-virtual {p1, p2}, Lcom/android/camera2/DetachableClickListener;->clearOnDetach(Landroid/app/Dialog;)V

    .line 113
    iget-object p1, p0, Lcom/android/camera/CameraPreferenceActivity;->mDoubleConfirmActionChooseDialog:Landroid/app/AlertDialog;

    invoke-virtual {p1}, Landroid/app/AlertDialog;->show()V

    .line 114
    return-void
.end method


# virtual methods
.method public changeRequestOrientation()V
    .locals 1

    .line 71
    invoke-static {}, Lcom/mi/config/b;->hL()Z

    move-result v0

    if-nez v0, :cond_0

    .line 72
    return-void

    .line 74
    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 75
    const/4 v0, 0x7

    invoke-virtual {p0, v0}, Lcom/android/camera/CameraPreferenceActivity;->setRequestedOrientation(I)V

    goto :goto_0

    .line 77
    :cond_1
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/CameraPreferenceActivity;->setRequestedOrientation(I)V

    .line 79
    :goto_0
    return-void
.end method

.method protected getPreferenceXml()I
    .locals 1

    .line 23
    const/high16 v0, 0x7f070000

    return v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 62
    invoke-super {p0, p1}, Lcom/android/camera/BasePreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    # .line 63
    # invoke-virtual {p0}, Lcom/android/camera/CameraPreferenceActivity;->getIntent()Landroid/content/Intent;

    # move-result-object p1

    # const-string v0, ":miui:starting_window_label"

    # invoke-virtual {p1, v0}, Landroid/content/Intent;->getCharSequenceExtra(Ljava/lang/String;)Ljava/lang/CharSequence;

    # move-result-object p1

    # if-eqz p1, :cond_0

    # .line 64
    # invoke-virtual {p0}, Lcom/android/camera/CameraPreferenceActivity;->getActionBar()Lmiui/app/ActionBar;

    # move-result-object p1

    # const v0, 0x7f090045

    # invoke-virtual {p1, v0}, Lmiui/app/ActionBar;->setTitle(I)V

    .line 67
    # :cond_0
    invoke-virtual {p0}, Lcom/android/camera/CameraPreferenceActivity;->changeRequestOrientation()V

    .line 68
    return-void
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 5

    .line 33
    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v0

    const-string v1, "pref_camera_snap_key"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    if-eqz p2, :cond_3

    .line 35
    invoke-virtual {p0}, Lcom/android/camera/CameraPreferenceActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "volumekey_wake_screen"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 37
    const p1, 0x7f09018d

    invoke-static {p0, p1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p1

    .line 38
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 39
    return v2

    .line 41
    :cond_0
    const v0, 0x7f09018a

    invoke-virtual {p0, v0}, Lcom/android/camera/CameraPreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const v0, 0x7f09018b

    .line 42
    invoke-virtual {p0, v0}, Lcom/android/camera/CameraPreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 43
    :cond_1
    const-string v0, "public_transportation_shortcuts"

    .line 44
    invoke-virtual {p0}, Lcom/android/camera/CameraPreferenceActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "key_long_press_volume_down"

    invoke-static {v3, v4}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 43
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 46
    check-cast p1, Lcom/android/camera/ui/PreviewListPreference;

    check-cast p2, Ljava/lang/String;

    invoke-direct {p0, p1, p2}, Lcom/android/camera/CameraPreferenceActivity;->bringUpDoubleConfirmDlg(Lcom/android/camera/ui/PreviewListPreference;Ljava/lang/String;)V

    .line 47
    return v2

    .line 50
    :cond_2
    invoke-virtual {p0}, Lcom/android/camera/CameraPreferenceActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    const-string v0, "key_long_press_volume_down"

    move-object v2, p2

    check-cast v2, Ljava/lang/String;

    .line 52
    invoke-static {v2}, Lcom/android/camera/CameraSettings;->getMiuiSettingsKeyForStreetSnap(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 50
    invoke-static {p1, v0, v2}, Landroid/provider/Settings$Secure;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 53
    const-string p1, "pref_camera_snap_key"

    invoke-static {p1, p2}, Lcom/android/camera/statistic/CameraStatUtil;->trackPreferenceChange(Ljava/lang/String;Ljava/lang/Object;)V

    .line 54
    return v1

    .line 56
    :cond_3
    invoke-super {p0, p1, p2}, Lcom/android/camera/BasePreferenceActivity;->onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method protected onSettingChanged(I)V
    .locals 1

    .line 28
    sget-object v0, Lcom/android/camera/CameraSettings;->sCameraChangeManager:Lcom/android/camera/ChangeManager;

    invoke-virtual {v0, p1}, Lcom/android/camera/ChangeManager;->request(I)V

    .line 29
    return-void
.end method
