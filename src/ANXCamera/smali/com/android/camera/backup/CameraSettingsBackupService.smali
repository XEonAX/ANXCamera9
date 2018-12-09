.class public Lcom/android/camera/backup/CameraSettingsBackupService;
.super Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase;
.source "CameraSettingsBackupService.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 6
    invoke-direct {p0}, Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase;-><init>()V

    return-void
.end method


# virtual methods
.method protected getBackupImpl()Lcom/xiaomi/settingsdk/backup/ICloudBackup;
    .locals 1

    .line 9
    new-instance v0, Lcom/android/camera/backup/CameraSettingsBackupImpl;

    invoke-direct {v0}, Lcom/android/camera/backup/CameraSettingsBackupImpl;-><init>()V

    return-object v0
.end method
