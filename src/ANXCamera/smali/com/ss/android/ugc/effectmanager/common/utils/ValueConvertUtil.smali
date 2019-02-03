.class public Lcom/ss/android/ugc/effectmanager/common/utils/ValueConvertUtil;
.super Ljava/lang/Object;
.source "ValueConvertUtil.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static ConvertStringToLong(Ljava/lang/String;J)J
    .locals 2

    .line 9
    if-eqz p0, :cond_1

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 12
    :cond_0
    nop

    .line 14
    :try_start_0
    invoke-static {p0}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    nop

    .line 18
    move-wide p1, v0

    goto :goto_0

    .line 15
    :catch_0
    move-exception p0

    .line 16
    invoke-virtual {p0}, Ljava/lang/NumberFormatException;->printStackTrace()V

    .line 18
    :goto_0
    return-wide p1

    .line 10
    :cond_1
    :goto_1
    return-wide p1
.end method
