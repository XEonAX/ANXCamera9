.class public abstract Lmiui/hardware/display/IDisplayFeatureCallback$Stub;
.super Landroid/os/HwBinder;
.source "IDisplayFeatureCallback.java"

# interfaces
.implements Lmiui/hardware/display/IDisplayFeatureCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/hardware/display/IDisplayFeatureCallback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 36
    invoke-direct {p0}, Landroid/os/HwBinder;-><init>()V

    return-void
.end method


# virtual methods
.method public asBinder()Landroid/os/IHwBinder;
    .registers 1

    .line 39
    return-object p0
.end method

.method public final getDebugInfo()Landroid/hidl/base/V1_0/DebugInfo;
    .registers 4

    .line 81
    new-instance v0, Landroid/hidl/base/V1_0/DebugInfo;

    invoke-direct {v0}, Landroid/hidl/base/V1_0/DebugInfo;-><init>()V

    .line 82
    .local v0, "info":Landroid/hidl/base/V1_0/DebugInfo;
    invoke-static {}, Landroid/os/HidlSupport;->getPidIfSharable()I

    move-result v1

    iput v1, v0, Landroid/hidl/base/V1_0/DebugInfo;->pid:I

    .line 83
    const-wide/16 v1, 0x0

    iput-wide v1, v0, Landroid/hidl/base/V1_0/DebugInfo;->ptr:J

    .line 84
    const/4 v1, 0x0

    iput v1, v0, Landroid/hidl/base/V1_0/DebugInfo;->arch:I

    .line 85
    return-object v0
.end method

.method public final getHashChain()Ljava/util/ArrayList;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "[B>;"
        }
    .end annotation

    .line 57
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x2

    new-array v1, v1, [[B

    const/16 v2, 0x20

    new-array v3, v2, [B

    fill-array-data v3, :array_20

    const/4 v4, 0x0

    aput-object v3, v1, v4

    new-array v2, v2, [B

    fill-array-data v2, :array_34

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0

    nop

    :array_20
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data

    :array_34
    .array-data 1
        -0x43t
        -0x26t
        -0x4at
        0x18t
        0x4dt
        0x7at
        0x34t
        0x6dt
        -0x5at
        -0x60t
        0x7dt
        -0x40t
        -0x7et
        -0x74t
        -0xft
        -0x66t
        0x69t
        0x6ft
        0x4ct
        -0x56t
        0x36t
        0x11t
        -0x3bt
        0x1ft
        0x2et
        0x14t
        0x56t
        0x5at
        0x14t
        -0x4ct
        0xft
        -0x27t
    .end array-data
.end method

.method public final interfaceChain()Ljava/util/ArrayList;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 44
    new-instance v0, Ljava/util/ArrayList;

    const-string v1, "vendor.xiaomi.hardware.displayfeature@1.0::IDisplayFeatureCallback"

    const-string v2, "android.hidl.base@1.0::IBase"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public final interfaceDescriptor()Ljava/lang/String;
    .registers 2

    .line 51
    const-string v0, "vendor.xiaomi.hardware.displayfeature@1.0::IDisplayFeatureCallback"

    return-object v0
.end method

.method public final linkToDeath(Landroid/os/IHwBinder$DeathRecipient;J)Z
    .registers 5
    .param p1, "recipient"    # Landroid/os/IHwBinder$DeathRecipient;
    .param p2, "cookie"    # J

    .line 70
    const/4 v0, 0x1

    return v0
.end method

.method public final notifySyspropsChanged()V
    .registers 1

    .line 90
    invoke-static {}, Landroid/os/HwBinder;->enableInstrumentation()V

    .line 91
    return-void
.end method

.method public onTransact(ILandroid/os/HwParcel;Landroid/os/HwParcel;I)V
    .registers 14
    .param p1, "_hidl_code"    # I
    .param p2, "_hidl_request"    # Landroid/os/HwParcel;
    .param p3, "_hidl_reply"    # Landroid/os/HwParcel;
    .param p4, "_hidl_flags"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 119
    const/high16 v0, -0x80000000

    const/4 v1, 0x0

    const/4 v2, 0x1

    sparse-switch p1, :sswitch_data_17a

    goto/16 :goto_179

    .line 283
    :sswitch_9
    and-int/lit8 v3, p4, 0x1

    if-eqz v3, :cond_f

    move v1, v2

    nop

    .line 284
    .local v1, "_hidl_is_oneway":Z
    :cond_f
    if-eqz v1, :cond_179

    .line 285
    invoke-virtual {p3, v0}, Landroid/os/HwParcel;->writeStatus(I)V

    .line 286
    invoke-virtual {p3}, Landroid/os/HwParcel;->send()V

    .line 287
    goto/16 :goto_179

    .line 270
    .end local v1    # "_hidl_is_oneway":Z
    :sswitch_19
    and-int/lit8 v3, p4, 0x1

    if-eqz v3, :cond_1f

    move v1, v2

    nop

    .line 271
    .restart local v1    # "_hidl_is_oneway":Z
    :cond_1f
    if-eq v1, v2, :cond_29

    .line 272
    invoke-virtual {p3, v0}, Landroid/os/HwParcel;->writeStatus(I)V

    .line 273
    invoke-virtual {p3}, Landroid/os/HwParcel;->send()V

    .line 274
    goto/16 :goto_179

    .line 275
    :cond_29
    const-string v0, "android.hidl.base@1.0::IBase"

    invoke-virtual {p2, v0}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 277
    invoke-virtual {p0}, Lmiui/hardware/display/IDisplayFeatureCallback$Stub;->notifySyspropsChanged()V

    .line 278
    goto/16 :goto_179

    .line 254
    .end local v1    # "_hidl_is_oneway":Z
    :sswitch_33
    and-int/lit8 v3, p4, 0x1

    if-eqz v3, :cond_38

    goto :goto_39

    :cond_38
    move v2, v1

    .line 255
    .local v2, "_hidl_is_oneway":Z
    :goto_39
    if-eqz v2, :cond_43

    .line 256
    invoke-virtual {p3, v0}, Landroid/os/HwParcel;->writeStatus(I)V

    .line 257
    invoke-virtual {p3}, Landroid/os/HwParcel;->send()V

    .line 258
    goto/16 :goto_179

    .line 259
    :cond_43
    const-string v0, "android.hidl.base@1.0::IBase"

    invoke-virtual {p2, v0}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 261
    invoke-virtual {p0}, Lmiui/hardware/display/IDisplayFeatureCallback$Stub;->getDebugInfo()Landroid/hidl/base/V1_0/DebugInfo;

    move-result-object v0

    .line 262
    .local v0, "_hidl_out_info":Landroid/hidl/base/V1_0/DebugInfo;
    invoke-virtual {p3, v1}, Landroid/os/HwParcel;->writeStatus(I)V

    .line 263
    invoke-virtual {v0, p3}, Landroid/hidl/base/V1_0/DebugInfo;->writeToParcel(Landroid/os/HwParcel;)V

    .line 264
    invoke-virtual {p3}, Landroid/os/HwParcel;->send()V

    .line 265
    goto/16 :goto_179

    .line 239
    .end local v0    # "_hidl_out_info":Landroid/hidl/base/V1_0/DebugInfo;
    .end local v2    # "_hidl_is_oneway":Z
    :sswitch_57
    and-int/lit8 v3, p4, 0x1

    if-eqz v3, :cond_5c

    goto :goto_5d

    :cond_5c
    move v2, v1

    .line 240
    .restart local v2    # "_hidl_is_oneway":Z
    :goto_5d
    if-eqz v2, :cond_67

    .line 241
    invoke-virtual {p3, v0}, Landroid/os/HwParcel;->writeStatus(I)V

    .line 242
    invoke-virtual {p3}, Landroid/os/HwParcel;->send()V

    .line 243
    goto/16 :goto_179

    .line 244
    :cond_67
    const-string v0, "android.hidl.base@1.0::IBase"

    invoke-virtual {p2, v0}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 246
    invoke-virtual {p0}, Lmiui/hardware/display/IDisplayFeatureCallback$Stub;->ping()V

    .line 247
    invoke-virtual {p3, v1}, Landroid/os/HwParcel;->writeStatus(I)V

    .line 248
    invoke-virtual {p3}, Landroid/os/HwParcel;->send()V

    .line 249
    goto/16 :goto_179

    .line 229
    .end local v2    # "_hidl_is_oneway":Z
    :sswitch_77
    and-int/lit8 v3, p4, 0x1

    if-eqz v3, :cond_7d

    move v1, v2

    nop

    .line 230
    .restart local v1    # "_hidl_is_oneway":Z
    :cond_7d
    if-eqz v1, :cond_179

    .line 231
    invoke-virtual {p3, v0}, Landroid/os/HwParcel;->writeStatus(I)V

    .line 232
    invoke-virtual {p3}, Landroid/os/HwParcel;->send()V

    .line 233
    goto/16 :goto_179

    .line 216
    .end local v1    # "_hidl_is_oneway":Z
    :sswitch_87
    and-int/lit8 v3, p4, 0x1

    if-eqz v3, :cond_8d

    move v1, v2

    nop

    .line 217
    .restart local v1    # "_hidl_is_oneway":Z
    :cond_8d
    if-eq v1, v2, :cond_97

    .line 218
    invoke-virtual {p3, v0}, Landroid/os/HwParcel;->writeStatus(I)V

    .line 219
    invoke-virtual {p3}, Landroid/os/HwParcel;->send()V

    .line 220
    goto/16 :goto_179

    .line 221
    :cond_97
    const-string v0, "android.hidl.base@1.0::IBase"

    invoke-virtual {p2, v0}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 223
    invoke-virtual {p0}, Lmiui/hardware/display/IDisplayFeatureCallback$Stub;->setHALInstrumentation()V

    .line 224
    goto/16 :goto_179

    .line 183
    .end local v1    # "_hidl_is_oneway":Z
    :sswitch_a1
    and-int/lit8 v3, p4, 0x1

    if-eqz v3, :cond_a6

    goto :goto_a7

    :cond_a6
    move v2, v1

    .line 184
    .restart local v2    # "_hidl_is_oneway":Z
    :goto_a7
    if-eqz v2, :cond_b1

    .line 185
    invoke-virtual {p3, v0}, Landroid/os/HwParcel;->writeStatus(I)V

    .line 186
    invoke-virtual {p3}, Landroid/os/HwParcel;->send()V

    .line 187
    goto/16 :goto_179

    .line 188
    :cond_b1
    const-string v0, "android.hidl.base@1.0::IBase"

    invoke-virtual {p2, v0}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 190
    invoke-virtual {p0}, Lmiui/hardware/display/IDisplayFeatureCallback$Stub;->getHashChain()Ljava/util/ArrayList;

    move-result-object v0

    .line 191
    .local v0, "_hidl_out_hashchain":Ljava/util/ArrayList;, "Ljava/util/ArrayList<[B>;"
    invoke-virtual {p3, v1}, Landroid/os/HwParcel;->writeStatus(I)V

    .line 193
    new-instance v3, Landroid/os/HwBlob;

    const/16 v4, 0x10

    invoke-direct {v3, v4}, Landroid/os/HwBlob;-><init>(I)V

    .line 195
    .local v3, "_hidl_blob":Landroid/os/HwBlob;
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    .line 196
    .local v4, "_hidl_vec_size":I
    const-wide/16 v5, 0x8

    invoke-virtual {v3, v5, v6, v4}, Landroid/os/HwBlob;->putInt32(JI)V

    .line 197
    const-wide/16 v5, 0xc

    invoke-virtual {v3, v5, v6, v1}, Landroid/os/HwBlob;->putBool(JZ)V

    .line 198
    new-instance v5, Landroid/os/HwBlob;

    mul-int/lit8 v6, v4, 0x20

    invoke-direct {v5, v6}, Landroid/os/HwBlob;-><init>(I)V

    .line 199
    .local v5, "childBlob":Landroid/os/HwBlob;
    nop

    .local v1, "_hidl_index_0":I
    :goto_da
    if-ge v1, v4, :cond_ec

    .line 201
    mul-int/lit8 v6, v1, 0x20

    int-to-long v6, v6

    .line 202
    .local v6, "_hidl_array_offset_1":J
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [B

    invoke-virtual {v5, v6, v7, v8}, Landroid/os/HwBlob;->putInt8Array(J[B)V

    .line 203
    nop

    .line 199
    .end local v6    # "_hidl_array_offset_1":J
    add-int/lit8 v1, v1, 0x1

    goto :goto_da

    .line 206
    .end local v1    # "_hidl_index_0":I
    :cond_ec
    const-wide/16 v6, 0x0

    invoke-virtual {v3, v6, v7, v5}, Landroid/os/HwBlob;->putBlob(JLandroid/os/HwBlob;)V

    .line 208
    .end local v4    # "_hidl_vec_size":I
    .end local v5    # "childBlob":Landroid/os/HwBlob;
    invoke-virtual {p3, v3}, Landroid/os/HwParcel;->writeBuffer(Landroid/os/HwBlob;)V

    .line 210
    .end local v3    # "_hidl_blob":Landroid/os/HwBlob;
    invoke-virtual {p3}, Landroid/os/HwParcel;->send()V

    .line 211
    goto/16 :goto_179

    .line 167
    .end local v0    # "_hidl_out_hashchain":Ljava/util/ArrayList;, "Ljava/util/ArrayList<[B>;"
    .end local v2    # "_hidl_is_oneway":Z
    :sswitch_f9
    and-int/lit8 v3, p4, 0x1

    if-eqz v3, :cond_fe

    goto :goto_ff

    :cond_fe
    move v2, v1

    .line 168
    .restart local v2    # "_hidl_is_oneway":Z
    :goto_ff
    if-eqz v2, :cond_109

    .line 169
    invoke-virtual {p3, v0}, Landroid/os/HwParcel;->writeStatus(I)V

    .line 170
    invoke-virtual {p3}, Landroid/os/HwParcel;->send()V

    .line 171
    goto/16 :goto_179

    .line 172
    :cond_109
    const-string v0, "android.hidl.base@1.0::IBase"

    invoke-virtual {p2, v0}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 174
    invoke-virtual {p0}, Lmiui/hardware/display/IDisplayFeatureCallback$Stub;->interfaceDescriptor()Ljava/lang/String;

    move-result-object v0

    .line 175
    .local v0, "_hidl_out_descriptor":Ljava/lang/String;
    invoke-virtual {p3, v1}, Landroid/os/HwParcel;->writeStatus(I)V

    .line 176
    invoke-virtual {p3, v0}, Landroid/os/HwParcel;->writeString(Ljava/lang/String;)V

    .line 177
    invoke-virtual {p3}, Landroid/os/HwParcel;->send()V

    .line 178
    goto :goto_179

    .line 153
    .end local v0    # "_hidl_out_descriptor":Ljava/lang/String;
    .end local v2    # "_hidl_is_oneway":Z
    :sswitch_11c
    and-int/lit8 v3, p4, 0x1

    if-eqz v3, :cond_121

    goto :goto_122

    :cond_121
    move v2, v1

    .line 154
    .restart local v2    # "_hidl_is_oneway":Z
    :goto_122
    if-eqz v2, :cond_12b

    .line 155
    invoke-virtual {p3, v0}, Landroid/os/HwParcel;->writeStatus(I)V

    .line 156
    invoke-virtual {p3}, Landroid/os/HwParcel;->send()V

    .line 157
    goto :goto_179

    .line 158
    :cond_12b
    const-string v0, "android.hidl.base@1.0::IBase"

    invoke-virtual {p2, v0}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 160
    invoke-virtual {p3, v1}, Landroid/os/HwParcel;->writeStatus(I)V

    .line 161
    invoke-virtual {p3}, Landroid/os/HwParcel;->send()V

    .line 162
    goto :goto_179

    .line 137
    .end local v2    # "_hidl_is_oneway":Z
    :sswitch_137
    and-int/lit8 v3, p4, 0x1

    if-eqz v3, :cond_13c

    goto :goto_13d

    :cond_13c
    move v2, v1

    .line 138
    .restart local v2    # "_hidl_is_oneway":Z
    :goto_13d
    if-eqz v2, :cond_146

    .line 139
    invoke-virtual {p3, v0}, Landroid/os/HwParcel;->writeStatus(I)V

    .line 140
    invoke-virtual {p3}, Landroid/os/HwParcel;->send()V

    .line 141
    goto :goto_179

    .line 142
    :cond_146
    const-string v0, "android.hidl.base@1.0::IBase"

    invoke-virtual {p2, v0}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 144
    invoke-virtual {p0}, Lmiui/hardware/display/IDisplayFeatureCallback$Stub;->interfaceChain()Ljava/util/ArrayList;

    move-result-object v0

    .line 145
    .local v0, "_hidl_out_descriptors":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {p3, v1}, Landroid/os/HwParcel;->writeStatus(I)V

    .line 146
    invoke-virtual {p3, v0}, Landroid/os/HwParcel;->writeStringVector(Ljava/util/ArrayList;)V

    .line 147
    invoke-virtual {p3}, Landroid/os/HwParcel;->send()V

    .line 148
    goto :goto_179

    .line 122
    .end local v0    # "_hidl_out_descriptors":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v2    # "_hidl_is_oneway":Z
    :sswitch_159
    and-int/lit8 v3, p4, 0x1

    if-eqz v3, :cond_15f

    move v1, v2

    nop

    .line 123
    .local v1, "_hidl_is_oneway":Z
    :cond_15f
    if-eq v1, v2, :cond_168

    .line 124
    invoke-virtual {p3, v0}, Landroid/os/HwParcel;->writeStatus(I)V

    .line 125
    invoke-virtual {p3}, Landroid/os/HwParcel;->send()V

    .line 126
    goto :goto_179

    .line 127
    :cond_168
    const-string v0, "vendor.xiaomi.hardware.displayfeature@1.0::IDisplayFeatureCallback"

    invoke-virtual {p2, v0}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 129
    invoke-virtual {p2}, Landroid/os/HwParcel;->readInt32()I

    move-result v0

    .line 130
    .local v0, "caseId":I
    invoke-virtual {p2}, Landroid/os/HwParcel;->readInt32()I

    move-result v2

    .line 131
    .local v2, "value":I
    invoke-virtual {p0, v0, v2}, Lmiui/hardware/display/IDisplayFeatureCallback$Stub;->displayfeatureInfoChanged(II)V

    .line 132
    nop

    .line 292
    .end local v0    # "caseId":I
    .end local v1    # "_hidl_is_oneway":Z
    .end local v2    # "value":I
    :cond_179
    :goto_179
    return-void

    :sswitch_data_17a
    .sparse-switch
        0x1 -> :sswitch_159
        0xf43484e -> :sswitch_137
        0xf444247 -> :sswitch_11c
        0xf445343 -> :sswitch_f9
        0xf485348 -> :sswitch_a1
        0xf494e54 -> :sswitch_87
        0xf4c5444 -> :sswitch_77
        0xf504e47 -> :sswitch_57
        0xf524546 -> :sswitch_33
        0xf535953 -> :sswitch_19
        0xf555444 -> :sswitch_9
    .end sparse-switch
.end method

.method public final ping()V
    .registers 1

    .line 75
    return-void
.end method

.method public queryLocalInterface(Ljava/lang/String;)Landroid/os/IHwInterface;
    .registers 3
    .param p1, "descriptor"    # Ljava/lang/String;

    .line 101
    const-string v0, "vendor.xiaomi.hardware.displayfeature@1.0::IDisplayFeatureCallback"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 102
    return-object p0

    .line 104
    :cond_9
    const/4 v0, 0x0

    return-object v0
.end method

.method public registerAsService(Ljava/lang/String;)V
    .registers 2
    .param p1, "serviceName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 108
    invoke-virtual {p0, p1}, Lmiui/hardware/display/IDisplayFeatureCallback$Stub;->registerService(Ljava/lang/String;)V

    .line 109
    return-void
.end method

.method public final setHALInstrumentation()V
    .registers 1

    .line 66
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 113
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lmiui/hardware/display/IDisplayFeatureCallback$Stub;->interfaceDescriptor()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "@Stub"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final unlinkToDeath(Landroid/os/IHwBinder$DeathRecipient;)Z
    .registers 3
    .param p1, "recipient"    # Landroid/os/IHwBinder$DeathRecipient;

    .line 95
    const/4 v0, 0x1

    return v0
.end method
