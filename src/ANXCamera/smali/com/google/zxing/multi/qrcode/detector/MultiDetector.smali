.class public final Lcom/google/zxing/multi/qrcode/detector/MultiDetector;
.super Lcom/google/zxing/qrcode/detector/Detector;
.source "MultiDetector.java"


# static fields
.field private static final EMPTY_DETECTOR_RESULTS:[Lcom/google/zxing/common/DetectorResult;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 41
    const/4 v0, 0x0

    new-array v0, v0, [Lcom/google/zxing/common/DetectorResult;

    sput-object v0, Lcom/google/zxing/multi/qrcode/detector/MultiDetector;->EMPTY_DETECTOR_RESULTS:[Lcom/google/zxing/common/DetectorResult;

    return-void
.end method

.method public constructor <init>(Lcom/google/zxing/common/BitMatrix;)V
    .registers 2
    .param p1, "image"    # Lcom/google/zxing/common/BitMatrix;

    .line 44
    invoke-direct {p0, p1}, Lcom/google/zxing/qrcode/detector/Detector;-><init>(Lcom/google/zxing/common/BitMatrix;)V

    .line 45
    return-void
.end method


# virtual methods
.method public detectMulti(Ljava/util/Map;)[Lcom/google/zxing/common/DetectorResult;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)[",
            "Lcom/google/zxing/common/DetectorResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 48
    .local p1, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;*>;"
    invoke-virtual {p0}, Lcom/google/zxing/multi/qrcode/detector/MultiDetector;->getImage()Lcom/google/zxing/common/BitMatrix;

    move-result-object v0

    .line 50
    .local v0, "image":Lcom/google/zxing/common/BitMatrix;
    if-nez p1, :cond_8

    const/4 v1, 0x0

    goto :goto_10

    :cond_8
    sget-object v1, Lcom/google/zxing/DecodeHintType;->NEED_RESULT_POINT_CALLBACK:Lcom/google/zxing/DecodeHintType;

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/zxing/ResultPointCallback;

    .line 49
    :goto_10
    nop

    .line 51
    .local v1, "resultPointCallback":Lcom/google/zxing/ResultPointCallback;
    new-instance v2, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;

    invoke-direct {v2, v0, v1}, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;-><init>(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/ResultPointCallback;)V

    .line 52
    .local v2, "finder":Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;
    invoke-virtual {v2, p1}, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;->findMulti(Ljava/util/Map;)[Lcom/google/zxing/qrcode/detector/FinderPatternInfo;

    move-result-object v3

    .line 54
    .local v3, "infos":[Lcom/google/zxing/qrcode/detector/FinderPatternInfo;
    array-length v4, v3

    if-eqz v4, :cond_4a

    .line 58
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 59
    .local v4, "result":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/common/DetectorResult;>;"
    array-length v5, v3

    const/4 v6, 0x0

    :goto_24
    if-lt v6, v5, :cond_3c

    .line 66
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_2f

    .line 67
    sget-object v5, Lcom/google/zxing/multi/qrcode/detector/MultiDetector;->EMPTY_DETECTOR_RESULTS:[Lcom/google/zxing/common/DetectorResult;

    return-object v5

    .line 69
    :cond_2f
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    new-array v5, v5, [Lcom/google/zxing/common/DetectorResult;

    invoke-interface {v4, v5}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Lcom/google/zxing/common/DetectorResult;

    return-object v5

    .line 59
    :cond_3c
    aget-object v7, v3, v6

    .line 61
    .local v7, "info":Lcom/google/zxing/qrcode/detector/FinderPatternInfo;
    :try_start_3e
    invoke-virtual {p0, v7}, Lcom/google/zxing/multi/qrcode/detector/MultiDetector;->processFinderPatternInfo(Lcom/google/zxing/qrcode/detector/FinderPatternInfo;)Lcom/google/zxing/common/DetectorResult;

    move-result-object v8

    invoke-interface {v4, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_45
    .catch Lcom/google/zxing/ReaderException; {:try_start_3e .. :try_end_45} :catch_46

    .line 62
    goto :goto_47

    :catch_46
    move-exception v8

    .line 59
    .end local v7    # "info":Lcom/google/zxing/qrcode/detector/FinderPatternInfo;
    :goto_47
    add-int/lit8 v6, v6, 0x1

    goto :goto_24

    .line 55
    .end local v4    # "result":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/common/DetectorResult;>;"
    :cond_4a
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v4

    throw v4
.end method
