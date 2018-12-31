.class public final Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$Builder;
.source "LensSdkParamsProto.java"

# interfaces
.implements Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParamsOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$Builder<",
        "Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;",
        "Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;",
        ">;",
        "Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParamsOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 643
    invoke-static {}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->access$000()Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/protobuf/GeneratedMessageLite$Builder;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 644
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$1;)V
    .locals 0

    .line 636
    invoke-direct {p0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearAgsaVersionName()Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;
    .locals 1

    .line 775
    invoke-virtual {p0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->copyOnWrite()V

    .line 776
    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-static {v0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->access$500(Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;)V

    .line 777
    return-object p0
.end method

.method public clearArStickersAvailabilityStatus()Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;
    .locals 1

    .line 850
    invoke-virtual {p0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->copyOnWrite()V

    .line 851
    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-static {v0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->access$1000(Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;)V

    .line 852
    return-object p0
.end method

.method public clearLensAvailabilityStatus()Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;
    .locals 1

    .line 819
    invoke-virtual {p0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->copyOnWrite()V

    .line 820
    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-static {v0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->access$800(Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;)V

    .line 821
    return-object p0
.end method

.method public clearLensSdkVersion()Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;
    .locals 1

    .line 702
    invoke-virtual {p0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->copyOnWrite()V

    .line 703
    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-static {v0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->access$200(Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;)V

    .line 704
    return-object p0
.end method

.method public getAgsaVersionName()Ljava/lang/String;
    .locals 1

    .line 740
    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-virtual {v0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->getAgsaVersionName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getAgsaVersionNameBytes()Lcom/google/protobuf/ByteString;
    .locals 1

    .line 752
    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-virtual {v0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->getAgsaVersionNameBytes()Lcom/google/protobuf/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public getArStickersAvailabilityStatus()Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$LensAvailabilityStatus;
    .locals 1

    .line 836
    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-virtual {v0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->getArStickersAvailabilityStatus()Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$LensAvailabilityStatus;

    move-result-object v0

    return-object v0
.end method

.method public getLensAvailabilityStatus()Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$LensAvailabilityStatus;
    .locals 1

    .line 805
    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-virtual {v0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->getLensAvailabilityStatus()Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$LensAvailabilityStatus;

    move-result-object v0

    return-object v0
.end method

.method public getLensSdkVersion()Ljava/lang/String;
    .locals 1

    .line 667
    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-virtual {v0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->getLensSdkVersion()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLensSdkVersionBytes()Lcom/google/protobuf/ByteString;
    .locals 1

    .line 679
    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-virtual {v0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->getLensSdkVersionBytes()Lcom/google/protobuf/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public hasAgsaVersionName()Z
    .locals 1

    .line 729
    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-virtual {v0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->hasAgsaVersionName()Z

    move-result v0

    return v0
.end method

.method public hasArStickersAvailabilityStatus()Z
    .locals 1

    .line 829
    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-virtual {v0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->hasArStickersAvailabilityStatus()Z

    move-result v0

    return v0
.end method

.method public hasLensAvailabilityStatus()Z
    .locals 1

    .line 798
    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-virtual {v0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->hasLensAvailabilityStatus()Z

    move-result v0

    return v0
.end method

.method public hasLensSdkVersion()Z
    .locals 1

    .line 656
    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-virtual {v0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->hasLensSdkVersion()Z

    move-result v0

    return v0
.end method

.method public setAgsaVersionName(Ljava/lang/String;)Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;
    .locals 1

    .line 763
    invoke-virtual {p0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->copyOnWrite()V

    .line 764
    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-static {v0, p1}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->access$400(Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;Ljava/lang/String;)V

    .line 765
    return-object p0
.end method

.method public setAgsaVersionNameBytes(Lcom/google/protobuf/ByteString;)Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;
    .locals 1

    .line 788
    invoke-virtual {p0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->copyOnWrite()V

    .line 789
    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-static {v0, p1}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->access$600(Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;Lcom/google/protobuf/ByteString;)V

    .line 790
    return-object p0
.end method

.method public setArStickersAvailabilityStatus(Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$LensAvailabilityStatus;)Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;
    .locals 1

    .line 842
    invoke-virtual {p0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->copyOnWrite()V

    .line 843
    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-static {v0, p1}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->access$900(Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$LensAvailabilityStatus;)V

    .line 844
    return-object p0
.end method

.method public setLensAvailabilityStatus(Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$LensAvailabilityStatus;)Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;
    .locals 1

    .line 811
    invoke-virtual {p0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->copyOnWrite()V

    .line 812
    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-static {v0, p1}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->access$700(Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$LensAvailabilityStatus;)V

    .line 813
    return-object p0
.end method

.method public setLensSdkVersion(Ljava/lang/String;)Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;
    .locals 1

    .line 690
    invoke-virtual {p0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->copyOnWrite()V

    .line 691
    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-static {v0, p1}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->access$100(Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;Ljava/lang/String;)V

    .line 692
    return-object p0
.end method

.method public setLensSdkVersionBytes(Lcom/google/protobuf/ByteString;)Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;
    .locals 1

    .line 715
    invoke-virtual {p0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->copyOnWrite()V

    .line 716
    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-static {v0, p1}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->access$300(Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;Lcom/google/protobuf/ByteString;)V

    .line 717
    return-object p0
.end method
