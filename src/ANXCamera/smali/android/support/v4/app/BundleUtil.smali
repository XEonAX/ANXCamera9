.class Landroid/support/v4/app/BundleUtil;
.super Ljava/lang/Object;
.source "BundleUtil.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getBundleArrayFromBundle(Landroid/os/Bundle;Ljava/lang/String;)[Landroid/os/Bundle;
    .registers 5
    .param p0, "bundle"    # Landroid/os/Bundle;
    .param p1, "key"    # Ljava/lang/String;

    .line 18
    invoke-virtual {p0, p1}, Landroid/os/Bundle;->getParcelableArray(Ljava/lang/String;)[Landroid/os/Parcelable;

    move-result-object v0

    .line 19
    .local v0, "array":[Landroid/os/Parcelable;
    instance-of v1, v0, [Landroid/os/Bundle;

    if-nez v1, :cond_18

    if-nez v0, :cond_b

    goto :goto_18

    .line 22
    :cond_b
    array-length v1, v0

    const-class v2, [Landroid/os/Bundle;

    invoke-static {v0, v1, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;ILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Landroid/os/Bundle;

    .line 24
    .local v1, "typedArray":[Landroid/os/Bundle;
    invoke-virtual {p0, p1, v1}, Landroid/os/Bundle;->putParcelableArray(Ljava/lang/String;[Landroid/os/Parcelable;)V

    .line 25
    return-object v1

    .line 20
    .end local v1    # "typedArray":[Landroid/os/Bundle;
    :cond_18
    :goto_18
    move-object v1, v0

    check-cast v1, [Landroid/os/Bundle;

    return-object v1
.end method
