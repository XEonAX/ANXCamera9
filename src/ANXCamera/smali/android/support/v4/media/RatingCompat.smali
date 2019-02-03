.class public final Landroid/support/v4/media/RatingCompat;
.super Ljava/lang/Object;
.source "RatingCompat.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/media/RatingCompat$StarStyle;,
        Landroid/support/v4/media/RatingCompat$Style;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Landroid/support/v4/media/RatingCompat;",
            ">;"
        }
    .end annotation
.end field

.field public static final RATING_3_STARS:I = 0x3

.field public static final RATING_4_STARS:I = 0x4

.field public static final RATING_5_STARS:I = 0x5

.field public static final RATING_HEART:I = 0x1

.field public static final RATING_NONE:I = 0x0

.field private static final RATING_NOT_RATED:F = -1.0f

.field public static final RATING_PERCENTAGE:I = 0x6

.field public static final RATING_THUMB_UP_DOWN:I = 0x2

.field private static final TAG:Ljava/lang/String; = "Rating"


# instance fields
.field private mRatingObj:Ljava/lang/Object;

.field private final mRatingStyle:I

.field private final mRatingValue:F


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 121
    new-instance v0, Landroid/support/v4/media/RatingCompat$1;

    invoke-direct {v0}, Landroid/support/v4/media/RatingCompat$1;-><init>()V

    sput-object v0, Landroid/support/v4/media/RatingCompat;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>(IF)V
    .registers 3
    .param p1, "ratingStyle"    # I
    .param p2, "rating"    # F

    .line 99
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 100
    iput p1, p0, Landroid/support/v4/media/RatingCompat;->mRatingStyle:I

    .line 101
    iput p2, p0, Landroid/support/v4/media/RatingCompat;->mRatingValue:F

    .line 102
    return-void
.end method

.method synthetic constructor <init>(IFLandroid/support/v4/media/RatingCompat$1;)V
    .registers 4
    .param p1, "x0"    # I
    .param p2, "x1"    # F
    .param p3, "x2"    # Landroid/support/v4/media/RatingCompat$1;

    .line 36
    invoke-direct {p0, p1, p2}, Landroid/support/v4/media/RatingCompat;-><init>(IF)V

    return-void
.end method

.method public static fromRating(Ljava/lang/Object;)Landroid/support/v4/media/RatingCompat;
    .registers 4
    .param p0, "ratingObj"    # Ljava/lang/Object;

    .line 322
    const/4 v0, 0x0

    if-eqz p0, :cond_43

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-ge v1, v2, :cond_a

    goto :goto_43

    .line 326
    :cond_a
    invoke-static {p0}, Landroid/support/v4/media/RatingCompatApi21;->getRatingStyle(Ljava/lang/Object;)I

    move-result v1

    .line 328
    .local v1, "ratingStyle":I
    invoke-static {p0}, Landroid/support/v4/media/RatingCompatApi21;->isRated(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3c

    .line 329
    packed-switch v1, :pswitch_data_44

    .line 346
    return-object v0

    .line 343
    :pswitch_18
    invoke-static {p0}, Landroid/support/v4/media/RatingCompatApi21;->getPercentRating(Ljava/lang/Object;)F

    move-result v0

    invoke-static {v0}, Landroid/support/v4/media/RatingCompat;->newPercentageRating(F)Landroid/support/v4/media/RatingCompat;

    move-result-object v0

    .line 344
    .local v0, "rating":Landroid/support/v4/media/RatingCompat;
    goto :goto_40

    .line 339
    .end local v0    # "rating":Landroid/support/v4/media/RatingCompat;
    :pswitch_21
    invoke-static {p0}, Landroid/support/v4/media/RatingCompatApi21;->getStarRating(Ljava/lang/Object;)F

    move-result v0

    invoke-static {v1, v0}, Landroid/support/v4/media/RatingCompat;->newStarRating(IF)Landroid/support/v4/media/RatingCompat;

    move-result-object v0

    .line 341
    .restart local v0    # "rating":Landroid/support/v4/media/RatingCompat;
    goto :goto_40

    .line 334
    .end local v0    # "rating":Landroid/support/v4/media/RatingCompat;
    :pswitch_2a
    invoke-static {p0}, Landroid/support/v4/media/RatingCompatApi21;->isThumbUp(Ljava/lang/Object;)Z

    move-result v0

    invoke-static {v0}, Landroid/support/v4/media/RatingCompat;->newThumbRating(Z)Landroid/support/v4/media/RatingCompat;

    move-result-object v0

    .line 335
    .restart local v0    # "rating":Landroid/support/v4/media/RatingCompat;
    goto :goto_40

    .line 331
    .end local v0    # "rating":Landroid/support/v4/media/RatingCompat;
    :pswitch_33
    invoke-static {p0}, Landroid/support/v4/media/RatingCompatApi21;->hasHeart(Ljava/lang/Object;)Z

    move-result v0

    invoke-static {v0}, Landroid/support/v4/media/RatingCompat;->newHeartRating(Z)Landroid/support/v4/media/RatingCompat;

    move-result-object v0

    .line 332
    .restart local v0    # "rating":Landroid/support/v4/media/RatingCompat;
    goto :goto_40

    .line 349
    .end local v0    # "rating":Landroid/support/v4/media/RatingCompat;
    :cond_3c
    invoke-static {v1}, Landroid/support/v4/media/RatingCompat;->newUnratedRating(I)Landroid/support/v4/media/RatingCompat;

    move-result-object v0

    .line 351
    .restart local v0    # "rating":Landroid/support/v4/media/RatingCompat;
    :goto_40
    iput-object p0, v0, Landroid/support/v4/media/RatingCompat;->mRatingObj:Ljava/lang/Object;

    .line 352
    return-object v0

    .line 323
    .end local v0    # "rating":Landroid/support/v4/media/RatingCompat;
    .end local v1    # "ratingStyle":I
    :cond_43
    :goto_43
    return-object v0

    :pswitch_data_44
    .packed-switch 0x1
        :pswitch_33
        :pswitch_2a
        :pswitch_21
        :pswitch_21
        :pswitch_21
        :pswitch_18
    .end packed-switch
.end method

.method public static newHeartRating(Z)Landroid/support/v4/media/RatingCompat;
    .registers 4
    .param p0, "hasHeart"    # Z

    .line 170
    new-instance v0, Landroid/support/v4/media/RatingCompat;

    if-eqz p0, :cond_7

    const/high16 v1, 0x3f800000    # 1.0f

    goto :goto_8

    :cond_7
    const/4 v1, 0x0

    :goto_8
    const/4 v2, 0x1

    invoke-direct {v0, v2, v1}, Landroid/support/v4/media/RatingCompat;-><init>(IF)V

    return-object v0
.end method

.method public static newPercentageRating(F)Landroid/support/v4/media/RatingCompat;
    .registers 3
    .param p0, "percent"    # F

    .line 228
    const/4 v0, 0x0

    cmpg-float v0, p0, v0

    if-ltz v0, :cond_13

    const/high16 v0, 0x42c80000    # 100.0f

    cmpl-float v0, p0, v0

    if-lez v0, :cond_c

    goto :goto_13

    .line 232
    :cond_c
    new-instance v0, Landroid/support/v4/media/RatingCompat;

    const/4 v1, 0x6

    invoke-direct {v0, v1, p0}, Landroid/support/v4/media/RatingCompat;-><init>(IF)V

    return-object v0

    .line 229
    :cond_13
    :goto_13
    const-string v0, "Rating"

    const-string v1, "Invalid percentage-based rating value"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 230
    const/4 v0, 0x0

    return-object v0
.end method

.method public static newStarRating(IF)Landroid/support/v4/media/RatingCompat;
    .registers 7
    .param p0, "starRatingStyle"    # I
    .param p1, "starRating"    # F

    .line 198
    const/high16 v0, -0x40800000    # -1.0f

    .line 199
    .local v0, "maxRating":F
    const/4 v1, 0x0

    packed-switch p0, :pswitch_data_44

    .line 210
    const-string v2, "Rating"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Invalid rating style ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ") for a star rating"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 211
    return-object v1

    .line 207
    :pswitch_22
    const/high16 v0, 0x40a00000    # 5.0f

    .line 208
    goto :goto_2b

    .line 204
    :pswitch_25
    const/high16 v0, 0x40800000    # 4.0f

    .line 205
    goto :goto_2b

    .line 201
    :pswitch_28
    const/high16 v0, 0x40400000    # 3.0f

    .line 202
    nop

    .line 213
    :goto_2b
    const/4 v2, 0x0

    cmpg-float v2, p1, v2

    if-ltz v2, :cond_3b

    cmpl-float v2, p1, v0

    if-lez v2, :cond_35

    goto :goto_3b

    .line 217
    :cond_35
    new-instance v1, Landroid/support/v4/media/RatingCompat;

    invoke-direct {v1, p0, p1}, Landroid/support/v4/media/RatingCompat;-><init>(IF)V

    return-object v1

    .line 214
    :cond_3b
    :goto_3b
    const-string v2, "Rating"

    const-string v3, "Trying to set out of range star-based rating"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 215
    return-object v1

    nop

    :pswitch_data_44
    .packed-switch 0x3
        :pswitch_28
        :pswitch_25
        :pswitch_22
    .end packed-switch
.end method

.method public static newThumbRating(Z)Landroid/support/v4/media/RatingCompat;
    .registers 4
    .param p0, "thumbIsUp"    # Z

    .line 181
    new-instance v0, Landroid/support/v4/media/RatingCompat;

    if-eqz p0, :cond_7

    const/high16 v1, 0x3f800000    # 1.0f

    goto :goto_8

    :cond_7
    const/4 v1, 0x0

    :goto_8
    const/4 v2, 0x2

    invoke-direct {v0, v2, v1}, Landroid/support/v4/media/RatingCompat;-><init>(IF)V

    return-object v0
.end method

.method public static newUnratedRating(I)Landroid/support/v4/media/RatingCompat;
    .registers 3
    .param p0, "ratingStyle"    # I

    .line 149
    packed-switch p0, :pswitch_data_e

    .line 158
    const/4 v0, 0x0

    return-object v0

    .line 156
    :pswitch_5
    new-instance v0, Landroid/support/v4/media/RatingCompat;

    const/high16 v1, -0x40800000    # -1.0f

    invoke-direct {v0, p0, v1}, Landroid/support/v4/media/RatingCompat;-><init>(IF)V

    return-object v0

    nop

    :pswitch_data_e
    .packed-switch 0x1
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
    .end packed-switch
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    .line 112
    iget v0, p0, Landroid/support/v4/media/RatingCompat;->mRatingStyle:I

    return v0
.end method

.method public getPercentRating()F
    .registers 3

    .line 305
    iget v0, p0, Landroid/support/v4/media/RatingCompat;->mRatingStyle:I

    const/4 v1, 0x6

    if-ne v0, v1, :cond_f

    invoke-virtual {p0}, Landroid/support/v4/media/RatingCompat;->isRated()Z

    move-result v0

    if-nez v0, :cond_c

    goto :goto_f

    .line 308
    :cond_c
    iget v0, p0, Landroid/support/v4/media/RatingCompat;->mRatingValue:F

    return v0

    .line 306
    :cond_f
    :goto_f
    const/high16 v0, -0x40800000    # -1.0f

    return v0
.end method

.method public getRating()Ljava/lang/Object;
    .registers 3

    .line 364
    iget-object v0, p0, Landroid/support/v4/media/RatingCompat;->mRatingObj:Ljava/lang/Object;

    if-nez v0, :cond_52

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-ge v0, v1, :cond_b

    goto :goto_52

    .line 368
    :cond_b
    invoke-virtual {p0}, Landroid/support/v4/media/RatingCompat;->isRated()Z

    move-result v0

    if-eqz v0, :cond_47

    .line 369
    iget v0, p0, Landroid/support/v4/media/RatingCompat;->mRatingStyle:I

    packed-switch v0, :pswitch_data_56

    goto :goto_45

    .line 382
    :pswitch_17
    invoke-virtual {p0}, Landroid/support/v4/media/RatingCompat;->getPercentRating()F

    move-result v0

    invoke-static {v0}, Landroid/support/v4/media/RatingCompatApi21;->newPercentageRating(F)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/media/RatingCompat;->mRatingObj:Ljava/lang/Object;

    goto :goto_45

    .line 379
    :pswitch_22
    iget v0, p0, Landroid/support/v4/media/RatingCompat;->mRatingStyle:I

    invoke-virtual {p0}, Landroid/support/v4/media/RatingCompat;->getStarRating()F

    move-result v1

    invoke-static {v0, v1}, Landroid/support/v4/media/RatingCompatApi21;->newStarRating(IF)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/media/RatingCompat;->mRatingObj:Ljava/lang/Object;

    .line 380
    goto :goto_4f

    .line 374
    :pswitch_2f
    invoke-virtual {p0}, Landroid/support/v4/media/RatingCompat;->isThumbUp()Z

    move-result v0

    invoke-static {v0}, Landroid/support/v4/media/RatingCompatApi21;->newThumbRating(Z)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/media/RatingCompat;->mRatingObj:Ljava/lang/Object;

    .line 375
    goto :goto_4f

    .line 371
    :pswitch_3a
    invoke-virtual {p0}, Landroid/support/v4/media/RatingCompat;->hasHeart()Z

    move-result v0

    invoke-static {v0}, Landroid/support/v4/media/RatingCompatApi21;->newHeartRating(Z)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/media/RatingCompat;->mRatingObj:Ljava/lang/Object;

    .line 372
    goto :goto_4f

    .line 384
    :goto_45
    const/4 v0, 0x0

    return-object v0

    .line 387
    :cond_47
    iget v0, p0, Landroid/support/v4/media/RatingCompat;->mRatingStyle:I

    invoke-static {v0}, Landroid/support/v4/media/RatingCompatApi21;->newUnratedRating(I)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/media/RatingCompat;->mRatingObj:Ljava/lang/Object;

    .line 389
    :goto_4f
    iget-object v0, p0, Landroid/support/v4/media/RatingCompat;->mRatingObj:Ljava/lang/Object;

    return-object v0

    .line 365
    :cond_52
    :goto_52
    iget-object v0, p0, Landroid/support/v4/media/RatingCompat;->mRatingObj:Ljava/lang/Object;

    return-object v0

    nop

    :pswitch_data_56
    .packed-switch 0x1
        :pswitch_3a
        :pswitch_2f
        :pswitch_22
        :pswitch_22
        :pswitch_22
        :pswitch_17
    .end packed-switch
.end method

.method public getRatingStyle()I
    .registers 2

    .line 252
    iget v0, p0, Landroid/support/v4/media/RatingCompat;->mRatingStyle:I

    return v0
.end method

.method public getStarRating()F
    .registers 2

    .line 287
    iget v0, p0, Landroid/support/v4/media/RatingCompat;->mRatingStyle:I

    packed-switch v0, :pswitch_data_12

    goto :goto_f

    .line 291
    :pswitch_6
    invoke-virtual {p0}, Landroid/support/v4/media/RatingCompat;->isRated()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 292
    iget v0, p0, Landroid/support/v4/media/RatingCompat;->mRatingValue:F

    return v0

    .line 295
    :cond_f
    :goto_f
    const/high16 v0, -0x40800000    # -1.0f

    return v0

    :pswitch_data_12
    .packed-switch 0x3
        :pswitch_6
        :pswitch_6
        :pswitch_6
    .end packed-switch
.end method

.method public hasHeart()Z
    .registers 5

    .line 261
    iget v0, p0, Landroid/support/v4/media/RatingCompat;->mRatingStyle:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eq v0, v2, :cond_7

    .line 262
    return v1

    .line 264
    :cond_7
    iget v0, p0, Landroid/support/v4/media/RatingCompat;->mRatingValue:F

    const/high16 v3, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v3

    if-nez v0, :cond_11

    move v1, v2

    nop

    :cond_11
    return v1
.end method

.method public isRated()Z
    .registers 3

    .line 241
    iget v0, p0, Landroid/support/v4/media/RatingCompat;->mRatingValue:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-ltz v0, :cond_9

    const/4 v0, 0x1

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return v0
.end method

.method public isThumbUp()Z
    .registers 4

    .line 274
    iget v0, p0, Landroid/support/v4/media/RatingCompat;->mRatingStyle:I

    const/4 v1, 0x0

    const/4 v2, 0x2

    if-eq v0, v2, :cond_7

    .line 275
    return v1

    .line 277
    :cond_7
    iget v0, p0, Landroid/support/v4/media/RatingCompat;->mRatingValue:F

    const/high16 v2, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v2

    if-nez v0, :cond_11

    const/4 v1, 0x1

    nop

    :cond_11
    return v1
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .line 106
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Rating:style="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroid/support/v4/media/RatingCompat;->mRatingStyle:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " rating="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroid/support/v4/media/RatingCompat;->mRatingValue:F

    const/4 v2, 0x0

    cmpg-float v1, v1, v2

    if-gez v1, :cond_1e

    const-string v1, "unrated"

    goto :goto_24

    :cond_1e
    iget v1, p0, Landroid/support/v4/media/RatingCompat;->mRatingValue:F

    invoke-static {v1}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v1

    :goto_24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .line 117
    iget v0, p0, Landroid/support/v4/media/RatingCompat;->mRatingStyle:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 118
    iget v0, p0, Landroid/support/v4/media/RatingCompat;->mRatingValue:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 119
    return-void
.end method
