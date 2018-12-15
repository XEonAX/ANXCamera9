.class public final Lcom/google/zxing/client/result/VEventResultParser;
.super Lcom/google/zxing/client/result/ResultParser;
.source "VEventResultParser.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 29
    invoke-direct {p0}, Lcom/google/zxing/client/result/ResultParser;-><init>()V

    return-void
.end method

.method private static matchSingleVCardPrefixedField(Ljava/lang/CharSequence;Ljava/lang/String;Z)Ljava/lang/String;
    .registers 6
    .param p0, "prefix"    # Ljava/lang/CharSequence;
    .param p1, "rawText"    # Ljava/lang/String;
    .param p2, "trim"    # Z

    .line 95
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/google/zxing/client/result/VCardResultParser;->matchSingleVCardPrefixedField(Ljava/lang/CharSequence;Ljava/lang/String;ZZ)Ljava/util/List;

    move-result-object v1

    .line 96
    .local v1, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v1, :cond_15

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_e

    goto :goto_15

    :cond_e
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_16

    :cond_15
    :goto_15
    const/4 v0, 0x0

    :goto_16
    return-object v0
.end method

.method private static matchVCardPrefixedField(Ljava/lang/CharSequence;Ljava/lang/String;Z)[Ljava/lang/String;
    .registers 9
    .param p0, "prefix"    # Ljava/lang/CharSequence;
    .param p1, "rawText"    # Ljava/lang/String;
    .param p2, "trim"    # Z

    .line 100
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/google/zxing/client/result/VCardResultParser;->matchVCardPrefixedField(Ljava/lang/CharSequence;Ljava/lang/String;ZZ)Ljava/util/List;

    move-result-object v1

    .line 101
    .local v1, "values":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Ljava/lang/String;>;>;"
    if-eqz v1, :cond_29

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_e

    goto :goto_29

    .line 104
    :cond_e
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    .line 105
    .local v2, "size":I
    new-array v3, v2, [Ljava/lang/String;

    .line 106
    .local v3, "result":[Ljava/lang/String;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_15
    if-lt v4, v2, :cond_18

    .line 109
    .end local v4    # "i":I
    return-object v3

    .line 107
    .restart local v4    # "i":I
    :cond_18
    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    invoke-interface {v5, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    aput-object v5, v3, v4

    .line 106
    add-int/lit8 v4, v4, 0x1

    goto :goto_15

    .line 102
    .end local v2    # "size":I
    .end local v3    # "result":[Ljava/lang/String;
    .end local v4    # "i":I
    :cond_29
    :goto_29
    const/4 v0, 0x0

    return-object v0
.end method

.method private static stripMailto(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "s"    # Ljava/lang/String;

    .line 113
    if-eqz p0, :cond_17

    const-string v0, "mailto:"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_12

    const-string v0, "MAILTO:"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_17

    .line 114
    :cond_12
    const/4 v0, 0x7

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 116
    :cond_17
    return-object p0
.end method


# virtual methods
.method public parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/CalendarParsedResult;
    .registers 28
    .param p1, "result"    # Lcom/google/zxing/Result;

    .line 33
    invoke-static/range {p1 .. p1}, Lcom/google/zxing/client/result/VEventResultParser;->getMassagedText(Lcom/google/zxing/Result;)Ljava/lang/String;

    move-result-object v1

    .line 34
    .local v1, "rawText":Ljava/lang/String;
    const-string v0, "BEGIN:VEVENT"

    invoke-virtual {v1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    .line 35
    .local v2, "vEventStart":I
    const/4 v3, 0x0

    if-gez v2, :cond_e

    .line 36
    return-object v3

    .line 39
    :cond_e
    const-string v0, "SUMMARY"

    const/4 v4, 0x1

    invoke-static {v0, v1, v4}, Lcom/google/zxing/client/result/VEventResultParser;->matchSingleVCardPrefixedField(Ljava/lang/CharSequence;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v18

    .line 40
    .local v18, "summary":Ljava/lang/String;
    const-string v0, "DTSTART"

    invoke-static {v0, v1, v4}, Lcom/google/zxing/client/result/VEventResultParser;->matchSingleVCardPrefixedField(Ljava/lang/CharSequence;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v19

    .line 41
    .local v19, "start":Ljava/lang/String;
    if-nez v19, :cond_1e

    .line 42
    return-object v3

    .line 44
    :cond_1e
    const-string v0, "DTEND"

    invoke-static {v0, v1, v4}, Lcom/google/zxing/client/result/VEventResultParser;->matchSingleVCardPrefixedField(Ljava/lang/CharSequence;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v20

    .line 45
    .local v20, "end":Ljava/lang/String;
    const-string v0, "DURATION"

    invoke-static {v0, v1, v4}, Lcom/google/zxing/client/result/VEventResultParser;->matchSingleVCardPrefixedField(Ljava/lang/CharSequence;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v21

    .line 46
    .local v21, "duration":Ljava/lang/String;
    const-string v0, "LOCATION"

    invoke-static {v0, v1, v4}, Lcom/google/zxing/client/result/VEventResultParser;->matchSingleVCardPrefixedField(Ljava/lang/CharSequence;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v22

    .line 47
    .local v22, "location":Ljava/lang/String;
    const-string v0, "ORGANIZER"

    invoke-static {v0, v1, v4}, Lcom/google/zxing/client/result/VEventResultParser;->matchSingleVCardPrefixedField(Ljava/lang/CharSequence;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/zxing/client/result/VEventResultParser;->stripMailto(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v23

    .line 49
    .local v23, "organizer":Ljava/lang/String;
    const-string v0, "ATTENDEE"

    invoke-static {v0, v1, v4}, Lcom/google/zxing/client/result/VEventResultParser;->matchVCardPrefixedField(Ljava/lang/CharSequence;Ljava/lang/String;Z)[Ljava/lang/String;

    move-result-object v13

    .line 50
    .local v13, "attendees":[Ljava/lang/String;
    if-eqz v13, :cond_52

    .line 51
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_43
    array-length v5, v13

    if-lt v0, v5, :cond_47

    .end local v0    # "i":I
    goto :goto_52

    .line 52
    .restart local v0    # "i":I
    :cond_47
    aget-object v5, v13, v0

    invoke-static {v5}, Lcom/google/zxing/client/result/VEventResultParser;->stripMailto(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v13, v0

    .line 51
    add-int/lit8 v0, v0, 0x1

    goto :goto_43

    .line 55
    .end local v0    # "i":I
    :cond_52
    :goto_52
    const-string v0, "DESCRIPTION"

    invoke-static {v0, v1, v4}, Lcom/google/zxing/client/result/VEventResultParser;->matchSingleVCardPrefixedField(Ljava/lang/CharSequence;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v24

    .line 57
    .local v24, "description":Ljava/lang/String;
    const-string v0, "GEO"

    invoke-static {v0, v1, v4}, Lcom/google/zxing/client/result/VEventResultParser;->matchSingleVCardPrefixedField(Ljava/lang/CharSequence;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v4

    .line 60
    .local v4, "geoString":Ljava/lang/String;
    if-nez v4, :cond_69

    .line 61
    const-wide/high16 v5, 0x7ff8000000000000L    # Double.NaN

    .line 62
    .local v5, "latitude":D
    const-wide/high16 v7, 0x7ff8000000000000L    # Double.NaN

    .line 63
    .local v7, "longitude":D
    nop

    .line 72
    move-wide v14, v5

    move-wide/from16 v16, v7

    goto :goto_89

    .line 64
    .end local v5    # "latitude":D
    .end local v7    # "longitude":D
    :cond_69
    const/16 v0, 0x3b

    invoke-virtual {v4, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    .line 65
    .local v5, "semicolon":I
    if-gez v5, :cond_72

    .line 66
    return-object v3

    .line 69
    :cond_72
    const/4 v0, 0x0

    :try_start_73
    invoke-virtual {v4, v0, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v6

    .line 70
    .local v6, "latitude":D
    add-int/lit8 v0, v5, 0x1

    invoke-virtual {v4, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v8
    :try_end_85
    .catch Ljava/lang/NumberFormatException; {:try_start_73 .. :try_end_85} :catch_b0

    .line 71
    .local v8, "longitude":D
    nop

    .line 72
    move-wide v14, v6

    move-wide/from16 v16, v8

    .line 77
    .end local v5    # "semicolon":I
    .end local v6    # "latitude":D
    .end local v8    # "longitude":D
    .local v14, "latitude":D
    .local v16, "longitude":D
    :goto_89
    :try_start_89
    new-instance v0, Lcom/google/zxing/client/result/CalendarParsedResult;
    :try_end_8b
    .catch Ljava/lang/IllegalArgumentException; {:try_start_89 .. :try_end_8b} :catch_ac

    .line 78
    nop

    .line 79
    nop

    .line 80
    nop

    .line 81
    nop

    .line 82
    nop

    .line 83
    nop

    .line 84
    nop

    .line 85
    nop

    .line 86
    nop

    .line 77
    move-object v5, v0

    move-object/from16 v6, v18

    move-object/from16 v7, v19

    move-object/from16 v8, v20

    move-object/from16 v9, v21

    move-object/from16 v10, v22

    move-object/from16 v11, v23

    move-object v12, v13

    move-object/from16 v25, v13

    move-object/from16 v13, v24

    .end local v13    # "attendees":[Ljava/lang/String;
    .local v25, "attendees":[Ljava/lang/String;
    :try_start_a6
    invoke-direct/range {v5 .. v17}, Lcom/google/zxing/client/result/CalendarParsedResult;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;DD)V
    :try_end_a9
    .catch Ljava/lang/IllegalArgumentException; {:try_start_a6 .. :try_end_a9} :catch_aa

    return-object v0

    .line 87
    :catch_aa
    move-exception v0

    goto :goto_af

    .end local v25    # "attendees":[Ljava/lang/String;
    .restart local v13    # "attendees":[Ljava/lang/String;
    :catch_ac
    move-exception v0

    move-object/from16 v25, v13

    .line 88
    .end local v13    # "attendees":[Ljava/lang/String;
    .local v0, "ignored":Ljava/lang/IllegalArgumentException;
    .restart local v25    # "attendees":[Ljava/lang/String;
    :goto_af
    return-object v3

    .line 71
    .end local v0    # "ignored":Ljava/lang/IllegalArgumentException;
    .end local v14    # "latitude":D
    .end local v16    # "longitude":D
    .end local v25    # "attendees":[Ljava/lang/String;
    .restart local v5    # "semicolon":I
    .restart local v13    # "attendees":[Ljava/lang/String;
    :catch_b0
    move-exception v0

    move-object/from16 v25, v13

    .line 72
    .end local v13    # "attendees":[Ljava/lang/String;
    .local v0, "ignored":Ljava/lang/NumberFormatException;
    .restart local v25    # "attendees":[Ljava/lang/String;
    return-object v3
.end method

.method public bridge synthetic parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/zxing/client/result/VEventResultParser;->parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/CalendarParsedResult;

    move-result-object p1

    return-object p1
.end method
