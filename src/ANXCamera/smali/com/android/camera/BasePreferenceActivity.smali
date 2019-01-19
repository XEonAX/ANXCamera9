.class public abstract Lcom/android/camera/BasePreferenceActivity;
.super Landroid/preference/PreferenceActivity;
.source "BasePreferenceActivity.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;
.implements Landroid/preference/Preference$OnPreferenceClickListener;


# static fields
.field public static final FROM_WHERE:Ljava/lang/String; = "from_where"

.field private static final PREF_KEY_PRIVACY:Ljava/lang/String; = "pref_privacy"

.field private static final PREF_KEY_RESTORE:Ljava/lang/String; = "pref_restore"

.field public static final REMOVE_KEYS:Ljava/lang/String; = "remove_keys"

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mAppInstalledListener:Lcom/android/camera/lib/compatibility/util/CompatibilityUtils$PackageInstallerListener;

.field private mFromWhere:I

.field private mGoToActivity:Z

.field private mHasReset:Z

.field protected mPreferenceGroup:Landroid/preference/PreferenceScreen;

.field protected mPreferences:Lcom/android/camera/preferences/CameraSettingPreferences;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 51
    const-class v0, Lcom/android/camera/BasePreferenceActivity;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/BasePreferenceActivity;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 45
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    .line 585
    new-instance v0, Lcom/android/camera/BasePreferenceActivity$4;

    invoke-direct {v0, p0}, Lcom/android/camera/BasePreferenceActivity$4;-><init>(Lcom/android/camera/BasePreferenceActivity;)V

    iput-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mAppInstalledListener:Lcom/android/camera/lib/compatibility/util/CompatibilityUtils$PackageInstallerListener;

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/BasePreferenceActivity;)V
    .locals 0

    .line 45
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->restorePreferences()V

    return-void
.end method

.method static synthetic access$100(Lcom/android/camera/BasePreferenceActivity;)V
    .locals 0

    .line 45
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->installQRCodeReceiver()V

    return-void
.end method

.method static synthetic access$200()Ljava/lang/String;
    .locals 1

    .line 45
    sget-object v0, Lcom/android/camera/BasePreferenceActivity;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lcom/android/camera/BasePreferenceActivity;)Lcom/android/camera/lib/compatibility/util/CompatibilityUtils$PackageInstallerListener;
    .locals 0

    .line 45
    iget-object p0, p0, Lcom/android/camera/BasePreferenceActivity;->mAppInstalledListener:Lcom/android/camera/lib/compatibility/util/CompatibilityUtils$PackageInstallerListener;

    return-object p0
.end method

.method private filterByCloud()V
    .locals 3

    .line 250
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataCloudMgr()Lcom/android/camera/data/cloud/DataCloud$CloudManager;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/cloud/DataCloud$CloudManager;->DataCloudFeature()Lcom/android/camera/data/cloud/DataCloud$CloudFeature;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/cloud/DataCloud$CloudFeature;->getAllDisabledFeatures()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 251
    iget-object v2, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    invoke-virtual {p0, v2, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 252
    goto :goto_0

    .line 253
    :cond_0
    return-void
.end method

.method private filterByConfig()V
    .locals 6

    .line 116
    sget-object v0, Lcom/android/camera/BasePreferenceActivity;->TAG:Ljava/lang/String;

    const-string v1, "filterByConfig:"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 117
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "category_device_setting"

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 118
    iget-object v1, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v2, "category_camera_setting"

    invoke-virtual {v1, v2}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    .line 120
    iget v2, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    const/16 v3, 0xa1

    if-eq v2, v3, :cond_2

    iget v2, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    const/16 v3, 0xae

    if-eq v2, v3, :cond_2

    iget v2, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    const/16 v3, 0xa9

    if-eq v2, v3, :cond_2

    iget v2, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    const/16 v3, 0xa8

    if-eq v2, v3, :cond_2

    iget v2, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    const/16 v3, 0xac

    if-eq v2, v3, :cond_2

    iget v2, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    const/16 v3, 0xaa

    if-ne v2, v3, :cond_0

    goto :goto_1

    .line 131
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mi/config/a;->fr()Z

    move-result v2

    .line 132
    sget-object v3, Lcom/android/camera/BasePreferenceActivity;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "filterByConfig: isSupportVideoFrontMirror = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 134
    if-eqz v2, :cond_1

    .line 135
    const-string v0, "pref_front_mirror_key"

    invoke-direct {p0, v1, v0}, Lcom/android/camera/BasePreferenceActivity;->removeFromGroup(Landroid/preference/Preference;Ljava/lang/String;)V

    goto :goto_0

    .line 137
    :cond_1
    const-string v1, "pref_front_mirror_key"

    invoke-direct {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removeFromGroup(Landroid/preference/Preference;Ljava/lang/String;)V

    .line 139
    :goto_0
    return-void

    .line 126
    :cond_2
    :goto_1
    const-string v2, "pref_front_mirror_key"

    invoke-direct {p0, v0, v2}, Lcom/android/camera/BasePreferenceActivity;->removeFromGroup(Landroid/preference/Preference;Ljava/lang/String;)V

    .line 127
    const-string v0, "pref_front_mirror_key"

    invoke-direct {p0, v1, v0}, Lcom/android/camera/BasePreferenceActivity;->removeFromGroup(Landroid/preference/Preference;Ljava/lang/String;)V

    .line 128
    return-void
.end method

.method private filterByDeviceCapability()V
    .locals 6

    .line 223
    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    const/16 v1, 0xac

    if-ne v0, v1, :cond_2

    .line 224
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigSlowMotion()Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;->isSlowMotionFps960()Z

    move-result v0

    .line 225
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigSlowMotion()Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;->isSlowMotionFps120()Z

    move-result v1

    .line 227
    iget-object v2, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v3, "pref_video_new_slow_motion_key"

    invoke-virtual {v2, v3}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Lcom/android/camera/ui/PreviewListPreference;

    .line 228
    const/4 v3, 0x0

    invoke-static {v3}, Lcom/android/camera/CameraSettings;->getSupportedHfrSettings(I)Ljava/util/ArrayList;

    move-result-object v4

    .line 229
    const-string v5, "1920x1080:240"

    invoke-interface {v4, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    .line 230
    const/4 v5, 0x1

    if-nez v4, :cond_1

    if-nez v1, :cond_1

    .line 231
    new-array v1, v5, [Ljava/lang/String;

    const/4 v4, 0x5

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v1, v3

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v2, v1}, Lcom/android/camera/ui/PreviewListPreference;->filterUnsupported(Ljava/util/List;)V

    .line 232
    invoke-direct {p0, v2}, Lcom/android/camera/BasePreferenceActivity;->resetIfInvalid(Landroid/preference/ListPreference;)V

    .line 233
    if-eqz v0, :cond_0

    const v0, 0x7f09002f

    goto :goto_0

    .line 234
    :cond_0
    const v0, 0x7f09002e

    .line 233
    :goto_0
    invoke-virtual {v2, v0}, Lcom/android/camera/ui/PreviewListPreference;->setSummary(I)V

    .line 235
    invoke-virtual {v2, v3}, Lcom/android/camera/ui/PreviewListPreference;->setEnabled(Z)V

    goto :goto_1

    .line 237
    :cond_1
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    .line 238
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v3, 0x7f0e0009

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    .line 237
    invoke-virtual {p0, v0, v2, v1}, Lcom/android/camera/BasePreferenceActivity;->filterUnsupportedOptions(Landroid/preference/PreferenceGroup;Lcom/android/camera/ui/PreviewListPreference;Ljava/util/List;)V

    .line 239
    invoke-virtual {v2, v5}, Lcom/android/camera/ui/PreviewListPreference;->setEnabled(Z)V

    .line 242
    :cond_2
    :goto_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fs()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 243
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_video_hfr_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    goto :goto_2

    .line 245
    :cond_3
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_video_new_slow_motion_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 247
    :goto_2
    return-void
.end method

.method private filterByDeviceID()V
    .locals 2

    .line 354
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    .line 356
    invoke-static {}, Lcom/mi/config/b;->gq()Z

    move-result v0

    if-nez v0, :cond_0

    .line 357
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_video_hfr_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 361
    :cond_0
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_long_press_shutter_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 364
    invoke-static {}, Lcom/mi/config/b;->fS()Z

    move-result v0

    if-nez v0, :cond_1

    .line 365
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_movie_solid_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 368
    :cond_1
    invoke-static {}, Lcom/mi/config/b;->ge()Z

    move-result v0

    if-nez v0, :cond_2

    .line 369
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_watermark_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 372
    :cond_2
    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportedDualCameraWaterMark()Z

    move-result v0

    if-nez v0, :cond_3

    .line 373
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_dualcamera_watermark"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 376
    :cond_3
    invoke-static {}, Lcom/mi/config/b;->fW()Z

    move-result v0

    if-nez v0, :cond_4

    .line 377
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camerasound_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 380
    :cond_4
    invoke-static {}, Lcom/mi/config/b;->gb()Z

    move-result v0

    if-nez v0, :cond_5

    .line 381
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_recordlocation_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 384
    :cond_5
    invoke-static {}, Lcom/mi/config/b;->isPad()Z

    move-result v0

    if-nez v0, :cond_6

    sget-boolean v0, Lcom/mi/config/b;->pN:Z

    if-eqz v0, :cond_7

    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 385
    :cond_6
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_picturesize_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 388
    :cond_7
    invoke-static {}, Lcom/android/camera/storage/Storage;->hasSecondaryStorage()Z

    move-result v0

    if-nez v0, :cond_8

    .line 389
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_priority_storage"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 392
    :cond_8
    invoke-static {}, Lcom/mi/config/b;->gr()Z

    move-result v0

    if-nez v0, :cond_9

    .line 393
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_auto_chroma_flash_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 396
    :cond_9
    invoke-static {}, Lcom/mi/config/b;->fY()Z

    move-result v0

    if-nez v0, :cond_a

    .line 397
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_long_press_shutter_feature_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 400
    :cond_a
    invoke-static {}, Lcom/mi/config/b;->gs()Z

    move-result v0

    if-nez v0, :cond_b

    .line 401
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_capture_when_stable_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 404
    :cond_b
    invoke-static {}, Lcom/mi/config/b;->gC()Z

    move-result v0

    if-nez v0, :cond_c

    .line 405
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_asd_night_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 408
    :cond_c
    invoke-static {}, Lcom/mi/config/b;->ha()Z

    move-result v0

    if-nez v0, :cond_d

    .line 409
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_snap_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 412
    :cond_d
    invoke-static {}, Lcom/mi/config/b;->hs()Z

    move-result v0

    if-nez v0, :cond_e

    .line 413
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_groupshot_with_primitive_picture_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 416
    :cond_e
    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportedPortrait()Z

    move-result v0

    if-nez v0, :cond_f

    .line 417
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_portrait_with_facebeauty_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 420
    :cond_f
    invoke-static {}, Lcom/mi/config/b;->isSupportedOpticalZoom()Z

    move-result v0

    if-nez v0, :cond_10

    invoke-static {}, Lcom/mi/config/b;->isSupportedPortrait()Z

    move-result v0

    if-nez v0, :cond_10

    .line 421
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_dual_enable_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 423
    :cond_10
    invoke-static {}, Lcom/mi/config/b;->isSupportedOpticalZoom()Z

    move-result v0

    if-nez v0, :cond_11

    .line 424
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_dual_sat_enable_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 427
    :cond_11
    invoke-static {}, Lcom/mi/config/b;->isSupportSuperResolution()Z

    move-result v0

    if-nez v0, :cond_12

    .line 428
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_super_resolution_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 431
    :cond_12
    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportParallelProcess()Z

    move-result v0

    if-nez v0, :cond_13

    .line 432
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_parallel_process_enable_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 435
    :cond_13
    invoke-static {}, Lcom/mi/config/b;->gL()Z

    move-result v0

    if-eqz v0, :cond_14

    .line 436
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_facedetection_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 437
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_facedetection_auto_hidden_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 438
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_parallel_process_enable_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 439
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_dual_enable_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 440
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_dual_sat_enable_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 441
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_front_mirror_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 442
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_qc_camera_sharpness_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 443
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_qc_camera_contrast_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 444
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_qc_camera_saturation_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 445
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_autoexposure_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 448
    :cond_14
    invoke-static {}, Lcom/android/camera/ProximitySensorLock;->supported()Z

    move-result v0

    if-nez v0, :cond_15

    .line 449
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_proximity_lock_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 452
    :cond_15
    invoke-static {}, Lcom/mi/config/b;->hE()Z

    move-result v0

    if-nez v0, :cond_16

    .line 453
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_fingerprint_capture_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 456
    :cond_16
    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->shouldNormalWideLDCBeVisibleInMode(I)Z

    move-result v0

    if-eqz v0, :cond_17

    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    .line 457
    invoke-static {v0}, Lcom/android/camera/CameraSettings;->isUltraWideConfigOpen(I)Z

    move-result v0

    if-nez v0, :cond_17

    .line 458
    invoke-static {}, Lcom/android/camera/CameraSettings;->isRearMenuUltraPixelPhotographyOn()Z

    move-result v0

    if-nez v0, :cond_17

    .line 459
    invoke-static {}, Lcom/android/camera/CameraSettings;->isUltraPixelPhotographyOn()Z

    move-result v0

    if-eqz v0, :cond_18

    .line 460
    :cond_17
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_normal_wide_ldc_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 464
    :cond_18
    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->shouldUltraWideLDCBeVisibleInMode(I)Z

    move-result v0

    if-eqz v0, :cond_19

    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    .line 465
    invoke-static {v0}, Lcom/android/camera/CameraSettings;->isUltraWideConfigOpen(I)Z

    move-result v0

    if-nez v0, :cond_1a

    .line 466
    :cond_19
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_ultra_wide_ldc_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 470
    :cond_1a
    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->shouldUltraWideVideoLDCBeVisibleInMode(I)Z

    move-result v0

    if-eqz v0, :cond_1b

    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    .line 471
    invoke-static {v0}, Lcom/android/camera/CameraSettings;->isUltraWideConfigOpen(I)Z

    move-result v0

    if-nez v0, :cond_1c

    .line 472
    :cond_1b
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_ultra_wide_video_ldc_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 474
    :cond_1c
    return-void
.end method

.method private filterByFrom()V
    .locals 10

    .line 291
    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    const/16 v1, 0xaa

    const/16 v2, 0xac

    const/16 v3, 0xa8

    const/16 v4, 0xa9

    const/16 v5, 0xa2

    const/16 v6, 0xa1

    const/16 v7, 0xa6

    const/16 v8, 0xae

    const/16 v9, 0xa3

    if-eq v0, v9, :cond_3

    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    const/16 v9, 0xa5

    if-eq v0, v9, :cond_3

    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    if-eq v0, v7, :cond_3

    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    const/16 v9, 0xa7

    if-eq v0, v9, :cond_3

    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    const/16 v9, 0xad

    if-eq v0, v9, :cond_3

    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    const/16 v9, 0xab

    if-ne v0, v9, :cond_0

    goto :goto_1

    .line 301
    :cond_0
    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    if-eq v0, v6, :cond_1

    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    if-eq v0, v8, :cond_1

    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    if-eq v0, v5, :cond_1

    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    if-eq v0, v4, :cond_1

    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    if-eq v0, v3, :cond_1

    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    if-eq v0, v2, :cond_1

    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    if-ne v0, v1, :cond_4

    .line 309
    :cond_1
    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    if-ne v0, v8, :cond_2

    .line 310
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v9, "pref_video_volumekey_function_key"

    invoke-virtual {p0, v0, v9}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    goto :goto_0

    .line 312
    :cond_2
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v9, "pref_live_volumekey_function_key"

    invoke-virtual {p0, v0, v9}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 314
    :goto_0
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v9, "pref_camera_volumekey_function_key"

    invoke-virtual {p0, v0, v9}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 315
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->removeNonVideoPreference()V

    .line 316
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->removeIncompatibleVideoPreference()V

    .line 317
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v9, "pref_camera_autoexposure_key"

    invoke-virtual {p0, v0, v9}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    goto :goto_2

    .line 297
    :cond_3
    :goto_1
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v9, "pref_video_volumekey_function_key"

    invoke-virtual {p0, v0, v9}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 298
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v9, "pref_live_volumekey_function_key"

    invoke-virtual {p0, v0, v9}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 299
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v9, "category_camcorder_setting"

    invoke-virtual {p0, v0, v9}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 300
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v9, "pref_video_autoexposure_key"

    invoke-virtual {p0, v0, v9}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 320
    :cond_4
    :goto_2
    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    if-eq v0, v6, :cond_5

    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    if-eq v0, v8, :cond_5

    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    if-eq v0, v5, :cond_5

    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    if-eq v0, v4, :cond_5

    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    if-eq v0, v3, :cond_5

    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    if-eq v0, v1, :cond_5

    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    if-eq v0, v2, :cond_5

    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    if-ne v0, v7, :cond_6

    .line 328
    :cond_5
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->removeIncompatibleAdvancePreference()V

    .line 330
    :cond_6
    return-void
.end method

.method private filterByPreference()V
    .locals 4

    .line 165
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_video_quality_key"

    .line 166
    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/PreviewListPreference;

    .line 167
    if-eqz v0, :cond_2

    .line 168
    iget v1, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    .line 169
    invoke-static {v1}, Lcom/android/camera/CameraSettings;->getSupportedVideoQuality(I)Ljava/util/ArrayList;

    move-result-object v1

    .line 170
    iget-object v2, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    invoke-virtual {p0, v2, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->filterUnsupportedOptions(Landroid/preference/PreferenceGroup;Lcom/android/camera/ui/PreviewListPreference;Ljava/util/List;)V

    .line 173
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v2, "pref_video_quality_key_extra"

    .line 174
    invoke-virtual {v0, v2}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/PreviewListPreference;

    .line 175
    if-eqz v0, :cond_1

    iget v2, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    const/16 v3, 0xa2

    if-ne v2, v3, :cond_1

    .line 176
    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoBokehOn()Z

    move-result v2

    if-nez v2, :cond_0

    .line 177
    invoke-static {}, Lcom/android/camera/CameraSettings;->getFaceBeautifyValue()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/android/camera/constant/BeautyConstant;->LEVEL_CLOSE:Ljava/lang/String;

    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 178
    :cond_0
    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 179
    const/4 v2, 0x5

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 180
    iget-object v2, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v3, "pref_video_quality_key"

    invoke-virtual {p0, v2, v3}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 181
    invoke-virtual {v0, v1}, Lcom/android/camera/ui/PreviewListPreference;->filterUnsupported(Ljava/util/List;)V

    .line 182
    invoke-direct {p0, v0}, Lcom/android/camera/BasePreferenceActivity;->resetIfInvalid(Landroid/preference/ListPreference;)V

    .line 183
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/PreviewListPreference;->setEnabled(Z)V

    goto :goto_0

    .line 185
    :cond_1
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_video_quality_key_extra"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 189
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_video_hfr_key"

    .line 190
    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/PreviewListPreference;

    .line 191
    if-eqz v0, :cond_3

    .line 192
    iget-object v1, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    iget v2, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    .line 193
    invoke-static {v2}, Lcom/android/camera/CameraSettings;->getCameraId(I)I

    move-result v2

    invoke-static {v2}, Lcom/android/camera/CameraSettings;->getSupportedHfrSettings(I)Ljava/util/ArrayList;

    move-result-object v2

    .line 192
    invoke-virtual {p0, v1, v0, v2}, Lcom/android/camera/BasePreferenceActivity;->filterUnsupportedOptions(Landroid/preference/PreferenceGroup;Lcom/android/camera/ui/PreviewListPreference;Ljava/util/List;)V

    .line 196
    :cond_3
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->getVideoSpeed()Ljava/lang/String;

    move-result-object v0

    .line 198
    sget-boolean v1, Lcom/mi/config/b;->qj:Z

    if-eqz v1, :cond_4

    const-string v1, "normal"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 199
    :cond_4
    invoke-static {}, Lcom/mi/config/b;->hS()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 200
    :cond_5
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_movie_solid_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 203
    :cond_6
    invoke-static {}, Lcom/android/camera/Util;->isLabOptionsVisible()Z

    move-result v0

    if-nez v0, :cond_7

    .line 204
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_facedetection_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 205
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_portrait_with_facebeauty_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 206
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_facedetection_auto_hidden_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 207
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_dual_enable_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 208
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_dual_sat_enable_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 209
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_mfnr_sat_enable_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 210
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_sr_enable_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 211
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_parallel_process_enable_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 212
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_live_sticker_internal"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 214
    :cond_7
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fE()Z

    move-result v0

    if-nez v0, :cond_8

    .line 215
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "user_define_watermark"

    invoke-direct {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removeFromGroup(Landroid/preference/Preference;Ljava/lang/String;)V

    .line 217
    :cond_8
    return-void
.end method

.method private filterGroup()V
    .locals 1

    .line 850
    const-string v0, "category_device_setting"

    invoke-direct {p0, v0}, Lcom/android/camera/BasePreferenceActivity;->filterGroupIfEmpty(Ljava/lang/String;)V

    .line 851
    const-string v0, "category_camcorder_setting"

    invoke-direct {p0, v0}, Lcom/android/camera/BasePreferenceActivity;->filterGroupIfEmpty(Ljava/lang/String;)V

    .line 852
    const-string v0, "category_camera_setting"

    invoke-direct {p0, v0}, Lcom/android/camera/BasePreferenceActivity;->filterGroupIfEmpty(Ljava/lang/String;)V

    .line 853
    const-string v0, "category_advance_setting"

    invoke-direct {p0, v0}, Lcom/android/camera/BasePreferenceActivity;->filterGroupIfEmpty(Ljava/lang/String;)V

    .line 854
    return-void
.end method

.method private filterGroupIfEmpty(Ljava/lang/String;)V
    .locals 2

    .line 857
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    invoke-virtual {v0, p1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 858
    if-eqz v0, :cond_0

    instance-of v1, v0, Landroid/preference/PreferenceGroup;

    if-eqz v1, :cond_0

    check-cast v0, Landroid/preference/PreferenceGroup;

    .line 859
    invoke-virtual {v0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v0

    if-nez v0, :cond_0

    .line 860
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    invoke-virtual {p0, v0, p1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 862
    :cond_0
    return-void
.end method

.method private getFilterValue(Lcom/android/camera/ui/PreviewListPreference;Landroid/content/SharedPreferences;)Ljava/lang/String;
    .locals 3

    .line 816
    invoke-virtual {p1}, Lcom/android/camera/ui/PreviewListPreference;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 817
    if-nez p2, :cond_0

    .line 818
    return-object v0

    .line 820
    :cond_0
    invoke-virtual {p1}, Lcom/android/camera/ui/PreviewListPreference;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p2, v1, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 821
    invoke-virtual {p1}, Lcom/android/camera/ui/PreviewListPreference;->getEntryValues()[Ljava/lang/CharSequence;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/Util;->isStringValueContained(Ljava/lang/Object;[Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 822
    nop

    .line 823
    invoke-interface {p2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    .line 824
    invoke-virtual {p1}, Lcom/android/camera/ui/PreviewListPreference;->getKey()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p2, p1, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 825
    invoke-interface {p2}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_0

    .line 827
    :cond_1
    move-object v0, v1

    :goto_0
    return-object v0
.end method

.method private initializeActivity()V
    .locals 2

    .line 90
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    .line 91
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    if-eqz v0, :cond_0

    .line 92
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    invoke-virtual {v0}, Landroid/preference/PreferenceScreen;->removeAll()V

    .line 94
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->getPreferenceXml()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/camera/BasePreferenceActivity;->addPreferencesFromResource(I)V

    .line 95
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    .line 96
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    if-nez v0, :cond_1

    .line 97
    sget-object v0, Lcom/android/camera/BasePreferenceActivity;->TAG:Ljava/lang/String;

    const-string v1, "fail to init PreferenceGroup"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->finish()V

    .line 100
    :cond_1
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->registerListener()V

    .line 101
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->filterByCloud()V

    .line 102
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->filterByPreference()V

    .line 103
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->filterByFrom()V

    .line 104
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->filterByDeviceID()V

    .line 105
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->filterByDeviceCapability()V

    .line 106
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->filterByIntent()V

    .line 107
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->filterByConfig()V

    .line 108
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->filterGroup()V

    .line 110
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->updateEntries()V

    .line 111
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    iget-object v1, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferences:Lcom/android/camera/preferences/CameraSettingPreferences;

    invoke-direct {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->updatePreferences(Landroid/preference/PreferenceGroup;Landroid/content/SharedPreferences;)V

    .line 112
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/camera/BasePreferenceActivity;->updateConflictPreference(Landroid/preference/Preference;)V

    .line 113
    return-void
.end method

.method private installQRCodeReceiver()V
    .locals 2

    .line 573
    new-instance v0, Lcom/android/camera/BasePreferenceActivity$3;

    invoke-direct {v0, p0}, Lcom/android/camera/BasePreferenceActivity$3;-><init>(Lcom/android/camera/BasePreferenceActivity;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    .line 582
    invoke-virtual {v0, v1}, Lcom/android/camera/BasePreferenceActivity$3;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 583
    return-void
.end method

.method private registerListener()V
    .locals 2

    .line 256
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    invoke-direct {p0, v0, p0}, Lcom/android/camera/BasePreferenceActivity;->registerListener(Landroid/preference/PreferenceGroup;Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 258
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_restore"

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 259
    if-eqz v0, :cond_0

    .line 260
    invoke-virtual {v0, p0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 263
    :cond_0
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_privacy"

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 264
    if-eqz v0, :cond_1

    .line 265
    invoke-virtual {v0, p0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 268
    :cond_1
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_priority_storage"

    .line 269
    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 270
    if-eqz v0, :cond_2

    .line 271
    invoke-virtual {v0, p0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 274
    :cond_2
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_facedetection_key"

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 275
    if-eqz v0, :cond_3

    .line 276
    invoke-virtual {v0, p0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 279
    :cond_3
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_scan_qrcode_key"

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 280
    if-eqz v0, :cond_4

    .line 281
    invoke-virtual {v0, p0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 284
    :cond_4
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "user_define_watermark"

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 285
    if-eqz v0, :cond_5

    .line 286
    invoke-virtual {v0, p0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 288
    :cond_5
    return-void
.end method

.method private registerListener(Landroid/preference/PreferenceGroup;Landroid/preference/Preference$OnPreferenceChangeListener;)V
    .locals 4

    .line 505
    invoke-virtual {p1}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v0

    .line 506
    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    .line 507
    invoke-virtual {p1, v1}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v2

    .line 508
    instance-of v3, v2, Landroid/preference/PreferenceGroup;

    if-eqz v3, :cond_0

    .line 509
    check-cast v2, Landroid/preference/PreferenceGroup;

    invoke-direct {p0, v2, p2}, Lcom/android/camera/BasePreferenceActivity;->registerListener(Landroid/preference/PreferenceGroup;Landroid/preference/Preference$OnPreferenceChangeListener;)V

    goto :goto_1

    .line 511
    :cond_0
    invoke-virtual {v2, p2}, Landroid/preference/Preference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 506
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 514
    :cond_1
    return-void
.end method

.method private removeFromGroup(Landroid/preference/Preference;Ljava/lang/String;)V
    .locals 1

    .line 158
    if-eqz p1, :cond_0

    instance-of v0, p1, Landroid/preference/PreferenceGroup;

    if-eqz v0, :cond_0

    check-cast p1, Landroid/preference/PreferenceGroup;

    .line 159
    invoke-virtual {p1}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v0

    if-lez v0, :cond_0

    .line 160
    invoke-virtual {p0, p1, p2}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 162
    :cond_0
    return-void
.end method

.method private removeIncompatibleAdvancePreference()V
    .locals 2

    .line 348
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_qc_camera_contrast_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 349
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_qc_camera_saturation_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 350
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_qc_camera_sharpness_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 351
    return-void
.end method

.method private removeIncompatibleVideoPreference()V
    .locals 2

    .line 337
    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    const/16 v1, 0xac

    if-ne v0, v1, :cond_0

    .line 338
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_video_quality_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    goto :goto_1

    .line 339
    :cond_0
    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    const/16 v1, 0xa1

    if-eq v0, v1, :cond_2

    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    const/16 v1, 0xae

    if-ne v0, v1, :cond_1

    goto :goto_0

    .line 343
    :cond_1
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_video_new_slow_motion_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    goto :goto_1

    .line 340
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_video_quality_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 341
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_video_new_slow_motion_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 345
    :goto_1
    return-void
.end method

.method private removeNonVideoPreference()V
    .locals 2

    .line 333
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "category_camera_setting"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 334
    return-void
.end method

.method private resetIfInvalid(Landroid/preference/ListPreference;)V
    .locals 2

    .line 497
    invoke-virtual {p1}, Landroid/preference/ListPreference;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 498
    invoke-virtual {p1, v0}, Landroid/preference/ListPreference;->findIndexOfValue(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 499
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/preference/ListPreference;->setValueIndex(I)V

    .line 501
    :cond_0
    return-void
.end method

.method private resetPreferences()V
    .locals 4

    .line 615
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/BasePreferenceActivity;->mHasReset:Z

    .line 617
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    .line 618
    invoke-virtual {v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getIntentType()I

    move-result v2

    .line 619
    invoke-virtual {v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->resetAll()V

    .line 621
    nop

    .line 622
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v1

    const/4 v3, 0x0

    invoke-interface {v1, v3, v2}, Lcom/android/camera/data/provider/DataProvider;->dataConfig(II)Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v1

    check-cast v1, Lcom/android/camera/data/data/config/DataItemConfig;

    .line 623
    invoke-virtual {v1}, Lcom/android/camera/data/data/config/DataItemConfig;->resetAll()V

    .line 625
    nop

    .line 626
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v1

    invoke-interface {v1, v0, v2}, Lcom/android/camera/data/provider/DataProvider;->dataConfig(II)Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/config/DataItemConfig;

    .line 627
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->resetAll()V

    .line 629
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->clearArrayMap()V

    .line 631
    invoke-static {}, Lcom/android/camera/data/DataRepository;->getInstance()Lcom/android/camera/data/DataRepository;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/DataRepository;->backUp()Lcom/android/camera/data/backup/DataBackUp;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/backup/DataBackUp;->clearBackUp()V

    .line 633
    invoke-static {}, Lcom/android/camera/Util;->generateCustomWatermark2File()Landroid/graphics/Bitmap;

    .line 634
    return-void
.end method

.method private resetSnapSetting()V
    .locals 3

    .line 637
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "key_long_press_volume_down"

    invoke-static {v0, v1}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 639
    const-string v1, "Street-snap-picture"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "Street-snap-movie"

    .line 640
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 641
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "key_long_press_volume_down"

    const-string v2, "none"

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Secure;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 645
    :cond_1
    return-void
.end method

.method private resetTimeOutFlag()V
    .locals 1

    .line 906
    iget-boolean v0, p0, Lcom/android/camera/BasePreferenceActivity;->mHasReset:Z

    if-nez v0, :cond_0

    .line 907
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->resetTimeOut()V

    .line 909
    :cond_0
    return-void
.end method

.method private restorePreferences()V
    .locals 2

    .line 605
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->resetPreferences()V

    .line 606
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->resetSnapSetting()V

    .line 608
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->initializeActivity()V

    .line 609
    nop

    .line 610
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/high16 v1, 0x7f0f0000

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    .line 609
    invoke-static {v0}, Lcom/android/camera/storage/PriorityStorageBroadcastReceiver;->setPriorityStorage(Z)V

    .line 611
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/android/camera/BasePreferenceActivity;->onSettingChanged(I)V

    .line 612
    return-void
.end method

.method private updateConflictPreference(Landroid/preference/Preference;)V
    .locals 3

    .line 877
    sget-boolean v0, Lcom/mi/config/b;->qj:Z

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/android/camera/CameraSettings;->isMovieSolidOn()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x6

    iget v1, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    .line 878
    invoke-static {v1}, Lcom/android/camera/CameraSettings;->getPreferVideoQuality(I)I

    move-result v1

    if-gt v0, v1, :cond_1

    .line 879
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_movie_solid_key"

    .line 880
    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/CheckBoxPreference;

    .line 881
    iget-object v1, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v2, "pref_video_quality_key"

    .line 882
    invoke-virtual {v1, v2}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Lcom/android/camera/ui/PreviewListPreference;

    .line 883
    if-eqz p1, :cond_0

    const-string v2, "pref_camera_movie_solid_key"

    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 884
    const p1, 0x7f090020

    .line 885
    invoke-static {p1}, Lcom/android/camera/CameraSettings;->getDefaultPreferenceId(I)I

    move-result p1

    .line 884
    invoke-virtual {p0, p1}, Lcom/android/camera/BasePreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object p1

    .line 886
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferences:Lcom/android/camera/preferences/CameraSettingPreferences;

    invoke-virtual {v0}, Lcom/android/camera/preferences/CameraSettingPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 887
    const-string v2, "pref_video_quality_key"

    invoke-interface {v0, v2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 888
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 889
    invoke-virtual {v1, p1}, Lcom/android/camera/ui/PreviewListPreference;->setValue(Ljava/lang/String;)V

    .line 890
    goto :goto_0

    .line 891
    :cond_0
    iget-object p1, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferences:Lcom/android/camera/preferences/CameraSettingPreferences;

    invoke-virtual {p1}, Lcom/android/camera/preferences/CameraSettingPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 892
    const-string v1, "pref_camera_movie_solid_key"

    const/4 v2, 0x0

    invoke-interface {p1, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 893
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 894
    invoke-virtual {v0, v2}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 897
    :cond_1
    :goto_0
    return-void
.end method

.method private updateEntries()V
    .locals 6

    .line 704
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_picturesize_key"

    .line 705
    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/PreviewListPreference;

    .line 706
    iget-object v1, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v2, "pref_camera_antibanding_key"

    .line 707
    invoke-virtual {v1, v2}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Lcom/android/camera/ui/PreviewListPreference;

    .line 708
    iget-object v2, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v3, "pref_auto_chroma_flash_key"

    .line 709
    invoke-virtual {v2, v3}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/CheckBoxPreference;

    .line 710
    iget-object v3, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v4, "pref_video_quality_key"

    .line 711
    invoke-virtual {v3, v4}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    check-cast v3, Lcom/android/camera/ui/PreviewListPreference;

    .line 712
    iget-object v4, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v5, "pref_camera_snap_key"

    .line 713
    invoke-virtual {v4, v5}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    check-cast v4, Lcom/android/camera/ui/PreviewListPreference;

    .line 715
    if-eqz v0, :cond_0

    .line 716
    invoke-static {}, Lcom/android/camera/PictureSizeManager;->getEntries()[Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/android/camera/ui/PreviewListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 717
    invoke-static {}, Lcom/android/camera/PictureSizeManager;->getEntryValues()[Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/android/camera/ui/PreviewListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    .line 718
    invoke-static {}, Lcom/android/camera/PictureSizeManager;->getDefaultValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/android/camera/ui/PreviewListPreference;->setDefaultValue(Ljava/lang/Object;)V

    .line 719
    invoke-static {}, Lcom/android/camera/PictureSizeManager;->getDefaultValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/android/camera/ui/PreviewListPreference;->setValue(Ljava/lang/String;)V

    .line 722
    :cond_0
    if-eqz v1, :cond_1

    invoke-static {}, Lcom/android/camera/Util;->isAntibanding60()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 723
    const v0, 0x7f0900be

    invoke-virtual {p0, v0}, Lcom/android/camera/BasePreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 724
    invoke-virtual {v1, v0}, Lcom/android/camera/ui/PreviewListPreference;->setValue(Ljava/lang/String;)V

    .line 725
    invoke-virtual {v1, v0}, Lcom/android/camera/ui/PreviewListPreference;->setDefaultValue(Ljava/lang/Object;)V

    .line 728
    :cond_1
    if-eqz v2, :cond_2

    .line 729
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0f0003

    .line 730
    invoke-static {v1}, Lcom/android/camera/CameraSettings;->getDefaultPreferenceId(I)I

    move-result v1

    .line 729
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    invoke-virtual {v2, v0}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 734
    :cond_2
    if-eqz v3, :cond_3

    .line 736
    const v0, 0x7f090020

    .line 737
    invoke-static {v0}, Lcom/android/camera/CameraSettings;->getDefaultPreferenceId(I)I

    move-result v0

    .line 736
    invoke-virtual {p0, v0}, Lcom/android/camera/BasePreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 738
    invoke-virtual {v3, v0}, Lcom/android/camera/ui/PreviewListPreference;->setDefaultValue(Ljava/lang/Object;)V

    .line 739
    invoke-virtual {v3, v0}, Lcom/android/camera/ui/PreviewListPreference;->setValue(Ljava/lang/String;)V

    .line 742
    :cond_3
    if-eqz v4, :cond_8

    invoke-static {}, Lcom/mi/config/b;->ha()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 743
    const v0, 0x7f090184

    invoke-virtual {p0, v0}, Lcom/android/camera/BasePreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 744
    invoke-virtual {v4, v0}, Lcom/android/camera/ui/PreviewListPreference;->setDefaultValue(Ljava/lang/Object;)V

    .line 745
    invoke-virtual {v4, v0}, Lcom/android/camera/ui/PreviewListPreference;->setValue(Ljava/lang/String;)V

    .line 748
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "key_long_press_volume_down"

    invoke-static {v0, v1}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 750
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "volumekey_wake_screen"

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    const/4 v2, 0x1

    if-eq v1, v2, :cond_7

    const-string v1, "public_transportation_shortcuts"

    .line 752
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    const-string v1, "none"

    .line 753
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    goto :goto_0

    .line 756
    :cond_4
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    const-string v2, "pref_camera_snap_key"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/android/camera/data/data/global/DataItemGlobal;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 757
    if-eqz v1, :cond_5

    .line 758
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v2, "key_long_press_volume_down"

    .line 760
    invoke-static {v1}, Lcom/android/camera/CameraSettings;->getMiuiSettingsKeyForStreetSnap(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 758
    invoke-static {v0, v2, v3}, Landroid/provider/Settings$Secure;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 761
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string v2, "pref_camera_snap_key"

    invoke-interface {v0, v2}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->remove(Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 762
    invoke-virtual {v4, v1}, Lcom/android/camera/ui/PreviewListPreference;->setValue(Ljava/lang/String;)V

    goto :goto_1

    .line 763
    :cond_5
    const-string v1, "Street-snap-picture"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 764
    const v0, 0x7f09018a

    invoke-virtual {p0, v0}, Lcom/android/camera/BasePreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Lcom/android/camera/ui/PreviewListPreference;->setValue(Ljava/lang/String;)V

    goto :goto_1

    .line 765
    :cond_6
    const-string v1, "Street-snap-movie"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 766
    const v0, 0x7f09018b

    invoke-virtual {p0, v0}, Lcom/android/camera/BasePreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Lcom/android/camera/ui/PreviewListPreference;->setValue(Ljava/lang/String;)V

    goto :goto_1

    .line 754
    :cond_7
    :goto_0
    const v0, 0x7f09018c

    invoke-virtual {p0, v0}, Lcom/android/camera/BasePreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Lcom/android/camera/ui/PreviewListPreference;->setValue(Ljava/lang/String;)V

    .line 770
    :cond_8
    :goto_1
    return-void
.end method

.method private updatePreferences(Landroid/preference/PreferenceGroup;Landroid/content/SharedPreferences;)V
    .locals 7

    .line 787
    if-nez p1, :cond_0

    .line 788
    return-void

    .line 790
    :cond_0
    invoke-virtual {p1}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v0

    .line 791
    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_5

    .line 792
    invoke-virtual {p1, v2}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v3

    .line 793
    instance-of v4, v3, Lcom/android/camera/ui/PreviewListPreference;

    if-eqz v4, :cond_2

    .line 794
    move-object v4, v3

    check-cast v4, Lcom/android/camera/ui/PreviewListPreference;

    .line 795
    const-string v5, "pref_camera_picturesize_key"

    invoke-virtual {v4}, Lcom/android/camera/ui/PreviewListPreference;->getKey()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 796
    invoke-static {}, Lcom/android/camera/PictureSizeManager;->getPictureSizeRatioString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/android/camera/ui/PreviewListPreference;->setValue(Ljava/lang/String;)V

    goto :goto_1

    .line 798
    :cond_1
    invoke-direct {p0, v4, p2}, Lcom/android/camera/BasePreferenceActivity;->getFilterValue(Lcom/android/camera/ui/PreviewListPreference;Landroid/content/SharedPreferences;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/android/camera/ui/PreviewListPreference;->setValue(Ljava/lang/String;)V

    .line 800
    :goto_1
    invoke-virtual {v3, v1}, Landroid/preference/Preference;->setPersistent(Z)V

    .line 801
    goto :goto_2

    :cond_2
    instance-of v4, v3, Landroid/preference/CheckBoxPreference;

    if-eqz v4, :cond_3

    .line 802
    move-object v4, v3

    check-cast v4, Landroid/preference/CheckBoxPreference;

    .line 803
    invoke-virtual {v4}, Landroid/preference/CheckBoxPreference;->getKey()Ljava/lang/String;

    move-result-object v5

    .line 804
    invoke-virtual {v4}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v6

    invoke-interface {p2, v5, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    invoke-virtual {v4, v5}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 805
    invoke-virtual {v3, v1}, Landroid/preference/Preference;->setPersistent(Z)V

    .line 806
    goto :goto_2

    :cond_3
    instance-of v4, v3, Landroid/preference/PreferenceGroup;

    if-eqz v4, :cond_4

    .line 807
    check-cast v3, Landroid/preference/PreferenceGroup;

    invoke-direct {p0, v3, p2}, Lcom/android/camera/BasePreferenceActivity;->updatePreferences(Landroid/preference/PreferenceGroup;Landroid/content/SharedPreferences;)V

    goto :goto_2

    .line 810
    :cond_4
    sget-object v4, Lcom/android/camera/BasePreferenceActivity;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "no need update preference for "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 791
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 813
    :cond_5
    return-void
.end method

.method private updateQRCodeEntry()V
    .locals 4

    .line 773
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_scan_qrcode_key"

    .line 774
    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/CheckBoxPreference;

    .line 775
    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferences:Lcom/android/camera/preferences/CameraSettingPreferences;

    const-string v2, "pref_scan_qrcode_key"

    .line 776
    invoke-virtual {v0}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v3

    invoke-virtual {v1, v2, v3}, Lcom/android/camera/preferences/CameraSettingPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 777
    invoke-static {p0}, Lcom/android/camera/CameraSettings;->isQRCodeReceiverAvailable(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 778
    sget-object v1, Lcom/android/camera/BasePreferenceActivity;->TAG:Ljava/lang/String;

    const-string v2, "disable QRCodeScan"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 779
    iget-object v1, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferences:Lcom/android/camera/preferences/CameraSettingPreferences;

    invoke-virtual {v1}, Lcom/android/camera/preferences/CameraSettingPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 780
    const-string v2, "pref_scan_qrcode_key"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 781
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 782
    invoke-virtual {v0, v3}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 784
    :cond_0
    return-void
.end method


# virtual methods
.method protected addPreference(Ljava/lang/String;Landroid/preference/Preference;)Z
    .locals 1

    .line 695
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    invoke-virtual {v0, p1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    .line 696
    instance-of v0, p1, Landroid/preference/PreferenceGroup;

    if-eqz v0, :cond_0

    .line 697
    check-cast p1, Landroid/preference/PreferenceGroup;

    invoke-virtual {p1, p2}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 698
    const/4 p1, 0x1

    return p1

    .line 700
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method protected filterByIntent()V
    .locals 3

    .line 841
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "remove_keys"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 842
    if-eqz v0, :cond_0

    .line 843
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 844
    iget-object v2, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    invoke-virtual {p0, v2, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 845
    goto :goto_0

    .line 847
    :cond_0
    return-void
.end method

.method public filterUnsupportedOptions(Landroid/preference/PreferenceGroup;Lcom/android/camera/ui/PreviewListPreference;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/preference/PreferenceGroup;",
            "Lcom/android/camera/ui/PreviewListPreference;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 481
    if-eqz p3, :cond_2

    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-gt v0, v1, :cond_0

    goto :goto_0

    .line 486
    :cond_0
    invoke-virtual {p2, p3}, Lcom/android/camera/ui/PreviewListPreference;->filterUnsupported(Ljava/util/List;)V

    .line 487
    invoke-virtual {p2}, Lcom/android/camera/ui/PreviewListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object p3

    array-length p3, p3

    if-gt p3, v1, :cond_1

    .line 488
    invoke-virtual {p2}, Lcom/android/camera/ui/PreviewListPreference;->getKey()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 489
    return-void

    .line 492
    :cond_1
    invoke-direct {p0, p2}, Lcom/android/camera/BasePreferenceActivity;->resetIfInvalid(Landroid/preference/ListPreference;)V

    .line 493
    return-void

    .line 482
    :cond_2
    :goto_0
    invoke-virtual {p2}, Lcom/android/camera/ui/PreviewListPreference;->getKey()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 483
    return-void
.end method

.method protected abstract getPreferenceXml()I
.end method

.method public onBackPressed()V
    .locals 0

    .line 901
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->resetTimeOutFlag()V

    .line 902
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onBackPressed()V

    .line 903
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 67
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 68
    invoke-static {p0}, Lcom/android/camera/Util;->updateCountryIso(Landroid/content/Context;)V

    .line 69
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "from_where"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    .line 70
    invoke-static {}, Lcom/android/camera/preferences/CameraSettingPreferences;->instance()Lcom/android/camera/preferences/CameraSettingPreferences;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferences:Lcom/android/camera/preferences/CameraSettingPreferences;

    .line 71
    invoke-static {}, Lcom/android/camera/CameraSettings;->upgradeGlobalPreferences()V

    .line 72
    invoke-static {p0}, Lcom/android/camera/storage/Storage;->initStorage(Landroid/content/Context;)V

    .line 73
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->initializeActivity()V

    .line 74
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "StartActivityWhenLocked"

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 75
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/high16 v0, 0x80000

    invoke-virtual {p1, v0}, Landroid/view/Window;->addFlags(I)V

    .line 77
    :cond_0
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2

    .line 832
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x102002c

    if-ne v0, v1, :cond_0

    .line 833
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->resetTimeOutFlag()V

    .line 834
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->finish()V

    .line 835
    const/4 p1, 0x1

    return p1

    .line 837
    :cond_0
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 5

    .line 649
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/BasePreferenceActivity;->onSettingChanged(I)V

    .line 650
    iget-object v1, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferences:Lcom/android/camera/preferences/CameraSettingPreferences;

    invoke-virtual {v1}, Lcom/android/camera/preferences/CameraSettingPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 651
    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v2

    .line 652
    instance-of v3, p2, Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 653
    move-object v3, p2

    check-cast v3, Ljava/lang/String;

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    .line 654
    :cond_0
    instance-of v3, p2, Ljava/lang/Boolean;

    if-eqz v3, :cond_1

    .line 655
    move-object v3, p2

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    .line 656
    :cond_1
    instance-of v3, p2, Ljava/lang/Integer;

    if-eqz v3, :cond_2

    .line 657
    move-object v3, p2

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    .line 658
    :cond_2
    instance-of v3, p2, Ljava/lang/Long;

    if-eqz v3, :cond_3

    .line 659
    move-object v3, p2

    check-cast v3, Ljava/lang/Long;

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-interface {v1, v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    .line 660
    :cond_3
    instance-of v3, p2, Ljava/lang/Float;

    if-eqz v3, :cond_4

    .line 661
    move-object v3, p2

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    .line 666
    :goto_0
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 667
    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, p2}, Lcom/android/camera/statistic/CameraStatUtil;->trackPreferenceChange(Ljava/lang/String;Ljava/lang/Object;)V

    .line 669
    invoke-direct {p0, p1}, Lcom/android/camera/BasePreferenceActivity;->updateConflictPreference(Landroid/preference/Preference;)V

    .line 670
    return v0

    .line 663
    :cond_4
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "unhandled new value with type="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 664
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public onPreferenceClick(Landroid/preference/Preference;)Z
    .locals 11

    .line 518
    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v0

    const-string v1, "pref_restore"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/high16 v1, 0x1040000

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    .line 519
    new-instance v7, Lcom/android/camera/BasePreferenceActivity$1;

    invoke-direct {v7, p0}, Lcom/android/camera/BasePreferenceActivity$1;-><init>(Lcom/android/camera/BasePreferenceActivity;)V

    .line 526
    const p1, 0x7f09000f

    .line 527
    invoke-virtual {p0, p1}, Lcom/android/camera/BasePreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    const p1, 0x7f090010

    .line 528
    invoke-virtual {p0, p1}, Lcom/android/camera/BasePreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    const p1, 0x104000a

    .line 529
    invoke-virtual {p0, p1}, Lcom/android/camera/BasePreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 530
    invoke-virtual {p0, v1}, Lcom/android/camera/BasePreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    .line 526
    move-object v3, p0

    invoke-static/range {v3 .. v9}, Lcom/android/camera/RotateDialogController;->showSystemAlertDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/app/AlertDialog;

    .line 531
    return v2

    .line 534
    :cond_0
    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v0

    const-string v3, "pref_privacy"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 535
    invoke-static {p0}, Lcom/android/camera/ActivityLauncher;->launchPrivacyPolicyWebpage(Landroid/content/Context;)V

    .line 536
    return v2

    .line 539
    :cond_1
    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v0

    const-string v3, "user_define_watermark"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v3, 0x0

    if-eqz v0, :cond_3

    .line 540
    new-instance p1, Landroid/content/Intent;

    const-class v0, Lcom/android/camera/UserDefineWatermarkActivity;

    invoke-direct {p1, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 541
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "StartActivityWhenLocked"

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 542
    const-string v0, "StartActivityWhenLocked"

    invoke-virtual {p1, v0, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 544
    :cond_2
    iput-boolean v2, p0, Lcom/android/camera/BasePreferenceActivity;->mGoToActivity:Z

    .line 545
    invoke-virtual {p0, p1}, Lcom/android/camera/BasePreferenceActivity;->startActivity(Landroid/content/Intent;)V

    .line 546
    return v2

    .line 549
    :cond_3
    const-string v0, "pref_priority_storage"

    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 550
    check-cast p1, Landroid/preference/CheckBoxPreference;

    .line 551
    invoke-virtual {p1}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result p1

    .line 550
    invoke-static {p1}, Lcom/android/camera/storage/PriorityStorageBroadcastReceiver;->setPriorityStorage(Z)V

    goto :goto_0

    .line 552
    :cond_4
    const-string v0, "pref_scan_qrcode_key"

    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    .line 553
    invoke-static {p0}, Lcom/android/camera/CameraSettings;->isQRCodeReceiverAvailable(Landroid/content/Context;)Z

    move-result p1

    if-nez p1, :cond_5

    .line 554
    new-instance v8, Lcom/android/camera/BasePreferenceActivity$2;

    invoke-direct {v8, p0}, Lcom/android/camera/BasePreferenceActivity$2;-><init>(Lcom/android/camera/BasePreferenceActivity;)V

    .line 561
    const p1, 0x7f0901ec

    .line 562
    invoke-virtual {p0, p1}, Lcom/android/camera/BasePreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    const p1, 0x7f0901ed

    .line 563
    invoke-virtual {p0, p1}, Lcom/android/camera/BasePreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    const p1, 0x7f0901eb

    .line 564
    invoke-virtual {p0, p1}, Lcom/android/camera/BasePreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 565
    invoke-virtual {p0, v1}, Lcom/android/camera/BasePreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x0

    .line 561
    move-object v4, p0

    invoke-static/range {v4 .. v10}, Lcom/android/camera/RotateDialogController;->showSystemAlertDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/app/AlertDialog;

    .line 566
    return v2

    .line 569
    :cond_5
    :goto_0
    return v3
.end method

.method protected onRestart()V
    .locals 1

    .line 866
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onRestart()V

    .line 867
    iget-boolean v0, p0, Lcom/android/camera/BasePreferenceActivity;->mGoToActivity:Z

    if-eqz v0, :cond_0

    .line 868
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/BasePreferenceActivity;->mGoToActivity:Z

    goto :goto_0

    .line 870
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->finish()V

    .line 872
    :goto_0
    return-void
.end method

.method protected onResume()V
    .locals 2

    .line 81
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onResume()V

    .line 82
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->updateQRCodeEntry()V

    .line 83
    invoke-static {}, Lcom/android/camera/Util;->isLabOptionsVisible()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 84
    const v0, 0x7f090112

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 86
    :cond_0
    return-void
.end method

.method protected abstract onSettingChanged(I)V
.end method

.method protected removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z
    .locals 6

    .line 674
    invoke-virtual {p1, p2}, Landroid/preference/PreferenceGroup;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 675
    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 676
    invoke-virtual {p1, v0}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 677
    return v1

    .line 681
    :cond_0
    invoke-virtual {p1}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v0

    .line 682
    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v0, :cond_2

    .line 683
    invoke-virtual {p1, v3}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v4

    .line 684
    instance-of v5, v4, Landroid/preference/PreferenceGroup;

    if-eqz v5, :cond_1

    .line 685
    check-cast v4, Landroid/preference/PreferenceGroup;

    invoke-virtual {p0, v4, p2}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 686
    return v1

    .line 682
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 691
    :cond_2
    return v2
.end method
