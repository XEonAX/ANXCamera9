.class public final Lcom/google/zxing/client/result/VINParsedResult;
.super Lcom/google/zxing/client/result/ParsedResult;
.source "VINParsedResult.java"


# instance fields
.field private final countryCode:Ljava/lang/String;

.field private final modelYear:I

.field private final plantCode:C

.field private final sequentialNumber:Ljava/lang/String;

.field private final vehicleAttributes:Ljava/lang/String;

.field private final vehicleDescriptorSection:Ljava/lang/String;

.field private final vehicleIdentifierSection:Ljava/lang/String;

.field private final vin:Ljava/lang/String;

.field private final worldManufacturerID:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ICLjava/lang/String;)V
    .locals 1
    .param p1, "vin"    # Ljava/lang/String;
    .param p2, "worldManufacturerID"    # Ljava/lang/String;
    .param p3, "vehicleDescriptorSection"    # Ljava/lang/String;
    .param p4, "vehicleIdentifierSection"    # Ljava/lang/String;
    .param p5, "countryCode"    # Ljava/lang/String;
    .param p6, "vehicleAttributes"    # Ljava/lang/String;
    .param p7, "modelYear"    # I
    .param p8, "plantCode"    # C
    .param p9, "sequentialNumber"    # Ljava/lang/String;

    .line 42
    sget-object v0, Lcom/google/zxing/client/result/ParsedResultType;->VIN:Lcom/google/zxing/client/result/ParsedResultType;

    invoke-direct {p0, v0}, Lcom/google/zxing/client/result/ParsedResult;-><init>(Lcom/google/zxing/client/result/ParsedResultType;)V

    .line 43
    iput-object p1, p0, Lcom/google/zxing/client/result/VINParsedResult;->vin:Ljava/lang/String;

    .line 44
    iput-object p2, p0, Lcom/google/zxing/client/result/VINParsedResult;->worldManufacturerID:Ljava/lang/String;

    .line 45
    iput-object p3, p0, Lcom/google/zxing/client/result/VINParsedResult;->vehicleDescriptorSection:Ljava/lang/String;

    .line 46
    iput-object p4, p0, Lcom/google/zxing/client/result/VINParsedResult;->vehicleIdentifierSection:Ljava/lang/String;

    .line 47
    iput-object p5, p0, Lcom/google/zxing/client/result/VINParsedResult;->countryCode:Ljava/lang/String;

    .line 48
    iput-object p6, p0, Lcom/google/zxing/client/result/VINParsedResult;->vehicleAttributes:Ljava/lang/String;

    .line 49
    iput p7, p0, Lcom/google/zxing/client/result/VINParsedResult;->modelYear:I

    .line 50
    iput-char p8, p0, Lcom/google/zxing/client/result/VINParsedResult;->plantCode:C

    .line 51
    iput-object p9, p0, Lcom/google/zxing/client/result/VINParsedResult;->sequentialNumber:Ljava/lang/String;

    .line 52
    return-void
.end method


# virtual methods
.method public getCountryCode()Ljava/lang/String;
    .locals 1

    .line 71
    iget-object v0, p0, Lcom/google/zxing/client/result/VINParsedResult;->countryCode:Ljava/lang/String;

    return-object v0
.end method

.method public getDisplayResult()Ljava/lang/String;
    .locals 4

    .line 92
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x32

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 93
    .local v0, "result":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lcom/google/zxing/client/result/VINParsedResult;->worldManufacturerID:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 94
    iget-object v2, p0, Lcom/google/zxing/client/result/VINParsedResult;->vehicleDescriptorSection:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 95
    iget-object v2, p0, Lcom/google/zxing/client/result/VINParsedResult;->vehicleIdentifierSection:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v2, 0xa

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 96
    iget-object v3, p0, Lcom/google/zxing/client/result/VINParsedResult;->countryCode:Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 97
    iget-object v3, p0, Lcom/google/zxing/client/result/VINParsedResult;->countryCode:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 99
    :cond_0
    iget v3, p0, Lcom/google/zxing/client/result/VINParsedResult;->modelYear:I

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 100
    iget-char v3, p0, Lcom/google/zxing/client/result/VINParsedResult;->plantCode:C

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 101
    iget-object v1, p0, Lcom/google/zxing/client/result/VINParsedResult;->sequentialNumber:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 102
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getModelYear()I
    .locals 1

    .line 79
    iget v0, p0, Lcom/google/zxing/client/result/VINParsedResult;->modelYear:I

    return v0
.end method

.method public getPlantCode()C
    .locals 1

    .line 83
    iget-char v0, p0, Lcom/google/zxing/client/result/VINParsedResult;->plantCode:C

    return v0
.end method

.method public getSequentialNumber()Ljava/lang/String;
    .locals 1

    .line 87
    iget-object v0, p0, Lcom/google/zxing/client/result/VINParsedResult;->sequentialNumber:Ljava/lang/String;

    return-object v0
.end method

.method public getVIN()Ljava/lang/String;
    .locals 1

    .line 55
    iget-object v0, p0, Lcom/google/zxing/client/result/VINParsedResult;->vin:Ljava/lang/String;

    return-object v0
.end method

.method public getVehicleAttributes()Ljava/lang/String;
    .locals 1

    .line 75
    iget-object v0, p0, Lcom/google/zxing/client/result/VINParsedResult;->vehicleAttributes:Ljava/lang/String;

    return-object v0
.end method

.method public getVehicleDescriptorSection()Ljava/lang/String;
    .locals 1

    .line 63
    iget-object v0, p0, Lcom/google/zxing/client/result/VINParsedResult;->vehicleDescriptorSection:Ljava/lang/String;

    return-object v0
.end method

.method public getVehicleIdentifierSection()Ljava/lang/String;
    .locals 1

    .line 67
    iget-object v0, p0, Lcom/google/zxing/client/result/VINParsedResult;->vehicleIdentifierSection:Ljava/lang/String;

    return-object v0
.end method

.method public getWorldManufacturerID()Ljava/lang/String;
    .locals 1

    .line 59
    iget-object v0, p0, Lcom/google/zxing/client/result/VINParsedResult;->worldManufacturerID:Ljava/lang/String;

    return-object v0
.end method
