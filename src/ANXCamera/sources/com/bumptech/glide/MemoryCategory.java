package com.bumptech.glide;

public enum MemoryCategory {
    LOW(0.5f),
    NORMAL(1.0f),
    HIGH(1.5f);
    
    private final float multiplier;

    private MemoryCategory(float f) {
        this.multiplier = f;
    }

    public float p() {
        return this.multiplier;
    }
}
