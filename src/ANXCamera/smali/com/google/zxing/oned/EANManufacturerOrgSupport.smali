.class final Lcom/google/zxing/oned/EANManufacturerOrgSupport;
.super Ljava/lang/Object;
.source "EANManufacturerOrgSupport.java"


# instance fields
.field private final countryIdentifiers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final ranges:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "[I>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 1

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->ranges:Ljava/util/List;

    .line 34
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->countryIdentifiers:Ljava/util/List;

    .line 31
    return-void
.end method

.method private add([ILjava/lang/String;)V
    .locals 1
    .param p1, "range"    # [I
    .param p2, "id"    # Ljava/lang/String;

    .line 55
    iget-object v0, p0, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->ranges:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 56
    iget-object v0, p0, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->countryIdentifiers:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 57
    return-void
.end method

.method private declared-synchronized initIfNeeded()V
    .locals 5

    monitor-enter p0

    .line 60
    :try_start_0
    iget-object v0, p0, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->ranges:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    .line 61
    monitor-exit p0

    return-void

    .line 63
    :cond_0
    const/4 v0, 0x2

    :try_start_1
    new-array v1, v0, [I

    const/16 v2, 0x13

    const/4 v3, 0x1

    aput v2, v1, v3

    const-string v2, "US/CA"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 64
    new-array v1, v0, [I

    fill-array-data v1, :array_0

    const-string v2, "US"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 65
    new-array v1, v0, [I

    fill-array-data v1, :array_1

    const-string v2, "US/CA"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 66
    new-array v1, v0, [I

    fill-array-data v1, :array_2

    const-string v2, "FR"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 67
    new-array v1, v3, [I

    const/16 v2, 0x17c

    const/4 v4, 0x0

    aput v2, v1, v4

    const-string v2, "BG"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 68
    new-array v1, v3, [I

    const/16 v2, 0x17f

    aput v2, v1, v4

    const-string v2, "SI"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 69
    new-array v1, v3, [I

    const/16 v2, 0x181

    aput v2, v1, v4

    const-string v2, "HR"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 70
    new-array v1, v3, [I

    const/16 v2, 0x183

    aput v2, v1, v4

    const-string v2, "BA"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 71
    new-array v1, v0, [I

    fill-array-data v1, :array_3

    const-string v2, "DE"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 72
    new-array v1, v0, [I

    fill-array-data v1, :array_4

    const-string v2, "JP"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 73
    new-array v1, v0, [I

    fill-array-data v1, :array_5

    const-string v2, "RU"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 74
    new-array v1, v3, [I

    const/16 v2, 0x1d7

    aput v2, v1, v4

    const-string v2, "TW"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 75
    new-array v1, v3, [I

    const/16 v2, 0x1da

    aput v2, v1, v4

    const-string v2, "EE"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 76
    new-array v1, v3, [I

    const/16 v2, 0x1db

    aput v2, v1, v4

    const-string v2, "LV"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 77
    new-array v1, v3, [I

    const/16 v2, 0x1dc

    aput v2, v1, v4

    const-string v2, "AZ"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 78
    new-array v1, v3, [I

    const/16 v2, 0x1dd

    aput v2, v1, v4

    const-string v2, "LT"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 79
    new-array v1, v3, [I

    const/16 v2, 0x1de

    aput v2, v1, v4

    const-string v2, "UZ"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 80
    new-array v1, v3, [I

    const/16 v2, 0x1df

    aput v2, v1, v4

    const-string v2, "LK"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 81
    new-array v1, v3, [I

    const/16 v2, 0x1e0

    aput v2, v1, v4

    const-string v2, "PH"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 82
    new-array v1, v3, [I

    const/16 v2, 0x1e1

    aput v2, v1, v4

    const-string v2, "BY"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 83
    new-array v1, v3, [I

    const/16 v2, 0x1e2

    aput v2, v1, v4

    const-string v2, "UA"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 84
    new-array v1, v3, [I

    const/16 v2, 0x1e4

    aput v2, v1, v4

    const-string v2, "MD"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 85
    new-array v1, v3, [I

    const/16 v2, 0x1e5

    aput v2, v1, v4

    const-string v2, "AM"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 86
    new-array v1, v3, [I

    const/16 v2, 0x1e6

    aput v2, v1, v4

    const-string v2, "GE"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 87
    new-array v1, v3, [I

    const/16 v2, 0x1e7

    aput v2, v1, v4

    const-string v2, "KZ"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 88
    new-array v1, v3, [I

    const/16 v2, 0x1e9

    aput v2, v1, v4

    const-string v2, "HK"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 89
    new-array v1, v0, [I

    fill-array-data v1, :array_6

    const-string v2, "JP"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 90
    new-array v1, v0, [I

    fill-array-data v1, :array_7

    const-string v2, "GB"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 91
    new-array v1, v3, [I

    const/16 v2, 0x208

    aput v2, v1, v4

    const-string v2, "GR"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 92
    new-array v1, v3, [I

    const/16 v2, 0x210

    aput v2, v1, v4

    const-string v2, "LB"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 93
    new-array v1, v3, [I

    const/16 v2, 0x211

    aput v2, v1, v4

    const-string v2, "CY"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 94
    new-array v1, v3, [I

    const/16 v2, 0x213

    aput v2, v1, v4

    const-string v2, "MK"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 95
    new-array v1, v3, [I

    const/16 v2, 0x217

    aput v2, v1, v4

    const-string v2, "MT"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 96
    new-array v1, v3, [I

    const/16 v2, 0x21b

    aput v2, v1, v4

    const-string v2, "IE"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 97
    new-array v1, v0, [I

    fill-array-data v1, :array_8

    const-string v2, "BE/LU"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 98
    new-array v1, v3, [I

    const/16 v2, 0x230

    aput v2, v1, v4

    const-string v2, "PT"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 99
    new-array v1, v3, [I

    const/16 v2, 0x239

    aput v2, v1, v4

    const-string v2, "IS"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 100
    new-array v1, v0, [I

    fill-array-data v1, :array_9

    const-string v2, "DK"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 101
    new-array v1, v3, [I

    const/16 v2, 0x24e

    aput v2, v1, v4

    const-string v2, "PL"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 102
    new-array v1, v3, [I

    const/16 v2, 0x252

    aput v2, v1, v4

    const-string v2, "RO"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 103
    new-array v1, v3, [I

    const/16 v2, 0x257

    aput v2, v1, v4

    const-string v2, "HU"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 104
    new-array v1, v0, [I

    fill-array-data v1, :array_a

    const-string v2, "ZA"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 105
    new-array v1, v3, [I

    const/16 v2, 0x25b

    aput v2, v1, v4

    const-string v2, "GH"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 106
    new-array v1, v3, [I

    const/16 v2, 0x260

    aput v2, v1, v4

    const-string v2, "BH"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 107
    new-array v1, v3, [I

    const/16 v2, 0x261

    aput v2, v1, v4

    const-string v2, "MU"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 108
    new-array v1, v3, [I

    const/16 v2, 0x263

    aput v2, v1, v4

    const-string v2, "MA"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 109
    new-array v1, v3, [I

    const/16 v2, 0x265

    aput v2, v1, v4

    const-string v2, "DZ"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 110
    new-array v1, v3, [I

    const/16 v2, 0x268

    aput v2, v1, v4

    const-string v2, "KE"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 111
    new-array v1, v3, [I

    const/16 v2, 0x26a

    aput v2, v1, v4

    const-string v2, "CI"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 112
    new-array v1, v3, [I

    const/16 v2, 0x26b

    aput v2, v1, v4

    const-string v2, "TN"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 113
    new-array v1, v3, [I

    const/16 v2, 0x26d

    aput v2, v1, v4

    const-string v2, "SY"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 114
    new-array v1, v3, [I

    const/16 v2, 0x26e

    aput v2, v1, v4

    const-string v2, "EG"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 115
    new-array v1, v3, [I

    const/16 v2, 0x270

    aput v2, v1, v4

    const-string v2, "LY"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 116
    new-array v1, v3, [I

    const/16 v2, 0x271

    aput v2, v1, v4

    const-string v2, "JO"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 117
    new-array v1, v3, [I

    const/16 v2, 0x272

    aput v2, v1, v4

    const-string v2, "IR"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 118
    new-array v1, v3, [I

    const/16 v2, 0x273

    aput v2, v1, v4

    const-string v2, "KW"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 119
    new-array v1, v3, [I

    const/16 v2, 0x274

    aput v2, v1, v4

    const-string v2, "SA"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 120
    new-array v1, v3, [I

    const/16 v2, 0x275

    aput v2, v1, v4

    const-string v2, "AE"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 121
    new-array v1, v0, [I

    fill-array-data v1, :array_b

    const-string v2, "FI"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 122
    new-array v1, v0, [I

    fill-array-data v1, :array_c

    const-string v2, "CN"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 123
    new-array v1, v0, [I

    fill-array-data v1, :array_d

    const-string v2, "NO"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 124
    new-array v1, v3, [I

    const/16 v2, 0x2d9

    aput v2, v1, v4

    const-string v2, "IL"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 125
    new-array v1, v0, [I

    fill-array-data v1, :array_e

    const-string v2, "SE"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 126
    new-array v1, v3, [I

    const/16 v2, 0x2e4

    aput v2, v1, v4

    const-string v2, "GT"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 127
    new-array v1, v3, [I

    const/16 v2, 0x2e5

    aput v2, v1, v4

    const-string v2, "SV"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 128
    new-array v1, v3, [I

    const/16 v2, 0x2e6

    aput v2, v1, v4

    const-string v2, "HN"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 129
    new-array v1, v3, [I

    const/16 v2, 0x2e7

    aput v2, v1, v4

    const-string v2, "NI"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 130
    new-array v1, v3, [I

    const/16 v2, 0x2e8

    aput v2, v1, v4

    const-string v2, "CR"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 131
    new-array v1, v3, [I

    const/16 v2, 0x2e9

    aput v2, v1, v4

    const-string v2, "PA"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 132
    new-array v1, v3, [I

    const/16 v2, 0x2ea

    aput v2, v1, v4

    const-string v2, "DO"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 133
    new-array v1, v3, [I

    const/16 v2, 0x2ee

    aput v2, v1, v4

    const-string v2, "MX"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 134
    new-array v1, v0, [I

    fill-array-data v1, :array_f

    const-string v2, "CA"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 135
    new-array v1, v3, [I

    const/16 v2, 0x2f7

    aput v2, v1, v4

    const-string v2, "VE"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 136
    new-array v1, v0, [I

    fill-array-data v1, :array_10

    const-string v2, "CH"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 137
    new-array v1, v3, [I

    const/16 v2, 0x302

    aput v2, v1, v4

    const-string v2, "CO"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 138
    new-array v1, v3, [I

    const/16 v2, 0x305

    aput v2, v1, v4

    const-string v2, "UY"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 139
    new-array v1, v3, [I

    const/16 v2, 0x307

    aput v2, v1, v4

    const-string v2, "PE"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 140
    new-array v1, v3, [I

    const/16 v2, 0x309

    aput v2, v1, v4

    const-string v2, "BO"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 141
    new-array v1, v3, [I

    const/16 v2, 0x30b

    aput v2, v1, v4

    const-string v2, "AR"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 142
    new-array v1, v3, [I

    const/16 v2, 0x30c

    aput v2, v1, v4

    const-string v2, "CL"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 143
    new-array v1, v3, [I

    const/16 v2, 0x310

    aput v2, v1, v4

    const-string v2, "PY"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 144
    new-array v1, v3, [I

    const/16 v2, 0x311

    aput v2, v1, v4

    const-string v2, "PE"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 145
    new-array v1, v3, [I

    const/16 v2, 0x312

    aput v2, v1, v4

    const-string v2, "EC"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 146
    new-array v1, v0, [I

    fill-array-data v1, :array_11

    const-string v2, "BR"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 147
    new-array v1, v0, [I

    fill-array-data v1, :array_12

    const-string v2, "IT"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 148
    new-array v1, v0, [I

    fill-array-data v1, :array_13

    const-string v2, "ES"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 149
    new-array v1, v3, [I

    const/16 v2, 0x352

    aput v2, v1, v4

    const-string v2, "CU"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 150
    new-array v1, v3, [I

    const/16 v2, 0x35a

    aput v2, v1, v4

    const-string v2, "SK"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 151
    new-array v1, v3, [I

    const/16 v2, 0x35b

    aput v2, v1, v4

    const-string v2, "CZ"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 152
    new-array v1, v3, [I

    const/16 v2, 0x35c

    aput v2, v1, v4

    const-string v2, "YU"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 153
    new-array v1, v3, [I

    const/16 v2, 0x361

    aput v2, v1, v4

    const-string v2, "MN"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 154
    new-array v1, v3, [I

    const/16 v2, 0x363

    aput v2, v1, v4

    const-string v2, "KP"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 155
    new-array v1, v0, [I

    fill-array-data v1, :array_14

    const-string v2, "TR"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 156
    new-array v1, v0, [I

    fill-array-data v1, :array_15

    const-string v2, "NL"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 157
    new-array v1, v3, [I

    const/16 v2, 0x370

    aput v2, v1, v4

    const-string v2, "KR"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 158
    new-array v1, v3, [I

    const/16 v2, 0x375

    aput v2, v1, v4

    const-string v2, "TH"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 159
    new-array v1, v3, [I

    const/16 v2, 0x378

    aput v2, v1, v4

    const-string v2, "SG"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 160
    new-array v1, v3, [I

    const/16 v2, 0x37a

    aput v2, v1, v4

    const-string v2, "IN"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 161
    new-array v1, v3, [I

    const/16 v2, 0x37d

    aput v2, v1, v4

    const-string v2, "VN"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 162
    new-array v1, v3, [I

    const/16 v2, 0x380

    aput v2, v1, v4

    const-string v2, "PK"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 163
    new-array v1, v3, [I

    const/16 v2, 0x383

    aput v2, v1, v4

    const-string v2, "ID"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 164
    new-array v1, v0, [I

    fill-array-data v1, :array_16

    const-string v2, "AT"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 165
    new-array v1, v0, [I

    fill-array-data v1, :array_17

    const-string v2, "AU"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 166
    new-array v0, v0, [I

    fill-array-data v0, :array_18

    const-string v1, "AZ"

    invoke-direct {p0, v0, v1}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 167
    new-array v0, v3, [I

    const/16 v1, 0x3bb

    aput v1, v0, v4

    const-string v1, "MY"

    invoke-direct {p0, v0, v1}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    .line 168
    new-array v0, v3, [I

    const/16 v1, 0x3be

    aput v1, v0, v4

    const-string v1, "MO"

    invoke-direct {p0, v0, v1}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 169
    monitor-exit p0

    return-void

    .line 59
    :catchall_0
    move-exception v0

    monitor-exit p0

    .end local p0    # "this":Lcom/google/zxing/oned/EANManufacturerOrgSupport;
    throw v0

    :array_0
    .array-data 4
        0x1e
        0x27
    .end array-data

    :array_1
    .array-data 4
        0x3c
        0x8b
    .end array-data

    :array_2
    .array-data 4
        0x12c
        0x17b
    .end array-data

    :array_3
    .array-data 4
        0x190
        0x1b8
    .end array-data

    :array_4
    .array-data 4
        0x1c2
        0x1cb
    .end array-data

    :array_5
    .array-data 4
        0x1cc
        0x1d5
    .end array-data

    :array_6
    .array-data 4
        0x1ea
        0x1f3
    .end array-data

    :array_7
    .array-data 4
        0x1f4
        0x1fd
    .end array-data

    :array_8
    .array-data 4
        0x21c
        0x225
    .end array-data

    :array_9
    .array-data 4
        0x23a
        0x243
    .end array-data

    :array_a
    .array-data 4
        0x258
        0x259
    .end array-data

    :array_b
    .array-data 4
        0x280
        0x289
    .end array-data

    :array_c
    .array-data 4
        0x2b2
        0x2b7
    .end array-data

    :array_d
    .array-data 4
        0x2bc
        0x2c5
    .end array-data

    :array_e
    .array-data 4
        0x2da
        0x2e3
    .end array-data

    :array_f
    .array-data 4
        0x2f2
        0x2f3
    .end array-data

    :array_10
    .array-data 4
        0x2f8
        0x301
    .end array-data

    :array_11
    .array-data 4
        0x315
        0x316
    .end array-data

    :array_12
    .array-data 4
        0x320
        0x347
    .end array-data

    :array_13
    .array-data 4
        0x348
        0x351
    .end array-data

    :array_14
    .array-data 4
        0x364
        0x365
    .end array-data

    :array_15
    .array-data 4
        0x366
        0x36f
    .end array-data

    :array_16
    .array-data 4
        0x384
        0x397
    .end array-data

    :array_17
    .array-data 4
        0x3a2
        0x3ab
    .end array-data

    :array_18
    .array-data 4
        0x3ac
        0x3b5
    .end array-data
.end method


# virtual methods
.method lookupCountryIdentifier(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p1, "productCode"    # Ljava/lang/String;

    .line 37
    invoke-direct {p0}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->initIfNeeded()V

    .line 38
    const/4 v0, 0x0

    const/4 v1, 0x3

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 39
    .local v1, "prefix":I
    iget-object v2, p0, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->ranges:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    .line 40
    .local v2, "max":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    const/4 v4, 0x0

    if-lt v3, v2, :cond_0

    .line 51
    .end local v3    # "i":I
    return-object v4

    .line 41
    .restart local v3    # "i":I
    :cond_0
    iget-object v5, p0, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->ranges:Ljava/util/List;

    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [I

    .line 42
    .local v5, "range":[I
    aget v6, v5, v0

    .line 43
    .local v6, "start":I
    if-ge v1, v6, :cond_1

    .line 44
    return-object v4

    .line 46
    :cond_1
    array-length v4, v5

    const/4 v7, 0x1

    if-ne v4, v7, :cond_2

    move v4, v6

    goto :goto_1

    :cond_2
    aget v4, v5, v7

    .line 47
    .local v4, "end":I
    :goto_1
    if-gt v1, v4, :cond_3

    .line 48
    iget-object v0, p0, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->countryIdentifiers:Ljava/util/List;

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0

    .line 40
    .end local v4    # "end":I
    .end local v5    # "range":[I
    .end local v6    # "start":I
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method
