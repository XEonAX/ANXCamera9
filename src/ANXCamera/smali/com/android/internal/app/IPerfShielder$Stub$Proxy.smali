.class Lcom/android/internal/app/IPerfShielder$Stub$Proxy;
.super Ljava/lang/Object;
.source "IPerfShielder.java"

# interfaces
.implements Lcom/android/internal/app/IPerfShielder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/app/IPerfShielder$Stub;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Proxy"
.end annotation


# instance fields
.field private mRemote:Landroid/os/IBinder;


# direct methods
.method constructor <init>(Landroid/os/IBinder;)V
    .registers 2
    .param p1, "remote"    # Landroid/os/IBinder;

    .line 539
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 540
    iput-object p1, p0, Lcom/android/internal/app/IPerfShielder$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    .line 541
    return-void
.end method


# virtual methods
.method public abortMatchingScenario(Landroid/os/statistics/E2EScenario;Ljava/lang/String;IJ)V
    .registers 11
    .param p1, "scenario"    # Landroid/os/statistics/E2EScenario;
    .param p2, "tag"    # Ljava/lang/String;
    .param p3, "tid"    # I
    .param p4, "uptimeMillis"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1080
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 1081
    .local v0, "_data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 1083
    .local v1, "_reply":Landroid/os/Parcel;
    :try_start_8
    const-string v2, "com.android.internal.app.IPerfShielder"

    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 1084
    const/4 v2, 0x0

    if-eqz p1, :cond_18

    .line 1085
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 1086
    invoke-virtual {p1, v0, v2}, Landroid/os/statistics/E2EScenario;->writeToParcel(Landroid/os/Parcel;I)V

    goto :goto_1b

    .line 1089
    :cond_18
    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 1091
    :goto_1b
    invoke-virtual {v0, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 1092
    invoke-virtual {v0, p3}, Landroid/os/Parcel;->writeInt(I)V

    .line 1093
    invoke-virtual {v0, p4, p5}, Landroid/os/Parcel;->writeLong(J)V

    .line 1094
    iget-object v3, p0, Lcom/android/internal/app/IPerfShielder$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/16 v4, 0x1e

    invoke-interface {v3, v4, v0, v1, v2}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 1095
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V
    :try_end_2e
    .catchall {:try_start_8 .. :try_end_2e} :catchall_36

    .line 1098
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 1099
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 1100
    nop

    .line 1101
    return-void

    .line 1098
    :catchall_36
    move-exception v2

    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 1099
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    throw v2
.end method

.method public abortSpecificScenario(Landroid/os/Bundle;IJ)V
    .registers 10
    .param p1, "scenarioBundle"    # Landroid/os/Bundle;
    .param p2, "tid"    # I
    .param p3, "uptimeMillis"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1104
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 1105
    .local v0, "_data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 1107
    .local v1, "_reply":Landroid/os/Parcel;
    :try_start_8
    const-string v2, "com.android.internal.app.IPerfShielder"

    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 1108
    const/4 v2, 0x0

    if-eqz p1, :cond_18

    .line 1109
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 1110
    invoke-virtual {p1, v0, v2}, Landroid/os/Bundle;->writeToParcel(Landroid/os/Parcel;I)V

    goto :goto_1b

    .line 1113
    :cond_18
    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 1115
    :goto_1b
    invoke-virtual {v0, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 1116
    invoke-virtual {v0, p3, p4}, Landroid/os/Parcel;->writeLong(J)V

    .line 1117
    iget-object v3, p0, Lcom/android/internal/app/IPerfShielder$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/16 v4, 0x1f

    invoke-interface {v3, v4, v0, v1, v2}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 1118
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V
    :try_end_2b
    .catchall {:try_start_8 .. :try_end_2b} :catchall_33

    .line 1121
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 1122
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 1123
    nop

    .line 1124
    return-void

    .line 1121
    :catchall_33
    move-exception v2

    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 1122
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    throw v2
.end method

.method public addActivityLaunchTime(Ljava/lang/String;Ljava/lang/String;JJZZ)V
    .registers 14
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "activityName"    # Ljava/lang/String;
    .param p3, "launchStartTime"    # J
    .param p5, "launchEndTime"    # J
    .param p7, "fromHome"    # Z
    .param p8, "isColdStart"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 571
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 573
    .local v0, "_data":Landroid/os/Parcel;
    :try_start_4
    const-string v1, "com.android.internal.app.IPerfShielder"

    invoke-virtual {v0, v1}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 574
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 575
    invoke-virtual {v0, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 576
    invoke-virtual {v0, p3, p4}, Landroid/os/Parcel;->writeLong(J)V

    .line 577
    invoke-virtual {v0, p5, p6}, Landroid/os/Parcel;->writeLong(J)V

    .line 578
    invoke-virtual {v0, p7}, Landroid/os/Parcel;->writeInt(I)V

    .line 579
    invoke-virtual {v0, p8}, Landroid/os/Parcel;->writeInt(I)V

    .line 580
    iget-object v1, p0, Lcom/android/internal/app/IPerfShielder$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/4 v2, 0x2

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-interface {v1, v2, v0, v3, v4}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    :try_end_23
    .catchall {:try_start_4 .. :try_end_23} :catchall_28

    .line 583
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 584
    nop

    .line 585
    return-void

    .line 583
    :catchall_28
    move-exception v1

    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    throw v1
.end method

.method public addCallingPkgHookRule(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .registers 9
    .param p1, "hostApp"    # Ljava/lang/String;
    .param p2, "originCallingPkg"    # Ljava/lang/String;
    .param p3, "hookCallingPkg"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 972
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 973
    .local v0, "_data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 976
    .local v1, "_reply":Landroid/os/Parcel;
    :try_start_8
    const-string v2, "com.android.internal.app.IPerfShielder"

    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 977
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 978
    invoke-virtual {v0, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 979
    invoke-virtual {v0, p3}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 980
    iget-object v2, p0, Lcom/android/internal/app/IPerfShielder$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/16 v3, 0x1a

    const/4 v4, 0x0

    invoke-interface {v2, v3, v0, v1, v4}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 981
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V

    .line 982
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    move-result v2
    :try_end_25
    .catchall {:try_start_8 .. :try_end_25} :catchall_33

    if-eqz v2, :cond_29

    const/4 v4, 0x1

    nop

    :cond_29
    move v2, v4

    .line 985
    .local v2, "_result":Z
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 986
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 987
    nop

    .line 986
    nop

    .line 988
    return v2

    .line 985
    .end local v2    # "_result":Z
    :catchall_33
    move-exception v2

    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 986
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    throw v2
.end method

.method public addTimeConsumingIntent([Ljava/lang/String;)V
    .registers 7
    .param p1, "actions"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 784
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 785
    .local v0, "_data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 787
    .local v1, "_reply":Landroid/os/Parcel;
    :try_start_8
    const-string v2, "com.android.internal.app.IPerfShielder"

    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 788
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeStringArray([Ljava/lang/String;)V

    .line 789
    iget-object v2, p0, Lcom/android/internal/app/IPerfShielder$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/16 v3, 0x10

    const/4 v4, 0x0

    invoke-interface {v2, v3, v0, v1, v4}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 790
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V
    :try_end_1b
    .catchall {:try_start_8 .. :try_end_1b} :catchall_23

    .line 793
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 794
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 795
    nop

    .line 796
    return-void

    .line 793
    :catchall_23
    move-exception v2

    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 794
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    throw v2
.end method

.method public asBinder()Landroid/os/IBinder;
    .registers 2

    .line 544
    iget-object v0, p0, Lcom/android/internal/app/IPerfShielder$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    return-object v0
.end method

.method public beginScenario(Landroid/os/statistics/E2EScenario;Landroid/os/statistics/E2EScenarioSettings;Ljava/lang/String;Landroid/os/statistics/E2EScenarioPayload;IJZ)Landroid/os/Bundle;
    .registers 14
    .param p1, "scenario"    # Landroid/os/statistics/E2EScenario;
    .param p2, "settings"    # Landroid/os/statistics/E2EScenarioSettings;
    .param p3, "tag"    # Ljava/lang/String;
    .param p4, "payload"    # Landroid/os/statistics/E2EScenarioPayload;
    .param p5, "tid"    # I
    .param p6, "uptimeMillis"    # J
    .param p8, "needResultBundle"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1033
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 1034
    .local v0, "_data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 1037
    .local v1, "_reply":Landroid/os/Parcel;
    :try_start_8
    const-string v2, "com.android.internal.app.IPerfShielder"

    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 1038
    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz p1, :cond_18

    .line 1039
    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 1040
    invoke-virtual {p1, v0, v3}, Landroid/os/statistics/E2EScenario;->writeToParcel(Landroid/os/Parcel;I)V

    goto :goto_1b

    .line 1043
    :cond_18
    invoke-virtual {v0, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 1045
    :goto_1b
    if-eqz p2, :cond_24

    .line 1046
    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 1047
    invoke-virtual {p2, v0, v3}, Landroid/os/statistics/E2EScenarioSettings;->writeToParcel(Landroid/os/Parcel;I)V

    goto :goto_27

    .line 1050
    :cond_24
    invoke-virtual {v0, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 1052
    :goto_27
    invoke-virtual {v0, p3}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 1053
    if-eqz p4, :cond_33

    .line 1054
    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 1055
    invoke-virtual {p4, v0, v3}, Landroid/os/statistics/E2EScenarioPayload;->writeToParcel(Landroid/os/Parcel;I)V

    goto :goto_36

    .line 1058
    :cond_33
    invoke-virtual {v0, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 1060
    :goto_36
    invoke-virtual {v0, p5}, Landroid/os/Parcel;->writeInt(I)V

    .line 1061
    invoke-virtual {v0, p6, p7}, Landroid/os/Parcel;->writeLong(J)V

    .line 1062
    invoke-virtual {v0, p8}, Landroid/os/Parcel;->writeInt(I)V

    .line 1063
    iget-object v2, p0, Lcom/android/internal/app/IPerfShielder$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/16 v4, 0x1d

    invoke-interface {v2, v4, v0, v1, v3}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 1064
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V

    .line 1065
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_58

    .line 1066
    sget-object v2, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v2, v1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/Bundle;
    :try_end_57
    .catchall {:try_start_8 .. :try_end_57} :catchall_62

    .local v2, "_result":Landroid/os/Bundle;
    goto :goto_59

    .line 1069
    .end local v2    # "_result":Landroid/os/Bundle;
    :cond_58
    const/4 v2, 0x0

    .line 1073
    .restart local v2    # "_result":Landroid/os/Bundle;
    :goto_59
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 1074
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 1075
    nop

    .line 1074
    nop

    .line 1076
    return-object v2

    .line 1073
    .end local v2    # "_result":Landroid/os/Bundle;
    :catchall_62
    move-exception v2

    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 1074
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    throw v2
.end method

.method public clearTimeConsumingIntent()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 814
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 815
    .local v0, "_data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 817
    .local v1, "_reply":Landroid/os/Parcel;
    :try_start_8
    const-string v2, "com.android.internal.app.IPerfShielder"

    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 818
    iget-object v2, p0, Lcom/android/internal/app/IPerfShielder$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/16 v3, 0x12

    const/4 v4, 0x0

    invoke-interface {v2, v3, v0, v1, v4}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 819
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V
    :try_end_18
    .catchall {:try_start_8 .. :try_end_18} :catchall_20

    .line 822
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 823
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 824
    nop

    .line 825
    return-void

    .line 822
    :catchall_20
    move-exception v2

    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 823
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    throw v2
.end method

.method public closeCheckPriority()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 746
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 747
    .local v0, "_data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 749
    .local v1, "_reply":Landroid/os/Parcel;
    :try_start_8
    const-string v2, "com.android.internal.app.IPerfShielder"

    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 750
    iget-object v2, p0, Lcom/android/internal/app/IPerfShielder$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/16 v3, 0xd

    const/4 v4, 0x0

    invoke-interface {v2, v3, v0, v1, v4}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 751
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V
    :try_end_18
    .catchall {:try_start_8 .. :try_end_18} :catchall_20

    .line 754
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 755
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 756
    nop

    .line 757
    return-void

    .line 754
    :catchall_20
    move-exception v2

    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 755
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    throw v2
.end method

.method public deletePackageInfo(Ljava/lang/String;)Z
    .registers 7
    .param p1, "pkgName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 919
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 920
    .local v0, "_data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 923
    .local v1, "_reply":Landroid/os/Parcel;
    :try_start_8
    const-string v2, "com.android.internal.app.IPerfShielder"

    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 924
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 925
    iget-object v2, p0, Lcom/android/internal/app/IPerfShielder$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/16 v3, 0x17

    const/4 v4, 0x0

    invoke-interface {v2, v3, v0, v1, v4}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 926
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V

    .line 927
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    move-result v2
    :try_end_1f
    .catchall {:try_start_8 .. :try_end_1f} :catchall_2d

    if-eqz v2, :cond_23

    const/4 v4, 0x1

    nop

    :cond_23
    move v2, v4

    .line 930
    .local v2, "_result":Z
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 931
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 932
    nop

    .line 931
    nop

    .line 933
    return v2

    .line 930
    .end local v2    # "_result":Z
    :catchall_2d
    move-exception v2

    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 931
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    throw v2
.end method

.method public deleteRedirectRule(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 8
    .param p1, "callingPkg"    # Ljava/lang/String;
    .param p2, "destPkg"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 874
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 875
    .local v0, "_data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 878
    .local v1, "_reply":Landroid/os/Parcel;
    :try_start_8
    const-string v2, "com.android.internal.app.IPerfShielder"

    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 879
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 880
    invoke-virtual {v0, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 881
    iget-object v2, p0, Lcom/android/internal/app/IPerfShielder$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/16 v3, 0x15

    const/4 v4, 0x0

    invoke-interface {v2, v3, v0, v1, v4}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 882
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V

    .line 883
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    move-result v2
    :try_end_22
    .catchall {:try_start_8 .. :try_end_22} :catchall_30

    if-eqz v2, :cond_26

    const/4 v4, 0x1

    nop

    :cond_26
    move v2, v4

    .line 886
    .local v2, "_result":Z
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 887
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 888
    nop

    .line 887
    nop

    .line 889
    return v2

    .line 886
    .end local v2    # "_result":Z
    :catchall_30
    move-exception v2

    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 887
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    throw v2
.end method

.method public finishMatchingScenario(Landroid/os/statistics/E2EScenario;Ljava/lang/String;Landroid/os/statistics/E2EScenarioPayload;IJ)V
    .registers 12
    .param p1, "scenario"    # Landroid/os/statistics/E2EScenario;
    .param p2, "tag"    # Ljava/lang/String;
    .param p3, "payload"    # Landroid/os/statistics/E2EScenarioPayload;
    .param p4, "tid"    # I
    .param p5, "uptimeMillis"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1127
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 1128
    .local v0, "_data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 1130
    .local v1, "_reply":Landroid/os/Parcel;
    :try_start_8
    const-string v2, "com.android.internal.app.IPerfShielder"

    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 1131
    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz p1, :cond_18

    .line 1132
    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 1133
    invoke-virtual {p1, v0, v3}, Landroid/os/statistics/E2EScenario;->writeToParcel(Landroid/os/Parcel;I)V

    goto :goto_1b

    .line 1136
    :cond_18
    invoke-virtual {v0, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 1138
    :goto_1b
    invoke-virtual {v0, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 1139
    if-eqz p3, :cond_27

    .line 1140
    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 1141
    invoke-virtual {p3, v0, v3}, Landroid/os/statistics/E2EScenarioPayload;->writeToParcel(Landroid/os/Parcel;I)V

    goto :goto_2a

    .line 1144
    :cond_27
    invoke-virtual {v0, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 1146
    :goto_2a
    invoke-virtual {v0, p4}, Landroid/os/Parcel;->writeInt(I)V

    .line 1147
    invoke-virtual {v0, p5, p6}, Landroid/os/Parcel;->writeLong(J)V

    .line 1148
    iget-object v2, p0, Lcom/android/internal/app/IPerfShielder$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/16 v4, 0x20

    invoke-interface {v2, v4, v0, v1, v3}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 1149
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V
    :try_end_3a
    .catchall {:try_start_8 .. :try_end_3a} :catchall_42

    .line 1152
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 1153
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 1154
    nop

    .line 1155
    return-void

    .line 1152
    :catchall_42
    move-exception v2

    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 1153
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    throw v2
.end method

.method public finishSpecificScenario(Landroid/os/Bundle;Landroid/os/statistics/E2EScenarioPayload;IJ)V
    .registers 11
    .param p1, "scenarioBundle"    # Landroid/os/Bundle;
    .param p2, "payload"    # Landroid/os/statistics/E2EScenarioPayload;
    .param p3, "tid"    # I
    .param p4, "uptimeMillis"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1158
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 1159
    .local v0, "_data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 1161
    .local v1, "_reply":Landroid/os/Parcel;
    :try_start_8
    const-string v2, "com.android.internal.app.IPerfShielder"

    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 1162
    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz p1, :cond_18

    .line 1163
    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 1164
    invoke-virtual {p1, v0, v3}, Landroid/os/Bundle;->writeToParcel(Landroid/os/Parcel;I)V

    goto :goto_1b

    .line 1167
    :cond_18
    invoke-virtual {v0, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 1169
    :goto_1b
    if-eqz p2, :cond_24

    .line 1170
    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 1171
    invoke-virtual {p2, v0, v3}, Landroid/os/statistics/E2EScenarioPayload;->writeToParcel(Landroid/os/Parcel;I)V

    goto :goto_27

    .line 1174
    :cond_24
    invoke-virtual {v0, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 1176
    :goto_27
    invoke-virtual {v0, p3}, Landroid/os/Parcel;->writeInt(I)V

    .line 1177
    invoke-virtual {v0, p4, p5}, Landroid/os/Parcel;->writeLong(J)V

    .line 1178
    iget-object v2, p0, Lcom/android/internal/app/IPerfShielder$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/16 v4, 0x21

    invoke-interface {v2, v4, v0, v1, v3}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 1179
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V
    :try_end_37
    .catchall {:try_start_8 .. :try_end_37} :catchall_3f

    .line 1182
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 1183
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 1184
    nop

    .line 1185
    return-void

    .line 1182
    :catchall_3f
    move-exception v2

    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 1183
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    throw v2
.end method

.method public getAllRunningProcessMemInfos()Ljava/util/List;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/os/Bundle;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 649
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 650
    .local v0, "_data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 653
    .local v1, "_reply":Landroid/os/Parcel;
    :try_start_8
    const-string v2, "com.android.internal.app.IPerfShielder"

    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 654
    iget-object v2, p0, Lcom/android/internal/app/IPerfShielder$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/4 v3, 0x7

    const/4 v4, 0x0

    invoke-interface {v2, v3, v0, v1, v4}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 655
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V

    .line 656
    sget-object v2, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    move-result-object v2
    :try_end_1d
    .catchall {:try_start_8 .. :try_end_1d} :catchall_26

    .line 659
    .local v2, "_result":Ljava/util/List;, "Ljava/util/List<Landroid/os/Bundle;>;"
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 660
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 661
    nop

    .line 660
    nop

    .line 662
    return-object v2

    .line 659
    .end local v2    # "_result":Ljava/util/List;, "Ljava/util/List<Landroid/os/Bundle;>;"
    :catchall_26
    move-exception v2

    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 660
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    throw v2
.end method

.method public getFreeMemory()J
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 937
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 938
    .local v0, "_data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 941
    .local v1, "_reply":Landroid/os/Parcel;
    :try_start_8
    const-string v2, "com.android.internal.app.IPerfShielder"

    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 942
    iget-object v2, p0, Lcom/android/internal/app/IPerfShielder$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/16 v3, 0x18

    const/4 v4, 0x0

    invoke-interface {v2, v3, v0, v1, v4}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 943
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V

    .line 944
    invoke-virtual {v1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v2
    :try_end_1c
    .catchall {:try_start_8 .. :try_end_1c} :catchall_25

    .line 947
    .local v2, "_result":J
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 948
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 949
    nop

    .line 948
    nop

    .line 950
    return-wide v2

    .line 947
    .end local v2    # "_result":J
    :catchall_25
    move-exception v2

    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 948
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    throw v2
.end method

.method public getInterfaceDescriptor()Ljava/lang/String;
    .registers 2

    .line 548
    const-string v0, "com.android.internal.app.IPerfShielder"

    return-object v0
.end method

.method public getMemoryTrimLevel()I
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 828
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 829
    .local v0, "_data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 832
    .local v1, "_reply":Landroid/os/Parcel;
    :try_start_8
    const-string v2, "com.android.internal.app.IPerfShielder"

    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 833
    iget-object v2, p0, Lcom/android/internal/app/IPerfShielder$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/16 v3, 0x13

    const/4 v4, 0x0

    invoke-interface {v2, v3, v0, v1, v4}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 834
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V

    .line 835
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    move-result v2
    :try_end_1c
    .catchall {:try_start_8 .. :try_end_1c} :catchall_25

    .line 838
    .local v2, "_result":I
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 839
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 840
    nop

    .line 839
    nop

    .line 841
    return v2

    .line 838
    .end local v2    # "_result":I
    :catchall_25
    move-exception v2

    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 839
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    throw v2
.end method

.method public getPackageNameByPid(I)Ljava/lang/String;
    .registers 7
    .param p1, "pid"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 613
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 614
    .local v0, "_data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 617
    .local v1, "_reply":Landroid/os/Parcel;
    :try_start_8
    const-string v2, "com.android.internal.app.IPerfShielder"

    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 618
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeInt(I)V

    .line 619
    iget-object v2, p0, Lcom/android/internal/app/IPerfShielder$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/4 v3, 0x5

    const/4 v4, 0x0

    invoke-interface {v2, v3, v0, v1, v4}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 620
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V

    .line 621
    invoke-virtual {v1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2
    :try_end_1e
    .catchall {:try_start_8 .. :try_end_1e} :catchall_27

    .line 624
    .local v2, "_result":Ljava/lang/String;
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 625
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 626
    nop

    .line 625
    nop

    .line 627
    return-object v2

    .line 624
    .end local v2    # "_result":Ljava/lang/String;
    :catchall_27
    move-exception v2

    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 625
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    throw v2
.end method

.method public getPerfEventSocketFd()Landroid/os/ParcelFileDescriptor;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1011
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 1012
    .local v0, "_data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 1015
    .local v1, "_reply":Landroid/os/Parcel;
    :try_start_8
    const-string v2, "com.android.internal.app.IPerfShielder"

    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 1016
    iget-object v2, p0, Lcom/android/internal/app/IPerfShielder$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/16 v3, 0x1c

    const/4 v4, 0x0

    invoke-interface {v2, v3, v0, v1, v4}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 1017
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V

    .line 1018
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_27

    .line 1019
    sget-object v2, Landroid/os/ParcelFileDescriptor;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v2, v1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/ParcelFileDescriptor;
    :try_end_26
    .catchall {:try_start_8 .. :try_end_26} :catchall_31

    .local v2, "_result":Landroid/os/ParcelFileDescriptor;
    goto :goto_28

    .line 1022
    .end local v2    # "_result":Landroid/os/ParcelFileDescriptor;
    :cond_27
    const/4 v2, 0x0

    .line 1026
    .restart local v2    # "_result":Landroid/os/ParcelFileDescriptor;
    :goto_28
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 1027
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 1028
    nop

    .line 1027
    nop

    .line 1029
    return-object v2

    .line 1026
    .end local v2    # "_result":Landroid/os/ParcelFileDescriptor;
    :catchall_31
    move-exception v2

    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 1027
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    throw v2
.end method

.method public insertPackageInfo(Landroid/content/pm/PackageInfo;)Z
    .registers 8
    .param p1, "pInfo"    # Landroid/content/pm/PackageInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 895
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 896
    .local v0, "_data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 899
    .local v1, "_reply":Landroid/os/Parcel;
    :try_start_8
    const-string v2, "com.android.internal.app.IPerfShielder"

    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 900
    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz p1, :cond_18

    .line 901
    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 902
    invoke-virtual {p1, v0, v3}, Landroid/content/pm/PackageInfo;->writeToParcel(Landroid/os/Parcel;I)V

    goto :goto_1b

    .line 905
    :cond_18
    invoke-virtual {v0, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 907
    :goto_1b
    iget-object v4, p0, Lcom/android/internal/app/IPerfShielder$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/16 v5, 0x16

    invoke-interface {v4, v5, v0, v1, v3}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 908
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V

    .line 909
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    move-result v4
    :try_end_29
    .catchall {:try_start_8 .. :try_end_29} :catchall_36

    if-eqz v4, :cond_2c

    goto :goto_2d

    :cond_2c
    move v2, v3

    .line 912
    .local v2, "_result":Z
    :goto_2d
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 913
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 914
    nop

    .line 913
    nop

    .line 915
    return v2

    .line 912
    .end local v2    # "_result":Z
    :catchall_36
    move-exception v2

    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 913
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    throw v2
.end method

.method public insertRedirectRule(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Z
    .registers 11
    .param p1, "callingPkg"    # Ljava/lang/String;
    .param p2, "destPkg"    # Ljava/lang/String;
    .param p3, "redirectPkgname"    # Ljava/lang/String;
    .param p4, "clsNameMap"    # Landroid/os/Bundle;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 847
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 848
    .local v0, "_data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 851
    .local v1, "_reply":Landroid/os/Parcel;
    :try_start_8
    const-string v2, "com.android.internal.app.IPerfShielder"

    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 852
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 853
    invoke-virtual {v0, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 854
    invoke-virtual {v0, p3}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 855
    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz p4, :cond_21

    .line 856
    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 857
    invoke-virtual {p4, v0, v3}, Landroid/os/Bundle;->writeToParcel(Landroid/os/Parcel;I)V

    goto :goto_24

    .line 860
    :cond_21
    invoke-virtual {v0, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 862
    :goto_24
    iget-object v4, p0, Lcom/android/internal/app/IPerfShielder$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/16 v5, 0x14

    invoke-interface {v4, v5, v0, v1, v3}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 863
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V

    .line 864
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    move-result v4
    :try_end_32
    .catchall {:try_start_8 .. :try_end_32} :catchall_3f

    if-eqz v4, :cond_35

    goto :goto_36

    :cond_35
    move v2, v3

    .line 867
    .local v2, "_result":Z
    :goto_36
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 868
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 869
    nop

    .line 868
    nop

    .line 870
    return v2

    .line 867
    .end local v2    # "_result":Z
    :catchall_3f
    move-exception v2

    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 868
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    throw v2
.end method

.method public killUnusedApp(II)V
    .registers 8
    .param p1, "uid"    # I
    .param p2, "pid"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 600
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 602
    .local v0, "_data":Landroid/os/Parcel;
    :try_start_4
    const-string v1, "com.android.internal.app.IPerfShielder"

    invoke-virtual {v0, v1}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 603
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeInt(I)V

    .line 604
    invoke-virtual {v0, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 605
    iget-object v1, p0, Lcom/android/internal/app/IPerfShielder$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/4 v2, 0x4

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-interface {v1, v2, v0, v3, v4}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    :try_end_17
    .catchall {:try_start_4 .. :try_end_17} :catchall_1c

    .line 608
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 609
    nop

    .line 610
    return-void

    .line 608
    :catchall_1c
    move-exception v1

    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    throw v1
.end method

.method public removeCallingPkgHookRule(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 8
    .param p1, "hostApp"    # Ljava/lang/String;
    .param p2, "originCallingPkg"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 992
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 993
    .local v0, "_data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 996
    .local v1, "_reply":Landroid/os/Parcel;
    :try_start_8
    const-string v2, "com.android.internal.app.IPerfShielder"

    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 997
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 998
    invoke-virtual {v0, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 999
    iget-object v2, p0, Lcom/android/internal/app/IPerfShielder$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/16 v3, 0x1b

    const/4 v4, 0x0

    invoke-interface {v2, v3, v0, v1, v4}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 1000
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V

    .line 1001
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    move-result v2
    :try_end_22
    .catchall {:try_start_8 .. :try_end_22} :catchall_30

    if-eqz v2, :cond_26

    const/4 v4, 0x1

    nop

    :cond_26
    move v2, v4

    .line 1004
    .local v2, "_result":Z
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 1005
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 1006
    nop

    .line 1005
    nop

    .line 1007
    return v2

    .line 1004
    .end local v2    # "_result":Z
    :catchall_30
    move-exception v2

    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 1005
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    throw v2
.end method

.method public removeServicePriority(Lcom/android/internal/app/MiuiServicePriority;Z)V
    .registers 8
    .param p1, "servicePriority"    # Lcom/android/internal/app/MiuiServicePriority;
    .param p2, "inBlacklist"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 727
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 729
    .local v0, "_data":Landroid/os/Parcel;
    :try_start_4
    const-string v1, "com.android.internal.app.IPerfShielder"

    invoke-virtual {v0, v1}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 730
    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz p1, :cond_14

    .line 731
    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 732
    invoke-virtual {p1, v0, v1}, Lcom/android/internal/app/MiuiServicePriority;->writeToParcel(Landroid/os/Parcel;I)V

    goto :goto_17

    .line 735
    :cond_14
    invoke-virtual {v0, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 737
    :goto_17
    invoke-virtual {v0, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 738
    iget-object v1, p0, Lcom/android/internal/app/IPerfShielder$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/16 v3, 0xc

    const/4 v4, 0x0

    invoke-interface {v1, v3, v0, v4, v2}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    :try_end_22
    .catchall {:try_start_4 .. :try_end_22} :catchall_27

    .line 741
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 742
    nop

    .line 743
    return-void

    .line 741
    :catchall_27
    move-exception v1

    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    throw v1
.end method

.method public removeTimeConsumingIntent([Ljava/lang/String;)V
    .registers 7
    .param p1, "actions"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 799
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 800
    .local v0, "_data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 802
    .local v1, "_reply":Landroid/os/Parcel;
    :try_start_8
    const-string v2, "com.android.internal.app.IPerfShielder"

    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 803
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeStringArray([Ljava/lang/String;)V

    .line 804
    iget-object v2, p0, Lcom/android/internal/app/IPerfShielder$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/16 v3, 0x11

    const/4 v4, 0x0

    invoke-interface {v2, v3, v0, v1, v4}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 805
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V
    :try_end_1b
    .catchall {:try_start_8 .. :try_end_1b} :catchall_23

    .line 808
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 809
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 810
    nop

    .line 811
    return-void

    .line 808
    :catchall_23
    move-exception v2

    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 809
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    throw v2
.end method

.method public reportAnr(ILjava/lang/String;JJLjava/lang/String;)V
    .registers 13
    .param p1, "callingPid"    # I
    .param p2, "windowName"    # Ljava/lang/String;
    .param p3, "totalDuration"    # J
    .param p5, "endTs"    # J
    .param p7, "cpuInfo"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 954
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 956
    .local v0, "_data":Landroid/os/Parcel;
    :try_start_4
    const-string v1, "com.android.internal.app.IPerfShielder"

    invoke-virtual {v0, v1}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 957
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeInt(I)V

    .line 958
    invoke-virtual {v0, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 959
    invoke-virtual {v0, p3, p4}, Landroid/os/Parcel;->writeLong(J)V

    .line 960
    invoke-virtual {v0, p5, p6}, Landroid/os/Parcel;->writeLong(J)V

    .line 961
    invoke-virtual {v0, p7}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 962
    iget-object v1, p0, Lcom/android/internal/app/IPerfShielder$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/16 v2, 0x19

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-interface {v1, v2, v0, v3, v4}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    :try_end_21
    .catchall {:try_start_4 .. :try_end_21} :catchall_26

    .line 965
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 966
    nop

    .line 967
    return-void

    .line 965
    :catchall_26
    move-exception v1

    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    throw v1
.end method

.method public reportExcessiveCpuUsageRecords(Ljava/util/List;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/os/Bundle;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1188
    .local p1, "records":Ljava/util/List;, "Ljava/util/List<Landroid/os/Bundle;>;"
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 1190
    .local v0, "_data":Landroid/os/Parcel;
    :try_start_4
    const-string v1, "com.android.internal.app.IPerfShielder"

    invoke-virtual {v0, v1}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 1191
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    .line 1192
    iget-object v1, p0, Lcom/android/internal/app/IPerfShielder$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/16 v2, 0x22

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-interface {v1, v2, v0, v3, v4}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    :try_end_15
    .catchall {:try_start_4 .. :try_end_15} :catchall_1a

    .line 1195
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 1196
    nop

    .line 1197
    return-void

    .line 1195
    :catchall_1a
    move-exception v1

    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    throw v1
.end method

.method public reportNotificationClick(Ljava/lang/String;Landroid/content/Intent;J)V
    .registers 10
    .param p1, "postPackage"    # Ljava/lang/String;
    .param p2, "intent"    # Landroid/content/Intent;
    .param p3, "uptimeMillis"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1202
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 1204
    .local v0, "_data":Landroid/os/Parcel;
    :try_start_4
    const-string v1, "com.android.internal.app.IPerfShielder"

    invoke-virtual {v0, v1}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 1205
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 1206
    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz p2, :cond_17

    .line 1207
    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 1208
    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->writeToParcel(Landroid/os/Parcel;I)V

    goto :goto_1a

    .line 1211
    :cond_17
    invoke-virtual {v0, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 1213
    :goto_1a
    invoke-virtual {v0, p3, p4}, Landroid/os/Parcel;->writeLong(J)V

    .line 1214
    iget-object v1, p0, Lcom/android/internal/app/IPerfShielder$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/16 v3, 0x23

    const/4 v4, 0x0

    invoke-interface {v1, v3, v0, v4, v2}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    :try_end_25
    .catchall {:try_start_4 .. :try_end_25} :catchall_2a

    .line 1217
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 1218
    nop

    .line 1219
    return-void

    .line 1217
    :catchall_2a
    move-exception v1

    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    throw v1
.end method

.method public reportPerceptibleJank(IILjava/lang/String;JJJIJ)V
    .registers 30
    .param p1, "callingPid"    # I
    .param p2, "renderThreadTid"    # I
    .param p3, "windowName"    # Ljava/lang/String;
    .param p4, "totalDuration"    # J
    .param p6, "maxFrameDuration"    # J
    .param p8, "endTs"    # J
    .param p10, "selfCause"    # I
    .param p11, "num_frames"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 552
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    move-object v1, v0

    .line 554
    .local v1, "_data":Landroid/os/Parcel;
    :try_start_5
    const-string v0, "com.android.internal.app.IPerfShielder"

    invoke-virtual {v1, v0}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 555
    move/from16 v2, p1

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeInt(I)V
    :try_end_f
    .catchall {:try_start_5 .. :try_end_f} :catchall_5e

    .line 556
    move/from16 v3, p2

    :try_start_11
    invoke-virtual {v1, v3}, Landroid/os/Parcel;->writeInt(I)V
    :try_end_14
    .catchall {:try_start_11 .. :try_end_14} :catchall_5a

    .line 557
    move-object/from16 v4, p3

    :try_start_16
    invoke-virtual {v1, v4}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V
    :try_end_19
    .catchall {:try_start_16 .. :try_end_19} :catchall_56

    .line 558
    move-wide/from16 v5, p4

    :try_start_1b
    invoke-virtual {v1, v5, v6}, Landroid/os/Parcel;->writeLong(J)V
    :try_end_1e
    .catchall {:try_start_1b .. :try_end_1e} :catchall_52

    .line 559
    move-wide/from16 v7, p6

    :try_start_20
    invoke-virtual {v1, v7, v8}, Landroid/os/Parcel;->writeLong(J)V
    :try_end_23
    .catchall {:try_start_20 .. :try_end_23} :catchall_4e

    .line 560
    move-wide/from16 v9, p8

    :try_start_25
    invoke-virtual {v1, v9, v10}, Landroid/os/Parcel;->writeLong(J)V
    :try_end_28
    .catchall {:try_start_25 .. :try_end_28} :catchall_4a

    .line 561
    move/from16 v11, p10

    :try_start_2a
    invoke-virtual {v1, v11}, Landroid/os/Parcel;->writeInt(I)V
    :try_end_2d
    .catchall {:try_start_2a .. :try_end_2d} :catchall_46

    .line 562
    move-wide/from16 v12, p11

    :try_start_2f
    invoke-virtual {v1, v12, v13}, Landroid/os/Parcel;->writeLong(J)V
    :try_end_32
    .catchall {:try_start_2f .. :try_end_32} :catchall_42

    .line 563
    move-object/from16 v14, p0

    :try_start_34
    iget-object v0, v14, Lcom/android/internal/app/IPerfShielder$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/4 v15, 0x0

    const/4 v2, 0x1

    invoke-interface {v0, v2, v1, v15, v2}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    :try_end_3b
    .catchall {:try_start_34 .. :try_end_3b} :catchall_40

    .line 566
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 567
    nop

    .line 568
    return-void

    .line 566
    :catchall_40
    move-exception v0

    goto :goto_6f

    :catchall_42
    move-exception v0

    move-object/from16 v14, p0

    goto :goto_6f

    :catchall_46
    move-exception v0

    move-object/from16 v14, p0

    goto :goto_6d

    :catchall_4a
    move-exception v0

    move-object/from16 v14, p0

    goto :goto_6b

    :catchall_4e
    move-exception v0

    move-object/from16 v14, p0

    goto :goto_69

    :catchall_52
    move-exception v0

    move-object/from16 v14, p0

    goto :goto_67

    :catchall_56
    move-exception v0

    move-object/from16 v14, p0

    goto :goto_65

    :catchall_5a
    move-exception v0

    move-object/from16 v14, p0

    goto :goto_63

    :catchall_5e
    move-exception v0

    move-object/from16 v14, p0

    move/from16 v3, p2

    :goto_63
    move-object/from16 v4, p3

    :goto_65
    move-wide/from16 v5, p4

    :goto_67
    move-wide/from16 v7, p6

    :goto_69
    move-wide/from16 v9, p8

    :goto_6b
    move/from16 v11, p10

    :goto_6d
    move-wide/from16 v12, p11

    :goto_6f
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    throw v0
.end method

.method public setForkedProcessGroup(IIILjava/lang/String;)V
    .registers 10
    .param p1, "puid"    # I
    .param p2, "ppid"    # I
    .param p3, "group"    # I
    .param p4, "processName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 631
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 632
    .local v0, "_data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 634
    .local v1, "_reply":Landroid/os/Parcel;
    :try_start_8
    const-string v2, "com.android.internal.app.IPerfShielder"

    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 635
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeInt(I)V

    .line 636
    invoke-virtual {v0, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 637
    invoke-virtual {v0, p3}, Landroid/os/Parcel;->writeInt(I)V

    .line 638
    invoke-virtual {v0, p4}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 639
    iget-object v2, p0, Lcom/android/internal/app/IPerfShielder$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/4 v3, 0x6

    const/4 v4, 0x0

    invoke-interface {v2, v3, v0, v1, v4}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 640
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V
    :try_end_23
    .catchall {:try_start_8 .. :try_end_23} :catchall_2b

    .line 643
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 644
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 645
    nop

    .line 646
    return-void

    .line 643
    :catchall_2b
    move-exception v2

    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 644
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    throw v2
.end method

.method public setMiuiBroadcastDispatchEnable(Z)V
    .registers 7
    .param p1, "enable"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 772
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 774
    .local v0, "_data":Landroid/os/Parcel;
    :try_start_4
    const-string v1, "com.android.internal.app.IPerfShielder"

    invoke-virtual {v0, v1}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 775
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeInt(I)V

    .line 776
    iget-object v1, p0, Lcom/android/internal/app/IPerfShielder$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/16 v2, 0xf

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-interface {v1, v2, v0, v3, v4}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    :try_end_15
    .catchall {:try_start_4 .. :try_end_15} :catchall_1a

    .line 779
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 780
    nop

    .line 781
    return-void

    .line 779
    :catchall_1a
    move-exception v1

    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    throw v1
.end method

.method public setMiuiContentProviderControl(Z)V
    .registers 7
    .param p1, "enable"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 760
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 762
    .local v0, "_data":Landroid/os/Parcel;
    :try_start_4
    const-string v1, "com.android.internal.app.IPerfShielder"

    invoke-virtual {v0, v1}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 763
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeInt(I)V

    .line 764
    iget-object v1, p0, Lcom/android/internal/app/IPerfShielder$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/16 v2, 0xe

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-interface {v1, v2, v0, v3, v4}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    :try_end_15
    .catchall {:try_start_4 .. :try_end_15} :catchall_1a

    .line 767
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 768
    nop

    .line 769
    return-void

    .line 767
    :catchall_1a
    move-exception v1

    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    throw v1
.end method

.method public setSchedFgPid(I)V
    .registers 7
    .param p1, "pid"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 588
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 590
    .local v0, "_data":Landroid/os/Parcel;
    :try_start_4
    const-string v1, "com.android.internal.app.IPerfShielder"

    invoke-virtual {v0, v1}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 591
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeInt(I)V

    .line 592
    iget-object v1, p0, Lcom/android/internal/app/IPerfShielder$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/4 v2, 0x3

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-interface {v1, v2, v0, v3, v4}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    :try_end_14
    .catchall {:try_start_4 .. :try_end_14} :catchall_19

    .line 595
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 596
    nop

    .line 597
    return-void

    .line 595
    :catchall_19
    move-exception v1

    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    throw v1
.end method

.method public setServicePriority(Ljava/util/List;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/internal/app/MiuiServicePriority;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 702
    .local p1, "servicePrioritys":Ljava/util/List;, "Ljava/util/List<Lcom/android/internal/app/MiuiServicePriority;>;"
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 704
    .local v0, "_data":Landroid/os/Parcel;
    :try_start_4
    const-string v1, "com.android.internal.app.IPerfShielder"

    invoke-virtual {v0, v1}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 705
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    .line 706
    iget-object v1, p0, Lcom/android/internal/app/IPerfShielder$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/16 v2, 0xa

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-interface {v1, v2, v0, v3, v4}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    :try_end_15
    .catchall {:try_start_4 .. :try_end_15} :catchall_1a

    .line 709
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 710
    nop

    .line 711
    return-void

    .line 709
    :catchall_1a
    move-exception v1

    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    throw v1
.end method

.method public setServicePriorityWithNoProc(Ljava/util/List;J)V
    .registers 9
    .param p2, "noProcDelayTime"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/internal/app/MiuiServicePriority;",
            ">;J)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 714
    .local p1, "servicePrioritys":Ljava/util/List;, "Ljava/util/List<Lcom/android/internal/app/MiuiServicePriority;>;"
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 716
    .local v0, "_data":Landroid/os/Parcel;
    :try_start_4
    const-string v1, "com.android.internal.app.IPerfShielder"

    invoke-virtual {v0, v1}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 717
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    .line 718
    invoke-virtual {v0, p2, p3}, Landroid/os/Parcel;->writeLong(J)V

    .line 719
    iget-object v1, p0, Lcom/android/internal/app/IPerfShielder$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/16 v2, 0xb

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-interface {v1, v2, v0, v3, v4}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    :try_end_18
    .catchall {:try_start_4 .. :try_end_18} :catchall_1d

    .line 722
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 723
    nop

    .line 724
    return-void

    .line 722
    :catchall_1d
    move-exception v1

    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    throw v1
.end method

.method public updateProcessFullMemInfoByPids([I)Ljava/util/List;
    .registers 7
    .param p1, "pids"    # [I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([I)",
            "Ljava/util/List<",
            "Landroid/os/Bundle;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 666
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 667
    .local v0, "_data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 670
    .local v1, "_reply":Landroid/os/Parcel;
    :try_start_8
    const-string v2, "com.android.internal.app.IPerfShielder"

    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 671
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeIntArray([I)V

    .line 672
    iget-object v2, p0, Lcom/android/internal/app/IPerfShielder$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/16 v3, 0x8

    const/4 v4, 0x0

    invoke-interface {v2, v3, v0, v1, v4}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 673
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V

    .line 674
    sget-object v2, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    move-result-object v2
    :try_end_21
    .catchall {:try_start_8 .. :try_end_21} :catchall_2a

    .line 677
    .local v2, "_result":Ljava/util/List;, "Ljava/util/List<Landroid/os/Bundle;>;"
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 678
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 679
    nop

    .line 678
    nop

    .line 680
    return-object v2

    .line 677
    .end local v2    # "_result":Ljava/util/List;, "Ljava/util/List<Landroid/os/Bundle;>;"
    :catchall_2a
    move-exception v2

    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 678
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    throw v2
.end method

.method public updateProcessPartialMemInfoByPids([I)Ljava/util/List;
    .registers 7
    .param p1, "pids"    # [I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([I)",
            "Ljava/util/List<",
            "Landroid/os/Bundle;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 684
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 685
    .local v0, "_data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 688
    .local v1, "_reply":Landroid/os/Parcel;
    :try_start_8
    const-string v2, "com.android.internal.app.IPerfShielder"

    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 689
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeIntArray([I)V

    .line 690
    iget-object v2, p0, Lcom/android/internal/app/IPerfShielder$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/16 v3, 0x9

    const/4 v4, 0x0

    invoke-interface {v2, v3, v0, v1, v4}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 691
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V

    .line 692
    sget-object v2, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    move-result-object v2
    :try_end_21
    .catchall {:try_start_8 .. :try_end_21} :catchall_2a

    .line 695
    .local v2, "_result":Ljava/util/List;, "Ljava/util/List<Landroid/os/Bundle;>;"
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 696
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 697
    nop

    .line 696
    nop

    .line 698
    return-object v2

    .line 695
    .end local v2    # "_result":Ljava/util/List;, "Ljava/util/List<Landroid/os/Bundle;>;"
    :catchall_2a
    move-exception v2

    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 696
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    throw v2
.end method
