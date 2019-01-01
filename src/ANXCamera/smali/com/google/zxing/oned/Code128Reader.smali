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
    .locals 5

    .line 39
    const/16 v0, 0x6b

    new-array v0, v0, [[I

    .line 40
    const/4 v1, 0x6

    new-array v2, v1, [I

    fill-array-data v2, :array_0

    const/4 v3, 0x0

    aput-object v2, v0, v3

    .line 41
    new-array v2, v1, [I

    fill-array-data v2, :array_1

    const/4 v3, 0x1

    aput-object v2, v0, v3

    .line 42
    new-array v2, v1, [I

    fill-array-data v2, :array_2

    const/4 v3, 0x2

    aput-object v2, v0, v3

    .line 43
    new-array v2, v1, [I

    fill-array-data v2, :array_3

    const/4 v3, 0x3

    aput-object v2, v0, v3

    .line 44
    new-array v2, v1, [I

    fill-array-data v2, :array_4

    const/4 v3, 0x4

    aput-object v2, v0, v3

    .line 45
    new-array v2, v1, [I

    fill-array-data v2, :array_5

    const/4 v3, 0x5

    aput-object v2, v0, v3

    .line 46
    new-array v2, v1, [I

    fill-array-data v2, :array_6

    aput-object v2, v0, v1

    .line 47
    new-array v2, v1, [I

    fill-array-data v2, :array_7

    const/4 v3, 0x7

    aput-object v2, v0, v3

    .line 48
    new-array v2, v1, [I

    fill-array-data v2, :array_8

    const/16 v4, 0x8

    aput-object v2, v0, v4

    .line 49
    new-array v2, v1, [I

    fill-array-data v2, :array_9

    const/16 v4, 0x9

    aput-object v2, v0, v4

    .line 50
    new-array v2, v1, [I

    fill-array-data v2, :array_a

    const/16 v4, 0xa

    aput-object v2, v0, v4

    .line 51
    new-array v2, v1, [I

    fill-array-data v2, :array_b

    const/16 v4, 0xb

    aput-object v2, v0, v4

    .line 52
    new-array v2, v1, [I

    fill-array-data v2, :array_c

    const/16 v4, 0xc

    aput-object v2, v0, v4

    .line 53
    new-array v2, v1, [I

    fill-array-data v2, :array_d

    const/16 v4, 0xd

    aput-object v2, v0, v4

    .line 54
    new-array v2, v1, [I

    fill-array-data v2, :array_e

    const/16 v4, 0xe

    aput-object v2, v0, v4

    .line 55
    new-array v2, v1, [I

    fill-array-data v2, :array_f

    const/16 v4, 0xf

    aput-object v2, v0, v4

    .line 56
    new-array v2, v1, [I

    fill-array-data v2, :array_10

    const/16 v4, 0x10

    aput-object v2, v0, v4

    .line 57
    new-array v2, v1, [I

    fill-array-data v2, :array_11

    const/16 v4, 0x11

    aput-object v2, v0, v4

    .line 58
    new-array v2, v1, [I

    fill-array-data v2, :array_12

    const/16 v4, 0x12

    aput-object v2, v0, v4

    .line 59
    new-array v2, v1, [I

    fill-array-data v2, :array_13

    const/16 v4, 0x13

    aput-object v2, v0, v4

    .line 60
    new-array v2, v1, [I

    fill-array-data v2, :array_14

    const/16 v4, 0x14

    aput-object v2, v0, v4

    .line 61
    new-array v2, v1, [I

    fill-array-data v2, :array_15

    const/16 v4, 0x15

    aput-object v2, v0, v4

    .line 62
    new-array v2, v1, [I

    fill-array-data v2, :array_16

    const/16 v4, 0x16

    aput-object v2, v0, v4

    .line 63
    new-array v2, v1, [I

    fill-array-data v2, :array_17

    const/16 v4, 0x17

    aput-object v2, v0, v4

    .line 64
    new-array v2, v1, [I

    fill-array-data v2, :array_18

    const/16 v4, 0x18

    aput-object v2, v0, v4

    .line 65
    new-array v2, v1, [I

    fill-array-data v2, :array_19

    const/16 v4, 0x19

    aput-object v2, v0, v4

    .line 66
    new-array v2, v1, [I

    fill-array-data v2, :array_1a

    const/16 v4, 0x1a

    aput-object v2, v0, v4

    .line 67
    new-array v2, v1, [I

    fill-array-data v2, :array_1b

    const/16 v4, 0x1b

    aput-object v2, v0, v4

    .line 68
    new-array v2, v1, [I

    fill-array-data v2, :array_1c

    const/16 v4, 0x1c

    aput-object v2, v0, v4

    .line 69
    new-array v2, v1, [I

    fill-array-data v2, :array_1d

    const/16 v4, 0x1d

    aput-object v2, v0, v4

    .line 70
    new-array v2, v1, [I

    fill-array-data v2, :array_1e

    const/16 v4, 0x1e

    aput-object v2, v0, v4

    .line 71
    new-array v2, v1, [I

    fill-array-data v2, :array_1f

    const/16 v4, 0x1f

    aput-object v2, v0, v4

    .line 72
    new-array v2, v1, [I

    fill-array-data v2, :array_20

    const/16 v4, 0x20

    aput-object v2, v0, v4

    .line 73
    new-array v2, v1, [I

    fill-array-data v2, :array_21

    const/16 v4, 0x21

    aput-object v2, v0, v4

    .line 74
    new-array v2, v1, [I

    fill-array-data v2, :array_22

    const/16 v4, 0x22

    aput-object v2, v0, v4

    .line 75
    new-array v2, v1, [I

    fill-array-data v2, :array_23

    const/16 v4, 0x23

    aput-object v2, v0, v4

    .line 76
    new-array v2, v1, [I

    fill-array-data v2, :array_24

    const/16 v4, 0x24

    aput-object v2, v0, v4

    .line 77
    new-array v2, v1, [I

    fill-array-data v2, :array_25

    const/16 v4, 0x25

    aput-object v2, v0, v4

    .line 78
    new-array v2, v1, [I

    fill-array-data v2, :array_26

    const/16 v4, 0x26

    aput-object v2, v0, v4

    .line 79
    new-array v2, v1, [I

    fill-array-data v2, :array_27

    const/16 v4, 0x27

    aput-object v2, v0, v4

    .line 80
    new-array v2, v1, [I

    fill-array-data v2, :array_28

    const/16 v4, 0x28

    aput-object v2, v0, v4

    .line 81
    new-array v2, v1, [I

    fill-array-data v2, :array_29

    const/16 v4, 0x29

    aput-object v2, v0, v4

    .line 82
    new-array v2, v1, [I

    fill-array-data v2, :array_2a

    const/16 v4, 0x2a

    aput-object v2, v0, v4

    .line 83
    new-array v2, v1, [I

    fill-array-data v2, :array_2b

    const/16 v4, 0x2b

    aput-object v2, v0, v4

    .line 84
    new-array v2, v1, [I

    fill-array-data v2, :array_2c

    const/16 v4, 0x2c

    aput-object v2, v0, v4

    .line 85
    new-array v2, v1, [I

    fill-array-data v2, :array_2d

    const/16 v4, 0x2d

    aput-object v2, v0, v4

    .line 86
    new-array v2, v1, [I

    fill-array-data v2, :array_2e

    const/16 v4, 0x2e

    aput-object v2, v0, v4

    .line 87
    new-array v2, v1, [I

    fill-array-data v2, :array_2f

    const/16 v4, 0x2f

    aput-object v2, v0, v4

    .line 88
    new-array v2, v1, [I

    fill-array-data v2, :array_30

    const/16 v4, 0x30

    aput-object v2, v0, v4

    .line 89
    new-array v2, v1, [I

    fill-array-data v2, :array_31

    const/16 v4, 0x31

    aput-object v2, v0, v4

    .line 90
    new-array v2, v1, [I

    fill-array-data v2, :array_32

    const/16 v4, 0x32

    aput-object v2, v0, v4

    .line 91
    new-array v2, v1, [I

    fill-array-data v2, :array_33

    const/16 v4, 0x33

    aput-object v2, v0, v4

    .line 92
    new-array v2, v1, [I

    fill-array-data v2, :array_34

    const/16 v4, 0x34

    aput-object v2, v0, v4

    .line 93
    new-array v2, v1, [I

    fill-array-data v2, :array_35

    const/16 v4, 0x35

    aput-object v2, v0, v4

    .line 94
    new-array v2, v1, [I

    fill-array-data v2, :array_36

    const/16 v4, 0x36

    aput-object v2, v0, v4

    .line 95
    new-array v2, v1, [I

    fill-array-data v2, :array_37

    const/16 v4, 0x37

    aput-object v2, v0, v4

    .line 96
    new-array v2, v1, [I

    fill-array-data v2, :array_38

    const/16 v4, 0x38

    aput-object v2, v0, v4

    .line 97
    new-array v2, v1, [I

    fill-array-data v2, :array_39

    const/16 v4, 0x39

    aput-object v2, v0, v4

    .line 98
    new-array v2, v1, [I

    fill-array-data v2, :array_3a

    const/16 v4, 0x3a

    aput-object v2, v0, v4

    .line 99
    new-array v2, v1, [I

    fill-array-data v2, :array_3b

    const/16 v4, 0x3b

    aput-object v2, v0, v4

    .line 100
    new-array v2, v1, [I

    fill-array-data v2, :array_3c

    const/16 v4, 0x3c

    aput-object v2, v0, v4

    .line 101
    new-array v2, v1, [I

    fill-array-data v2, :array_3d

    const/16 v4, 0x3d

    aput-object v2, v0, v4

    .line 102
    new-array v2, v1, [I

    fill-array-data v2, :array_3e

    const/16 v4, 0x3e

    aput-object v2, v0, v4

    .line 103
    new-array v2, v1, [I

    fill-array-data v2, :array_3f

    const/16 v4, 0x3f

    aput-object v2, v0, v4

    .line 104
    new-array v2, v1, [I

    fill-array-data v2, :array_40

    const/16 v4, 0x40

    aput-object v2, v0, v4

    .line 105
    new-array v2, v1, [I

    fill-array-data v2, :array_41

    const/16 v4, 0x41

    aput-object v2, v0, v4

    .line 106
    new-array v2, v1, [I

    fill-array-data v2, :array_42

    const/16 v4, 0x42

    aput-object v2, v0, v4

    .line 107
    new-array v2, v1, [I

    fill-array-data v2, :array_43

    const/16 v4, 0x43

    aput-object v2, v0, v4

    .line 108
    new-array v2, v1, [I

    fill-array-data v2, :array_44

    const/16 v4, 0x44

    aput-object v2, v0, v4

    .line 109
    new-array v2, v1, [I

    fill-array-data v2, :array_45

    const/16 v4, 0x45

    aput-object v2, v0, v4

    .line 110
    new-array v2, v1, [I

    fill-array-data v2, :array_46

    const/16 v4, 0x46

    aput-object v2, v0, v4

    .line 111
    new-array v2, v1, [I

    fill-array-data v2, :array_47

    const/16 v4, 0x47

    aput-object v2, v0, v4

    .line 112
    new-array v2, v1, [I

    fill-array-data v2, :array_48

    const/16 v4, 0x48

    aput-object v2, v0, v4

    .line 113
    new-array v2, v1, [I

    fill-array-data v2, :array_49

    const/16 v4, 0x49

    aput-object v2, v0, v4

    .line 114
    new-array v2, v1, [I

    fill-array-data v2, :array_4a

    const/16 v4, 0x4a

    aput-object v2, v0, v4

    .line 115
    new-array v2, v1, [I

    fill-array-data v2, :array_4b

    const/16 v4, 0x4b

    aput-object v2, v0, v4

    .line 116
    new-array v2, v1, [I

    fill-array-data v2, :array_4c

    const/16 v4, 0x4c

    aput-object v2, v0, v4

    .line 117
    new-array v2, v1, [I

    fill-array-data v2, :array_4d

    const/16 v4, 0x4d

    aput-object v2, v0, v4

    .line 118
    new-array v2, v1, [I

    fill-array-data v2, :array_4e

    const/16 v4, 0x4e

    aput-object v2, v0, v4

    .line 119
    new-array v2, v1, [I

    fill-array-data v2, :array_4f

    const/16 v4, 0x4f

    aput-object v2, v0, v4

    .line 120
    new-array v2, v1, [I

    fill-array-data v2, :array_50

    const/16 v4, 0x50

    aput-object v2, v0, v4

    .line 121
    new-array v2, v1, [I

    fill-array-data v2, :array_51

    const/16 v4, 0x51

    aput-object v2, v0, v4

    .line 122
    new-array v2, v1, [I

    fill-array-data v2, :array_52

    const/16 v4, 0x52

    aput-object v2, v0, v4

    .line 123
    new-array v2, v1, [I

    fill-array-data v2, :array_53

    const/16 v4, 0x53

    aput-object v2, v0, v4

    .line 124
    new-array v2, v1, [I

    fill-array-data v2, :array_54

    const/16 v4, 0x54

    aput-object v2, v0, v4

    .line 125
    new-array v2, v1, [I

    fill-array-data v2, :array_55

    const/16 v4, 0x55

    aput-object v2, v0, v4

    .line 126
    new-array v2, v1, [I

    fill-array-data v2, :array_56

    const/16 v4, 0x56

    aput-object v2, v0, v4

    .line 127
    new-array v2, v1, [I

    fill-array-data v2, :array_57

    const/16 v4, 0x57

    aput-object v2, v0, v4

    .line 128
    new-array v2, v1, [I

    fill-array-data v2, :array_58

    const/16 v4, 0x58

    aput-object v2, v0, v4

    .line 129
    new-array v2, v1, [I

    fill-array-data v2, :array_59

    const/16 v4, 0x59

    aput-object v2, v0, v4

    .line 130
    new-array v2, v1, [I

    fill-array-data v2, :array_5a

    const/16 v4, 0x5a

    aput-object v2, v0, v4

    .line 131
    new-array v2, v1, [I

    fill-array-data v2, :array_5b

    const/16 v4, 0x5b

    aput-object v2, v0, v4

    .line 132
    new-array v2, v1, [I

    fill-array-data v2, :array_5c

    const/16 v4, 0x5c

    aput-object v2, v0, v4

    .line 133
    new-array v2, v1, [I

    fill-array-data v2, :array_5d

    const/16 v4, 0x5d

    aput-object v2, v0, v4

    .line 134
    new-array v2, v1, [I

    fill-array-data v2, :array_5e

    const/16 v4, 0x5e

    aput-object v2, v0, v4

    .line 135
    new-array v2, v1, [I

    fill-array-data v2, :array_5f

    const/16 v4, 0x5f

    aput-object v2, v0, v4

    .line 136
    new-array v2, v1, [I

    fill-array-data v2, :array_60

    const/16 v4, 0x60

    aput-object v2, v0, v4

    .line 137
    new-array v2, v1, [I

    fill-array-data v2, :array_61

    const/16 v4, 0x61

    aput-object v2, v0, v4

    .line 138
    new-array v2, v1, [I

    fill-array-data v2, :array_62

    const/16 v4, 0x62

    aput-object v2, v0, v4

    .line 139
    new-array v2, v1, [I

    fill-array-data v2, :array_63

    const/16 v4, 0x63

    aput-object v2, v0, v4

    .line 140
    new-array v2, v1, [I

    fill-array-data v2, :array_64

    const/16 v4, 0x64

    aput-object v2, v0, v4

    .line 141
    new-array v2, v1, [I

    fill-array-data v2, :array_65

    const/16 v4, 0x65

    aput-object v2, v0, v4

    .line 142
    new-array v2, v1, [I

    fill-array-data v2, :array_66

    const/16 v4, 0x66

    aput-object v2, v0, v4

    .line 143
    new-array v2, v1, [I

    fill-array-data v2, :array_67

    const/16 v4, 0x67

    aput-object v2, v0, v4

    .line 144
    new-array v2, v1, [I

    fill-array-data v2, :array_68

    const/16 v4, 0x68

    aput-object v2, v0, v4

    .line 145
    new-array v1, v1, [I

    fill-array-data v1, :array_69

    const/16 v2, 0x69

    aput-object v1, v0, v2

    .line 146
    new-array v1, v3, [I

    fill-array-data v1, :array_6a

    const/16 v2, 0x6a

    aput-object v1, v0, v2

    .line 39
    sput-object v0, Lcom/google/zxing/oned/Code128Reader;->CODE_PATTERNS:[[I

    .line 167
    return-void

    :array_0
    .array-data 4
        0x2
        0x1
        0x2
        0x2
        0x2
        0x2
    .end array-data

    :array_1
    .array-data 4
        0x2
        0x2
        0x2
        0x1
        0x2
        0x2
    .end array-data

    :array_2
    .array-data 4
        0x2
        0x2
        0x2
        0x2
        0x2
        0x1
    .end array-data

    :array_3
    .array-data 4
        0x1
        0x2
        0x1
        0x2
        0x2
        0x3
    .end array-data

    :array_4
    .array-data 4
        0x1
        0x2
        0x1
        0x3
        0x2
        0x2
    .end array-data

    :array_5
    .array-data 4
        0x1
        0x3
        0x1
        0x2
        0x2
        0x2
    .end array-data

    :array_6
    .array-data 4
        0x1
        0x2
        0x2
        0x2
        0x1
        0x3
    .end array-data

    :array_7
    .array-data 4
        0x1
        0x2
        0x2
        0x3
        0x1
        0x2
    .end array-data

    :array_8
    .array-data 4
        0x1
        0x3
        0x2
        0x2
        0x1
        0x2
    .end array-data

    :array_9
    .array-data 4
        0x2
        0x2
        0x1
        0x2
        0x1
        0x3
    .end array-data

    :array_a
    .array-data 4
        0x2
        0x2
        0x1
        0x3
        0x1
        0x2
    .end array-data

    :array_b
    .array-data 4
        0x2
        0x3
        0x1
        0x2
        0x1
        0x2
    .end array-data

    :array_c
    .array-data 4
        0x1
        0x1
        0x2
        0x2
        0x3
        0x2
    .end array-data

    :array_d
    .array-data 4
        0x1
        0x2
        0x2
        0x1
        0x3
        0x2
    .end array-data

    :array_e
    .array-data 4
        0x1
        0x2
        0x2
        0x2
        0x3
        0x1
    .end array-data

    :array_f
    .array-data 4
        0x1
        0x1
        0x3
        0x2
        0x2
        0x2
    .end array-data

    :array_10
    .array-data 4
        0x1
        0x2
        0x3
        0x1
        0x2
        0x2
    .end array-data

    :array_11
    .array-data 4
        0x1
        0x2
        0x3
        0x2
        0x2
        0x1
    .end array-data

    :array_12
    .array-data 4
        0x2
        0x2
        0x3
        0x2
        0x1
        0x1
    .end array-data

    :array_13
    .array-data 4
        0x2
        0x2
        0x1
        0x1
        0x3
        0x2
    .end array-data

    :array_14
    .array-data 4
        0x2
        0x2
        0x1
        0x2
        0x3
        0x1
    .end array-data

    :array_15
    .array-data 4
        0x2
        0x1
        0x3
        0x2
        0x1
        0x2
    .end array-data

    :array_16
    .array-data 4
        0x2
        0x2
        0x3
        0x1
        0x1
        0x2
    .end array-data

    :array_17
    .array-data 4
        0x3
        0x1
        0x2
        0x1
        0x3
        0x1
    .end array-data

    :array_18
    .array-data 4
        0x3
        0x1
        0x1
        0x2
        0x2
        0x2
    .end array-data

    :array_19
    .array-data 4
        0x3
        0x2
        0x1
        0x1
        0x2
        0x2
    .end array-data

    :array_1a
    .array-data 4
        0x3
        0x2
        0x1
        0x2
        0x2
        0x1
    .end array-data

    :array_1b
    .array-data 4
        0x3
        0x1
        0x2
        0x2
        0x1
        0x2
    .end array-data

    :array_1c
    .array-data 4
        0x3
        0x2
        0x2
        0x1
        0x1
        0x2
    .end array-data

    :array_1d
    .array-data 4
        0x3
        0x2
        0x2
        0x2
        0x1
        0x1
    .end array-data

    :array_1e
    .array-data 4
        0x2
        0x1
        0x2
        0x1
        0x2
        0x3
    .end array-data

    :array_1f
    .array-data 4
        0x2
        0x1
        0x2
        0x3
        0x2
        0x1
    .end array-data

    :array_20
    .array-data 4
        0x2
        0x3
        0x2
        0x1
        0x2
        0x1
    .end array-data

    :array_21
    .array-data 4
        0x1
        0x1
        0x1
        0x3
        0x2
        0x3
    .end array-data

    :array_22
    .array-data 4
        0x1
        0x3
        0x1
        0x1
        0x2
        0x3
    .end array-data

    :array_23
    .array-data 4
        0x1
        0x3
        0x1
        0x3
        0x2
        0x1
    .end array-data

    :array_24
    .array-data 4
        0x1
        0x1
        0x2
        0x3
        0x1
        0x3
    .end array-data

    :array_25
    .array-data 4
        0x1
        0x3
        0x2
        0x1
        0x1
        0x3
    .end array-data

    :array_26
    .array-data 4
        0x1
        0x3
        0x2
        0x3
        0x1
        0x1
    .end array-data

    :array_27
    .array-data 4
        0x2
        0x1
        0x1
        0x3
        0x1
        0x3
    .end array-data

    :array_28
    .array-data 4
        0x2
        0x3
        0x1
        0x1
        0x1
        0x3
    .end array-data

    :array_29
    .array-data 4
        0x2
        0x3
        0x1
        0x3
        0x1
        0x1
    .end array-data

    :array_2a
    .array-data 4
        0x1
        0x1
        0x2
        0x1
        0x3
        0x3
    .end array-data

    :array_2b
    .array-data 4
        0x1
        0x1
        0x2
        0x3
        0x3
        0x1
    .end array-data

    :array_2c
    .array-data 4
        0x1
        0x3
        0x2
        0x1
        0x3
        0x1
    .end array-data

    :array_2d
    .array-data 4
        0x1
        0x1
        0x3
        0x1
        0x2
        0x3
    .end array-data

    :array_2e
    .array-data 4
        0x1
        0x1
        0x3
        0x3
        0x2
        0x1
    .end array-data

    :array_2f
    .array-data 4
        0x1
        0x3
        0x3
        0x1
        0x2
        0x1
    .end array-data

    :array_30
    .array-data 4
        0x3
        0x1
        0x3
        0x1
        0x2
        0x1
    .end array-data

    :array_31
    .array-data 4
        0x2
        0x1
        0x1
        0x3
        0x3
        0x1
    .end array-data

    :array_32
    .array-data 4
        0x2
        0x3
        0x1
        0x1
        0x3
        0x1
    .end array-data

    :array_33
    .array-data 4
        0x2
        0x1
        0x3
        0x1
        0x1
        0x3
    .end array-data

    :array_34
    .array-data 4
        0x2
        0x1
        0x3
        0x3
        0x1
        0x1
    .end array-data

    :array_35
    .array-data 4
        0x2
        0x1
        0x3
        0x1
        0x3
        0x1
    .end array-data

    :array_36
    .array-data 4
        0x3
        0x1
        0x1
        0x1
        0x2
        0x3
    .end array-data

    :array_37
    .array-data 4
        0x3
        0x1
        0x1
        0x3
        0x2
        0x1
    .end array-data

    :array_38
    .array-data 4
        0x3
        0x3
        0x1
        0x1
        0x2
        0x1
    .end array-data

    :array_39
    .array-data 4
        0x3
        0x1
        0x2
        0x1
        0x1
        0x3
    .end array-data

    :array_3a
    .array-data 4
        0x3
        0x1
        0x2
        0x3
        0x1
        0x1
    .end array-data

    :array_3b
    .array-data 4
        0x3
        0x3
        0x2
        0x1
        0x1
        0x1
    .end array-data

    :array_3c
    .array-data 4
        0x3
        0x1
        0x4
        0x1
        0x1
        0x1
    .end array-data

    :array_3d
    .array-data 4
        0x2
        0x2
        0x1
        0x4
        0x1
        0x1
    .end array-data

    :array_3e
    .array-data 4
        0x4
        0x3
        0x1
        0x1
        0x1
        0x1
    .end array-data

    :array_3f
    .array-data 4
        0x1
        0x1
        0x1
        0x2
        0x2
        0x4
    .end array-data

    :array_40
    .array-data 4
        0x1
        0x1
        0x1
        0x4
        0x2
        0x2
    .end array-data

    :array_41
    .array-data 4
        0x1
        0x2
        0x1
        0x1
        0x2
        0x4
    .end array-data

    :array_42
    .array-data 4
        0x1
        0x2
        0x1
        0x4
        0x2
        0x1
    .end array-data

    :array_43
    .array-data 4
        0x1
        0x4
        0x1
        0x1
        0x2
        0x2
    .end array-data

    :array_44
    .array-data 4
        0x1
        0x4
        0x1
        0x2
        0x2
        0x1
    .end array-data

    :array_45
    .array-data 4
        0x1
        0x1
        0x2
        0x2
        0x1
        0x4
    .end array-data

    :array_46
    .array-data 4
        0x1
        0x1
        0x2
        0x4
        0x1
        0x2
    .end array-data

    :array_47
    .array-data 4
        0x1
        0x2
        0x2
        0x1
        0x1
        0x4
    .end array-data

    :array_48
    .array-data 4
        0x1
        0x2
        0x2
        0x4
        0x1
        0x1
    .end array-data

    :array_49
    .array-data 4
        0x1
        0x4
        0x2
        0x1
        0x1
        0x2
    .end array-data

    :array_4a
    .array-data 4
        0x1
        0x4
        0x2
        0x2
        0x1
        0x1
    .end array-data

    :array_4b
    .array-data 4
        0x2
        0x4
        0x1
        0x2
        0x1
        0x1
    .end array-data

    :array_4c
    .array-data 4
        0x2
        0x2
        0x1
        0x1
        0x1
        0x4
    .end array-data

    :array_4d
    .array-data 4
        0x4
        0x1
        0x3
        0x1
        0x1
        0x1
    .end array-data

    :array_4e
    .array-data 4
        0x2
        0x4
        0x1
        0x1
        0x1
        0x2
    .end array-data

    :array_4f
    .array-data 4
        0x1
        0x3
        0x4
        0x1
        0x1
        0x1
    .end array-data

    :array_50
    .array-data 4
        0x1
        0x1
        0x1
        0x2
        0x4
        0x2
    .end array-data

    :array_51
    .array-data 4
        0x1
        0x2
        0x1
        0x1
        0x4
        0x2
    .end array-data

    :array_52
    .array-data 4
        0x1
        0x2
        0x1
        0x2
        0x4
        0x1
    .end array-data

    :array_53
    .array-data 4
        0x1
        0x1
        0x4
        0x2
        0x1
        0x2
    .end array-data

    :array_54
    .array-data 4
        0x1
        0x2
        0x4
        0x1
        0x1
        0x2
    .end array-data

    :array_55
    .array-data 4
        0x1
        0x2
        0x4
        0x2
        0x1
        0x1
    .end array-data

    :array_56
    .array-data 4
        0x4
        0x1
        0x1
        0x2
        0x1
        0x2
    .end array-data

    :array_57
    .array-data 4
        0x4
        0x2
        0x1
        0x1
        0x1
        0x2
    .end array-data

    :array_58
    .array-data 4
        0x4
        0x2
        0x1
        0x2
        0x1
        0x1
    .end array-data

    :array_59
    .array-data 4
        0x2
        0x1
        0x2
        0x1
        0x4
        0x1
    .end array-data

    :array_5a
    .array-data 4
        0x2
        0x1
        0x4
        0x1
        0x2
        0x1
    .end array-data

    :array_5b
    .array-data 4
        0x4
        0x1
        0x2
        0x1
        0x2
        0x1
    .end array-data

    :array_5c
    .array-data 4
        0x1
        0x1
        0x1
        0x1
        0x4
        0x3
    .end array-data

    :array_5d
    .array-data 4
        0x1
        0x1
        0x1
        0x3
        0x4
        0x1
    .end array-data

    :array_5e
    .array-data 4
        0x1
        0x3
        0x1
        0x1
        0x4
        0x1
    .end array-data

    :array_5f
    .array-data 4
        0x1
        0x1
        0x4
        0x1
        0x1
        0x3
    .end array-data

    :array_60
    .array-data 4
        0x1
        0x1
        0x4
        0x3
        0x1
        0x1
    .end array-data

    :array_61
    .array-data 4
        0x4
        0x1
        0x1
        0x1
        0x1
        0x3
    .end array-data

    :array_62
    .array-data 4
        0x4
        0x1
        0x1
        0x3
        0x1
        0x1
    .end array-data

    :array_63
    .array-data 4
        0x1
        0x1
        0x3
        0x1
        0x4
        0x1
    .end array-data

    :array_64
    .array-data 4
        0x1
        0x1
        0x4
        0x1
        0x3
        0x1
    .end array-data

    :array_65
    .array-data 4
        0x3
        0x1
        0x1
        0x1
        0x4
        0x1
    .end array-data

    :array_66
    .array-data 4
        0x4
        0x1
        0x1
        0x1
        0x3
        0x1
    .end array-data

    :array_67
    .array-data 4
        0x2
        0x1
        0x1
        0x4
        0x1
        0x2
    .end array-data

    :array_68
    .array-data 4
        0x2
        0x1
        0x1
        0x2
        0x1
        0x4
    .end array-data

    :array_69
    .array-data 4
        0x2
        0x1
        0x1
        0x2
        0x3
        0x2
    .end array-data

    :array_6a
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
    .locals 0

    .line 37
    invoke-direct {p0}, Lcom/google/zxing/oned/OneDReader;-><init>()V

    return-void
.end method

.method private static decodeCode(Lcom/google/zxing/common/BitArray;[II)I
    .locals 6
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
    :goto_0
    sget-object v3, Lcom/google/zxing/oned/Code128Reader;->CODE_PATTERNS:[[I

    array-length v3, v3

    if-lt v2, v3, :cond_1

    .line 228
    .end local v2    # "d":I
    if-ltz v1, :cond_0

    .line 229
    return v1

    .line 231
    :cond_0
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v2

    throw v2

    .line 220
    .restart local v2    # "d":I
    :cond_1
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

    if-gez v5, :cond_2

    .line 223
    move v0, v4

    .line 224
    move v1, v2

    .line 219
    .end local v3    # "pattern":[I
    .end local v4    # "variance":F
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method private static findStartPattern(Lcom/google/zxing/common/BitArray;)[I
    .locals 15
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
    :goto_0
    if-ge v8, v0, :cond_6

    .line 180
    invoke-virtual {p0, v8}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v9

    xor-int/2addr v9, v6

    const/4 v10, 0x1

    if-eqz v9, :cond_0

    .line 181
    aget v9, v4, v3

    add-int/2addr v9, v10

    aput v9, v4, v3

    .line 182
    goto :goto_3

    .line 183
    :cond_0
    add-int/lit8 v9, v7, -0x1

    if-ne v3, v9, :cond_4

    .line 184
    const/high16 v9, 0x3e800000    # 0.25f

    .line 185
    .local v9, "bestVariance":F
    const/4 v11, -0x1

    .line 186
    .local v11, "bestMatch":I
    const/16 v12, 0x67

    .local v12, "startCode":I
    :goto_1
    const/16 v13, 0x69

    if-le v12, v13, :cond_2

    .line 195
    .end local v12    # "startCode":I
    const/4 v12, 0x2

    if-ltz v11, :cond_1

    .line 196
    sub-int v13, v8, v5

    div-int/2addr v13, v12

    sub-int v13, v5, v13

    invoke-static {v1, v13}, Ljava/lang/Math;->max(II)I

    move-result v13

    invoke-virtual {p0, v13, v5, v1}, Lcom/google/zxing/common/BitArray;->isRange(IIZ)Z

    move-result v13

    if-eqz v13, :cond_1

    .line 197
    const/4 v13, 0x3

    new-array v13, v13, [I

    aput v5, v13, v1

    aput v8, v13, v10

    aput v11, v13, v12

    return-object v13

    .line 199
    :cond_1
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
    goto :goto_2

    .line 187
    .restart local v9    # "bestVariance":F
    .restart local v11    # "bestMatch":I
    .restart local v12    # "startCode":I
    :cond_2
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

    if-gez v14, :cond_3

    .line 190
    move v9, v13

    .line 191
    move v11, v12

    .line 186
    .end local v13    # "variance":F
    :cond_3
    add-int/lit8 v12, v12, 0x1

    goto :goto_1

    .line 205
    .end local v9    # "bestVariance":F
    .end local v11    # "bestMatch":I
    .end local v12    # "startCode":I
    :cond_4
    add-int/lit8 v3, v3, 0x1

    .line 207
    :goto_2
    aput v10, v4, v3

    .line 208
    if-eqz v6, :cond_5

    move v10, v1

    nop

    :cond_5
    move v6, v10

    .line 179
    :goto_3
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 211
    .end local v8    # "i":I
    :cond_6
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1
.end method


# virtual methods
.method public decodeRow(ILcom/google/zxing/common/BitArray;Ljava/util/Map;)Lcom/google/zxing/Result;
    .locals 37
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

    if-eqz v2, :cond_0

    sget-object v5, Lcom/google/zxing/DecodeHintType;->ASSUME_GS1:Lcom/google/zxing/DecodeHintType;

    invoke-interface {v2, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    move v5, v4

    goto :goto_0

    :cond_0
    move v5, v3

    .line 241
    .local v5, "convertFNC1":Z
    :goto_0
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
    packed-switch v8, :pswitch_data_0

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
    :pswitch_0
    const/16 v11, 0x63

    .line 257
    .local v11, "codeSet":I
    goto :goto_1

    .line 253
    .end local v11    # "codeSet":I
    :pswitch_1
    const/16 v11, 0x64

    .line 254
    .restart local v11    # "codeSet":I
    goto :goto_1

    .line 250
    .end local v11    # "codeSet":I
    :pswitch_2
    const/16 v11, 0x65

    .line 251
    .restart local v11    # "codeSet":I
    nop

    .line 259
    :goto_1
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
    :goto_2
    if-eqz v12, :cond_7

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
    if-eqz v2, :cond_6

    .line 497
    mul-int v2, v20, v11

    sub-int v19, v19, v2

    .line 499
    rem-int/lit8 v2, v19, 0x67

    if-ne v2, v11, :cond_5

    .line 504
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    .line 505
    .local v2, "resultLength":I
    if-eqz v2, :cond_4

    .line 512
    if-lez v2, :cond_2

    if-eqz v21, :cond_2

    .line 513
    const/16 v7, 0x63

    move/from16 v27, v8

    move/from16 v8, v24

    if-ne v8, v7, :cond_1

    .line 514
    .end local v24    # "codeSet":I
    .local v8, "codeSet":I
    .restart local v27    # "startCode":I
    add-int/lit8 v7, v2, -0x2

    invoke-virtual {v10, v7, v2}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 515
    goto :goto_3

    .line 516
    :cond_1
    add-int/lit8 v7, v2, -0x1

    invoke-virtual {v10, v7, v2}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    goto :goto_3

    .line 520
    .end local v27    # "startCode":I
    .local v8, "startCode":I
    .restart local v24    # "codeSet":I
    :cond_2
    move/from16 v27, v8

    move/from16 v8, v24

    .end local v24    # "codeSet":I
    .local v8, "codeSet":I
    .restart local v27    # "startCode":I
    :goto_3
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
    :goto_4
    if-lt v11, v6, :cond_3

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
    :cond_3
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

    goto :goto_4

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
    :cond_4
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
    :cond_5
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
    :cond_6
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
    :cond_7
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

    if-eq v6, v7, :cond_8

    .line 294
    const/16 v21, 0x1

    .line 298
    :cond_8
    if-eq v6, v7, :cond_9

    .line 299
    add-int/lit8 v20, v20, 0x1

    .line 300
    mul-int v13, v20, v6

    add-int v19, v19, v13

    .line 304
    :cond_9
    move v14, v15

    .line 305
    .end local v34    # "lastStart":I
    .restart local v14    # "lastStart":I
    array-length v13, v4

    move/from16 v18, v15

    move/from16 v15, v17

    .end local v15    # "nextStart":I
    .local v18, "nextStart":I
    :goto_5
    if-lt v15, v13, :cond_23

    .line 310
    packed-switch v6, :pswitch_data_1

    .line 317
    const/16 v15, 0x60

    const/16 v22, 0x20

    packed-switch v8, :pswitch_data_2

    .line 478
    move/from16 v13, v25

    move/from16 v12, v26

    const/16 v15, 0x64

    .end local v25    # "upperMode":Z
    .end local v26    # "shiftUpperMode":Z
    .local v12, "shiftUpperMode":Z
    .local v13, "upperMode":Z
    goto/16 :goto_10

    .line 314
    .end local v12    # "shiftUpperMode":Z
    .end local v13    # "upperMode":Z
    .restart local v25    # "upperMode":Z
    .restart local v26    # "shiftUpperMode":Z
    :pswitch_3
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v7

    throw v7

    .line 320
    :pswitch_4
    const/16 v13, 0x40

    if-ge v6, v13, :cond_b

    .line 321
    move/from16 v13, v25

    move/from16 v7, v26

    if-ne v7, v13, :cond_a

    .line 322
    .end local v25    # "upperMode":Z
    .end local v26    # "shiftUpperMode":Z
    .local v7, "shiftUpperMode":Z
    .restart local v13    # "upperMode":Z
    add-int v12, v22, v6

    int-to-char v12, v12

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 323
    goto :goto_6

    .line 324
    :cond_a
    add-int v12, v22, v6

    add-int/lit16 v12, v12, 0x80

    int-to-char v12, v12

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 326
    :goto_6
    const/4 v7, 0x0

    .line 327
    goto/16 :goto_a

    .end local v7    # "shiftUpperMode":Z
    .end local v13    # "upperMode":Z
    .restart local v25    # "upperMode":Z
    .restart local v26    # "shiftUpperMode":Z
    :cond_b
    move/from16 v13, v25

    move/from16 v12, v26

    .end local v25    # "upperMode":Z
    .end local v26    # "shiftUpperMode":Z
    .restart local v12    # "shiftUpperMode":Z
    .restart local v13    # "upperMode":Z
    if-ge v6, v15, :cond_d

    .line 328
    if-ne v12, v13, :cond_c

    .line 329
    add-int/lit8 v7, v6, -0x40

    int-to-char v7, v7

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 330
    goto :goto_7

    .line 331
    :cond_c
    add-int/lit8 v7, v6, 0x40

    int-to-char v7, v7

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 333
    :goto_7
    const/4 v7, 0x0

    .line 334
    .end local v12    # "shiftUpperMode":Z
    .restart local v7    # "shiftUpperMode":Z
    goto :goto_a

    .line 337
    .end local v7    # "shiftUpperMode":Z
    .restart local v12    # "shiftUpperMode":Z
    :cond_d
    if-eq v6, v7, :cond_e

    .line 338
    const/16 v21, 0x0

    .line 340
    :cond_e
    if-eq v6, v7, :cond_12

    packed-switch v6, :pswitch_data_3

    goto :goto_8

    .line 342
    :pswitch_5
    if-eqz v5, :cond_1a

    .line 343
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->length()I

    move-result v7

    if-nez v7, :cond_f

    .line 346
    const-string v7, "]C1"

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 347
    goto/16 :goto_e

    .line 349
    :cond_f
    const/16 v7, 0x1d

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 352
    goto/16 :goto_e

    .line 358
    :pswitch_6
    if-nez v13, :cond_10

    if-eqz v12, :cond_10

    .line 359
    const/4 v7, 0x1

    .line 360
    .end local v13    # "upperMode":Z
    .local v7, "upperMode":Z
    const/4 v12, 0x0

    .line 361
    goto/16 :goto_c

    .end local v7    # "upperMode":Z
    .restart local v13    # "upperMode":Z
    :cond_10
    if-eqz v13, :cond_11

    if-eqz v12, :cond_11

    .line 362
    const/4 v7, 0x0

    .line 363
    .end local v13    # "upperMode":Z
    .restart local v7    # "upperMode":Z
    const/4 v12, 0x0

    .line 364
    goto/16 :goto_c

    .line 365
    .end local v7    # "upperMode":Z
    .restart local v13    # "upperMode":Z
    :cond_11
    const/4 v7, 0x1

    .line 367
    .end local v12    # "shiftUpperMode":Z
    .local v7, "shiftUpperMode":Z
    goto :goto_a

    .line 373
    .end local v7    # "shiftUpperMode":Z
    .restart local v12    # "shiftUpperMode":Z
    :pswitch_7
    const/16 v7, 0x64

    .line 374
    .end local v8    # "codeSet":I
    .local v7, "codeSet":I
    goto/16 :goto_d

    .line 376
    .end local v7    # "codeSet":I
    .restart local v8    # "codeSet":I
    :pswitch_8
    const/16 v7, 0x63

    .line 377
    .end local v8    # "codeSet":I
    .restart local v7    # "codeSet":I
    goto/16 :goto_d

    .line 369
    .end local v7    # "codeSet":I
    .restart local v8    # "codeSet":I
    :pswitch_9
    const/4 v3, 0x1

    .line 370
    const/16 v7, 0x64

    .line 371
    .end local v8    # "codeSet":I
    .restart local v7    # "codeSet":I
    goto/16 :goto_d

    .line 356
    .end local v7    # "codeSet":I
    .restart local v8    # "codeSet":I
    :pswitch_a
    goto/16 :goto_e

    .line 379
    :cond_12
    const/4 v7, 0x1

    .line 383
    .end local v33    # "done":Z
    .local v7, "done":Z
    move/from16 v33, v7

    .end local v7    # "done":Z
    .restart local v33    # "done":Z
    :goto_8
    goto/16 :goto_e

    .line 385
    .end local v12    # "shiftUpperMode":Z
    .end local v13    # "upperMode":Z
    .restart local v25    # "upperMode":Z
    .restart local v26    # "shiftUpperMode":Z
    :pswitch_b
    move/from16 v13, v25

    move/from16 v12, v26

    .end local v25    # "upperMode":Z
    .end local v26    # "shiftUpperMode":Z
    .restart local v12    # "shiftUpperMode":Z
    .restart local v13    # "upperMode":Z
    if-ge v6, v15, :cond_14

    .line 386
    if-ne v12, v13, :cond_13

    .line 387
    add-int v7, v22, v6

    int-to-char v7, v7

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 388
    goto :goto_9

    .line 389
    :cond_13
    add-int v7, v22, v6

    add-int/lit16 v7, v7, 0x80

    int-to-char v7, v7

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 391
    :goto_9
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
    :goto_a
    move/from16 v26, v7

    :goto_b
    move/from16 v25, v13

    move/from16 v12, v33

    const/16 v15, 0x64

    goto/16 :goto_11

    .line 393
    .end local v25    # "upperMode":Z
    .end local v26    # "shiftUpperMode":Z
    .restart local v3    # "isNextShifted":Z
    .local v12, "shiftUpperMode":Z
    .local v13, "upperMode":Z
    .restart local v33    # "done":Z
    :cond_14
    if-eq v6, v7, :cond_15

    .line 394
    const/16 v21, 0x0

    .line 396
    :cond_15
    if-eq v6, v7, :cond_19

    packed-switch v6, :pswitch_data_4

    goto :goto_e

    .line 398
    :pswitch_c
    if-eqz v5, :cond_1a

    .line 399
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->length()I

    move-result v7

    if-nez v7, :cond_16

    .line 402
    const-string v7, "]C1"

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 403
    goto :goto_e

    .line 405
    :cond_16
    const/16 v7, 0x1d

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 408
    goto :goto_e

    .line 429
    :pswitch_d
    const/16 v7, 0x65

    .line 430
    .end local v8    # "codeSet":I
    .local v7, "codeSet":I
    goto :goto_d

    .line 414
    .end local v7    # "codeSet":I
    .restart local v8    # "codeSet":I
    :pswitch_e
    if-nez v13, :cond_17

    if-eqz v12, :cond_17

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
    :goto_c
    move v13, v3

    move/from16 v25, v7

    move/from16 v26, v12

    move/from16 v12, v33

    const/16 v15, 0x64

    goto/16 :goto_12

    .line 417
    .end local v25    # "upperMode":Z
    .end local v26    # "shiftUpperMode":Z
    .restart local v3    # "isNextShifted":Z
    .local v12, "shiftUpperMode":Z
    .local v13, "upperMode":Z
    .restart local v33    # "done":Z
    :cond_17
    if-eqz v13, :cond_18

    if-eqz v12, :cond_18

    .line 418
    const/4 v7, 0x0

    .line 419
    .end local v13    # "upperMode":Z
    .restart local v7    # "upperMode":Z
    const/4 v12, 0x0

    .line 420
    goto :goto_c

    .line 421
    .end local v7    # "upperMode":Z
    .restart local v13    # "upperMode":Z
    :cond_18
    const/4 v7, 0x1

    .line 423
    .end local v12    # "shiftUpperMode":Z
    .local v7, "shiftUpperMode":Z
    goto :goto_a

    .line 432
    .end local v7    # "shiftUpperMode":Z
    .restart local v12    # "shiftUpperMode":Z
    :pswitch_f
    const/16 v7, 0x63

    .line 433
    .end local v8    # "codeSet":I
    .local v7, "codeSet":I
    goto :goto_d

    .line 425
    .end local v7    # "codeSet":I
    .restart local v8    # "codeSet":I
    :pswitch_10
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
    :goto_d
    move v8, v7

    goto :goto_e

    .line 412
    .end local v25    # "upperMode":Z
    .end local v26    # "shiftUpperMode":Z
    .restart local v3    # "isNextShifted":Z
    .local v12, "shiftUpperMode":Z
    .local v13, "upperMode":Z
    .restart local v33    # "done":Z
    :pswitch_11
    goto :goto_e

    .line 435
    :cond_19
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
    :cond_1a
    :goto_e
    move/from16 v26, v12

    goto :goto_b

    .line 441
    .end local v12    # "done":Z
    .end local v13    # "isNextShifted":Z
    .restart local v3    # "isNextShifted":Z
    .restart local v33    # "done":Z
    :pswitch_12
    move/from16 v13, v25

    move/from16 v12, v26

    .end local v25    # "upperMode":Z
    .end local v26    # "shiftUpperMode":Z
    .local v12, "shiftUpperMode":Z
    .local v13, "upperMode":Z
    const/16 v15, 0x64

    if-ge v6, v15, :cond_1c

    .line 442
    const/16 v7, 0xa

    if-ge v6, v7, :cond_1b

    .line 443
    const/16 v7, 0x30

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 445
    :cond_1b
    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 446
    goto :goto_10

    .line 447
    :cond_1c
    if-eq v6, v7, :cond_1d

    .line 448
    const/16 v21, 0x0

    .line 450
    :cond_1d
    if-eq v6, v7, :cond_1f

    packed-switch v6, :pswitch_data_5

    goto :goto_10

    .line 452
    :pswitch_13
    if-eqz v5, :cond_20

    .line 453
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->length()I

    move-result v7

    if-nez v7, :cond_1e

    .line 456
    const-string v7, "]C1"

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 457
    goto :goto_10

    .line 459
    :cond_1e
    const/16 v7, 0x1d

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 462
    goto :goto_10

    .line 464
    :pswitch_14
    const/16 v7, 0x65

    .line 465
    .end local v8    # "codeSet":I
    .local v7, "codeSet":I
    goto :goto_f

    .line 467
    .end local v7    # "codeSet":I
    .restart local v8    # "codeSet":I
    :pswitch_15
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
    :goto_f
    move v8, v7

    goto :goto_10

    .line 470
    .end local v25    # "upperMode":Z
    .end local v26    # "shiftUpperMode":Z
    .restart local v3    # "isNextShifted":Z
    .local v12, "shiftUpperMode":Z
    .local v13, "upperMode":Z
    .restart local v33    # "done":Z
    :cond_1f
    const/4 v7, 0x1

    .line 478
    .end local v33    # "done":Z
    .local v7, "done":Z
    move/from16 v26, v12

    move/from16 v25, v13

    move v13, v3

    move v12, v7

    goto :goto_12

    .end local v3    # "isNextShifted":Z
    .end local v7    # "done":Z
    .local v12, "done":Z
    .local v13, "isNextShifted":Z
    .restart local v25    # "upperMode":Z
    .restart local v26    # "shiftUpperMode":Z
    :cond_20
    :goto_10
    move/from16 v26, v12

    move/from16 v25, v13

    move/from16 v12, v33

    :goto_11
    move v13, v3

    :goto_12
    if-eqz v2, :cond_22

    .line 479
    const/16 v3, 0x65

    if-ne v8, v3, :cond_21

    goto :goto_13

    :cond_21
    move v15, v3

    :goto_13
    move/from16 v24, v15

    .end local v2    # "unshift":Z
    .end local v8    # "codeSet":I
    .restart local v24    # "codeSet":I
    goto :goto_14

    .line 279
    .end local v24    # "codeSet":I
    .restart local v8    # "codeSet":I
    :cond_22
    move/from16 v24, v8

    .end local v27    # "startCode":I
    .end local v29    # "startPatternInfo":[I
    .local v6, "startPatternInfo":[I
    .local v8, "startCode":I
    .restart local v15    # "nextStart":I
    .local v18, "code":I
    .restart local v24    # "codeSet":I
    :goto_14
    move/from16 v3, v17

    move/from16 v15, v18

    move/from16 v8, v27

    move-object/from16 v2, p3

    const/4 v7, 0x2

    move/from16 v18, v6

    move-object/from16 v6, v29

    goto/16 :goto_2

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
    :cond_23
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

    goto/16 :goto_5

    nop

    :pswitch_data_0
    .packed-switch 0x67
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x67
        :pswitch_3
        :pswitch_3
        :pswitch_3
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x63
        :pswitch_12
        :pswitch_b
        :pswitch_4
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0x60
        :pswitch_a
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
    .end packed-switch

    :pswitch_data_4
    .packed-switch 0x60
        :pswitch_11
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
    .end packed-switch

    :pswitch_data_5
    .packed-switch 0x64
        :pswitch_15
        :pswitch_14
        :pswitch_13
    .end packed-switch
.end method
