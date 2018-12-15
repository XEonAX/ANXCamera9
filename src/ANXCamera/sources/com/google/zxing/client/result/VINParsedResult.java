package com.google.zxing.client.result;

public final class VINParsedResult extends ParsedResult {
    private final String countryCode;
    private final int modelYear;
    private final char plantCode;
    private final String sequentialNumber;
    private final String vehicleAttributes;
    private final String vehicleDescriptorSection;
    private final String vehicleIdentifierSection;
    private final String vin;
    private final String worldManufacturerID;

    public VINParsedResult(String vin, String worldManufacturerID, String vehicleDescriptorSection, String vehicleIdentifierSection, String countryCode, String vehicleAttributes, int modelYear, char plantCode, String sequentialNumber) {
        super(ParsedResultType.VIN);
        this.vin = vin;
        this.worldManufacturerID = worldManufacturerID;
        this.vehicleDescriptorSection = vehicleDescriptorSection;
        this.vehicleIdentifierSection = vehicleIdentifierSection;
        this.countryCode = countryCode;
        this.vehicleAttributes = vehicleAttributes;
        this.modelYear = modelYear;
        this.plantCode = plantCode;
        this.sequentialNumber = sequentialNumber;
    }

    public String getVIN() {
        return this.vin;
    }

    public String getWorldManufacturerID() {
        return this.worldManufacturerID;
    }

    public String getVehicleDescriptorSection() {
        return this.vehicleDescriptorSection;
    }

    public String getVehicleIdentifierSection() {
        return this.vehicleIdentifierSection;
    }

    public String getCountryCode() {
        return this.countryCode;
    }

    public String getVehicleAttributes() {
        return this.vehicleAttributes;
    }

    public int getModelYear() {
        return this.modelYear;
    }

    public char getPlantCode() {
        return this.plantCode;
    }

    public String getSequentialNumber() {
        return this.sequentialNumber;
    }

    public String getDisplayResult() {
        StringBuilder result = new StringBuilder(50);
        result.append(this.worldManufacturerID);
        result.append(' ');
        result.append(this.vehicleDescriptorSection);
        result.append(' ');
        result.append(this.vehicleIdentifierSection);
        result.append(10);
        if (this.countryCode != null) {
            result.append(this.countryCode);
            result.append(' ');
        }
        result.append(this.modelYear);
        result.append(' ');
        result.append(this.plantCode);
        result.append(' ');
        result.append(this.sequentialNumber);
        result.append(10);
        return result.toString();
    }
}
