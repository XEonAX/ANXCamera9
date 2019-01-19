.class public final Lcom/bef/effectsdk/R$styleable;
.super Ljava/lang/Object;
.source "R.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bef/effectsdk/R;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "styleable"
.end annotation


# static fields
.field public static final CameraPreference:[I

.field public static final CameraPreference_cameraTitle:I = 0x0

.field public static final IconIndicator:[I

.field public static final IconIndicator_icons:I = 0x0

.field public static final IconIndicator_modes:I = 0x1

.field public static final IconListPreference:[I

.field public static final IconListPreference_icons:I = 0x0

.field public static final IconListPreference_images:I = 0x3

.field public static final IconListPreference_largeIcons:I = 0x2

.field public static final IconListPreference_singleIcon:I = 0x1

.field public static final ListPreference:[I

.field public static final ListPreference_defaultValue:I = 0x1

.field public static final ListPreference_entries:I = 0x3

.field public static final ListPreference_entryValues:I = 0x2

.field public static final ListPreference_hasPopup:I = 0x4

.field public static final ListPreference_key:I = 0x0

.field public static final PreviewListPreference:[I

.field public static final PreviewListPreference_labelList:I = 0x0

.field public static final RecyclerView:[I

.field public static final RecyclerView_android_orientation:I = 0x0

.field public static final RecyclerView_layoutManager:I = 0x1

.field public static final RecyclerView_reverseLayout:I = 0x3

.field public static final RecyclerView_spanCount:I = 0x2

.field public static final RecyclerView_stackFromEnd:I = 0x4

.field public static final ToggleSwitch:[I

.field public static final ToggleSwitch_backgroundColor:I = 0x0

.field public static final ToggleSwitch_backgroundStrokeColor:I = 0x1

.field public static final ToggleSwitch_backgroundStrokeWidth:I = 0x2

.field public static final ToggleSwitch_checked:I = 0xf

.field public static final ToggleSwitch_duration:I = 0xe

.field public static final ToggleSwitch_textOff:I = 0x9

.field public static final ToggleSwitch_textOffColor:I = 0xa

.field public static final ToggleSwitch_textOffShadowColor:I = 0xb

.field public static final ToggleSwitch_textOffShadowRadius:I = 0xd

.field public static final ToggleSwitch_textOn:I = 0x7

.field public static final ToggleSwitch_textOnColor:I = 0x8

.field public static final ToggleSwitch_textSize:I = 0xc

.field public static final ToggleSwitch_thumbColor:I = 0x4

.field public static final ToggleSwitch_thumbPadding:I = 0x3

.field public static final ToggleSwitch_thumbShadowColor:I = 0x5

.field public static final ToggleSwitch_thumbShadowRadius:I = 0x6


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 2962
    const/4 v0, 0x1

    new-array v1, v0, [I

    const/4 v2, 0x0

    const v3, 0x7f010004

    aput v3, v1, v2

    sput-object v1, Lcom/bef/effectsdk/R$styleable;->CameraPreference:[I

    .line 2991
    const/4 v1, 0x2

    new-array v1, v1, [I

    fill-array-data v1, :array_0

    sput-object v1, Lcom/bef/effectsdk/R$styleable;->IconIndicator:[I

    .line 3030
    const/4 v1, 0x4

    new-array v1, v1, [I

    fill-array-data v1, :array_1

    sput-object v1, Lcom/bef/effectsdk/R$styleable;->IconListPreference:[I

    .line 3093
    const/4 v1, 0x5

    new-array v3, v1, [I

    fill-array-data v3, :array_2

    sput-object v3, Lcom/bef/effectsdk/R$styleable;->ListPreference:[I

    .line 3166
    new-array v0, v0, [I

    const v3, 0x7f01000f

    aput v3, v0, v2

    sput-object v0, Lcom/bef/effectsdk/R$styleable;->PreviewListPreference:[I

    .line 3197
    new-array v0, v1, [I

    fill-array-data v0, :array_3

    sput-object v0, Lcom/bef/effectsdk/R$styleable;->RecyclerView:[I

    .line 3313
    const/16 v0, 0x10

    new-array v0, v0, [I

    fill-array-data v0, :array_4

    sput-object v0, Lcom/bef/effectsdk/R$styleable;->ToggleSwitch:[I

    return-void

    nop

    :array_0
    .array-data 4
        0x7f01000a
        0x7f01000b
    .end array-data

    :array_1
    .array-data 4
        0x7f01000a
        0x7f01000c
        0x7f01000d
        0x7f01000e
    .end array-data

    :array_2
    .array-data 4
        0x7f010005
        0x7f010006
        0x7f010007
        0x7f010008
        0x7f010009
    .end array-data

    :array_3
    .array-data 4
        0x10100c4
        0x7f010000
        0x7f010001
        0x7f010002
        0x7f010003
    .end array-data

    :array_4
    .array-data 4
        0x7f010010
        0x7f010011
        0x7f010012
        0x7f010013
        0x7f010014
        0x7f010015
        0x7f010016
        0x7f010017
        0x7f010018
        0x7f010019
        0x7f01001a
        0x7f01001b
        0x7f01001c
        0x7f01001d
        0x7f01001e
        0x7f01001f
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 2951
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
