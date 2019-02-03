.class public interface abstract Lcom/android/camera/data/backup/DataBackUp;
.super Ljava/lang/Object;
.source "DataBackUp.java"


# virtual methods
.method public abstract backupRunning(Lcom/android/camera/data/data/runing/DataItemRunning;IIZ)V
.end method

.method public abstract clearBackUp()V
.end method

.method public abstract getBackupFilter(II)Ljava/lang/String;
.end method

.method public abstract getBackupRunning(II)Landroid/support/v4/util/SimpleArrayMap;
.end method

.method public abstract getBackupSwitchState(ILjava/lang/String;I)Z
.end method

.method public abstract isLastVideoFastMotion()Z
.end method

.method public abstract isLastVideoHFRMode()Z
.end method

.method public abstract isLastVideoSlowMotion()Z
.end method

.method public abstract removeOtherVideoMode()V
.end method

.method public abstract revertRunning(Lcom/android/camera/data/data/runing/DataItemRunning;II)V
.end method

.method public abstract startBackup(Lcom/android/camera/data/provider/DataProvider$ProviderEvent;I)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<P::",
            "Lcom/android/camera/data/provider/DataProvider$ProviderEvent;",
            ">(TP;I)V"
        }
    .end annotation
.end method
