.class public interface abstract annotation Lcom/google/lens/sdk/LensApi$LensAvailabilityStatus;
.super Ljava/lang/Object;
.source "LensApi.java"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/lens/sdk/LensApi;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2609
    name = "LensAvailabilityStatus"
.end annotation


# static fields
.field public static final LENS_READY:I = 0x0

.field public static final LENS_UNAVAILABLE:I = 0x1

.field public static final LENS_UNAVAILABLE_DEVICE_INCOMPATIBLE:I = 0x3

.field public static final LENS_UNAVAILABLE_DEVICE_LOCKED:I = 0x5

.field public static final LENS_UNAVAILABLE_LOCALE_NOT_SUPPORTED:I = 0x2

.field public static final LENS_UNAVAILABLE_UNKNOWN_ERROR_CODE:I = 0x6
