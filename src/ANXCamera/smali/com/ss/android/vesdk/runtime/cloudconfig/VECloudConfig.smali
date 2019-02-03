.class public Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;
.super Ljava/lang/Object;
.source "VECloudConfig.java"


# instance fields
.field public mCameraPreviewResolutionHeight:I

.field public mCameraPreviewResolutionWidth:I

.field public mCompileEncodeHWBPS:I

.field public mCompileEncodeMode:I

.field public mCompileEncodeSWCRF:I

.field public mCompileEncodeSWCRFPreset:I

.field public mCompileEncodeSWGOP:I

.field public mCompileEncodeSWMaxrate:I

.field public mCompileHwBitrateMode:I

.field public mCompileHwProfile:I

.field public mCompileSWBitrateMode:I

.field public mCompileVideoSWQP:I

.field public mEarphoneEchoAAudio:I

.field public mEarphoneEchoHuawei:I

.field public mEarphoneEchoNormal:I

.field public mImportEncodeMode:I

.field public mImportHWEncodeBPS:I

.field public mImportHwBitrateMode:I

.field public mImportHwProfile:I

.field public mImportSWBitrateMode:I

.field public mImportSWEncodeCRF:I

.field public mImportShortEdgeValue:I

.field public mImportVideoSWGop:I

.field public mImportVideoSWMaxrate:I

.field public mImportVideoSWPreset:I

.field public mImportVideoSWQP:I

.field public mRecordCameraCompatLevel:I

.field public mRecordCameraType:I

.field public mRecordEncodeMode:I

.field public mRecordHWEncodeBPS:I

.field public mRecordHwBitrateMode:I

.field public mRecordHwProfile:I

.field public mRecordResolutionHeight:I

.field public mRecordResolutionWidth:I

.field public mRecordSWBitrateMode:I

.field public mRecordSWEncodeCRF:I

.field public mRecordVideoSWGop:I

.field public mRecordVideoSWMaxrate:I

.field public mRecordVideoSWPreset:I

.field public mRecordVideoSWQP:I


# direct methods
.method public constructor <init>()V
    .locals 9

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    const/4 v0, 0x1

    iput v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordCameraType:I

    .line 18
    const/16 v1, 0xf

    iput v1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordSWEncodeCRF:I

    .line 23
    const/high16 v2, 0x400000

    iput v2, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordHWEncodeBPS:I

    .line 28
    const/4 v3, 0x0

    iput v3, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordEncodeMode:I

    .line 33
    iput v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordCameraCompatLevel:I

    .line 38
    const v4, 0x4c4b40

    iput v4, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordVideoSWMaxrate:I

    .line 43
    iput v3, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordVideoSWPreset:I

    .line 48
    const/16 v5, 0x23

    iput v5, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordVideoSWGop:I

    .line 53
    const/4 v6, 0x2

    iput v6, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordVideoSWQP:I

    .line 58
    iput v3, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordSWBitrateMode:I

    .line 63
    iput v3, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordHwBitrateMode:I

    .line 68
    iput v3, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordHwProfile:I

    .line 73
    const/16 v7, 0x2d0

    iput v7, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCameraPreviewResolutionWidth:I

    .line 78
    const/16 v7, 0x500

    iput v7, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCameraPreviewResolutionHeight:I

    .line 83
    const/16 v7, 0x240

    iput v7, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordResolutionWidth:I

    .line 88
    const/16 v8, 0x400

    iput v8, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordResolutionHeight:I

    .line 93
    iput v3, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mImportEncodeMode:I

    .line 98
    iput v7, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mImportShortEdgeValue:I

    .line 103
    iput v1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mImportSWEncodeCRF:I

    .line 108
    iput v2, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mImportHWEncodeBPS:I

    .line 114
    iput v4, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mImportVideoSWMaxrate:I

    .line 119
    iput v3, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mImportVideoSWPreset:I

    .line 124
    iput v5, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mImportVideoSWGop:I

    .line 129
    iput v6, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mImportVideoSWQP:I

    .line 134
    iput v3, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mImportSWBitrateMode:I

    .line 140
    iput v3, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mImportHwBitrateMode:I

    .line 145
    iput v3, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCompileEncodeMode:I

    .line 150
    iput v1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCompileEncodeSWCRF:I

    .line 155
    iput v2, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCompileEncodeHWBPS:I

    .line 160
    iput v4, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCompileEncodeSWMaxrate:I

    .line 165
    iput v3, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCompileEncodeSWCRFPreset:I

    .line 170
    iput v5, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCompileEncodeSWGOP:I

    .line 175
    iput v6, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCompileVideoSWQP:I

    .line 180
    iput v3, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCompileSWBitrateMode:I

    .line 185
    iput v3, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mImportHwProfile:I

    .line 190
    iput v3, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCompileHwBitrateMode:I

    .line 195
    iput v3, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCompileHwProfile:I

    .line 200
    iput v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mEarphoneEchoNormal:I

    .line 205
    iput v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mEarphoneEchoAAudio:I

    .line 210
    iput v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mEarphoneEchoHuawei:I

    return-void
.end method
