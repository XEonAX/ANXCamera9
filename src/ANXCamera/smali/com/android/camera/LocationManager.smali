.class public Lcom/android/camera/LocationManager;
.super Ljava/lang/Object;
.source "LocationManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/LocationManager$LocationListener;,
        Lcom/android/camera/LocationManager$Listener;
    }
.end annotation


# static fields
.field private static final GPS_REQUEST_LOCATION_TIME_OUT:I = 0xea60

.field private static final LOCATION_TIME_THRESHOLD:J = 0x36ee80L

.field private static final TAG:Ljava/lang/String; = "LocationManager"

.field private static final VALID_LAST_KNOWN_LOCATION_AGE:J = 0x2bf20L

.field private static sLocationManager:Lcom/android/camera/LocationManager;


# instance fields
.field private mCacheLocation:Landroid/location/Location;

.field private mLastKnownLocation:Landroid/location/Location;

.field private mListener:Lcom/android/camera/LocationManager$Listener;

.field mLocationListeners:[Lcom/android/camera/LocationManager$LocationListener;

.field private mLocationManager:Landroid/location/LocationManager;

.field private mRecordLocation:Z

.field private mTimer:Ljava/util/Timer;


# direct methods
.method private constructor <init>()V
    .locals 3

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/android/camera/LocationManager$LocationListener;

    new-instance v1, Lcom/android/camera/LocationManager$LocationListener;

    const-string v2, "gps"

    invoke-direct {v1, p0, v2}, Lcom/android/camera/LocationManager$LocationListener;-><init>(Lcom/android/camera/LocationManager;Ljava/lang/String;)V

    const/4 v2, 0x0

    aput-object v1, v0, v2

    new-instance v1, Lcom/android/camera/LocationManager$LocationListener;

    const-string v2, "network"

    invoke-direct {v1, p0, v2}, Lcom/android/camera/LocationManager$LocationListener;-><init>(Lcom/android/camera/LocationManager;Ljava/lang/String;)V

    const/4 v2, 0x1

    aput-object v1, v0, v2

    iput-object v0, p0, Lcom/android/camera/LocationManager;->mLocationListeners:[Lcom/android/camera/LocationManager$LocationListener;

    .line 65
    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/LocationManager;)V
    .locals 0

    .line 33
    invoke-direct {p0}, Lcom/android/camera/LocationManager;->stopReceivingGPSLocationUpdates()V

    return-void
.end method

.method static synthetic access$102(Lcom/android/camera/LocationManager;Ljava/util/Timer;)Ljava/util/Timer;
    .locals 0

    .line 33
    iput-object p1, p0, Lcom/android/camera/LocationManager;->mTimer:Ljava/util/Timer;

    return-object p1
.end method

.method static synthetic access$200(Lcom/android/camera/LocationManager;)Z
    .locals 0

    .line 33
    iget-boolean p0, p0, Lcom/android/camera/LocationManager;->mRecordLocation:Z

    return p0
.end method

.method static synthetic access$300(Lcom/android/camera/LocationManager;)V
    .locals 0

    .line 33
    invoke-direct {p0}, Lcom/android/camera/LocationManager;->cancelTimer()V

    return-void
.end method

.method static synthetic access$400(Lcom/android/camera/LocationManager;)Lcom/android/camera/LocationManager$Listener;
    .locals 0

    .line 33
    iget-object p0, p0, Lcom/android/camera/LocationManager;->mListener:Lcom/android/camera/LocationManager$Listener;

    return-object p0
.end method

.method static synthetic access$500(Lcom/android/camera/LocationManager;Landroid/location/Location;)V
    .locals 0

    .line 33
    invoke-direct {p0, p1}, Lcom/android/camera/LocationManager;->updateCacheLocation(Landroid/location/Location;)V

    return-void
.end method

.method private cancelTimer()V
    .locals 1

    .line 125
    iget-object v0, p0, Lcom/android/camera/LocationManager;->mTimer:Ljava/util/Timer;

    if-eqz v0, :cond_0

    .line 126
    iget-object v0, p0, Lcom/android/camera/LocationManager;->mTimer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 127
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/LocationManager;->mTimer:Ljava/util/Timer;

    .line 129
    :cond_0
    return-void
.end method

.method private getBetterLocation(Landroid/location/Location;Landroid/location/Location;)Landroid/location/Location;
    .locals 4

    .line 216
    nop

    .line 217
    if-nez p2, :cond_0

    .line 218
    return-object p1

    .line 220
    :cond_0
    if-eqz p1, :cond_1

    .line 221
    invoke-virtual {p1}, Landroid/location/Location;->getTime()J

    move-result-wide v0

    invoke-virtual {p2}, Landroid/location/Location;->getTime()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-ltz v0, :cond_1

    .line 222
    invoke-virtual {p1}, Landroid/location/Location;->getTime()J

    move-result-wide v0

    invoke-virtual {p2}, Landroid/location/Location;->getTime()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_2

    const-string v0, "gps"

    .line 223
    invoke-virtual {p2}, Landroid/location/Location;->getProvider()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 224
    :cond_1
    nop

    .line 226
    move-object p1, p2

    :cond_2
    return-object p1
.end method

.method private getLastLocation()V
    .locals 3

    .line 194
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/LocationManager;->mLocationManager:Landroid/location/LocationManager;

    const-string v1, "gps"

    invoke-virtual {v0, v1}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;

    move-result-object v0

    .line 196
    iget-object v1, p0, Lcom/android/camera/LocationManager;->mLocationManager:Landroid/location/LocationManager;

    const-string v2, "network"

    invoke-virtual {v1, v2}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;

    move-result-object v1

    .line 198
    invoke-direct {p0, v0, v1}, Lcom/android/camera/LocationManager;->getBetterLocation(Landroid/location/Location;Landroid/location/Location;)Landroid/location/Location;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/LocationManager;->mLastKnownLocation:Landroid/location/Location;

    .line 202
    iget-object v0, p0, Lcom/android/camera/LocationManager;->mCacheLocation:Landroid/location/Location;

    iget-object v1, p0, Lcom/android/camera/LocationManager;->mLastKnownLocation:Landroid/location/Location;

    invoke-direct {p0, v0, v1}, Lcom/android/camera/LocationManager;->getBetterLocation(Landroid/location/Location;Landroid/location/Location;)Landroid/location/Location;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 206
    goto :goto_0

    .line 203
    :catch_0
    move-exception v0

    .line 204
    const-string v1, "LocationManager"

    const-string v2, "fail to request last location update, ignore"

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 205
    iget-object v0, p0, Lcom/android/camera/LocationManager;->mCacheLocation:Landroid/location/Location;

    .line 207
    :goto_0
    invoke-direct {p0, v0}, Lcom/android/camera/LocationManager;->isValidLastKnownLocation(Landroid/location/Location;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 208
    iput-object v0, p0, Lcom/android/camera/LocationManager;->mCacheLocation:Landroid/location/Location;

    goto :goto_1

    .line 210
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/LocationManager;->mCacheLocation:Landroid/location/Location;

    .line 212
    :goto_1
    const-string v0, "LocationManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "last cache location is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/LocationManager;->mCacheLocation:Landroid/location/Location;

    if-eqz v2, :cond_1

    const-string v2, "not null"

    goto :goto_2

    :cond_1
    const-string v2, "null"

    :goto_2
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 213
    return-void
.end method

.method public static instance()Lcom/android/camera/LocationManager;
    .locals 1

    .line 68
    sget-object v0, Lcom/android/camera/LocationManager;->sLocationManager:Lcom/android/camera/LocationManager;

    if-nez v0, :cond_0

    .line 69
    new-instance v0, Lcom/android/camera/LocationManager;

    invoke-direct {v0}, Lcom/android/camera/LocationManager;-><init>()V

    sput-object v0, Lcom/android/camera/LocationManager;->sLocationManager:Lcom/android/camera/LocationManager;

    .line 71
    :cond_0
    sget-object v0, Lcom/android/camera/LocationManager;->sLocationManager:Lcom/android/camera/LocationManager;

    return-object v0
.end method

.method private isValidLastKnownLocation(Landroid/location/Location;)Z
    .locals 4

    .line 239
    if-eqz p1, :cond_0

    .line 240
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 241
    invoke-virtual {p1}, Landroid/location/Location;->getTime()J

    move-result-wide v2

    sub-long/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->abs(J)J

    move-result-wide v0

    const-wide/32 v2, 0x2bf20

    cmp-long p1, v0, v2

    if-gez p1, :cond_0

    .line 242
    const/4 p1, 0x1

    return p1

    .line 245
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method private startReceivingLocationUpdates()V
    .locals 10

    .line 132
    iget-object v0, p0, Lcom/android/camera/LocationManager;->mLocationManager:Landroid/location/LocationManager;

    if-nez v0, :cond_0

    .line 133
    nop

    .line 134
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "location"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/location/LocationManager;

    iput-object v0, p0, Lcom/android/camera/LocationManager;->mLocationManager:Landroid/location/LocationManager;

    .line 136
    :cond_0
    iget-object v0, p0, Lcom/android/camera/LocationManager;->mLocationManager:Landroid/location/LocationManager;

    if-eqz v0, :cond_2

    .line 138
    const/4 v0, 0x1

    :try_start_0
    iget-object v1, p0, Lcom/android/camera/LocationManager;->mLocationManager:Landroid/location/LocationManager;

    const-string v2, "network"

    const-wide/16 v3, 0x3e8

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/android/camera/LocationManager;->mLocationListeners:[Lcom/android/camera/LocationManager$LocationListener;

    aget-object v6, v6, v0

    invoke-virtual/range {v1 .. v6}, Landroid/location/LocationManager;->requestLocationUpdates(Ljava/lang/String;JFLandroid/location/LocationListener;)V
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 145
    :catch_0
    move-exception v1

    .line 146
    const-string v2, "LocationManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "provider does not exist "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 143
    :catch_1
    move-exception v1

    .line 144
    const-string v2, "LocationManager"

    const-string v3, "fail to request location update, ignore"

    invoke-static {v2, v3, v1}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 147
    :goto_0
    nop

    .line 149
    :goto_1
    :try_start_1
    iget-object v4, p0, Lcom/android/camera/LocationManager;->mLocationManager:Landroid/location/LocationManager;

    const-string v5, "gps"

    const-wide/16 v6, 0x3e8

    const/4 v8, 0x0

    iget-object v1, p0, Lcom/android/camera/LocationManager;->mLocationListeners:[Lcom/android/camera/LocationManager$LocationListener;

    const/4 v2, 0x0

    aget-object v9, v1, v2

    invoke-virtual/range {v4 .. v9}, Landroid/location/LocationManager;->requestLocationUpdates(Ljava/lang/String;JFLandroid/location/LocationListener;)V

    .line 155
    invoke-direct {p0}, Lcom/android/camera/LocationManager;->cancelTimer()V

    .line 156
    new-instance v1, Ljava/util/Timer;

    invoke-direct {v1, v0}, Ljava/util/Timer;-><init>(Z)V

    iput-object v1, p0, Lcom/android/camera/LocationManager;->mTimer:Ljava/util/Timer;

    .line 157
    iget-object v0, p0, Lcom/android/camera/LocationManager;->mTimer:Ljava/util/Timer;

    new-instance v1, Lcom/android/camera/LocationManager$1;

    invoke-direct {v1, p0}, Lcom/android/camera/LocationManager$1;-><init>(Lcom/android/camera/LocationManager;)V

    const-wide/32 v3, 0xea60

    invoke-virtual {v0, v1, v3, v4}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 164
    iget-object v0, p0, Lcom/android/camera/LocationManager;->mListener:Lcom/android/camera/LocationManager$Listener;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/LocationManager;->mListener:Lcom/android/camera/LocationManager$Listener;

    invoke-interface {v0, v2}, Lcom/android/camera/LocationManager$Listener;->showGpsOnScreenIndicator(Z)V
    :try_end_1
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_2

    goto :goto_2

    .line 167
    :catch_2
    move-exception v0

    .line 168
    const-string v1, "LocationManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "provider does not exist "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3

    .line 165
    :catch_3
    move-exception v0

    .line 166
    const-string v1, "LocationManager"

    const-string v2, "fail to request location update, ignore"

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 169
    :cond_1
    :goto_2
    nop

    .line 170
    :goto_3
    const-string v0, "LocationManager"

    const-string v1, "startReceivingLocationUpdates"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    invoke-direct {p0}, Lcom/android/camera/LocationManager;->getLastLocation()V

    .line 173
    :cond_2
    return-void
.end method

.method private stopReceivingGPSLocationUpdates()V
    .locals 4

    .line 249
    iget-object v0, p0, Lcom/android/camera/LocationManager;->mLocationManager:Landroid/location/LocationManager;

    if-eqz v0, :cond_0

    .line 251
    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lcom/android/camera/LocationManager;->mLocationManager:Landroid/location/LocationManager;

    iget-object v2, p0, Lcom/android/camera/LocationManager;->mLocationListeners:[Lcom/android/camera/LocationManager$LocationListener;

    aget-object v2, v2, v0

    invoke-virtual {v1, v2}, Landroid/location/LocationManager;->removeUpdates(Landroid/location/LocationListener;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 254
    goto :goto_0

    .line 252
    :catch_0
    move-exception v1

    .line 253
    const-string v2, "LocationManager"

    const-string v3, "fail to remove location listeners, ignore"

    invoke-static {v2, v3, v1}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 255
    :goto_0
    iget-object v1, p0, Lcom/android/camera/LocationManager;->mLocationListeners:[Lcom/android/camera/LocationManager$LocationListener;

    aget-object v1, v1, v0

    iput-boolean v0, v1, Lcom/android/camera/LocationManager$LocationListener;->mValid:Z

    .line 256
    const-string v0, "LocationManager"

    const-string v1, "stopReceivingGPSLocationUpdates"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 258
    :cond_0
    iget-object v0, p0, Lcom/android/camera/LocationManager;->mListener:Lcom/android/camera/LocationManager$Listener;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/LocationManager;->mListener:Lcom/android/camera/LocationManager$Listener;

    invoke-interface {v0}, Lcom/android/camera/LocationManager$Listener;->hideGpsOnScreenIndicator()V

    .line 259
    :cond_1
    return-void
.end method

.method private stopReceivingLocationUpdates()V
    .locals 5

    .line 176
    invoke-direct {p0}, Lcom/android/camera/LocationManager;->cancelTimer()V

    .line 177
    iget-object v0, p0, Lcom/android/camera/LocationManager;->mLocationManager:Landroid/location/LocationManager;

    if-eqz v0, :cond_1

    .line 178
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    iget-object v2, p0, Lcom/android/camera/LocationManager;->mLocationListeners:[Lcom/android/camera/LocationManager$LocationListener;

    array-length v2, v2

    if-ge v1, v2, :cond_0

    .line 180
    :try_start_0
    iget-object v2, p0, Lcom/android/camera/LocationManager;->mLocationManager:Landroid/location/LocationManager;

    iget-object v3, p0, Lcom/android/camera/LocationManager;->mLocationListeners:[Lcom/android/camera/LocationManager$LocationListener;

    aget-object v3, v3, v1

    invoke-virtual {v2, v3}, Landroid/location/LocationManager;->removeUpdates(Landroid/location/LocationListener;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 183
    goto :goto_1

    .line 181
    :catch_0
    move-exception v2

    .line 182
    const-string v3, "LocationManager"

    const-string v4, "fail to remove location listeners, ignore"

    invoke-static {v3, v4, v2}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 184
    :goto_1
    iget-object v2, p0, Lcom/android/camera/LocationManager;->mLocationListeners:[Lcom/android/camera/LocationManager$LocationListener;

    aget-object v2, v2, v1

    iput-boolean v0, v2, Lcom/android/camera/LocationManager$LocationListener;->mValid:Z

    .line 178
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 186
    :cond_0
    const-string v0, "LocationManager"

    const-string v1, "stopReceivingLocationUpdates"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 188
    :cond_1
    iget-object v0, p0, Lcom/android/camera/LocationManager;->mListener:Lcom/android/camera/LocationManager$Listener;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/LocationManager;->mListener:Lcom/android/camera/LocationManager$Listener;

    invoke-interface {v0}, Lcom/android/camera/LocationManager$Listener;->hideGpsOnScreenIndicator()V

    .line 189
    :cond_2
    return-void
.end method

.method private updateCacheLocation(Landroid/location/Location;)V
    .locals 1

    .line 230
    iget-object v0, p0, Lcom/android/camera/LocationManager;->mCacheLocation:Landroid/location/Location;

    invoke-direct {p0, v0, p1}, Lcom/android/camera/LocationManager;->getBetterLocation(Landroid/location/Location;Landroid/location/Location;)Landroid/location/Location;

    move-result-object p1

    .line 231
    iget-object v0, p0, Lcom/android/camera/LocationManager;->mCacheLocation:Landroid/location/Location;

    if-eqz v0, :cond_0

    .line 232
    iget-object v0, p0, Lcom/android/camera/LocationManager;->mCacheLocation:Landroid/location/Location;

    invoke-virtual {v0, p1}, Landroid/location/Location;->set(Landroid/location/Location;)V

    goto :goto_0

    .line 234
    :cond_0
    new-instance v0, Landroid/location/Location;

    invoke-direct {v0, p1}, Landroid/location/Location;-><init>(Landroid/location/Location;)V

    iput-object v0, p0, Lcom/android/camera/LocationManager;->mCacheLocation:Landroid/location/Location;

    .line 236
    :goto_0
    return-void
.end method

.method private static validateLocation(Landroid/location/Location;)Landroid/location/Location;
    .locals 6

    .line 102
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 103
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/location/Location;->getTime()J

    move-result-wide v2

    sub-long/2addr v2, v0

    invoke-static {v2, v3}, Ljava/lang/Math;->abs(J)J

    move-result-wide v2

    const-wide/32 v4, 0x36ee80

    cmp-long v2, v2, v4

    if-lez v2, :cond_0

    .line 104
    const-string v2, "LocationManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "validateLocation: modify to now from "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/location/Location;->getTime()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    invoke-virtual {p0, v0, v1}, Landroid/location/Location;->setTime(J)V

    .line 107
    :cond_0
    return-object p0
.end method


# virtual methods
.method public getCurrentLocation()Landroid/location/Location;
    .locals 5

    .line 85
    iget-boolean v0, p0, Lcom/android/camera/LocationManager;->mRecordLocation:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 88
    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/android/camera/LocationManager;->mLocationListeners:[Lcom/android/camera/LocationManager$LocationListener;

    array-length v1, v1

    if-ge v0, v1, :cond_2

    .line 89
    iget-object v1, p0, Lcom/android/camera/LocationManager;->mLocationListeners:[Lcom/android/camera/LocationManager$LocationListener;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lcom/android/camera/LocationManager$LocationListener;->current()Landroid/location/Location;

    move-result-object v1

    .line 90
    if-eqz v1, :cond_1

    .line 91
    const-string v2, "LocationManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "get current location, it is from "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/android/camera/LocationManager;->mLocationListeners:[Lcom/android/camera/LocationManager$LocationListener;

    aget-object v0, v4, v0

    iget-object v0, v0, Lcom/android/camera/LocationManager$LocationListener;->mProvider:Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    invoke-static {v1}, Lcom/android/camera/LocationManager;->validateLocation(Landroid/location/Location;)Landroid/location/Location;

    move-result-object v0

    return-object v0

    .line 88
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 95
    :cond_2
    const-string v0, "LocationManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No location received yet. cache location is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    iget-object v2, p0, Lcom/android/camera/LocationManager;->mCacheLocation:Landroid/location/Location;

    if-eqz v2, :cond_3

    const-string v2, "not null"

    goto :goto_1

    :cond_3
    const-string v2, "null"

    :goto_1
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 95
    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    iget-object v0, p0, Lcom/android/camera/LocationManager;->mCacheLocation:Landroid/location/Location;

    invoke-static {v0}, Lcom/android/camera/LocationManager;->validateLocation(Landroid/location/Location;)Landroid/location/Location;

    move-result-object v0

    return-object v0
.end method

.method public getLastKnownLocation()Landroid/location/Location;
    .locals 1

    .line 327
    iget-boolean v0, p0, Lcom/android/camera/LocationManager;->mRecordLocation:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 328
    :cond_0
    iget-object v0, p0, Lcom/android/camera/LocationManager;->mLastKnownLocation:Landroid/location/Location;

    return-object v0
.end method

.method public recordLocation(Z)V
    .locals 1

    .line 111
    iget-boolean v0, p0, Lcom/android/camera/LocationManager;->mRecordLocation:Z

    if-eq v0, p1, :cond_1

    .line 112
    iput-boolean p1, p0, Lcom/android/camera/LocationManager;->mRecordLocation:Z

    .line 113
    if-eqz p1, :cond_0

    invoke-static {}, Lcom/android/camera/permission/PermissionManager;->checkCameraLocationPermissions()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 114
    invoke-direct {p0}, Lcom/android/camera/LocationManager;->startReceivingLocationUpdates()V

    goto :goto_0

    .line 116
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/LocationManager;->stopReceivingLocationUpdates()V

    .line 119
    :cond_1
    :goto_0
    return-void
.end method

.method public setListener(Lcom/android/camera/LocationManager$Listener;)V
    .locals 0

    .line 75
    iput-object p1, p0, Lcom/android/camera/LocationManager;->mListener:Lcom/android/camera/LocationManager$Listener;

    .line 76
    return-void
.end method

.method public unsetListener(Lcom/android/camera/LocationManager$Listener;)V
    .locals 1

    .line 79
    iget-object v0, p0, Lcom/android/camera/LocationManager;->mListener:Lcom/android/camera/LocationManager$Listener;

    if-ne v0, p1, :cond_0

    .line 80
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/android/camera/LocationManager;->mListener:Lcom/android/camera/LocationManager$Listener;

    .line 82
    :cond_0
    return-void
.end method
