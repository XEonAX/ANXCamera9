.class public final Lcom/google/zxing/oned/Code128Reader;
.super Lcom/google/zxing/oned/OneDReader;
.source "Code128Reader.java"


# static fields
.field private static final CODE_CODE_A:I = 0x65

.field private static final CODE_CODE_B:I = 0x64

.field private static final CODE_CODE_C:I = 0x63

.field private static final CODE_FNC_1:I = 0x66

.field private static final CODE_FNC_2:I = 0x61

.field private static final CODE_FNC_3:I = 0x60

.field private static final CODE_FNC_4_A:I = 0x65

.field private static final CODE_FNC_4_B:I = 0x64

.field static final CODE_PATTERNS:[[I

.field private static final CODE_SHIFT:I = 0x62

.field private static final CODE_START_A:I = 0x67

.field private static final CODE_START_B:I = 0x68

.field private static final CODE_START_C:I = 0x69

.field private static final CODE_STOP:I = 0x6a

.field private static final MAX_AVG_VARIANCE:F = 0.25f

.field private static final MAX_INDIVIDUAL_VARIANCE:F = 0.7f


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .line 39
    const/16 v0, 0x6b

    new-array v0, v0, [[I

    .line 40
    const/4 v1, 0x6

    new-array v2, v1, [I

    fill-array-data v2, :array_3c2

    const/4 v3, 0x0

    aput-object v2, v0, v3

    .line 41
    new-array v2, v1, [I

    fill-array-data v2, :array_3d2

    const/4 v3, 0x1

    aput-object v2, v0, v3

    .line 42
    new-array v2, v1, [I

    fill-array-data v2, :array_3e2

    const/4 v3, 0x2

    aput-object v2, v0, v3

    .line 43
    new-array v2, v1, [I

    fill-array-data v2, :array_3f2

    const/4 v3, 0x3

    aput-object v2, v0, v3

    .line 44
    new-array v2, v1, [I

    fill-array-data v2, :array_402

    const/4 v3, 0x4

    aput-object v2, v0, v3

    .line 45
    new-array v2, v1, [I

    fill-array-data v2, :array_412

    const/4 v3, 0x5

    aput-object v2, v0, v3

    .line 46
    new-array v2, v1, [I

    fill-array-data v2, :array_422

    aput-object v2, v0, v1

    .line 47
    new-array v2, v1, [I

    fill-array-data v2, :array_432

    const/4 v3, 0x7

    aput-object v2, v0, v3

    .line 48
    new-array v2, v1, [I

    fill-array-data v2, :array_442

    const/16 v4, 0x8

    aput-object v2, v0, v4

    .line 49
    new-array v2, v1, [I

    fill-array-data v2, :array_452

    const/16 v4, 0x9

    aput-object v2, v0, v4

    .line 50
    new-array v2, v1, [I

    fill-array-data v2, :array_462

    const/16 v4, 0xa

    aput-object v2, v0, v4

    .line 51
    new-array v2, v1, [I

    fill-array-data v2, :array_472

    const/16 v4, 0xb

    aput-object v2, v0, v4

    .line 52
    new-array v2, v1, [I

    fill-array-data v2, :array_482

    const/16 v4, 0xc

    aput-object v2, v0, v4

    .line 53
    new-array v2, v1, [I

    fill-array-data v2, :array_492

    const/16 v4, 0xd

    aput-object v2, v0, v4

    .line 54
    new-array v2, v1, [I

    fill-array-data v2, :array_4a2

    const/16 v4, 0xe

    aput-object v2, v0, v4

    .line 55
    new-array v2, v1, [I

    fill-array-data v2, :array_4b2

    const/16 v4, 0xf

    aput-object v2, v0, v4

    .line 56
    new-array v2, v1, [I

    fill-array-data v2, :array_4c2

    const/16 v4, 0x10

    aput-object v2, v0, v4

    .line 57
    new-array v2, v1, [I

    fill-array-data v2, :array_4d2

    const/16 v4, 0x11

    aput-object v2, v0, v4

    .line 58
    new-array v2, v1, [I

    fill-array-data v2, :array_4e2

    const/16 v4, 0x12

    aput-object v2, v0, v4

    .line 59
    new-array v2, v1, [I

    fill-array-data v2, :array_4f2

    const/16 v4, 0x13

    aput-object v2, v0, v4

    .line 60
    new-array v2, v1, [I

    fill-array-data v2, :array_502

    const/16 v4, 0x14

    aput-object v2, v0, v4

    .line 61
    new-array v2, v1, [I

    fill-array-data v2, :array_512

    const/16 v4, 0x15

    aput-object v2, v0, v4

    .line 62
    new-array v2, v1, [I

    fill-array-data v2, :array_522

    const/16 v4, 0x16

    aput-object v2, v0, v4

    .line 63
    new-array v2, v1, [I

    fill-array-data v2, :array_532

    const/16 v4, 0x17

    aput-object v2, v0, v4

    .line 64
    new-array v2, v1, [I

    fill-array-data v2, :array_542

    const/16 v4, 0x18

    aput-object v2, v0, v4

    .line 65
    new-array v2, v1, [I

    fill-array-data v2, :array_552

    const/16 v4, 0x19

    aput-object v2, v0, v4

    .line 66
    new-array v2, v1, [I

    fill-array-data v2, :array_562

    const/16 v4, 0x1a

    aput-object v2, v0, v4

    .line 67
    new-array v2, v1, [I

    fill-array-data v2, :array_572

    const/16 v4, 0x1b

    aput-object v2, v0, v4

    .line 68
    new-array v2, v1, [I

    fill-array-data v2, :array_582

    const/16 v4, 0x1c

    aput-object v2, v0, v4

    .line 69
    new-array v2, v1, [I

    fill-array-data v2, :array_592

    const/16 v4, 0x1d

    aput-object v2, v0, v4

    .line 70
    new-array v2, v1, [I

    fill-array-data v2, :array_5a2

    const/16 v4, 0x1e

    aput-object v2, v0, v4

    .line 71
    new-array v2, v1, [I

    fill-array-data v2, :array_5b2

    const/16 v4, 0x1f

    aput-object v2, v0, v4

    .line 72
    new-array v2, v1, [I

    fill-array-data v2, :array_5c2

    const/16 v4, 0x20

    aput-object v2, v0, v4

    .line 73
    new-array v2, v1, [I

    fill-array-data v2, :array_5d2

    const/16 v4, 0x21

    aput-object v2, v0, v4

    .line 74
    new-array v2, v1, [I

    fill-array-data v2, :array_5e2

    const/16 v4, 0x22

    aput-object v2, v0, v4

    .line 75
    new-array v2, v1, [I

    fill-array-data v2, :array_5f2

    const/16 v4, 0x23

    aput-object v2, v0, v4

    .line 76
    new-array v2, v1, [I

    fill-array-data v2, :array_602

    const/16 v4, 0x24

    aput-object v2, v0, v4

    .line 77
    new-array v2, v1, [I

    fill-array-data v2, :array_612

    const/16 v4, 0x25

    aput-object v2, v0, v4

    .line 78
    new-array v2, v1, [I

    fill-array-data v2, :array_622

    const/16 v4, 0x26

    aput-object v2, v0, v4

    .line 79
    new-array v2, v1, [I

    fill-array-data v2, :array_632

    const/16 v4, 0x27

    aput-object v2, v0, v4

    .line 80
    new-array v2, v1, [I

    fill-array-data v2, :array_642

    const/16 v4, 0x28

    aput-object v2, v0, v4

    .line 81
    new-array v2, v1, [I

    fill-array-data v2, :array_652

    const/16 v4, 0x29

    aput-object v2, v0, v4

    .line 82
    new-array v2, v1, [I

    fill-array-data v2, :array_662

    const/16 v4, 0x2a

    aput-object v2, v0, v4

    .line 83
    new-array v2, v1, [I

    fill-array-data v2, :array_672

    const/16 v4, 0x2b

    aput-object v2, v0, v4

    .line 84
    new-array v2, v1, [I

    fill-array-data v2, :array_682

    const/16 v4, 0x2c

    aput-object v2, v0, v4

    .line 85
    new-array v2, v1, [I

    fill-array-data v2, :array_692

    const/16 v4, 0x2d

    aput-object v2, v0, v4

    .line 86
    new-array v2, v1, [I

    fill-array-data v2, :array_6a2

    const/16 v4, 0x2e

    aput-object v2, v0, v4

    .line 87
    new-array v2, v1, [I

    fill-array-data v2, :array_6b2

    const/16 v4, 0x2f

    aput-object v2, v0, v4

    .line 88
    new-array v2, v1, [I

    fill-array-data v2, :array_6c2

    const/16 v4, 0x30

    aput-object v2, v0, v4

    .line 89
    new-array v2, v1, [I

    fill-array-data v2, :array_6d2

    const/16 v4, 0x31

    aput-object v2, v0, v4

    .line 90
    new-array v2, v1, [I

    fill-array-data v2, :array_6e2

    const/16 v4, 0x32

    aput-object v2, v0, v4

    .line 91
    new-array v2, v1, [I

    fill-array-data v2, :array_6f2

    const/16 v4, 0x33

    aput-object v2, v0, v4

    .line 92
    new-array v2, v1, [I

    fill-array-data v2, :array_702

    const/16 v4, 0x34

    aput-object v2, v0, v4

    .line 93
    new-array v2, v1, [I

    fill-array-data v2, :array_712

    const/16 v4, 0x35

    aput-object v2, v0, v4

    .line 94
    new-array v2, v1, [I

    fill-array-data v2, :array_722

    const/16 v4, 0x36

    aput-object v2, v0, v4

    .line 95
    new-array v2, v1, [I

    fill-array-data v2, :array_732

    const/16 v4, 0x37

    aput-object v2, v0, v4

    .line 96
    new-array v2, v1, [I

    fill-array-data v2, :array_742

    const/16 v4, 0x38

    aput-object v2, v0, v4

    .line 97
    new-array v2, v1, [I

    fill-array-data v2, :array_752

    const/16 v4, 0x39

    aput-object v2, v0, v4

    .line 98
    new-array v2, v1, [I

    fill-array-data v2, :array_762

    const/16 v4, 0x3a

    aput-object v2, v0, v4

    .line 99
    new-array v2, v1, [I

    fill-array-data v2, :array_772

    const/16 v4, 0x3b

    aput-object v2, v0, v4

    .line 100
    new-array v2, v1, [I

    fill-array-data v2, :array_782

    const/16 v4, 0x3c

    aput-object v2, v0, v4

    .line 101
    new-array v2, v1, [I

    fill-array-data v2, :array_792

    const/16 v4, 0x3d

    aput-object v2, v0, v4

    .line 102
    new-array v2, v1, [I

    fill-array-data v2, :array_7a2

    const/16 v4, 0x3e

    aput-object v2, v0, v4

    .line 103
    new-array v2, v1, [I

    fill-array-data v2, :array_7b2

    const/16 v4, 0x3f

    aput-object v2, v0, v4

    .line 104
    new-array v2, v1, [I

    fill-array-data v2, :array_7c2

    const/16 v4, 0x40

    aput-object v2, v0, v4

    .line 105
    new-array v2, v1, [I

    fill-array-data v2, :array_7d2

    const/16 v4, 0x41

    aput-object v2, v0, v4

    .line 106
    new-array v2, v1, [I

    fill-array-data v2, :array_7e2

    const/16 v4, 0x42

    aput-object v2, v0, v4

    .line 107
    new-array v2, v1, [I

    fill-array-data v2, :array_7f2

    const/16 v4, 0x43

    aput-object v2, v0, v4

    .line 108
    new-array v2, v1, [I

    fill-array-data v2, :array_802

    const/16 v4, 0x44

    aput-object v2, v0, v4

    .line 109
    new-array v2, v1, [I

    fill-array-data v2, :array_812

    const/16 v4, 0x45

    aput-object v2, v0, v4

    .line 110
    new-array v2, v1, [I

    fill-array-data v2, :array_822

    const/16 v4, 0x46

    aput-object v2, v0, v4

    .line 111
    new-array v2, v1, [I

    fill-array-data v2, :array_832

    const/16 v4, 0x47

    aput-object v2, v0, v4

    .line 112
    new-array v2, v1, [I

    fill-array-data v2, :array_842

    const/16 v4, 0x48

    aput-object v2, v0, v4

    .line 113
    new-array v2, v1, [I

    fill-array-data v2, :array_852

    const/16 v4, 0x49

    aput-object v2, v0, v4

    .line 114
    new-array v2, v1, [I

    fill-array-data v2, :array_862

    const/16 v4, 0x4a

    aput-object v2, v0, v4

    .line 115
    new-array v2, v1, [I

    fill-array-data v2, :array_872

    const/16 v4, 0x4b

    aput-object v2, v0, v4

    .line 116
    new-array v2, v1, [I

    fill-array-data v2, :array_882

    const/16 v4, 0x4c

    aput-object v2, v0, v4

    .line 117
    new-array v2, v1, [I

    fill-array-data v2, :array_892

    const/16 v4, 0x4d

    aput-object v2, v0, v4

    .line 118
    new-array v2, v1, [I

    fill-array-data v2, :array_8a2

    const/16 v4, 0x4e

    aput-object v2, v0, v4

    .line 119
    new-array v2, v1, [I

    fill-array-data v2, :array_8b2

    const/16 v4, 0x4f

    aput-object v2, v0, v4

    .line 120
    new-array v2, v1, [I

    fill-array-data v2, :array_8c2

    const/16 v4, 0x50

    aput-object v2, v0, v4

    .line 121
    new-array v2, v1, [I

    fill-array-data v2, :array_8d2

    const/16 v4, 0x51

    aput-object v2, v0, v4

    .line 122
    new-array v2, v1, [I

    fill-array-data v2, :array_8e2

    const/16 v4, 0x52

    aput-object v2, v0, v4

    .line 123
    new-array v2, v1, [I

    fill-array-data v2, :array_8f2

    const/16 v4, 0x53

    aput-object v2, v0, v4

    .line 124
    new-array v2, v1, [I

    fill-array-data v2, :array_902

    const/16 v4, 0x54

    aput-object v2, v0, v4

    .line 125
    new-array v2, v1, [I

    fill-array-data v2, :array_912

    const/16 v4, 0x55

    aput-object v2, v0, v4

    .line 126
    new-array v2, v1, [I

    fill-array-data v2, :array_922

    const/16 v4, 0x56

    aput-object v2, v0, v4

    .line 127
    new-array v2, v1, [I

    fill-array-data v2, :array_932

    const/16 v4, 0x57

    aput-object v2, v0, v4

    .line 128
    new-array v2, v1, [I

    fill-array-data v2, :array_942

    const/16 v4, 0x58

    aput-object v2, v0, v4

    .line 129
    new-array v2, v1, [I

    fill-array-data v2, :array_952

    const/16 v4, 0x59

    aput-object v2, v0, v4

    .line 130
    new-array v2, v1, [I

    fill-array-data v2, :array_962

    const/16 v4, 0x5a

    aput-object v2, v0, v4

    .line 131
    new-array v2, v1, [I

    fill-array-data v2, :array_972

    const/16 v4, 0x5b

    aput-object v2, v0, v4

    .line 132
    new-array v2, v1, [I

    fill-array-data v2, :array_982

    const/16 v4, 0x5c

    aput-object v2, v0, v4

    .line 133
    new-array v2, v1, [I

    fill-array-data v2, :array_992

    const/16 v4, 0x5d

    aput-object v2, v0, v4

    .line 134
    new-array v2, v1, [I

    fill-array-data v2, :array_9a2

    const/16 v4, 0x5e

    aput-object v2, v0, v4

    .line 135
    new-array v2, v1, [I

    fill-array-data v2, :array_9b2

    const/16 v4, 0x5f

    aput-object v2, v0, v4

    .line 136
    new-array v2, v1, [I

    fill-array-data v2, :array_9c2

    const/16 v4, 0x60

    aput-object v2, v0, v4

    .line 137
    new-array v2, v1, [I

    fill-array-data v2, :array_9d2

    const/16 v4, 0x61

    aput-object v2, v0, v4

    .line 138
    new-array v2, v1, [I

    fill-array-data v2, :array_9e2

    const/16 v4, 0x62

    aput-object v2, v0, v4

    .line 139
    new-array v2, v1, [I

    fill-array-data v2, :array_9f2

    const/16 v4, 0x63

    aput-object v2, v0, v4

    .line 140
    new-array v2, v1, [I

    fill-array-data v2, :array_a02

    const/16 v4, 0x64

    aput-object v2, v0, v4

    .line 141
    new-array v2, v1, [I

    fill-array-data v2, :array_a12

    const/16 v4, 0x65

    aput-object v2, v0, v4

    .line 142
    new-array v2, v1, [I

    fill-array-data v2, :array_a22

    const/16 v4, 0x66

    aput-object v2, v0, v4

    .line 143
    new-array v2, v1, [I

    fill-array-data v2, :array_a32

    const/16 v4, 0x67

    aput-object v2, v0, v4

    .line 144
    new-array v2, v1, [I

    fill-array-data v2, :array_a42

    const/16 v4, 0x68

    aput-object v2, v0, v4

    .line 145
    new-array v1, v1, [I

    fill-array-data v1, :array_a52

    const/16 v2, 0x69

    aput-object v1, v0, v2

    .line 146
    new-array v1, v3, [I

    fill-array-data v1, :array_a62

    const/16 v2, 0x6a

    aput-object v1, v0, v2

    .line 39
    sput-object v0, Lcom/google/zxing/oned/Code128Reader;->CODE_PATTERNS:[[I

    .line 167
    return-void

    :array_3c2
    .array-data 4
        0x2
        0x1
        0x2
        0x2
        0x2
        0x2
    .end array-data

    :array_3d2
    .array-data 4
        0x2
        0x2
        0x2
        0x1
        0x2
        0x2
    .end array-data

    :array_3e2
    .array-data 4
        0x2
        0x2
        0x2
        0x2
        0x2
        0x1
    .end array-data

    :array_3f2
    .array-data 4
        0x1
        0x2
        0x1
        0x2
        0x2
        0x3
    .end array-data

    :array_402
    .array-data 4
        0x1
        0x2
        0x1
        0x3
        0x2
        0x2
    .end array-data

    :array_412
    .array-data 4
        0x1
        0x3
        0x1
        0x2
        0x2
        0x2
    .end array-data

    :array_422
    .array-data 4
        0x1
        0x2
        0x2
        0x2
        0x1
        0x3
    .end array-data

    :array_432
    .array-data 4
        0x1
        0x2
        0x2
        0x3
        0x1
        0x2
    .end array-data

    :array_442
    .array-data 4
        0x1
        0x3
        0x2
        0x2
        0x1
        0x2
    .end array-data

    :array_452
    .array-data 4
        0x2
        0x2
        0x1
        0x2
        0x1
        0x3
    .end array-data

    :array_462
    .array-data 4
        0x2
        0x2
        0x1
        0x3
        0x1
        0x2
    .end array-data

    :array_472
    .array-data 4
        0x2
        0x3
        0x1
        0x2
        0x1
        0x2
    .end array-data

    :array_482
    .array-data 4
        0x1
        0x1
        0x2
        0x2
        0x3
        0x2
    .end array-data

    :array_492
    .array-data 4
        0x1
        0x2
        0x2
        0x1
        0x3
        0x2
    .end array-data

    :array_4a2
    .array-data 4
        0x1
        0x2
        0x2
        0x2
        0x3
        0x1
    .end array-data

    :array_4b2
    .array-data 4
        0x1
        0x1
        0x3
        0x2
        0x2
        0x2
    .end array-data

    :array_4c2
    .array-data 4
        0x1
        0x2
        0x3
        0x1
        0x2
        0x2
    .end array-data

    :array_4d2
    .array-data 4
        0x1
        0x2
        0x3
        0x2
        0x2
        0x1
    .end array-data

    :array_4e2
    .array-data 4
        0x2
        0x2
        0x3
        0x2
        0x1
        0x1
    .end array-data

    :array_4f2
    .array-data 4
        0x2
        0x2
        0x1
        0x1
        0x3
        0x2
    .end array-data

    :array_502
    .array-data 4
        0x2
        0x2
        0x1
        0x2
        0x3
        0x1
    .end array-data

    :array_512
    .array-data 4
        0x2
        0x1
        0x3
        0x2
        0x1
        0x2
    .end array-data

    :array_522
    .array-data 4
        0x2
        0x2
        0x3
        0x1
        0x1
        0x2
    .end array-data

    :array_532
    .array-data 4
        0x3
        0x1
        0x2
        0x1
        0x3
        0x1
    .end array-data

    :array_542
    .array-data 4
        0x3
        0x1
        0x1
        0x2
        0x2
        0x2
    .end array-data

    :array_552
    .array-data 4
        0x3
        0x2
        0x1
        0x1
        0x2
        0x2
    .end array-data

    :array_562
    .array-data 4
        0x3
        0x2
        0x1
        0x2
        0x2
        0x1
    .end array-data

    :array_572
    .array-data 4
        0x3
        0x1
        0x2
        0x2
        0x1
        0x2
    .end array-data

    :array_582
    .array-data 4
        0x3
        0x2
        0x2
        0x1
        0x1
        0x2
    .end array-data

    :array_592
    .array-data 4
        0x3
        0x2
        0x2
        0x2
        0x1
        0x1
    .end array-data

    :array_5a2
    .array-data 4
        0x2
        0x1
        0x2
        0x1
        0x2
        0x3
    .end array-data

    :array_5b2
    .array-data 4
        0x2
        0x1
        0x2
        0x3
        0x2
        0x1
    .end array-data

    :array_5c2
    .array-data 4
        0x2
        0x3
        0x2
        0x1
        0x2
        0x1
    .end array-data

    :array_5d2
    .array-data 4
        0x1
        0x1
        0x1
        0x3
        0x2
        0x3
    .end array-data

    :array_5e2
    .array-data 4
        0x1
        0x3
        0x1
        0x1
        0x2
        0x3
    .end array-data

    :array_5f2
    .array-data 4
        0x1
        0x3
        0x1
        0x3
        0x2
        0x1
    .end array-data

    :array_602
    .array-data 4
        0x1
        0x1
        0x2
        0x3
        0x1
        0x3
    .end array-data

    :array_612
    .array-data 4
        0x1
        0x3
        0x2
        0x1
        0x1
        0x3
    .end array-data

    :array_622
    .array-data 4
        0x1
        0x3
        0x2
        0x3
        0x1
        0x1
    .end array-data

    :array_632
    .array-data 4
        0x2
        0x1
        0x1
        0x3
        0x1
        0x3
    .end array-data

    :array_642
    .array-data 4
        0x2
        0x3
        0x1
        0x1
        0x1
        0x3
    .end array-data

    :array_652
    .array-data 4
        0x2
        0x3
        0x1
        0x3
        0x1
        0x1
    .end array-data

    :array_662
    .array-data 4
        0x1
        0x1
        0x2
        0x1
        0x3
        0x3
    .end array-data

    :array_672
    .array-data 4
        0x1
        0x1
        0x2
        0x3
        0x3
        0x1
    .end array-data

    :array_682
    .array-data 4
        0x1
        0x3
        0x2
        0x1
        0x3
        0x1
    .end array-data

    :array_692
    .array-data 4
        0x1
        0x1
        0x3
        0x1
        0x2
        0x3
    .end array-data

    :array_6a2
    .array-data 4
        0x1
        0x1
        0x3
        0x3
        0x2
        0x1
    .end array-data

    :array_6b2
    .array-data 4
        0x1
        0x3
        0x3
        0x1
        0x2
        0x1
    .end array-data

    :array_6c2
    .array-data 4
        0x3
        0x1
        0x3
        0x1
        0x2
        0x1
    .end array-data

    :array_6d2
    .array-data 4
        0x2
        0x1
        0x1
        0x3
        0x3
        0x1
    .end array-data

    :array_6e2
    .array-data 4
        0x2
        0x3
        0x1
        0x1
        0x3
        0x1
    .end array-data

    :array_6f2
    .array-data 4
        0x2
        0x1
        0x3
        0x1
        0x1
        0x3
    .end array-data

    :array_702
    .array-data 4
        0x2
        0x1
        0x3
        0x3
        0x1
        0x1
    .end array-data

    :array_712
    .array-data 4
        0x2
        0x1
        0x3
        0x1
        0x3
        0x1
    .end array-data

    :array_722
    .array-data 4
        0x3
        0x1
        0x1
        0x1
        0x2
        0x3
    .end array-data

    :array_732
    .array-data 4
        0x3
        0x1
        0x1
        0x3
        0x2
        0x1
    .end array-data

    :array_742
    .array-data 4
        0x3
        0x3
        0x1
        0x1
        0x2
        0x1
    .end array-data

    :array_752
    .array-data 4
        0x3
        0x1
        0x2
        0x1
        0x1
        0x3
    .end array-data

    :array_762
    .array-data 4
        0x3
        0x1
        0x2
        0x3
        0x1
        0x1
    .end array-data

    :array_772
    .array-data 4
        0x3
        0x3
        0x2
        0x1
        0x1
        0x1
    .end array-data

    :array_782
    .array-data 4
        0x3
        0x1
        0x4
        0x1
        0x1
        0x1
    .end array-data

    :array_792
    .array-data 4
        0x2
        0x2
        0x1
        0x4
        0x1
        0x1
    .end array-data

    :array_7a2
    .array-data 4
        0x4
        0x3
        0x1
        0x1
        0x1
        0x1
    .end array-data

    :array_7b2
    .array-data 4
        0x1
        0x1
        0x1
        0x2
        0x2
        0x4
    .end array-data

    :array_7c2
    .array-data 4
        0x1
        0x1
        0x1
        0x4
        0x2
        0x2
    .end array-data

    :array_7d2
    .array-data 4
        0x1
        0x2
        0x1
        0x1
        0x2
        0x4
    .end array-data

    :array_7e2
    .array-data 4
        0x1
        0x2
        0x1
        0x4
        0x2
        0x1
    .end array-data

    :array_7f2
    .array-data 4
        0x1
        0x4
        0x1
        0x1
        0x2
        0x2
    .end array-data

    :array_802
    .array-data 4
        0x1
        0x4
        0x1
        0x2
        0x2
        0x1
    .end array-data

    :array_812
    .array-data 4
        0x1
        0x1
        0x2
        0x2
        0x1
        0x4
    .end array-data

    :array_822
    .array-data 4
        0x1
        0x1
        0x2
        0x4
        0x1
        0x2
    .end array-data

    :array_832
    .array-data 4
        0x1
        0x2
        0x2
        0x1
        0x1
        0x4
    .end array-data

    :array_842
    .array-data 4
        0x1
        0x2
        0x2
        0x4
        0x1
        0x1
    .end array-data

    :array_852
    .array-data 4
        0x1
        0x4
        0x2
        0x1
        0x1
        0x2
    .end array-data

    :array_862
    .array-data 4
        0x1
        0x4
        0x2
        0x2
        0x1
        0x1
    .end array-data

    :array_872
    .array-data 4
        0x2
        0x4
        0x1
        0x2
        0x1
        0x1
    .end array-data

    :array_882
    .array-data 4
        0x2
        0x2
        0x1
        0x1
        0x1
        0x4
    .end array-data

    :array_892
    .array-data 4
        0x4
        0x1
        0x3
        0x1
        0x1
        0x1
    .end array-data

    :array_8a2
    .array-data 4
        0x2
        0x4
        0x1
        0x1
        0x1
        0x2
    .end array-data

    :array_8b2
    .array-data 4
        0x1
        0x3
        0x4
        0x1
        0x1
        0x1
    .end array-data

    :array_8c2
    .array-data 4
        0x1
        0x1
        0x1
        0x2
        0x4
        0x2
    .end array-data

    :array_8d2
    .array-data 4
        0x1
        0x2
        0x1
        0x1
        0x4
        0x2
    .end array-data

    :array_8e2
    .array-data 4
        0x1
        0x2
        0x1
        0x2
        0x4
        0x1
    .end array-data

    :array_8f2
    .array-data 4
        0x1
        0x1
        0x4
        0x2
        0x1
        0x2
    .end array-data

    :array_902
    .array-data 4
        0x1
        0x2
        0x4
        0x1
        0x1
        0x2
    .end array-data

    :array_912
    .array-data 4
        0x1
        0x2
        0x4
        0x2
        0x1
        0x1
    .end array-data

    :array_922
    .array-data 4
        0x4
        0x1
        0x1
        0x2
        0x1
        0x2
    .end array-data

    :array_932
    .array-data 4
        0x4
        0x2
        0x1
        0x1
        0x1
        0x2
    .end array-data

    :array_942
    .array-data 4
        0x4
        0x2
        0x1
        0x2
        0x1
        0x1
    .end array-data

    :array_952
    .array-data 4
        0x2
        0x1
        0x2
        0x1
        0x4
        0x1
    .end array-data

    :array_962
    .array-data 4
        0x2
        0x1
        0x4
        0x1
        0x2
        0x1
    .end array-data

    :array_972
    .array-data 4
        0x4
        0x1
        0x2
        0x1
        0x2
        0x1
    .end array-data

    :array_982
    .array-data 4
        0x1
        0x1
        0x1
        0x1
        0x4
        0x3
    .end array-data

    :array_992
    .array-data 4
        0x1
        0x1
        0x1
        0x3
        0x4
        0x1
    .end array-data

    :array_9a2
    .array-data 4
        0x1
        0x3
        0x1
        0x1
        0x4
        0x1
    .end array-data

    :array_9b2
    .array-data 4
        0x1
        0x1
        0x4
        0x1
        0x1
        0x3
    .end array-data

    :array_9c2
    .array-data 4
        0x1
        0x1
        0x4
        0x3
        0x1
        0x1
    .end array-data

    :array_9d2
    .array-data 4
        0x4
        0x1
        0x1
        0x1
        0x1
        0x3
    .end array-data

    :array_9e2
    .array-data 4
        0x4
        0x1
        0x1
        0x3
        0x1
        0x1
    .end array-data

    :array_9f2
    .array-data 4
        0x1
        0x1
        0x3
        0x1
        0x4
        0x1
    .end array-data

    :array_a02
    .array-data 4
        0x1
        0x1
        0x4
        0x1
        0x3
        0x1
    .end array-data

    :array_a12
    .array-data 4
        0x3
        0x1
        0x1
        0x1
        0x4
        0x1
    .end array-data

    :array_a22
    .array-data 4
        0x4
        0x1
        0x1
        0x1
        0x3
        0x1
    .end array-data

    :array_a32
    .array-data 4
        0x2
        0x1
        0x1
        0x4
        0x1
        0x2
    .end array-data

    :array_a42
    .array-data 4
        0x2
        0x1
        0x1
        0x2
        0x1
        0x4
    .end array-data

    :array_a52
    .array-data 4
        0x2
        0x1
        0x1
        0x2
        0x3
        0x2
    .end array-data

    :array_a62
    .array-data 4
        0x2
        0x3
        0x3
        0x1
        0x1
        0x1
        0x2
    .end array-data
.end method

.method public constructor <init>()V
    .registers 1

    .line 37
    invoke-direct {p0}, Lcom/google/zxing/oned/OneDReader;-><init>()V

    return-void
.end method

.method private static decodeCode(Lcom/google/zxing/common/BitArray;[II)I
    .registers 9
    .param p0, "row"    # Lcom/google/zxing/common/BitArray;
    .param p1, "counters"    # [I
    .param p2, "rowOffset"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 216
    invoke-static {p0, p2, p1}, Lcom/google/zxing/oned/Code128Reader;->recordPattern(Lcom/google/zxing/common/BitArray;I[I)V

    .line 217
    const/high16 v0, 0x3e800000    # 0.25f

    .line 218
    .local v0, "bestVariance":F
    const/4 v1, -0x1

    .line 219
    .local v1, "bestMatch":I
    const/4 v2, 0x0

    .local v2, "d":I
    :goto_7
    sget-object v3, Lcom/google/zxing/oned/Code128Reader;->CODE_PATTERNS:[[I

    array-length v3, v3

    if-lt v2, v3, :cond_14

    .line 228
    .end local v2    # "d":I
    if-ltz v1, :cond_f

    .line 229
    return v1

    .line 231
    :cond_f
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v2

    throw v2

    .line 220
    .restart local v2    # "d":I
    :cond_14
    sget-object v3, Lcom/google/zxing/oned/Code128Reader;->CODE_PATTERNS:[[I

    aget-object v3, v3, v2

    .line 221
    .local v3, "pattern":[I
    const v4, 0x3f333333    # 0.7f

    invoke-static {p1, v3, v4}, Lcom/google/zxing/oned/Code128Reader;->patternMatchVariance([I[IF)F

    move-result v4

    .line 222
    .local v4, "variance":F
    cmpg-float v5, v4, v0

    if-gez v5, :cond_25

    .line 223
    move v0, v4

    .line 224
    move v1, v2

    .line 219
    .end local v3    # "pattern":[I
    .end local v4    # "variance":F
    :cond_25
    add-int/lit8 v2, v2, 0x1

    goto :goto_7
.end method

.method private static findStartPattern(Lcom/google/zxing/common/BitArray;)[I
    .registers 16
    .param p0, "row"    # Lcom/google/zxing/common/BitArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 170
    invoke-virtual {p0}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v0

    .line 171
    .local v0, "width":I
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/google/zxing/common/BitArray;->getNextSet(I)I

    move-result v2

    .line 173
    .local v2, "rowOffset":I
    const/4 v3, 0x0

    .line 174
    .local v3, "counterPosition":I
    const/4 v4, 0x6

    new-array v4, v4, [I

    .line 175
    .local v4, "counters":[I
    move v5, v2

    .line 176
    .local v5, "patternStart":I
    const/4 v6, 0x0

    .line 177
    .local v6, "isWhite":Z
    array-length v7, v4

    .line 179
    .local v7, "patternLength":I
    move v8, v2

    .local v8, "i":I
    :goto_11
    if-ge v8, v0, :cond_80

    .line 180
    invoke-virtual {p0, v8}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v9

    xor-int/2addr v9, v6

    const/4 v10, 0x1

    if-eqz v9, :cond_21

    .line 181
    aget v9, v4, v3

    add-int/2addr v9, v10

    aput v9, v4, v3

    .line 182
    goto :goto_7d

    .line 183
    :cond_21
    add-int/lit8 v9, v7, -0x1

    if-ne v3, v9, :cond_74

    .line 184
    const/high16 v9, 0x3e800000    # 0.25f

    .line 185
    .local v9, "bestVariance":F
    const/4 v11, -0x1

    .line 186
    .local v11, "bestMatch":I
    const/16 v12, 0x67

    .local v12, "startCode":I
    :goto_2a
    const/16 v13, 0x69

    if-le v12, v13, :cond_60

    .line 195
    .end local v12    # "startCode":I
    const/4 v12, 0x2

    if-ltz v11, :cond_4a

    .line 196
    sub-int v13, v8, v5

    div-int/2addr v13, v12

    sub-int v13, v5, v13

    invoke-static {v1, v13}, Ljava/lang/Math;->max(II)I

    move-result v13

    invoke-virtual {p0, v13, v5, v1}, Lcom/google/zxing/common/BitArray;->isRange(IIZ)Z

    move-result v13

    if-eqz v13, :cond_4a

    .line 197
    const/4 v13, 0x3

    new-array v13, v13, [I

    aput v5, v13, v1

    aput v8, v13, v10

    aput v11, v13, v12

    return-object v13

    .line 199
    :cond_4a
    aget v13, v4, v1

    aget v14, v4, v10

    add-int/2addr v13, v14

    add-int/2addr v5, v13

    .line 200
    add-int/lit8 v13, v7, -0x2

    invoke-static {v4, v12, v4, v1, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 201
    add-int/lit8 v12, v7, -0x2

    aput v1, v4, v12

    .line 202
    add-int/lit8 v12, v7, -0x1

    aput v1, v4, v12

    .line 203
    add-int/lit8 v3, v3, -0x1

    .line 204
    .end local v9    # "bestVariance":F
    .end local v11    # "bestMatch":I
    goto :goto_76

    .line 187
    .restart local v9    # "bestVariance":F
    .restart local v11    # "bestMatch":I
    .restart local v12    # "startCode":I
    :cond_60
    sget-object v13, Lcom/google/zxing/oned/Code128Reader;->CODE_PATTERNS:[[I

    aget-object v13, v13, v12

    .line 188
    const v14, 0x3f333333    # 0.7f

    .line 187
    invoke-static {v4, v13, v14}, Lcom/google/zxing/oned/Code128Reader;->patternMatchVariance([I[IF)F

    move-result v13

    .line 189
    .local v13, "variance":F
    cmpg-float v14, v13, v9

    if-gez v14, :cond_71

    .line 190
    move v9, v13

    .line 191
    move v11, v12

    .line 186
    .end local v13    # "variance":F
    :cond_71
    add-int/lit8 v12, v12, 0x1

    goto :goto_2a

    .line 205
    .end local v9    # "bestVariance":F
    .end local v11    # "bestMatch":I
    .end local v12    # "startCode":I
    :cond_74
    add-int/lit8 v3, v3, 0x1

    .line 207
    :goto_76
    aput v10, v4, v3

    .line 208
    if-eqz v6, :cond_7c

    move v10, v1

    nop

    :cond_7c
    move v6, v10

    .line 179
    :goto_7d
    add-int/lit8 v8, v8, 0x1

    goto :goto_11

    .line 211
    .end local v8    # "i":I
    :cond_80
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1
.end method


# virtual methods
.method public decodeRow(ILcom/google/zxing/common/BitArray;Ljava/util/Map;)Lcom/google/zxing/Result;
    .registers 41
    .param p1, "rowNumber"    # I
    .param p2, "row"    # Lcom/google/zxing/common/BitArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/google/zxing/common/BitArray;",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)",
            "Lcom/google/zxing/Result;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/FormatException;,
            Lcom/google/zxing/ChecksumException;
        }
    .end annotation

    .local p3, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;*>;"
    move/from16 v0, p1

    move-object/from16 v1, p2

    .line 239
    move-object/from16 v2, p3

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_14

    sget-object v5, Lcom/google/zxing/DecodeHintType;->ASSUME_GS1:Lcom/google/zxing/DecodeHintType;

    invoke-interface {v2, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_14

    move v5, v4

    goto :goto_15

    :cond_14
    move v5, v3

    .line 241
    .local v5, "convertFNC1":Z
    :goto_15
    invoke-static/range {p2 .. p2}, Lcom/google/zxing/oned/Code128Reader;->findStartPattern(Lcom/google/zxing/common/BitArray;)[I

    move-result-object v6

    .line 242
    .local v6, "startPatternInfo":[I
    const/4 v7, 0x2

    aget v8, v6, v7

    .line 244
    .local v8, "startCode":I
    new-instance v9, Ljava/util/ArrayList;

    const/16 v10, 0x14

    invoke-direct {v9, v10}, Ljava/util/ArrayList;-><init>(I)V

    .line 245
    .local v9, "rawCodes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Byte;>;"
    int-to-byte v11, v8

    invoke-static {v11}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v11

    invoke-interface {v9, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 248
    packed-switch v8, :pswitch_data_30a

    .line 259
    move-object/from16 v29, v6

    move/from16 v27, v8

    .end local v6    # "startPatternInfo":[I
    .end local v8    # "startCode":I
    .local v27, "startCode":I
    .local v29, "startPatternInfo":[I
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v2

    throw v2

    .line 256
    .end local v27    # "startCode":I
    .end local v29    # "startPatternInfo":[I
    .restart local v6    # "startPatternInfo":[I
    .restart local v8    # "startCode":I
    :pswitch_37
    const/16 v11, 0x63

    .line 257
    .local v11, "codeSet":I
    goto :goto_40

    .line 253
    .end local v11    # "codeSet":I
    :pswitch_3a
    const/16 v11, 0x64

    .line 254
    .restart local v11    # "codeSet":I
    goto :goto_40

    .line 250
    .end local v11    # "codeSet":I
    :pswitch_3d
    const/16 v11, 0x65

    .line 251
    .restart local v11    # "codeSet":I
    nop

    .line 259
    :goto_40
    nop

    .line 262
    const/4 v12, 0x0

    .line 263
    .local v12, "done":Z
    const/4 v13, 0x0

    .line 265
    .local v13, "isNextShifted":Z
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14, v10}, Ljava/lang/StringBuilder;-><init>(I)V

    move-object v10, v14

    .line 267
    .local v10, "result":Ljava/lang/StringBuilder;
    aget v14, v6, v3

    .line 268
    .local v14, "lastStart":I
    aget v15, v6, v4

    .line 269
    .local v15, "nextStart":I
    const/4 v4, 0x6

    new-array v4, v4, [I

    .line 271
    .local v4, "counters":[I
    const/16 v17, 0x0

    .line 272
    .local v17, "lastCode":I
    const/16 v18, 0x0

    .line 273
    .local v18, "code":I
    move/from16 v19, v8

    .line 274
    .local v19, "checksumTotal":I
    const/16 v20, 0x0

    .line 275
    .local v20, "multiplier":I
    const/16 v21, 0x1

    .line 276
    .local v21, "lastCharacterWasPrintable":Z
    const/16 v22, 0x0

    .line 277
    .local v22, "upperMode":Z
    const/16 v23, 0x0

    .line 279
    .local v23, "shiftUpperMode":Z
    move/from16 v24, v11

    move/from16 v11, v17

    move/from16 v25, v22

    move/from16 v26, v23

    .end local v17    # "lastCode":I
    .end local v22    # "upperMode":Z
    .end local v23    # "shiftUpperMode":Z
    .local v11, "lastCode":I
    .local v24, "codeSet":I
    .local v25, "upperMode":Z
    .local v26, "shiftUpperMode":Z
    :goto_66
    if-eqz v12, :cond_162

    .line 484
    sub-int v3, v15, v14

    .line 489
    .local v3, "lastPatternSize":I
    invoke-virtual {v1, v15}, Lcom/google/zxing/common/BitArray;->getNextUnset(I)I

    move-result v15

    .line 490
    nop

    .line 491
    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v2

    sub-int v17, v15, v14

    div-int/lit8 v17, v17, 0x2

    add-int v7, v15, v17

    invoke-static {v2, v7}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 492
    nop

    .line 490
    const/4 v7, 0x0

    invoke-virtual {v1, v15, v2, v7}, Lcom/google/zxing/common/BitArray;->isRange(IIZ)Z

    move-result v2

    .line 492
    if-eqz v2, :cond_14d

    .line 497
    mul-int v2, v20, v11

    sub-int v19, v19, v2

    .line 499
    rem-int/lit8 v2, v19, 0x67

    if-ne v2, v11, :cond_138

    .line 504
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    .line 505
    .local v2, "resultLength":I
    if-eqz v2, :cond_121

    .line 512
    if-lez v2, :cond_ab

    if-eqz v21, :cond_ab

    .line 513
    const/16 v7, 0x63

    move/from16 v27, v8

    move/from16 v8, v24

    if-ne v8, v7, :cond_a5

    .line 514
    .end local v24    # "codeSet":I
    .local v8, "codeSet":I
    .restart local v27    # "startCode":I
    add-int/lit8 v7, v2, -0x2

    invoke-virtual {v10, v7, v2}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 515
    goto :goto_af

    .line 516
    :cond_a5
    add-int/lit8 v7, v2, -0x1

    invoke-virtual {v10, v7, v2}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    goto :goto_af

    .line 520
    .end local v27    # "startCode":I
    .local v8, "startCode":I
    .restart local v24    # "codeSet":I
    :cond_ab
    move/from16 v27, v8

    move/from16 v8, v24

    .end local v24    # "codeSet":I
    .local v8, "codeSet":I
    .restart local v27    # "startCode":I
    :goto_af
    const/4 v7, 0x1

    aget v17, v6, v7

    const/4 v7, 0x0

    aget v22, v6, v7

    add-int v7, v17, v22

    int-to-float v7, v7

    const/high16 v17, 0x40000000    # 2.0f

    div-float v7, v7, v17

    .line 521
    .local v7, "left":F
    move/from16 v28, v2

    int-to-float v2, v14

    .end local v2    # "resultLength":I
    .local v28, "resultLength":I
    move-object/from16 v29, v6

    int-to-float v6, v3

    .end local v6    # "startPatternInfo":[I
    .restart local v29    # "startPatternInfo":[I
    div-float v6, v6, v17

    add-float/2addr v2, v6

    .line 523
    .local v2, "right":F
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v6

    .line 524
    .local v6, "rawCodesSize":I
    move/from16 v30, v3

    new-array v3, v6, [B

    .line 525
    .local v3, "rawBytes":[B
    .local v30, "lastPatternSize":I
    const/16 v17, 0x0

    .local v17, "i":I
    move/from16 v31, v11

    move/from16 v11, v17

    .end local v17    # "i":I
    .local v11, "i":I
    .local v31, "lastCode":I
    :goto_d3
    if-lt v11, v6, :cond_101

    .line 529
    .end local v11    # "i":I
    new-instance v11, Lcom/google/zxing/Result;

    .line 530
    move/from16 v32, v6

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 531
    .end local v6    # "rawCodesSize":I
    .local v32, "rawCodesSize":I
    nop

    .line 532
    move/from16 v33, v12

    const/4 v12, 0x2

    new-array v12, v12, [Lcom/google/zxing/ResultPoint;

    .line 533
    .end local v12    # "done":Z
    .local v33, "done":Z
    move/from16 v34, v14

    new-instance v14, Lcom/google/zxing/ResultPoint;

    .end local v14    # "lastStart":I
    .local v34, "lastStart":I
    move/from16 v35, v15

    int-to-float v15, v0

    .end local v15    # "nextStart":I
    .local v35, "nextStart":I
    invoke-direct {v14, v7, v15}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    const/16 v17, 0x0

    aput-object v14, v12, v17

    .line 534
    new-instance v14, Lcom/google/zxing/ResultPoint;

    int-to-float v15, v0

    invoke-direct {v14, v2, v15}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    const/16 v16, 0x1

    aput-object v14, v12, v16

    .line 535
    sget-object v14, Lcom/google/zxing/BarcodeFormat;->CODE_128:Lcom/google/zxing/BarcodeFormat;

    .line 529
    invoke-direct {v11, v6, v3, v12, v14}, Lcom/google/zxing/Result;-><init>(Ljava/lang/String;[B[Lcom/google/zxing/ResultPoint;Lcom/google/zxing/BarcodeFormat;)V

    return-object v11

    .line 526
    .end local v32    # "rawCodesSize":I
    .end local v33    # "done":Z
    .end local v34    # "lastStart":I
    .end local v35    # "nextStart":I
    .restart local v6    # "rawCodesSize":I
    .restart local v11    # "i":I
    .restart local v12    # "done":Z
    .restart local v14    # "lastStart":I
    .restart local v15    # "nextStart":I
    :cond_101
    move/from16 v32, v6

    move/from16 v33, v12

    move/from16 v34, v14

    move/from16 v35, v15

    const/4 v12, 0x2

    const/16 v16, 0x1

    const/16 v17, 0x0

    .end local v6    # "rawCodesSize":I
    .end local v12    # "done":Z
    .end local v14    # "lastStart":I
    .end local v15    # "nextStart":I
    .restart local v32    # "rawCodesSize":I
    .restart local v33    # "done":Z
    .restart local v34    # "lastStart":I
    .restart local v35    # "nextStart":I
    invoke-interface {v9, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Byte;

    invoke-virtual {v6}, Ljava/lang/Byte;->byteValue()B

    move-result v6

    aput-byte v6, v3, v11

    .line 525
    add-int/lit8 v11, v11, 0x1

    move/from16 v6, v32

    move/from16 v12, v33

    goto :goto_d3

    .line 507
    .end local v7    # "left":F
    .end local v27    # "startCode":I
    .end local v28    # "resultLength":I
    .end local v29    # "startPatternInfo":[I
    .end local v30    # "lastPatternSize":I
    .end local v31    # "lastCode":I
    .end local v32    # "rawCodesSize":I
    .end local v33    # "done":Z
    .end local v34    # "lastStart":I
    .end local v35    # "nextStart":I
    .local v2, "resultLength":I
    .local v3, "lastPatternSize":I
    .local v6, "startPatternInfo":[I
    .local v8, "startCode":I
    .local v11, "lastCode":I
    .restart local v12    # "done":Z
    .restart local v14    # "lastStart":I
    .restart local v15    # "nextStart":I
    .restart local v24    # "codeSet":I
    :cond_121
    move/from16 v28, v2

    move/from16 v30, v3

    move-object/from16 v29, v6

    move/from16 v27, v8

    move/from16 v31, v11

    move/from16 v33, v12

    move/from16 v34, v14

    move/from16 v35, v15

    move/from16 v8, v24

    .end local v2    # "resultLength":I
    .end local v3    # "lastPatternSize":I
    .end local v6    # "startPatternInfo":[I
    .end local v11    # "lastCode":I
    .end local v12    # "done":Z
    .end local v14    # "lastStart":I
    .end local v15    # "nextStart":I
    .end local v24    # "codeSet":I
    .local v8, "codeSet":I
    .restart local v27    # "startCode":I
    .restart local v28    # "resultLength":I
    .restart local v29    # "startPatternInfo":[I
    .restart local v30    # "lastPatternSize":I
    .restart local v31    # "lastCode":I
    .restart local v33    # "done":Z
    .restart local v34    # "lastStart":I
    .restart local v35    # "nextStart":I
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v2

    throw v2

    .line 500
    .end local v27    # "startCode":I
    .end local v28    # "resultLength":I
    .end local v29    # "startPatternInfo":[I
    .end local v30    # "lastPatternSize":I
    .end local v31    # "lastCode":I
    .end local v33    # "done":Z
    .end local v34    # "lastStart":I
    .end local v35    # "nextStart":I
    .restart local v3    # "lastPatternSize":I
    .restart local v6    # "startPatternInfo":[I
    .local v8, "startCode":I
    .restart local v11    # "lastCode":I
    .restart local v12    # "done":Z
    .restart local v14    # "lastStart":I
    .restart local v15    # "nextStart":I
    .restart local v24    # "codeSet":I
    :cond_138
    move/from16 v30, v3

    move-object/from16 v29, v6

    move/from16 v27, v8

    move/from16 v31, v11

    move/from16 v33, v12

    move/from16 v34, v14

    move/from16 v35, v15

    move/from16 v8, v24

    .end local v3    # "lastPatternSize":I
    .end local v6    # "startPatternInfo":[I
    .end local v11    # "lastCode":I
    .end local v12    # "done":Z
    .end local v14    # "lastStart":I
    .end local v15    # "nextStart":I
    .end local v24    # "codeSet":I
    .local v8, "codeSet":I
    .restart local v27    # "startCode":I
    .restart local v29    # "startPatternInfo":[I
    .restart local v30    # "lastPatternSize":I
    .restart local v31    # "lastCode":I
    .restart local v33    # "done":Z
    .restart local v34    # "lastStart":I
    .restart local v35    # "nextStart":I
    invoke-static {}, Lcom/google/zxing/ChecksumException;->getChecksumInstance()Lcom/google/zxing/ChecksumException;

    move-result-object v2

    throw v2

    .line 493
    .end local v27    # "startCode":I
    .end local v29    # "startPatternInfo":[I
    .end local v30    # "lastPatternSize":I
    .end local v31    # "lastCode":I
    .end local v33    # "done":Z
    .end local v34    # "lastStart":I
    .end local v35    # "nextStart":I
    .restart local v3    # "lastPatternSize":I
    .restart local v6    # "startPatternInfo":[I
    .local v8, "startCode":I
    .restart local v11    # "lastCode":I
    .restart local v12    # "done":Z
    .restart local v14    # "lastStart":I
    .restart local v15    # "nextStart":I
    .restart local v24    # "codeSet":I
    :cond_14d
    move/from16 v30, v3

    move-object/from16 v29, v6

    move/from16 v27, v8

    move/from16 v31, v11

    move/from16 v33, v12

    move/from16 v34, v14

    move/from16 v35, v15

    move/from16 v8, v24

    .end local v3    # "lastPatternSize":I
    .end local v6    # "startPatternInfo":[I
    .end local v11    # "lastCode":I
    .end local v12    # "done":Z
    .end local v14    # "lastStart":I
    .end local v15    # "nextStart":I
    .end local v24    # "codeSet":I
    .local v8, "codeSet":I
    .restart local v27    # "startCode":I
    .restart local v29    # "startPatternInfo":[I
    .restart local v30    # "lastPatternSize":I
    .restart local v31    # "lastCode":I
    .restart local v33    # "done":Z
    .restart local v34    # "lastStart":I
    .restart local v35    # "nextStart":I
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v2

    throw v2

    .line 281
    .end local v27    # "startCode":I
    .end local v29    # "startPatternInfo":[I
    .end local v30    # "lastPatternSize":I
    .end local v31    # "lastCode":I
    .end local v33    # "done":Z
    .end local v34    # "lastStart":I
    .end local v35    # "nextStart":I
    .restart local v6    # "startPatternInfo":[I
    .local v8, "startCode":I
    .restart local v11    # "lastCode":I
    .restart local v12    # "done":Z
    .restart local v14    # "lastStart":I
    .restart local v15    # "nextStart":I
    .restart local v24    # "codeSet":I
    :cond_162
    move/from16 v17, v3

    move-object/from16 v29, v6

    move/from16 v27, v8

    move/from16 v31, v11

    move/from16 v33, v12

    move/from16 v34, v14

    move/from16 v8, v24

    const/16 v16, 0x1

    move v12, v7

    .end local v6    # "startPatternInfo":[I
    .end local v11    # "lastCode":I
    .end local v12    # "done":Z
    .end local v14    # "lastStart":I
    .end local v24    # "codeSet":I
    .local v8, "codeSet":I
    .restart local v27    # "startCode":I
    .restart local v29    # "startPatternInfo":[I
    .restart local v31    # "lastCode":I
    .restart local v33    # "done":Z
    .restart local v34    # "lastStart":I
    move v2, v13

    .line 282
    .local v2, "unshift":Z
    const/4 v3, 0x0

    .line 285
    .end local v13    # "isNextShifted":Z
    .local v3, "isNextShifted":Z
    move/from16 v11, v18

    .line 288
    .end local v31    # "lastCode":I
    .restart local v11    # "lastCode":I
    invoke-static {v1, v4, v15}, Lcom/google/zxing/oned/Code128Reader;->decodeCode(Lcom/google/zxing/common/BitArray;[II)I

    move-result v6

    .line 290
    .end local v18    # "code":I
    .local v6, "code":I
    int-to-byte v7, v6

    invoke-static {v7}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v7

    invoke-interface {v9, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 293
    const/16 v7, 0x6a

    if-eq v6, v7, :cond_189

    .line 294
    const/16 v21, 0x1

    .line 298
    :cond_189
    if-eq v6, v7, :cond_191

    .line 299
    add-int/lit8 v20, v20, 0x1

    .line 300
    mul-int v13, v20, v6

    add-int v19, v19, v13

    .line 304
    :cond_191
    move v14, v15

    .line 305
    .end local v34    # "lastStart":I
    .restart local v14    # "lastStart":I
    array-length v13, v4

    move/from16 v18, v15

    move/from16 v15, v17

    .end local v15    # "nextStart":I
    .local v18, "nextStart":I
    :goto_197
    if-lt v15, v13, :cond_2fe

    .line 310
    packed-switch v6, :pswitch_data_314

    .line 317
    const/16 v15, 0x60

    const/16 v22, 0x20

    packed-switch v8, :pswitch_data_31e

    .line 478
    move/from16 v13, v25

    move/from16 v12, v26

    const/16 v15, 0x64

    .end local v25    # "upperMode":Z
    .end local v26    # "shiftUpperMode":Z
    .local v12, "shiftUpperMode":Z
    .local v13, "upperMode":Z
    goto/16 :goto_2db

    .line 314
    .end local v12    # "shiftUpperMode":Z
    .end local v13    # "upperMode":Z
    .restart local v25    # "upperMode":Z
    .restart local v26    # "shiftUpperMode":Z
    :pswitch_1ab
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v7

    throw v7

    .line 320
    :pswitch_1b0
    const/16 v13, 0x40

    if-ge v6, v13, :cond_1cc

    .line 321
    move/from16 v13, v25

    move/from16 v7, v26

    if-ne v7, v13, :cond_1c1

    .line 322
    .end local v25    # "upperMode":Z
    .end local v26    # "shiftUpperMode":Z
    .local v7, "shiftUpperMode":Z
    .restart local v13    # "upperMode":Z
    add-int v12, v22, v6

    int-to-char v12, v12

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 323
    goto :goto_1c9

    .line 324
    :cond_1c1
    add-int v12, v22, v6

    add-int/lit16 v12, v12, 0x80

    int-to-char v12, v12

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 326
    :goto_1c9
    const/4 v7, 0x0

    .line 327
    goto/16 :goto_242

    .end local v7    # "shiftUpperMode":Z
    .end local v13    # "upperMode":Z
    .restart local v25    # "upperMode":Z
    .restart local v26    # "shiftUpperMode":Z
    :cond_1cc
    move/from16 v13, v25

    move/from16 v12, v26

    .end local v25    # "upperMode":Z
    .end local v26    # "shiftUpperMode":Z
    .restart local v12    # "shiftUpperMode":Z
    .restart local v13    # "upperMode":Z
    if-ge v6, v15, :cond_1e3

    .line 328
    if-ne v12, v13, :cond_1db

    .line 329
    add-int/lit8 v7, v6, -0x40

    int-to-char v7, v7

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 330
    goto :goto_1e1

    .line 331
    :cond_1db
    add-int/lit8 v7, v6, 0x40

    int-to-char v7, v7

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 333
    :goto_1e1
    const/4 v7, 0x0

    .line 334
    .end local v12    # "shiftUpperMode":Z
    .restart local v7    # "shiftUpperMode":Z
    goto :goto_242

    .line 337
    .end local v7    # "shiftUpperMode":Z
    .restart local v12    # "shiftUpperMode":Z
    :cond_1e3
    if-eq v6, v7, :cond_1e7

    .line 338
    const/16 v21, 0x0

    .line 340
    :cond_1e7
    if-eq v6, v7, :cond_224

    packed-switch v6, :pswitch_data_328

    goto :goto_227

    .line 342
    :pswitch_1ed
    if-eqz v5, :cond_295

    .line 343
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->length()I

    move-result v7

    if-nez v7, :cond_1fc

    .line 346
    const-string v7, "]C1"

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 347
    goto/16 :goto_295

    .line 349
    :cond_1fc
    const/16 v7, 0x1d

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 352
    goto/16 :goto_295

    .line 358
    :pswitch_203
    if-nez v13, :cond_20b

    if-eqz v12, :cond_20b

    .line 359
    const/4 v7, 0x1

    .line 360
    .end local v13    # "upperMode":Z
    .local v7, "upperMode":Z
    const/4 v12, 0x0

    .line 361
    goto/16 :goto_274

    .end local v7    # "upperMode":Z
    .restart local v13    # "upperMode":Z
    :cond_20b
    if-eqz v13, :cond_213

    if-eqz v12, :cond_213

    .line 362
    const/4 v7, 0x0

    .line 363
    .end local v13    # "upperMode":Z
    .restart local v7    # "upperMode":Z
    const/4 v12, 0x0

    .line 364
    goto/16 :goto_274

    .line 365
    .end local v7    # "upperMode":Z
    .restart local v13    # "upperMode":Z
    :cond_213
    const/4 v7, 0x1

    .line 367
    .end local v12    # "shiftUpperMode":Z
    .local v7, "shiftUpperMode":Z
    goto :goto_242

    .line 373
    .end local v7    # "shiftUpperMode":Z
    .restart local v12    # "shiftUpperMode":Z
    :pswitch_215
    const/16 v7, 0x64

    .line 374
    .end local v8    # "codeSet":I
    .local v7, "codeSet":I
    goto/16 :goto_28f

    .line 376
    .end local v7    # "codeSet":I
    .restart local v8    # "codeSet":I
    :pswitch_219
    const/16 v7, 0x63

    .line 377
    .end local v8    # "codeSet":I
    .restart local v7    # "codeSet":I
    goto/16 :goto_28f

    .line 369
    .end local v7    # "codeSet":I
    .restart local v8    # "codeSet":I
    :pswitch_21d
    const/4 v3, 0x1

    .line 370
    const/16 v7, 0x64

    .line 371
    .end local v8    # "codeSet":I
    .restart local v7    # "codeSet":I
    goto/16 :goto_28f

    .line 356
    .end local v7    # "codeSet":I
    .restart local v8    # "codeSet":I
    :pswitch_222
    goto/16 :goto_295

    .line 379
    :cond_224
    const/4 v7, 0x1

    .line 383
    .end local v33    # "done":Z
    .local v7, "done":Z
    move/from16 v33, v7

    .end local v7    # "done":Z
    .restart local v33    # "done":Z
    :goto_227
    goto/16 :goto_295

    .line 385
    .end local v12    # "shiftUpperMode":Z
    .end local v13    # "upperMode":Z
    .restart local v25    # "upperMode":Z
    .restart local v26    # "shiftUpperMode":Z
    :pswitch_229
    move/from16 v13, v25

    move/from16 v12, v26

    .end local v25    # "upperMode":Z
    .end local v26    # "shiftUpperMode":Z
    .restart local v12    # "shiftUpperMode":Z
    .restart local v13    # "upperMode":Z
    if-ge v6, v15, :cond_24c

    .line 386
    if-ne v12, v13, :cond_238

    .line 387
    add-int v7, v22, v6

    int-to-char v7, v7

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 388
    goto :goto_240

    .line 389
    :cond_238
    add-int v7, v22, v6

    add-int/lit16 v7, v7, 0x80

    int-to-char v7, v7

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 391
    :goto_240
    const/4 v7, 0x0

    .line 392
    .end local v12    # "shiftUpperMode":Z
    .local v7, "shiftUpperMode":Z
    nop

    .line 478
    .end local v3    # "isNextShifted":Z
    .end local v7    # "shiftUpperMode":Z
    .end local v33    # "done":Z
    .local v12, "done":Z
    .local v13, "isNextShifted":Z
    .restart local v25    # "upperMode":Z
    .restart local v26    # "shiftUpperMode":Z
    :goto_242
    move/from16 v26, v7

    :goto_244
    move/from16 v25, v13

    move/from16 v12, v33

    const/16 v15, 0x64

    goto/16 :goto_2e1

    .line 393
    .end local v25    # "upperMode":Z
    .end local v26    # "shiftUpperMode":Z
    .restart local v3    # "isNextShifted":Z
    .local v12, "shiftUpperMode":Z
    .local v13, "upperMode":Z
    .restart local v33    # "done":Z
    :cond_24c
    if-eq v6, v7, :cond_250

    .line 394
    const/16 v21, 0x0

    .line 396
    :cond_250
    if-eq v6, v7, :cond_292

    packed-switch v6, :pswitch_data_33a

    goto :goto_295

    .line 398
    :pswitch_256
    if-eqz v5, :cond_295

    .line 399
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->length()I

    move-result v7

    if-nez v7, :cond_264

    .line 402
    const-string v7, "]C1"

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 403
    goto :goto_295

    .line 405
    :cond_264
    const/16 v7, 0x1d

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 408
    goto :goto_295

    .line 429
    :pswitch_26a
    const/16 v7, 0x65

    .line 430
    .end local v8    # "codeSet":I
    .local v7, "codeSet":I
    goto :goto_28f

    .line 414
    .end local v7    # "codeSet":I
    .restart local v8    # "codeSet":I
    :pswitch_26d
    if-nez v13, :cond_27f

    if-eqz v12, :cond_27f

    .line 415
    const/4 v7, 0x1

    .line 416
    .end local v13    # "upperMode":Z
    .local v7, "upperMode":Z
    const/4 v12, 0x0

    .line 417
    nop

    .line 478
    .end local v3    # "isNextShifted":Z
    .end local v7    # "upperMode":Z
    .end local v33    # "done":Z
    .local v12, "done":Z
    .local v13, "isNextShifted":Z
    .restart local v25    # "upperMode":Z
    .restart local v26    # "shiftUpperMode":Z
    :goto_274
    move v13, v3

    move/from16 v25, v7

    move/from16 v26, v12

    move/from16 v12, v33

    const/16 v15, 0x64

    goto/16 :goto_2e2

    .line 417
    .end local v25    # "upperMode":Z
    .end local v26    # "shiftUpperMode":Z
    .restart local v3    # "isNextShifted":Z
    .local v12, "shiftUpperMode":Z
    .local v13, "upperMode":Z
    .restart local v33    # "done":Z
    :cond_27f
    if-eqz v13, :cond_286

    if-eqz v12, :cond_286

    .line 418
    const/4 v7, 0x0

    .line 419
    .end local v13    # "upperMode":Z
    .restart local v7    # "upperMode":Z
    const/4 v12, 0x0

    .line 420
    goto :goto_274

    .line 421
    .end local v7    # "upperMode":Z
    .restart local v13    # "upperMode":Z
    :cond_286
    const/4 v7, 0x1

    .line 423
    .end local v12    # "shiftUpperMode":Z
    .local v7, "shiftUpperMode":Z
    goto :goto_242

    .line 432
    .end local v7    # "shiftUpperMode":Z
    .restart local v12    # "shiftUpperMode":Z
    :pswitch_288
    const/16 v7, 0x63

    .line 433
    .end local v8    # "codeSet":I
    .local v7, "codeSet":I
    goto :goto_28f

    .line 425
    .end local v7    # "codeSet":I
    .restart local v8    # "codeSet":I
    :pswitch_28b
    const/4 v3, 0x1

    .line 426
    const/16 v7, 0x65

    .line 427
    .end local v8    # "codeSet":I
    .restart local v7    # "codeSet":I
    nop

    .line 478
    .end local v3    # "isNextShifted":Z
    .end local v7    # "codeSet":I
    .end local v33    # "done":Z
    .restart local v8    # "codeSet":I
    .local v12, "done":Z
    .local v13, "isNextShifted":Z
    .restart local v25    # "upperMode":Z
    .restart local v26    # "shiftUpperMode":Z
    :goto_28f
    move v8, v7

    goto :goto_295

    .line 412
    .end local v25    # "upperMode":Z
    .end local v26    # "shiftUpperMode":Z
    .restart local v3    # "isNextShifted":Z
    .local v12, "shiftUpperMode":Z
    .local v13, "upperMode":Z
    .restart local v33    # "done":Z
    :pswitch_291
    goto :goto_295

    .line 435
    :cond_292
    const/4 v7, 0x1

    .line 439
    .end local v33    # "done":Z
    .local v7, "done":Z
    move/from16 v33, v7

    .line 478
    .end local v3    # "isNextShifted":Z
    .end local v7    # "done":Z
    .local v12, "done":Z
    .local v13, "isNextShifted":Z
    .restart local v25    # "upperMode":Z
    .restart local v26    # "shiftUpperMode":Z
    :cond_295
    :goto_295
    move/from16 v26, v12

    goto :goto_244

    .line 441
    .end local v12    # "done":Z
    .end local v13    # "isNextShifted":Z
    .restart local v3    # "isNextShifted":Z
    .restart local v33    # "done":Z
    :pswitch_298
    move/from16 v13, v25

    move/from16 v12, v26

    .end local v25    # "upperMode":Z
    .end local v26    # "shiftUpperMode":Z
    .local v12, "shiftUpperMode":Z
    .local v13, "upperMode":Z
    const/16 v15, 0x64

    if-ge v6, v15, :cond_2ad

    .line 442
    const/16 v7, 0xa

    if-ge v6, v7, :cond_2a9

    .line 443
    const/16 v7, 0x30

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 445
    :cond_2a9
    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 446
    goto :goto_2db

    .line 447
    :cond_2ad
    if-eq v6, v7, :cond_2b1

    .line 448
    const/16 v21, 0x0

    .line 450
    :cond_2b1
    if-eq v6, v7, :cond_2d3

    packed-switch v6, :pswitch_data_34c

    goto :goto_2db

    .line 452
    :pswitch_2b7
    if-eqz v5, :cond_2db

    .line 453
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->length()I

    move-result v7

    if-nez v7, :cond_2c5

    .line 456
    const-string v7, "]C1"

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 457
    goto :goto_2db

    .line 459
    :cond_2c5
    const/16 v7, 0x1d

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 462
    goto :goto_2db

    .line 464
    :pswitch_2cb
    const/16 v7, 0x65

    .line 465
    .end local v8    # "codeSet":I
    .local v7, "codeSet":I
    goto :goto_2d1

    .line 467
    .end local v7    # "codeSet":I
    .restart local v8    # "codeSet":I
    :pswitch_2ce
    const/16 v7, 0x64

    .line 468
    .end local v8    # "codeSet":I
    .restart local v7    # "codeSet":I
    nop

    .line 478
    .end local v3    # "isNextShifted":Z
    .end local v7    # "codeSet":I
    .end local v33    # "done":Z
    .restart local v8    # "codeSet":I
    .local v12, "done":Z
    .local v13, "isNextShifted":Z
    .restart local v25    # "upperMode":Z
    .restart local v26    # "shiftUpperMode":Z
    :goto_2d1
    move v8, v7

    goto :goto_2db

    .line 470
    .end local v25    # "upperMode":Z
    .end local v26    # "shiftUpperMode":Z
    .restart local v3    # "isNextShifted":Z
    .local v12, "shiftUpperMode":Z
    .local v13, "upperMode":Z
    .restart local v33    # "done":Z
    :cond_2d3
    const/4 v7, 0x1

    .line 478
    .end local v33    # "done":Z
    .local v7, "done":Z
    move/from16 v26, v12

    move/from16 v25, v13

    move v13, v3

    move v12, v7

    goto :goto_2e2

    .end local v3    # "isNextShifted":Z
    .end local v7    # "done":Z
    .local v12, "done":Z
    .local v13, "isNextShifted":Z
    .restart local v25    # "upperMode":Z
    .restart local v26    # "shiftUpperMode":Z
    :cond_2db
    :goto_2db
    move/from16 v26, v12

    move/from16 v25, v13

    move/from16 v12, v33

    :goto_2e1
    move v13, v3

    :goto_2e2
    if-eqz v2, :cond_2ed

    .line 479
    const/16 v3, 0x65

    if-ne v8, v3, :cond_2e9

    goto :goto_2ea

    :cond_2e9
    move v15, v3

    :goto_2ea
    move/from16 v24, v15

    .end local v2    # "unshift":Z
    .end local v8    # "codeSet":I
    .restart local v24    # "codeSet":I
    goto :goto_2ef

    .line 279
    .end local v24    # "codeSet":I
    .restart local v8    # "codeSet":I
    :cond_2ed
    move/from16 v24, v8

    .end local v27    # "startCode":I
    .end local v29    # "startPatternInfo":[I
    .local v6, "startPatternInfo":[I
    .local v8, "startCode":I
    .restart local v15    # "nextStart":I
    .local v18, "code":I
    .restart local v24    # "codeSet":I
    :goto_2ef
    move/from16 v3, v17

    move/from16 v15, v18

    move/from16 v8, v27

    move-object/from16 v2, p3

    const/4 v7, 0x2

    move/from16 v18, v6

    move-object/from16 v6, v29

    goto/16 :goto_66

    .line 305
    .end local v12    # "done":Z
    .end local v13    # "isNextShifted":Z
    .end local v15    # "nextStart":I
    .end local v24    # "codeSet":I
    .restart local v2    # "unshift":Z
    .restart local v3    # "isNextShifted":Z
    .local v6, "code":I
    .local v8, "codeSet":I
    .local v18, "nextStart":I
    .restart local v27    # "startCode":I
    .restart local v29    # "startPatternInfo":[I
    .restart local v33    # "done":Z
    :cond_2fe
    move/from16 v12, v26

    .end local v26    # "shiftUpperMode":Z
    .local v12, "shiftUpperMode":Z
    aget v22, v4, v15

    .line 306
    .local v22, "counter":I
    add-int v18, v18, v22

    .line 305
    .end local v22    # "counter":I
    add-int/lit8 v15, v15, 0x1

    const/4 v12, 0x2

    goto/16 :goto_197

    nop

    :pswitch_data_30a
    .packed-switch 0x67
        :pswitch_3d
        :pswitch_3a
        :pswitch_37
    .end packed-switch

    :pswitch_data_314
    .packed-switch 0x67
        :pswitch_1ab
        :pswitch_1ab
        :pswitch_1ab
    .end packed-switch

    :pswitch_data_31e
    .packed-switch 0x63
        :pswitch_298
        :pswitch_229
        :pswitch_1b0
    .end packed-switch

    :pswitch_data_328
    .packed-switch 0x60
        :pswitch_222
        :pswitch_222
        :pswitch_21d
        :pswitch_219
        :pswitch_215
        :pswitch_203
        :pswitch_1ed
    .end packed-switch

    :pswitch_data_33a
    .packed-switch 0x60
        :pswitch_291
        :pswitch_291
        :pswitch_28b
        :pswitch_288
        :pswitch_26d
        :pswitch_26a
        :pswitch_256
    .end packed-switch

    :pswitch_data_34c
    .packed-switch 0x64
        :pswitch_2ce
        :pswitch_2cb
        :pswitch_2b7
    .end packed-switch
.end method
