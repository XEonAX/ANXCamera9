.class public Landroid/hardware/camera2/marshal/MarshalRegistryANX;
.super Ljava/lang/Object;
.source "MarshalRegistryANX.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/hardware/camera2/marshal/MarshalRegistryANX$MarshalToken;
    }
.end annotation


# static fields
.field private static final sMarshalLock:Ljava/lang/Object;

.field private static final sMarshalerMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Landroid/hardware/camera2/marshal/MarshalRegistryANX$MarshalToken<",
            "*>;",
            "Landroid/hardware/camera2/marshal/Marshaler<",
            "*>;>;"
        }
    .end annotation
.end field

.field private static final sRegisteredMarshalQueryables:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/hardware/camera2/marshal/MarshalQueryable<",
            "*>;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 134
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Landroid/hardware/camera2/marshal/MarshalRegistryANX;->sMarshalLock:Ljava/lang/Object;

    .line 136
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Landroid/hardware/camera2/marshal/MarshalRegistryANX;->sRegisteredMarshalQueryables:Ljava/util/List;

    .line 138
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Landroid/hardware/camera2/marshal/MarshalRegistryANX;->sMarshalerMap:Ljava/util/HashMap;

    return-void
.end method

.method private constructor <init>()V
    .registers 2

    .line 141
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 142
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method public static getMarshaler(Landroid/hardware/camera2/utils/TypeReference;I)Landroid/hardware/camera2/marshal/Marshaler;
    .registers 9
    .param p1, "nativeType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/hardware/camera2/utils/TypeReference<",
            "TT;>;I)",
            "Landroid/hardware/camera2/marshal/Marshaler<",
            "TT;>;"
        }
    .end annotation

    .line 59
    .local p0, "typeToken":Landroid/hardware/camera2/utils/TypeReference;, "Landroid/hardware/camera2/utils/TypeReference<TT;>;"
    sget-object v0, Landroid/hardware/camera2/marshal/MarshalRegistryANX;->sMarshalLock:Ljava/lang/Object;

    monitor-enter v0

    .line 62
    :try_start_3
    new-instance v1, Landroid/hardware/camera2/marshal/MarshalRegistryANX$MarshalToken;

    invoke-direct {v1, p0, p1}, Landroid/hardware/camera2/marshal/MarshalRegistryANX$MarshalToken;-><init>(Landroid/hardware/camera2/utils/TypeReference;I)V

    .line 68
    .local v1, "marshalToken":Landroid/hardware/camera2/marshal/MarshalRegistryANX$MarshalToken;, "Landroid/hardware/camera2/marshal/MarshalRegistryANX$MarshalToken<TT;>;"
    sget-object v2, Landroid/hardware/camera2/marshal/MarshalRegistryANX;->sMarshalerMap:Ljava/util/HashMap;

    .line 69
    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/hardware/camera2/marshal/Marshaler;

    .line 71
    .local v2, "marshaler":Landroid/hardware/camera2/marshal/Marshaler;, "Landroid/hardware/camera2/marshal/Marshaler<TT;>;"
    if-nez v2, :cond_6d

    .line 73
    sget-object v3, Landroid/hardware/camera2/marshal/MarshalRegistryANX;->sRegisteredMarshalQueryables:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-eqz v3, :cond_65

    .line 78
    sget-object v3, Landroid/hardware/camera2/marshal/MarshalRegistryANX;->sRegisteredMarshalQueryables:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_20
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3a

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/hardware/camera2/marshal/MarshalQueryable;

    .line 80
    .local v4, "potentialMarshaler":Landroid/hardware/camera2/marshal/MarshalQueryable;, "Landroid/hardware/camera2/marshal/MarshalQueryable<*>;"
    move-object v5, v4

    .line 83
    .local v5, "castedPotential":Landroid/hardware/camera2/marshal/MarshalQueryable;, "Landroid/hardware/camera2/marshal/MarshalQueryable<TT;>;"
    invoke-interface {v5, p0, p1}, Landroid/hardware/camera2/marshal/MarshalQueryable;->isTypeMappingSupported(Landroid/hardware/camera2/utils/TypeReference;I)Z

    move-result v6

    if-eqz v6, :cond_39

    .line 84
    invoke-interface {v5, p0, p1}, Landroid/hardware/camera2/marshal/MarshalQueryable;->createMarshaler(Landroid/hardware/camera2/utils/TypeReference;I)Landroid/hardware/camera2/marshal/Marshaler;

    move-result-object v3

    move-object v2, v3

    .line 85
    goto :goto_3a

    .line 87
    .end local v4    # "potentialMarshaler":Landroid/hardware/camera2/marshal/MarshalQueryable;, "Landroid/hardware/camera2/marshal/MarshalQueryable<*>;"
    .end local v5    # "castedPotential":Landroid/hardware/camera2/marshal/MarshalQueryable;, "Landroid/hardware/camera2/marshal/MarshalQueryable<TT;>;"
    :cond_39
    goto :goto_20

    .line 89
    :cond_3a
    :goto_3a
    if-eqz v2, :cond_42

    .line 98
    sget-object v3, Landroid/hardware/camera2/marshal/MarshalRegistryANX;->sMarshalerMap:Ljava/util/HashMap;

    invoke-virtual {v3, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_6d

    .line 90
    :cond_42
    new-instance v3, Ljava/lang/UnsupportedOperationException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Could not find marshaler that matches the requested combination of type reference "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v5, " and native type "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    invoke-static {p1}, Landroid/hardware/camera2/marshal/MarshalHelpers;->toStringNativeType(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 74
    :cond_65
    new-instance v3, Ljava/lang/AssertionError;

    const-string v4, "No available query marshalers registered"

    invoke-direct {v3, v4}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v3

    .line 101
    :cond_6d
    :goto_6d
    monitor-exit v0

    return-object v2

    .line 102
    .end local v1    # "marshalToken":Landroid/hardware/camera2/marshal/MarshalRegistryANX$MarshalToken;, "Landroid/hardware/camera2/marshal/MarshalRegistryANX$MarshalToken<TT;>;"
    .end local v2    # "marshaler":Landroid/hardware/camera2/marshal/Marshaler;, "Landroid/hardware/camera2/marshal/Marshaler<TT;>;"
    :catchall_6f
    move-exception v1

    monitor-exit v0
    :try_end_71
    .catchall {:try_start_3 .. :try_end_71} :catchall_6f

    throw v1
.end method

.method public static registerMarshalQueryable(Landroid/hardware/camera2/marshal/MarshalQueryable;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/hardware/camera2/marshal/MarshalQueryable<",
            "TT;>;)V"
        }
    .end annotation

    .line 40
    .local p0, "queryable":Landroid/hardware/camera2/marshal/MarshalQueryable;, "Landroid/hardware/camera2/marshal/MarshalQueryable<TT;>;"
    sget-object v0, Landroid/hardware/camera2/marshal/MarshalRegistryANX;->sMarshalLock:Ljava/lang/Object;

    monitor-enter v0

    .line 41
    :try_start_3
    sget-object v1, Landroid/hardware/camera2/marshal/MarshalRegistryANX;->sRegisteredMarshalQueryables:Ljava/util/List;

    invoke-interface {v1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 42
    monitor-exit v0

    .line 43
    return-void

    .line 42
    :catchall_a
    move-exception v1

    monitor-exit v0
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v1
.end method
