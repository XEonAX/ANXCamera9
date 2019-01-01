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

    .line 50
    const-class v0, Lcom/android/camera/BasePreferenceActivity;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/BasePreferenceActivity;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 44
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    .line 558
    new-instance v0, Lcom/android/camera/BasePreferenceActivity$4;

    invoke-direct {v0, p0}, Lcom/android/camera/BasePreferenceActivity$4;-><init>(Lcom/android/camera/BasePreferenceActivity;)V

    iput-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mAppInstalledListener:Lcom/android/camera/lib/compatibility/util/CompatibilityUtils$PackageInstallerListener;

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/BasePreferenceActivity;)V
    .locals 0

    .line 44
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->restorePreferences()V

    return-void
.end method

.method static synthetic access$100(Lcom/android/camera/BasePreferenceActivity;)V
    .locals 0

    .line 44
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->installQRCodeReceiver()V

    return-void
.end method

.method static synthetic access$200()Ljava/lang/String;
    .locals 1

    .line 44
    sget-object v0, Lcom/android/camera/BasePreferenceActivity;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lcom/android/camera/BasePreferenceActivity;)Lcom/android/camera/lib/compatibility/util/CompatibilityUtils$PackageInstallerListener;
    .locals 0

    .line 44
    iget-object p0, p0, Lcom/android/camera/BasePreferenceActivity;->mAppInstalledListener:Lcom/android/camera/lib/compatibility/util/CompatibilityUtils$PackageInstallerListener;

    return-object p0
.end method

.method private filterByCloud()V
    .locals 3

    .line 236
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

    .line 237
    iget-object v2, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    invoke-virtual {p0, v2, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 238
    goto :goto_0

    .line 239
    :cond_0
    return-void
.end method

.method private filterByConfig()V
    .locals 6

    .line 115
    sget-object v0, Lcom/android/camera/BasePreferenceActivity;->TAG:Ljava/lang/String;

    const-string v1, "filterByConfig:"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 116
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "category_device_setting"

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 117
    iget-object v1, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v2, "category_camera_setting"

    invoke-virtual {v1, v2}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    .line 119
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

    .line 130
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mi/config/a;->fq()Z

    move-result v2

    .line 131
    sget-object v3, Lcom/android/camera/BasePreferenceActivity;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "filterByConfig: isSupportVideoFrontMirror = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 133
    if-eqz v2, :cond_1

    .line 134
    const-string v0, "pref_front_mirror_key"

    invoke-direct {p0, v1, v0}, Lcom/android/camera/BasePreferenceActivity;->removeFromGroup(Landroid/preference/Preference;Ljava/lang/String;)V

    goto :goto_0

    .line 136
    :cond_1
    const-string v1, "pref_front_mirror_key"

    invoke-direct {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removeFromGroup(Landroid/preference/Preference;Ljava/lang/String;)V

    .line 138
    :goto_0
    return-void

    .line 125
    :cond_2
    :goto_1
    const-string v2, "pref_front_mirror_key"

    invoke-direct {p0, v0, v2}, Lcom/android/camera/BasePreferenceActivity;->removeFromGroup(Landroid/preference/Preference;Ljava/lang/String;)V

    .line 126
    const-string v0, "pref_front_mirror_key"

    invoke-direct {p0, v1, v0}, Lcom/android/camera/BasePreferenceActivity;->removeFromGroup(Landroid/preference/Preference;Ljava/lang/String;)V

    .line 127
    return-void
.end method

.method private filterByDeviceCapability()V
    .locals 2

    .line 220
    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    const/16 v1, 0xac

    if-ne v0, v1, :cond_0

    .line 221
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->getSupportedHfrSettings(I)Ljava/util/ArrayList;

    move-result-object v0

    .line 222
    const-string v1, "1920x1080:240"

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    .line 223
    if-nez v0, :cond_0

    .line 224
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_video_new_slow_motion_key"

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 225
    const v1, 0x7f0b0030

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setSummary(I)V

    .line 228
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fr()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 229
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_video_hfr_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    goto :goto_0

    .line 231
    :cond_1
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_video_new_slow_motion_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 233
    :goto_0
    return-void
.end method

.method private filterByDeviceID()V
    .locals 2

    .line 332
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    .line 334
    invoke-static {}, Lcom/mi/config/b;->gh()Z

    move-result v0

    if-nez v0, :cond_0

    .line 335
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_video_hfr_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 339
    :cond_0
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_long_press_shutter_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 342
    invoke-static {}, Lcom/mi/config/b;->fI()Z

    move-result v0

    if-nez v0, :cond_1

    .line 343
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_movie_solid_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 346
    :cond_1
    invoke-static {}, Lcom/mi/config/b;->fT()Z

    move-result v0

    if-nez v0, :cond_2

    .line 347
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_watermark_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 350
    :cond_2
    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportedDualCameraWaterMark()Z

    move-result v0

    if-nez v0, :cond_3

    .line 351
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_dualcamera_watermark"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 354
    :cond_3
    invoke-static {}, Lcom/mi/config/b;->fM()Z

    move-result v0

    if-nez v0, :cond_4

    .line 355
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camerasound_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 358
    :cond_4
    invoke-static {}, Lcom/mi/config/b;->fR()Z

    move-result v0

    if-nez v0, :cond_5

    .line 359
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_recordlocation_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 362
    :cond_5
    invoke-static {}, Lcom/mi/config/b;->isPad()Z

    move-result v0

    if-nez v0, :cond_6

    sget-boolean v0, Lcom/mi/config/b;->pO:Z

    if-eqz v0, :cond_7

    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 363
    :cond_6
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_picturesize_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 366
    :cond_7
    invoke-static {}, Lcom/android/camera/storage/Storage;->hasSecondaryStorage()Z

    move-result v0

    if-nez v0, :cond_8

    .line 367
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_priority_storage"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 370
    :cond_8
    invoke-static {}, Lcom/mi/config/b;->gi()Z

    move-result v0

    if-nez v0, :cond_9

    .line 371
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_auto_chroma_flash_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 374
    :cond_9
    invoke-static {}, Lcom/mi/config/b;->fO()Z

    move-result v0

    if-nez v0, :cond_a

    .line 375
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_long_press_shutter_feature_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 378
    :cond_a
    invoke-static {}, Lcom/mi/config/b;->gj()Z

    move-result v0

    if-nez v0, :cond_b

    .line 379
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_capture_when_stable_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 382
    :cond_b
    invoke-static {}, Lcom/mi/config/b;->gt()Z

    move-result v0

    if-nez v0, :cond_c

    .line 383
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_asd_night_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 386
    :cond_c
    invoke-static {}, Lcom/mi/config/b;->gR()Z

    move-result v0

    if-nez v0, :cond_d

    .line 387
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_snap_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 390
    :cond_d
    invoke-static {}, Lcom/mi/config/b;->hj()Z

    move-result v0

    if-nez v0, :cond_e

    .line 391
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_groupshot_with_primitive_picture_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 394
    :cond_e
    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportedPortrait()Z

    move-result v0

    if-nez v0, :cond_f

    .line 395
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_portrait_with_facebeauty_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 398
    :cond_f
    invoke-static {}, Lcom/mi/config/b;->isSupportedOpticalZoom()Z

    move-result v0

    if-nez v0, :cond_10

    invoke-static {}, Lcom/mi/config/b;->isSupportedPortrait()Z

    move-result v0

    if-nez v0, :cond_10

    .line 399
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_dual_enable_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 401
    :cond_10
    invoke-static {}, Lcom/mi/config/b;->isSupportedOpticalZoom()Z

    move-result v0

    if-nez v0, :cond_11

    .line 402
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_dual_sat_enable_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 405
    :cond_11
    invoke-static {}, Lcom/mi/config/b;->isSupportSuperResolution()Z

    move-result v0

    if-nez v0, :cond_12

    .line 406
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_super_resolution_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 409
    :cond_12
    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportParallelProcess()Z

    move-result v0

    if-nez v0, :cond_13

    .line 410
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_parallel_process_enable_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 413
    :cond_13
    invoke-static {}, Lcom/mi/config/b;->gC()Z

    move-result v0

    if-eqz v0, :cond_14

    .line 414
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_facedetection_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 415
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_facedetection_auto_hidden_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 416
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_parallel_process_enable_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 417
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_dual_enable_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 418
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_dual_sat_enable_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 419
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_front_mirror_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 420
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_qc_camera_sharpness_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 421
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_qc_camera_contrast_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 422
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_qc_camera_saturation_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 423
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_autoexposure_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 426
    :cond_14
    invoke-static {}, Lcom/android/camera/ProximitySensorLock;->supported()Z

    move-result v0

    if-nez v0, :cond_15

    .line 427
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_proximity_lock_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 430
    :cond_15
    invoke-static {}, Lcom/mi/config/b;->hv()Z

    move-result v0

    if-nez v0, :cond_16

    .line 431
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_fingerprint_capture_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 434
    :cond_16
    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->shouldNormalWideLDCBeVisibleInMode(I)Z

    move-result v0

    if-eqz v0, :cond_17

    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    .line 435
    invoke-static {v0}, Lcom/android/camera/CameraSettings;->isUltraWideConfigOpen(I)Z

    move-result v0

    if-eqz v0, :cond_18

    .line 436
    :cond_17
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_normal_wide_ldc_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 440
    :cond_18
    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->shouldUltraWideLDCBeVisibleInMode(I)Z

    move-result v0

    if-eqz v0, :cond_19

    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    .line 441
    invoke-static {v0}, Lcom/android/camera/CameraSettings;->isUltraWideConfigOpen(I)Z

    move-result v0

    if-nez v0, :cond_1a

    .line 442
    :cond_19
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_ultra_wide_ldc_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 446
    :cond_1a
    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->shouldUltraWideVideoLDCBeVisibleInMode(I)Z

    move-result v0

    if-eqz v0, :cond_1b

    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    .line 447
    invoke-static {v0}, Lcom/android/camera/CameraSettings;->isUltraWideConfigOpen(I)Z

    move-result v0

    if-nez v0, :cond_1c

    .line 448
    :cond_1b
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_ultra_wide_video_ldc_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 450
    :cond_1c
    return-void
.end method

.method private filterByFrom()V
    .locals 10

    .line 277
    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    const/16 v1, 0xaa

    const/16 v2, 0xac

    const/16 v3, 0xa8

    const/16 v4, 0xa9

    const/16 v5, 0xa2

    const/16 v6, 0xae

    const/16 v7, 0xa1

    const/16 v8, 0xa6

    const/16 v9, 0xa3

    if-eq v0, v9, :cond_2

    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    const/16 v9, 0xa5

    if-eq v0, v9, :cond_2

    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    if-eq v0, v8, :cond_2

    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    const/16 v9, 0xa7

    if-eq v0, v9, :cond_2

    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    const/16 v9, 0xad

    if-eq v0, v9, :cond_2

    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    const/16 v9, 0xab

    if-ne v0, v9, :cond_0

    goto :goto_0

    .line 285
    :cond_0
    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    if-eq v0, v7, :cond_1

    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    if-eq v0, v6, :cond_1

    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    if-eq v0, v5, :cond_1

    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    if-eq v0, v4, :cond_1

    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    if-eq v0, v3, :cond_1

    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    if-eq v0, v2, :cond_1

    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    if-ne v0, v1, :cond_3

    .line 293
    :cond_1
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v9, "pref_camera_volumekey_function_key"

    invoke-virtual {p0, v0, v9}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 294
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->removeNonVideoPreference()V

    .line 295
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->removeIncompatibleVideoPreference()V

    goto :goto_1

    .line 283
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v9, "pref_video_volumekey_function_key"

    invoke-virtual {p0, v0, v9}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 284
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v9, "category_camcorder_setting"

    invoke-virtual {p0, v0, v9}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 298
    :cond_3
    :goto_1
    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    if-eq v0, v7, :cond_4

    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    if-eq v0, v6, :cond_4

    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    if-eq v0, v5, :cond_4

    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    if-eq v0, v4, :cond_4

    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    if-eq v0, v3, :cond_4

    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    if-eq v0, v1, :cond_4

    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    if-eq v0, v2, :cond_4

    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    if-ne v0, v8, :cond_5

    .line 306
    :cond_4
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->removeIncompatibleAdvancePreference()V

    .line 308
    :cond_5
    return-void
.end method

.method private filterByPreference()V
    .locals 4

    .line 164
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_video_quality_key"

    .line 165
    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/PreviewListPreference;

    .line 166
    if-eqz v0, :cond_2

    .line 168
    invoke-static {}, Lcom/android/camera/CameraSettings;->getCameraId()I

    move-result v1

    invoke-static {v1}, Lcom/android/camera/CameraSettings;->getSupportedVideoQuality(I)Ljava/util/ArrayList;

    move-result-object v1

    .line 169
    iget-object v2, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    invoke-virtual {p0, v2, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->filterUnsupportedOptions(Landroid/preference/PreferenceGroup;Lcom/android/camera/ui/PreviewListPreference;Ljava/util/List;)V

    .line 172
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v2, "pref_video_quality_key_extra"

    .line 173
    invoke-virtual {v0, v2}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/PreviewListPreference;

    .line 174
    if-eqz v0, :cond_1

    iget v2, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    const/16 v3, 0xa1

    if-eq v2, v3, :cond_1

    iget v2, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    const/16 v3, 0xae

    if-eq v2, v3, :cond_1

    .line 175
    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoBokehOn()Z

    move-result v2

    if-nez v2, :cond_0

    .line 176
    invoke-static {}, Lcom/android/camera/CameraSettings;->getFaceBeautifyValue()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/android/camera/constant/BeautyConstant;->LEVEL_CLOSE:Ljava/lang/String;

    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 177
    :cond_0
    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 178
    const/4 v2, 0x5

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 179
    iget-object v2, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v3, "pref_video_quality_key"

    invoke-virtual {p0, v2, v3}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 180
    invoke-virtual {v0, v1}, Lcom/android/camera/ui/PreviewListPreference;->filterUnsupported(Ljava/util/List;)V

    .line 181
    invoke-direct {p0, v0}, Lcom/android/camera/BasePreferenceActivity;->resetIfInvalid(Landroid/preference/ListPreference;)V

    .line 182
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/PreviewListPreference;->setEnabled(Z)V

    goto :goto_0

    .line 184
    :cond_1
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_video_quality_key_extra"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 188
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_video_hfr_key"

    .line 189
    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/PreviewListPreference;

    .line 190
    if-eqz v0, :cond_3

    .line 191
    iget-object v1, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    .line 192
    invoke-static {}, Lcom/android/camera/CameraSettings;->getCameraId()I

    move-result v2

    invoke-static {v2}, Lcom/android/camera/CameraSettings;->getSupportedHfrSettings(I)Ljava/util/ArrayList;

    move-result-object v2

    .line 191
    invoke-virtual {p0, v1, v0, v2}, Lcom/android/camera/BasePreferenceActivity;->filterUnsupportedOptions(Landroid/preference/PreferenceGroup;Lcom/android/camera/ui/PreviewListPreference;Ljava/util/List;)V

    .line 195
    :cond_3
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->getVideoSpeed()Ljava/lang/String;

    move-result-object v0

    .line 197
    sget-boolean v1, Lcom/mi/config/b;->qk:Z

    if-eqz v1, :cond_4

    const-string v1, "normal"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 198
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_movie_solid_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 201
    :cond_4
    invoke-static {}, Lcom/android/camera/Util;->isLabOptionsVisible()Z

    move-result v0

    if-nez v0, :cond_5

    .line 202
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_facedetection_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 203
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_portrait_with_facebeauty_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 204
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_facedetection_auto_hidden_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 205
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_dual_enable_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 206
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_dual_sat_enable_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 207
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_mfnr_sat_enable_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 208
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_sr_enable_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 209
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_parallel_process_enable_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 211
    :cond_5
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fE()Z

    move-result v0

    if-nez v0, :cond_6

    .line 212
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "user_define_watermark"

    invoke-direct {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removeFromGroup(Landroid/preference/Preference;Ljava/lang/String;)V

    .line 214
    :cond_6
    return-void
.end method

.method private filterGroup()V
    .locals 1

    .line 823
    const-string v0, "category_device_setting"

    invoke-direct {p0, v0}, Lcom/android/camera/BasePreferenceActivity;->filterGroupIfEmpty(Ljava/lang/String;)V

    .line 824
    const-string v0, "category_camcorder_setting"

    invoke-direct {p0, v0}, Lcom/android/camera/BasePreferenceActivity;->filterGroupIfEmpty(Ljava/lang/String;)V

    .line 825
    const-string v0, "category_camera_setting"

    invoke-direct {p0, v0}, Lcom/android/camera/BasePreferenceActivity;->filterGroupIfEmpty(Ljava/lang/String;)V

    .line 826
    const-string v0, "category_advance_setting"

    invoke-direct {p0, v0}, Lcom/android/camera/BasePreferenceActivity;->filterGroupIfEmpty(Ljava/lang/String;)V

    .line 827
    return-void
.end method

.method private filterGroupIfEmpty(Ljava/lang/String;)V
    .locals 2

    .line 830
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    invoke-virtual {v0, p1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 831
    if-eqz v0, :cond_0

    instance-of v1, v0, Landroid/preference/PreferenceGroup;

    if-eqz v1, :cond_0

    check-cast v0, Landroid/preference/PreferenceGroup;

    .line 832
    invoke-virtual {v0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v0

    if-nez v0, :cond_0

    .line 833
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    invoke-virtual {p0, v0, p1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 835
    :cond_0
    return-void
.end method

.method private getFilterValue(Lcom/android/camera/ui/PreviewListPreference;Landroid/content/SharedPreferences;)Ljava/lang/String;
    .locals 3

    .line 789
    invoke-virtual {p1}, Lcom/android/camera/ui/PreviewListPreference;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 790
    if-nez p2, :cond_0

    .line 791
    return-object v0

    .line 793
    :cond_0
    invoke-virtual {p1}, Lcom/android/camera/ui/PreviewListPreference;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p2, v1, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 794
    invoke-virtual {p1}, Lcom/android/camera/ui/PreviewListPreference;->getEntryValues()[Ljava/lang/CharSequence;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/Util;->isStringValueContained(Ljava/lang/Object;[Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 795
    nop

    .line 796
    invoke-interface {p2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    .line 797
    invoke-virtual {p1}, Lcom/android/camera/ui/PreviewListPreference;->getKey()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p2, p1, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 798
    invoke-interface {p2}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_0

    .line 800
    :cond_1
    move-object v0, v1

    :goto_0
    return-object v0
.end method

.method private initializeActivity()V
    .locals 2

    .line 89
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    .line 90
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    if-eqz v0, :cond_0

    .line 91
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    invoke-virtual {v0}, Landroid/preference/PreferenceScreen;->removeAll()V

    .line 93
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->getPreferenceXml()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/camera/BasePreferenceActivity;->addPreferencesFromResource(I)V

    .line 94
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    .line 95
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    if-nez v0, :cond_1

    .line 96
    sget-object v0, Lcom/android/camera/BasePreferenceActivity;->TAG:Ljava/lang/String;

    const-string v1, "fail to init PreferenceGroup"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 97
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->finish()V

    .line 99
    :cond_1
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->registerListener()V

    .line 100
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->filterByCloud()V

    .line 101
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->filterByPreference()V

    .line 102
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->filterByFrom()V

    .line 103
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->filterByDeviceID()V

    .line 104
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->filterByDeviceCapability()V

    .line 105
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->filterByIntent()V

    .line 106
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->filterByConfig()V

    .line 107
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->filterGroup()V

    .line 109
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->updateEntries()V

    .line 110
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    iget-object v1, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferences:Lcom/android/camera/preferences/CameraSettingPreferences;

    invoke-direct {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->updatePreferences(Landroid/preference/PreferenceGroup;Landroid/content/SharedPreferences;)V

    .line 111
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/camera/BasePreferenceActivity;->updateConflictPreference(Landroid/preference/Preference;)V

    .line 112
    return-void
.end method

.method private installQRCodeReceiver()V
    .locals 2

    .line 546
    new-instance v0, Lcom/android/camera/BasePreferenceActivity$3;

    invoke-direct {v0, p0}, Lcom/android/camera/BasePreferenceActivity$3;-><init>(Lcom/android/camera/BasePreferenceActivity;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    .line 555
    invoke-virtual {v0, v1}, Lcom/android/camera/BasePreferenceActivity$3;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 556
    return-void
.end method

.method private registerListener()V
    .locals 2

    .line 242
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    invoke-direct {p0, v0, p0}, Lcom/android/camera/BasePreferenceActivity;->registerListener(Landroid/preference/PreferenceGroup;Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 244
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_restore"

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 245
    if-eqz v0, :cond_0

    .line 246
    invoke-virtual {v0, p0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 249
    :cond_0
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_privacy"

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 250
    if-eqz v0, :cond_1

    .line 251
    invoke-virtual {v0, p0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 254
    :cond_1
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_priority_storage"

    .line 255
    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 256
    if-eqz v0, :cond_2

    .line 257
    invoke-virtual {v0, p0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 260
    :cond_2
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_facedetection_key"

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 261
    if-eqz v0, :cond_3

    .line 262
    invoke-virtual {v0, p0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 265
    :cond_3
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_scan_qrcode_key"

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 266
    if-eqz v0, :cond_4

    .line 267
    invoke-virtual {v0, p0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 270
    :cond_4
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "user_define_watermark"

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 271
    if-eqz v0, :cond_5

    .line 272
    invoke-virtual {v0, p0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 274
    :cond_5
    return-void
.end method

.method private registerListener(Landroid/preference/PreferenceGroup;Landroid/preference/Preference$OnPreferenceChangeListener;)V
    .locals 4

    .line 481
    invoke-virtual {p1}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v0

    .line 482
    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    .line 483
    invoke-virtual {p1, v1}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v2

    .line 484
    instance-of v3, v2, Landroid/preference/PreferenceGroup;

    if-eqz v3, :cond_0

    .line 485
    check-cast v2, Landroid/preference/PreferenceGroup;

    invoke-direct {p0, v2, p2}, Lcom/android/camera/BasePreferenceActivity;->registerListener(Landroid/preference/PreferenceGroup;Landroid/preference/Preference$OnPreferenceChangeListener;)V

    goto :goto_1

    .line 487
    :cond_0
    invoke-virtual {v2, p2}, Landroid/preference/Preference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 482
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 490
    :cond_1
    return-void
.end method

.method private removeFromGroup(Landroid/preference/Preference;Ljava/lang/String;)V
    .locals 1

    .line 157
    if-eqz p1, :cond_0

    instance-of v0, p1, Landroid/preference/PreferenceGroup;

    if-eqz v0, :cond_0

    check-cast p1, Landroid/preference/PreferenceGroup;

    .line 158
    invoke-virtual {p1}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v0

    if-lez v0, :cond_0

    .line 159
    invoke-virtual {p0, p1, p2}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 161
    :cond_0
    return-void
.end method

.method private removeIncompatibleAdvancePreference()V
    .locals 2

    .line 326
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_qc_camera_contrast_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 327
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_qc_camera_saturation_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 328
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_qc_camera_sharpness_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 329
    return-void
.end method

.method private removeIncompatibleVideoPreference()V
    .locals 2

    .line 315
    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    const/16 v1, 0xac

    if-ne v0, v1, :cond_0

    .line 316
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_video_quality_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    goto :goto_1

    .line 317
    :cond_0
    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    const/16 v1, 0xa1

    if-eq v0, v1, :cond_2

    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    const/16 v1, 0xae

    if-ne v0, v1, :cond_1

    goto :goto_0

    .line 321
    :cond_1
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_video_new_slow_motion_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    goto :goto_1

    .line 318
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_video_quality_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 319
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_video_new_slow_motion_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 323
    :goto_1
    return-void
.end method

.method private removeNonVideoPreference()V
    .locals 2

    .line 311
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "category_camera_setting"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 312
    return-void
.end method

.method private resetIfInvalid(Landroid/preference/ListPreference;)V
    .locals 2

    .line 473
    invoke-virtual {p1}, Landroid/preference/ListPreference;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 474
    invoke-virtual {p1, v0}, Landroid/preference/ListPreference;->findIndexOfValue(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 475
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/preference/ListPreference;->setValueIndex(I)V

    .line 477
    :cond_0
    return-void
.end method

.method private resetPreferences()V
    .locals 4

    .line 588
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/BasePreferenceActivity;->mHasReset:Z

    .line 590
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    .line 591
    invoke-virtual {v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getIntentType()I

    move-result v2

    .line 592
    invoke-virtual {v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->resetAll()V

    .line 594
    nop

    .line 595
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v1

    const/4 v3, 0x0

    invoke-interface {v1, v3, v2}, Lcom/android/camera/data/provider/DataProvider;->dataConfig(II)Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v1

    check-cast v1, Lcom/android/camera/data/data/config/DataItemConfig;

    .line 596
    invoke-virtual {v1}, Lcom/android/camera/data/data/config/DataItemConfig;->resetAll()V

    .line 598
    nop

    .line 599
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v1

    invoke-interface {v1, v0, v2}, Lcom/android/camera/data/provider/DataProvider;->dataConfig(II)Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/config/DataItemConfig;

    .line 600
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->resetAll()V

    .line 602
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->clearArrayMap()V

    .line 604
    invoke-static {}, Lcom/android/camera/data/DataRepository;->getInstance()Lcom/android/camera/data/DataRepository;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/DataRepository;->backUp()Lcom/android/camera/data/backup/DataBackUp;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/backup/DataBackUp;->clearBackUp()V

    .line 606
    invoke-static {}, Lcom/android/camera/Util;->generateCustomWatermark2File()Landroid/graphics/Bitmap;

    .line 607
    return-void
.end method

.method private resetSnapSetting()V
    .locals 3

    .line 610
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "key_long_press_volume_down"

    invoke-static {v0, v1}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 612
    const-string v1, "Street-snap-picture"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "Street-snap-movie"

    .line 613
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 614
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "key_long_press_volume_down"

    const-string v2, "none"

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Secure;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 618
    :cond_1
    return-void
.end method

.method private resetTimeOutFlag()V
    .locals 1

    .line 879
    iget-boolean v0, p0, Lcom/android/camera/BasePreferenceActivity;->mHasReset:Z

    if-nez v0, :cond_0

    .line 880
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->resetTimeOut()V

    .line 882
    :cond_0
    return-void
.end method

.method private restorePreferences()V
    .locals 2

    .line 578
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->resetPreferences()V

    .line 579
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->resetSnapSetting()V

    .line 581
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->initializeActivity()V

    .line 582
    nop

    .line 583
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/high16 v1, 0x7f0f0000

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    .line 582
    invoke-static {v0}, Lcom/android/camera/storage/PriorityStorageBroadcastReceiver;->setPriorityStorage(Z)V

    .line 584
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/android/camera/BasePreferenceActivity;->onSettingChanged(I)V

    .line 585
    return-void
.end method

.method private updateConflictPreference(Landroid/preference/Preference;)V
    .locals 3

    .line 850
    sget-boolean v0, Lcom/mi/config/b;->qk:Z

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/android/camera/CameraSettings;->isMovieSolidOn()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x6

    .line 851
    invoke-static {}, Lcom/android/camera/CameraSettings;->getPreferVideoQuality()I

    move-result v1

    if-gt v0, v1, :cond_1

    .line 852
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_movie_solid_key"

    .line 853
    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/CheckBoxPreference;

    .line 854
    iget-object v1, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v2, "pref_video_quality_key"

    .line 855
    invoke-virtual {v1, v2}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Lcom/android/camera/ui/PreviewListPreference;

    .line 856
    if-eqz p1, :cond_0

    const-string v2, "pref_camera_movie_solid_key"

    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 857
    const p1, 0x7f0b0020

    .line 858
    invoke-static {p1}, Lcom/android/camera/CameraSettings;->getDefaultPreferenceId(I)I

    move-result p1

    .line 857
    invoke-virtual {p0, p1}, Lcom/android/camera/BasePreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object p1

    .line 859
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferences:Lcom/android/camera/preferences/CameraSettingPreferences;

    invoke-virtual {v0}, Lcom/android/camera/preferences/CameraSettingPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 860
    const-string v2, "pref_video_quality_key"

    invoke-interface {v0, v2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 861
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 862
    invoke-virtual {v1, p1}, Lcom/android/camera/ui/PreviewListPreference;->setValue(Ljava/lang/String;)V

    .line 863
    goto :goto_0

    .line 864
    :cond_0
    iget-object p1, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferences:Lcom/android/camera/preferences/CameraSettingPreferences;

    invoke-virtual {p1}, Lcom/android/camera/preferences/CameraSettingPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 865
    const-string v1, "pref_camera_movie_solid_key"

    const/4 v2, 0x0

    invoke-interface {p1, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 866
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 867
    invoke-virtual {v0, v2}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 870
    :cond_1
    :goto_0
    return-void
.end method

.method private updateEntries()V
    .locals 6

    .line 677
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_camera_picturesize_key"

    .line 678
    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/PreviewListPreference;

    .line 679
    iget-object v1, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v2, "pref_camera_antibanding_key"

    .line 680
    invoke-virtual {v1, v2}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Lcom/android/camera/ui/PreviewListPreference;

    .line 681
    iget-object v2, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v3, "pref_auto_chroma_flash_key"

    .line 682
    invoke-virtual {v2, v3}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/CheckBoxPreference;

    .line 683
    iget-object v3, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v4, "pref_video_quality_key"

    .line 684
    invoke-virtual {v3, v4}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    check-cast v3, Lcom/android/camera/ui/PreviewListPreference;

    .line 685
    iget-object v4, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v5, "pref_camera_snap_key"

    .line 686
    invoke-virtual {v4, v5}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    check-cast v4, Lcom/android/camera/ui/PreviewListPreference;

    .line 688
    if-eqz v0, :cond_0

    .line 689
    invoke-static {}, Lcom/android/camera/PictureSizeManager;->getEntries()[Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/android/camera/ui/PreviewListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 690
    invoke-static {}, Lcom/android/camera/PictureSizeManager;->getEntryValues()[Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/android/camera/ui/PreviewListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    .line 691
    invoke-static {}, Lcom/android/camera/PictureSizeManager;->getDefaultValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/android/camera/ui/PreviewListPreference;->setDefaultValue(Ljava/lang/Object;)V

    .line 692
    invoke-static {}, Lcom/android/camera/PictureSizeManager;->getDefaultValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/android/camera/ui/PreviewListPreference;->setValue(Ljava/lang/String;)V

    .line 695
    :cond_0
    if-eqz v1, :cond_1

    invoke-static {}, Lcom/android/camera/Util;->isAntibanding60()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 696
    const v0, 0x7f0b00bf

    invoke-virtual {p0, v0}, Lcom/android/camera/BasePreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 697
    invoke-virtual {v1, v0}, Lcom/android/camera/ui/PreviewListPreference;->setValue(Ljava/lang/String;)V

    .line 698
    invoke-virtual {v1, v0}, Lcom/android/camera/ui/PreviewListPreference;->setDefaultValue(Ljava/lang/Object;)V

    .line 701
    :cond_1
    if-eqz v2, :cond_2

    .line 702
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0f0003

    .line 703
    invoke-static {v1}, Lcom/android/camera/CameraSettings;->getDefaultPreferenceId(I)I

    move-result v1

    .line 702
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    invoke-virtual {v2, v0}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 707
    :cond_2
    if-eqz v3, :cond_3

    .line 709
    const v0, 0x7f0b0020

    .line 710
    invoke-static {v0}, Lcom/android/camera/CameraSettings;->getDefaultPreferenceId(I)I

    move-result v0

    .line 709
    invoke-virtual {p0, v0}, Lcom/android/camera/BasePreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 711
    invoke-virtual {v3, v0}, Lcom/android/camera/ui/PreviewListPreference;->setDefaultValue(Ljava/lang/Object;)V

    .line 712
    invoke-virtual {v3, v0}, Lcom/android/camera/ui/PreviewListPreference;->setValue(Ljava/lang/String;)V

    .line 715
    :cond_3
    if-eqz v4, :cond_8

    invoke-static {}, Lcom/mi/config/b;->gR()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 716
    const v0, 0x7f0b0184

    invoke-virtual {p0, v0}, Lcom/android/camera/BasePreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 717
    invoke-virtual {v4, v0}, Lcom/android/camera/ui/PreviewListPreference;->setDefaultValue(Ljava/lang/Object;)V

    .line 718
    invoke-virtual {v4, v0}, Lcom/android/camera/ui/PreviewListPreference;->setValue(Ljava/lang/String;)V

    .line 721
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "key_long_press_volume_down"

    invoke-static {v0, v1}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 723
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "volumekey_wake_screen"

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    const/4 v2, 0x1

    if-eq v1, v2, :cond_7

    const-string v1, "public_transportation_shortcuts"

    .line 725
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    const-string v1, "none"

    .line 726
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    goto :goto_0

    .line 729
    :cond_4
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    const-string v2, "pref_camera_snap_key"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/android/camera/data/data/global/DataItemGlobal;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 730
    if-eqz v1, :cond_5

    .line 731
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v2, "key_long_press_volume_down"

    .line 733
    invoke-static {v1}, Lcom/android/camera/CameraSettings;->getMiuiSettingsKeyForStreetSnap(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 731
    invoke-static {v0, v2, v3}, Landroid/provider/Settings$Secure;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 734
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string v2, "pref_camera_snap_key"

    invoke-interface {v0, v2}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->remove(Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 735
    invoke-virtual {v4, v1}, Lcom/android/camera/ui/PreviewListPreference;->setValue(Ljava/lang/String;)V

    goto :goto_1

    .line 736
    :cond_5
    const-string v1, "Street-snap-picture"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 737
    const v0, 0x7f0b018a

    invoke-virtual {p0, v0}, Lcom/android/camera/BasePreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Lcom/android/camera/ui/PreviewListPreference;->setValue(Ljava/lang/String;)V

    goto :goto_1

    .line 738
    :cond_6
    const-string v1, "Street-snap-movie"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 739
    const v0, 0x7f0b018b

    invoke-virtual {p0, v0}, Lcom/android/camera/BasePreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Lcom/android/camera/ui/PreviewListPreference;->setValue(Ljava/lang/String;)V

    goto :goto_1

    .line 727
    :cond_7
    :goto_0
    const v0, 0x7f0b018c

    invoke-virtual {p0, v0}, Lcom/android/camera/BasePreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Lcom/android/camera/ui/PreviewListPreference;->setValue(Ljava/lang/String;)V

    .line 743
    :cond_8
    :goto_1
    return-void
.end method

.method private updatePreferences(Landroid/preference/PreferenceGroup;Landroid/content/SharedPreferences;)V
    .locals 7

    .line 760
    if-nez p1, :cond_0

    .line 761
    return-void

    .line 763
    :cond_0
    invoke-virtual {p1}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v0

    .line 764
    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_5

    .line 765
    invoke-virtual {p1, v2}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v3

    .line 766
    instance-of v4, v3, Lcom/android/camera/ui/PreviewListPreference;

    if-eqz v4, :cond_2

    .line 767
    move-object v4, v3

    check-cast v4, Lcom/android/camera/ui/PreviewListPreference;

    .line 768
    const-string v5, "pref_camera_picturesize_key"

    invoke-virtual {v4}, Lcom/android/camera/ui/PreviewListPreference;->getKey()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 769
    invoke-static {}, Lcom/android/camera/PictureSizeManager;->getPictureSizeRatioString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/android/camera/ui/PreviewListPreference;->setValue(Ljava/lang/String;)V

    goto :goto_1

    .line 771
    :cond_1
    invoke-direct {p0, v4, p2}, Lcom/android/camera/BasePreferenceActivity;->getFilterValue(Lcom/android/camera/ui/PreviewListPreference;Landroid/content/SharedPreferences;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/android/camera/ui/PreviewListPreference;->setValue(Ljava/lang/String;)V

    .line 773
    :goto_1
    invoke-virtual {v3, v1}, Landroid/preference/Preference;->setPersistent(Z)V

    .line 774
    goto :goto_2

    :cond_2
    instance-of v4, v3, Landroid/preference/CheckBoxPreference;

    if-eqz v4, :cond_3

    .line 775
    move-object v4, v3

    check-cast v4, Landroid/preference/CheckBoxPreference;

    .line 776
    invoke-virtual {v4}, Landroid/preference/CheckBoxPreference;->getKey()Ljava/lang/String;

    move-result-object v5

    .line 777
    invoke-virtual {v4}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v6

    invoke-interface {p2, v5, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    invoke-virtual {v4, v5}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 778
    invoke-virtual {v3, v1}, Landroid/preference/Preference;->setPersistent(Z)V

    .line 779
    goto :goto_2

    :cond_3
    instance-of v4, v3, Landroid/preference/PreferenceGroup;

    if-eqz v4, :cond_4

    .line 780
    check-cast v3, Landroid/preference/PreferenceGroup;

    invoke-direct {p0, v3, p2}, Lcom/android/camera/BasePreferenceActivity;->updatePreferences(Landroid/preference/PreferenceGroup;Landroid/content/SharedPreferences;)V

    goto :goto_2

    .line 783
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

    .line 764
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 786
    :cond_5
    return-void
.end method

.method private updateQRCodeEntry()V
    .locals 4

    .line 746
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_scan_qrcode_key"

    .line 747
    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/CheckBoxPreference;

    .line 748
    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferences:Lcom/android/camera/preferences/CameraSettingPreferences;

    const-string v2, "pref_scan_qrcode_key"

    .line 749
    invoke-virtual {v0}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v3

    invoke-virtual {v1, v2, v3}, Lcom/android/camera/preferences/CameraSettingPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 750
    invoke-static {p0}, Lcom/android/camera/CameraSettings;->isQRCodeReceiverAvailable(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 751
    sget-object v1, Lcom/android/camera/BasePreferenceActivity;->TAG:Ljava/lang/String;

    const-string v2, "disable QRCodeScan"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 752
    iget-object v1, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferences:Lcom/android/camera/preferences/CameraSettingPreferences;

    invoke-virtual {v1}, Lcom/android/camera/preferences/CameraSettingPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 753
    const-string v2, "pref_scan_qrcode_key"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 754
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 755
    invoke-virtual {v0, v3}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 757
    :cond_0
    return-void
.end method


# virtual methods
.method protected addPreference(Ljava/lang/String;Landroid/preference/Preference;)Z
    .locals 1

    .line 668
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    invoke-virtual {v0, p1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    .line 669
    instance-of v0, p1, Landroid/preference/PreferenceGroup;

    if-eqz v0, :cond_0

    .line 670
    check-cast p1, Landroid/preference/PreferenceGroup;

    invoke-virtual {p1, p2}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 671
    const/4 p1, 0x1

    return p1

    .line 673
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method protected filterByIntent()V
    .locals 3

    .line 814
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "remove_keys"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 815
    if-eqz v0, :cond_0

    .line 816
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 817
    iget-object v2, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    invoke-virtual {p0, v2, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 818
    goto :goto_0

    .line 820
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

    .line 457
    if-eqz p3, :cond_2

    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-gt v0, v1, :cond_0

    goto :goto_0

    .line 462
    :cond_0
    invoke-virtual {p2, p3}, Lcom/android/camera/ui/PreviewListPreference;->filterUnsupported(Ljava/util/List;)V

    .line 463
    invoke-virtual {p2}, Lcom/android/camera/ui/PreviewListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object p3

    array-length p3, p3

    if-gt p3, v1, :cond_1

    .line 464
    invoke-virtual {p2}, Lcom/android/camera/ui/PreviewListPreference;->getKey()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 465
    return-void

    .line 468
    :cond_1
    invoke-direct {p0, p2}, Lcom/android/camera/BasePreferenceActivity;->resetIfInvalid(Landroid/preference/ListPreference;)V

    .line 469
    return-void

    .line 458
    :cond_2
    :goto_0
    invoke-virtual {p2}, Lcom/android/camera/ui/PreviewListPreference;->getKey()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 459
    return-void
.end method

.method protected abstract getPreferenceXml()I
.end method

.method public onBackPressed()V
    .locals 0

    .line 874
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->resetTimeOutFlag()V

    .line 861
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onBackPressed()V

    .line 876
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 66
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 67
    invoke-static {p0}, Lcom/android/camera/Util;->updateCountryIso(Landroid/content/Context;)V

    .line 68
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "from_where"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    .line 69
    invoke-static {}, Lcom/android/camera/preferences/CameraSettingPreferences;->instance()Lcom/android/camera/preferences/CameraSettingPreferences;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferences:Lcom/android/camera/preferences/CameraSettingPreferences;

    .line 70
    invoke-static {}, Lcom/android/camera/CameraSettings;->upgradeGlobalPreferences()V

    .line 71
    invoke-static {p0}, Lcom/android/camera/storage/Storage;->initStorage(Landroid/content/Context;)V

    .line 72
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->initializeActivity()V

    .line 73
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "StartActivityWhenLocked"

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 74
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/high16 v0, 0x80000

    invoke-virtual {p1, v0}, Landroid/view/Window;->addFlags(I)V

    .line 76
    :cond_0
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2

    .line 805
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x102002c

    if-ne v0, v1, :cond_0

    .line 806
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->resetTimeOutFlag()V

    .line 807
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->finish()V

    .line 808
    const/4 p1, 0x1

    return p1

    .line 810
    :cond_0
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 5

    .line 622
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/BasePreferenceActivity;->onSettingChanged(I)V

    .line 623
    iget-object v1, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferences:Lcom/android/camera/preferences/CameraSettingPreferences;

    invoke-virtual {v1}, Lcom/android/camera/preferences/CameraSettingPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 624
    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v2

    .line 625
    instance-of v3, p2, Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 626
    move-object v3, p2

    check-cast v3, Ljava/lang/String;

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    .line 627
    :cond_0
    instance-of v3, p2, Ljava/lang/Boolean;

    if-eqz v3, :cond_1

    .line 628
    move-object v3, p2

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    .line 629
    :cond_1
    instance-of v3, p2, Ljava/lang/Integer;

    if-eqz v3, :cond_2

    .line 630
    move-object v3, p2

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    .line 631
    :cond_2
    instance-of v3, p2, Ljava/lang/Long;

    if-eqz v3, :cond_3

    .line 632
    move-object v3, p2

    check-cast v3, Ljava/lang/Long;

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-interface {v1, v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    .line 633
    :cond_3
    instance-of v3, p2, Ljava/lang/Float;

    if-eqz v3, :cond_4

    .line 634
    move-object v3, p2

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    .line 639
    :goto_0
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 640
    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, p2}, Lcom/android/camera/statistic/CameraStatUtil;->trackPreferenceChange(Ljava/lang/String;Ljava/lang/Object;)V

    .line 642
    invoke-direct {p0, p1}, Lcom/android/camera/BasePreferenceActivity;->updateConflictPreference(Landroid/preference/Preference;)V

    .line 643
    return v0

    .line 636
    :cond_4
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "unhandled new value with type="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 637
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
    .locals 10

    .line 494
    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v0

    const-string v1, "pref_restore"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/high16 v1, 0x1040000

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    .line 495
    new-instance v7, Lcom/android/camera/BasePreferenceActivity$1;

    invoke-direct {v7, p0}, Lcom/android/camera/BasePreferenceActivity$1;-><init>(Lcom/android/camera/BasePreferenceActivity;)V

    .line 502
    const p1, 0x7f0b000f

    .line 503
    invoke-virtual {p0, p1}, Lcom/android/camera/BasePreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    const p1, 0x7f0b0010

    .line 504
    invoke-virtual {p0, p1}, Lcom/android/camera/BasePreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    const p1, 0x104000a

    .line 505
    invoke-virtual {p0, p1}, Lcom/android/camera/BasePreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 506
    invoke-virtual {p0, v1}, Lcom/android/camera/BasePreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    .line 502
    move-object v3, p0

    invoke-static/range {v3 .. v9}, Lcom/android/camera/RotateDialogController;->showSystemAlertDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/app/AlertDialog;

    .line 507
    return v2

    .line 510
    :cond_0
    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v0

    const-string v3, "pref_privacy"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 511
    invoke-static {p0}, Lcom/android/camera/ActivityLauncher;->launchPrivacyPolicyWebpage(Landroid/content/Context;)V

    .line 512
    return v2

    .line 515
    :cond_1
    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v0

    const-string v3, "user_define_watermark"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 516
    new-instance p1, Landroid/content/Intent;

    const-class v0, Lcom/android/camera/UserDefineWatermarkActivity;

    invoke-direct {p1, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 517
    iput-boolean v2, p0, Lcom/android/camera/BasePreferenceActivity;->mGoToActivity:Z

    .line 518
    invoke-virtual {p0, p1}, Lcom/android/camera/BasePreferenceActivity;->startActivity(Landroid/content/Intent;)V

    .line 519
    return v2

    .line 522
    :cond_2
    const-string v0, "pref_priority_storage"

    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 523
    check-cast p1, Landroid/preference/CheckBoxPreference;

    .line 524
    invoke-virtual {p1}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result p1

    .line 523
    invoke-static {p1}, Lcom/android/camera/storage/PriorityStorageBroadcastReceiver;->setPriorityStorage(Z)V

    goto :goto_0

    .line 525
    :cond_3
    const-string v0, "pref_scan_qrcode_key"

    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 526
    invoke-static {p0}, Lcom/android/camera/CameraSettings;->isQRCodeReceiverAvailable(Landroid/content/Context;)Z

    move-result p1

    if-nez p1, :cond_4

    .line 527
    new-instance v7, Lcom/android/camera/BasePreferenceActivity$2;

    invoke-direct {v7, p0}, Lcom/android/camera/BasePreferenceActivity$2;-><init>(Lcom/android/camera/BasePreferenceActivity;)V

    .line 534
    const p1, 0x7f0b01eb

    .line 535
    invoke-virtual {p0, p1}, Lcom/android/camera/BasePreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    const p1, 0x7f0b01ec

    .line 536
    invoke-virtual {p0, p1}, Lcom/android/camera/BasePreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    const p1, 0x7f0b01ea

    .line 537
    invoke-virtual {p0, p1}, Lcom/android/camera/BasePreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 538
    invoke-virtual {p0, v1}, Lcom/android/camera/BasePreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    .line 534
    move-object v3, p0

    invoke-static/range {v3 .. v9}, Lcom/android/camera/RotateDialogController;->showSystemAlertDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/app/AlertDialog;

    .line 539
    return v2

    .line 542
    :cond_4
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method protected onRestart()V
    .locals 1

    .line 829
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onRestart()V

    .line 840
    iget-boolean v0, p0, Lcom/android/camera/BasePreferenceActivity;->mGoToActivity:Z

    if-eqz v0, :cond_0

    .line 841
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/BasePreferenceActivity;->mGoToActivity:Z

    goto :goto_0

    .line 843
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->finish()V

    .line 845
    :goto_0
    return-void
.end method

.method protected onResume()V
    .locals 2

    .line 80
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onResume()V

    .line 81
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->updateQRCodeEntry()V

    .line 82
    invoke-static {}, Lcom/android/camera/Util;->isLabOptionsVisible()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 83
    const v0, 0x7f0b0111

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 85
    :cond_0
    return-void
.end method

.method protected abstract onSettingChanged(I)V
.end method

.method protected removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z
    .locals 6

    .line 647
    invoke-virtual {p1, p2}, Landroid/preference/PreferenceGroup;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 648
    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 649
    invoke-virtual {p1, v0}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 650
    return v1

    .line 654
    :cond_0
    invoke-virtual {p1}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v0

    .line 655
    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v0, :cond_2

    .line 656
    invoke-virtual {p1, v3}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v4

    .line 657
    instance-of v5, v4, Landroid/preference/PreferenceGroup;

    if-eqz v5, :cond_1

    .line 658
    check-cast v4, Landroid/preference/PreferenceGroup;

    invoke-virtual {p0, v4, p2}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 659
    return v1

    .line 655
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 664
    :cond_2
    return v2
.end method
