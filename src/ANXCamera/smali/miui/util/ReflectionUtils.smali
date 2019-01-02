.class public Lmiui/util/ReflectionUtils;
.super Ljava/lang/Object;
.source "ReflectionUtils.java"


# static fields
.field public static final BOOTCLASSLOADER:Ljava/lang/ClassLoader;

.field private static final TAG:Ljava/lang/String; = "ReflectionUtils"

.field private static final constructorCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Constructor<",
            "*>;>;"
        }
    .end annotation
.end field

.field private static final fieldCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Field;",
            ">;"
        }
    .end annotation
.end field

.field private static final methodCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Method;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 27
    invoke-static {}, Ljava/lang/ClassLoader;->getSystemClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    sput-object v0, Lmiui/util/ReflectionUtils;->BOOTCLASSLOADER:Ljava/lang/ClassLoader;

    .line 29
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lmiui/util/ReflectionUtils;->fieldCache:Ljava/util/HashMap;

    .line 30
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lmiui/util/ReflectionUtils;->methodCache:Ljava/util/HashMap;

    .line 31
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lmiui/util/ReflectionUtils;->constructorCache:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static varargs callMethod(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "methodName"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "TT;>;[",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .line 800
    .local p2, "returnValueClazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0, p1, p3}, Lmiui/util/ReflectionUtils;->findMethodBestMatch(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-virtual {v0, p0, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 801
    .local v0, "returnedValue":Ljava/lang/Object;
    invoke-static {v0, p2}, Lmiui/util/ReflectionUtils;->checkMethodReturnValue(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public static varargs callStaticMethod(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8
    .param p1, "methodName"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "TT;>;[",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .line 845
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "returnValueClazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-static {p0, p1, p3}, Lmiui/util/ReflectionUtils;->findMethodBestMatch(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 847
    .local v0, "method":Ljava/lang/reflect/Method;
    const/4 v1, 0x0

    :try_start_5
    invoke-virtual {v0, v1, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 848
    .local v1, "returnedValue":Ljava/lang/Object;
    invoke-static {v1, p2}, Lmiui/util/ReflectionUtils;->checkMethodReturnValue(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2
    :try_end_d
    .catch Ljava/lang/NullPointerException; {:try_start_5 .. :try_end_d} :catch_e

    return-object v2

    .line 849
    .end local v1    # "returnedValue":Ljava/lang/Object;
    :catch_e
    move-exception v1

    .line 850
    .local v1, "ex":Ljava/lang/NullPointerException;
    const-string v2, "ReflectionUtils"

    const-string v3, ""

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 854
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-direct {v2, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method private static checkFieldValue(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 4
    .param p0, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 773
    .local p1, "fieldClazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v0, Ljava/lang/Void;

    if-eq p1, v0, :cond_1f

    .line 776
    if-nez p0, :cond_8

    .line 777
    const/4 v0, 0x0

    return-object v0

    .line 779
    :cond_8
    if-nez p1, :cond_b

    .line 780
    return-object p0

    .line 782
    :cond_b
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, p1, v1}, Lorg/apache/miui/commons/lang3/ClassUtils;->isAssignable(Ljava/lang/Class;Ljava/lang/Class;Z)Z

    move-result v0

    if-eqz v0, :cond_17

    .line 783
    return-object p0

    .line 786
    :cond_17
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "fieldClazz"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 774
    :cond_1f
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "fieldClazz"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static checkMethodReturnValue(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 4
    .param p0, "returnedValue"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 889
    .local p1, "returnValueClazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    if-nez p0, :cond_4

    .line 890
    return-object v0

    .line 892
    :cond_4
    if-nez p1, :cond_7

    .line 893
    return-object p0

    .line 895
    :cond_7
    const-class v1, Ljava/lang/Void;

    if-ne p1, v1, :cond_c

    .line 896
    return-object v0

    .line 898
    :cond_c
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, p1, v1}, Lorg/apache/miui/commons/lang3/ClassUtils;->isAssignable(Ljava/lang/Class;Ljava/lang/Class;Z)Z

    move-result v0

    if-eqz v0, :cond_18

    .line 899
    return-object p0

    .line 902
    :cond_18
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "returnValueClazz"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static findClass(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;
    .registers 3
    .param p0, "className"    # Ljava/lang/String;
    .param p1, "classLoader"    # Ljava/lang/ClassLoader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/ClassLoader;",
            ")",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 56
    if-nez p1, :cond_4

    .line 57
    sget-object p1, Lmiui/util/ReflectionUtils;->BOOTCLASSLOADER:Ljava/lang/ClassLoader;

    .line 58
    :cond_4
    const/4 v0, 0x0

    invoke-static {p1, p0, v0}, Lorg/apache/miui/commons/lang3/ClassUtils;->getClass(Ljava/lang/ClassLoader;Ljava/lang/String;Z)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public static varargs findConstructorBestMatch(Ljava/lang/Class;[Ljava/lang/Class;)Ljava/lang/reflect/Constructor;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;[",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/reflect/Constructor<",
            "*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .line 495
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p1, "parameterTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 496
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-static {p1}, Lmiui/util/ReflectionUtils;->getParametersString([Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 497
    const-string v1, "#bestmatch"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 498
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 500
    .local v1, "fullConstructorName":Ljava/lang/String;
    sget-object v2, Lmiui/util/ReflectionUtils;->constructorCache:Ljava/util/HashMap;

    monitor-enter v2

    .line 501
    :try_start_1c
    sget-object v3, Lmiui/util/ReflectionUtils;->constructorCache:Ljava/util/HashMap;

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_36

    .line 502
    sget-object v3, Lmiui/util/ReflectionUtils;->constructorCache:Ljava/util/HashMap;

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/reflect/Constructor;

    .line 503
    .local v3, "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    if-eqz v3, :cond_30

    .line 505
    monitor-exit v2

    return-object v3

    .line 504
    :cond_30
    new-instance v4, Ljava/lang/NoSuchMethodException;

    invoke-direct {v4, v1}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 507
    .end local v3    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    :cond_36
    monitor-exit v2
    :try_end_37
    .catchall {:try_start_1c .. :try_end_37} :catchall_9b

    .line 510
    :try_start_37
    invoke-static {p0, p1}, Lmiui/util/ReflectionUtils;->findConstructorExact(Ljava/lang/Class;[Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v2

    .line 511
    .local v2, "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    sget-object v3, Lmiui/util/ReflectionUtils;->constructorCache:Ljava/util/HashMap;

    monitor-enter v3
    :try_end_3e
    .catch Ljava/lang/NoSuchMethodException; {:try_start_37 .. :try_end_3e} :catch_48

    .line 512
    :try_start_3e
    sget-object v4, Lmiui/util/ReflectionUtils;->constructorCache:Ljava/util/HashMap;

    invoke-virtual {v4, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 513
    monitor-exit v3

    .line 514
    return-object v2

    .line 513
    :catchall_45
    move-exception v4

    monitor-exit v3
    :try_end_47
    .catchall {:try_start_3e .. :try_end_47} :catchall_45

    :try_start_47
    throw v4
    :try_end_48
    .catch Ljava/lang/NoSuchMethodException; {:try_start_47 .. :try_end_48} :catch_48

    .line 515
    .end local v2    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    :catch_48
    move-exception v2

    .line 518
    const/4 v2, 0x0

    .line 519
    .local v2, "bestMatch":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredConstructors()[Ljava/lang/reflect/Constructor;

    move-result-object v3

    .line 520
    .local v3, "constructors":[Ljava/lang/reflect/Constructor;, "[Ljava/lang/reflect/Constructor<*>;"
    array-length v4, v3

    const/4 v5, 0x0

    move-object v6, v2

    .end local v2    # "bestMatch":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .local v6, "bestMatch":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    :goto_51
    const/4 v2, 0x1

    if-ge v5, v4, :cond_75

    aget-object v7, v3, v5

    .line 522
    .local v7, "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    invoke-virtual {v7}, Ljava/lang/reflect/Constructor;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v8

    invoke-static {p1, v8, v2}, Lorg/apache/miui/commons/lang3/ClassUtils;->isAssignable([Ljava/lang/Class;[Ljava/lang/Class;Z)Z

    move-result v2

    if-eqz v2, :cond_72

    .line 524
    if-eqz v6, :cond_70

    .line 525
    invoke-virtual {v7}, Ljava/lang/reflect/Constructor;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v2

    .line 526
    invoke-virtual {v6}, Ljava/lang/reflect/Constructor;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v8

    .line 524
    invoke-static {v2, v8, p1}, Lorg/apache/miui/commons/lang3/reflect/MemberUtils;->compareParameterTypes([Ljava/lang/Class;[Ljava/lang/Class;[Ljava/lang/Class;)I

    move-result v2

    if-gez v2, :cond_72

    .line 528
    :cond_70
    move-object v2, v7

    .line 520
    .end local v6    # "bestMatch":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .end local v7    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .restart local v2    # "bestMatch":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    move-object v6, v2

    .end local v2    # "bestMatch":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .restart local v6    # "bestMatch":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    :cond_72
    add-int/lit8 v5, v5, 0x1

    goto :goto_51

    .line 533
    :cond_75
    if-eqz v6, :cond_87

    .line 534
    invoke-virtual {v6, v2}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    .line 535
    sget-object v2, Lmiui/util/ReflectionUtils;->constructorCache:Ljava/util/HashMap;

    monitor-enter v2

    .line 536
    :try_start_7d
    sget-object v4, Lmiui/util/ReflectionUtils;->constructorCache:Ljava/util/HashMap;

    invoke-virtual {v4, v1, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 537
    monitor-exit v2

    .line 538
    return-object v6

    .line 537
    :catchall_84
    move-exception v4

    monitor-exit v2
    :try_end_86
    .catchall {:try_start_7d .. :try_end_86} :catchall_84

    throw v4

    .line 540
    :cond_87
    new-instance v2, Ljava/lang/NoSuchMethodException;

    invoke-direct {v2, v1}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    move-object v4, v2

    .line 541
    .local v4, "e":Ljava/lang/NoSuchMethodException;
    sget-object v5, Lmiui/util/ReflectionUtils;->constructorCache:Ljava/util/HashMap;

    monitor-enter v5

    .line 542
    :try_start_90
    sget-object v2, Lmiui/util/ReflectionUtils;->constructorCache:Ljava/util/HashMap;

    const/4 v7, 0x0

    invoke-virtual {v2, v1, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 543
    monitor-exit v5
    :try_end_97
    .catchall {:try_start_90 .. :try_end_97} :catchall_98

    .line 544
    throw v4

    .line 543
    :catchall_98
    move-exception v2

    :try_start_99
    monitor-exit v5
    :try_end_9a
    .catchall {:try_start_99 .. :try_end_9a} :catchall_98

    throw v2

    .line 507
    .end local v3    # "constructors":[Ljava/lang/reflect/Constructor;, "[Ljava/lang/reflect/Constructor<*>;"
    .end local v4    # "e":Ljava/lang/NoSuchMethodException;
    .end local v6    # "bestMatch":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    :catchall_9b
    move-exception v3

    :try_start_9c
    monitor-exit v2
    :try_end_9d
    .catchall {:try_start_9c .. :try_end_9d} :catchall_9b

    throw v3
.end method

.method public static varargs findConstructorBestMatch(Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/reflect/Constructor;
    .registers 3
    .param p1, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/reflect/Constructor<",
            "*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .line 571
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p1}, Lmiui/util/ReflectionUtils;->getParameterTypes([Ljava/lang/Object;)[Ljava/lang/Class;

    move-result-object v0

    invoke-static {p0, v0}, Lmiui/util/ReflectionUtils;->findConstructorBestMatch(Ljava/lang/Class;[Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    return-object v0
.end method

.method public static varargs findConstructorExact(Ljava/lang/Class;[Ljava/lang/Class;)Ljava/lang/reflect/Constructor;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;[",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/reflect/Constructor<",
            "*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .line 443
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p1, "parameterTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 444
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-static {p1}, Lmiui/util/ReflectionUtils;->getParametersString([Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 445
    const-string v1, "#exact"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 446
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 448
    .local v1, "fullConstructorName":Ljava/lang/String;
    sget-object v2, Lmiui/util/ReflectionUtils;->constructorCache:Ljava/util/HashMap;

    monitor-enter v2

    .line 449
    :try_start_1c
    sget-object v3, Lmiui/util/ReflectionUtils;->constructorCache:Ljava/util/HashMap;

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_36

    .line 450
    sget-object v3, Lmiui/util/ReflectionUtils;->constructorCache:Ljava/util/HashMap;

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/reflect/Constructor;

    .line 451
    .local v3, "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    if-eqz v3, :cond_30

    .line 453
    monitor-exit v2

    return-object v3

    .line 452
    :cond_30
    new-instance v4, Ljava/lang/NoSuchMethodException;

    invoke-direct {v4, v1}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 455
    .end local v3    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    :cond_36
    monitor-exit v2
    :try_end_37
    .catchall {:try_start_1c .. :try_end_37} :catchall_5c

    .line 458
    :try_start_37
    invoke-virtual {p0, p1}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v2

    .line 459
    .local v2, "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    .line 460
    sget-object v3, Lmiui/util/ReflectionUtils;->constructorCache:Ljava/util/HashMap;

    monitor-enter v3
    :try_end_42
    .catch Ljava/lang/NoSuchMethodException; {:try_start_37 .. :try_end_42} :catch_4c

    .line 461
    :try_start_42
    sget-object v4, Lmiui/util/ReflectionUtils;->constructorCache:Ljava/util/HashMap;

    invoke-virtual {v4, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 462
    monitor-exit v3

    .line 463
    return-object v2

    .line 462
    :catchall_49
    move-exception v4

    monitor-exit v3
    :try_end_4b
    .catchall {:try_start_42 .. :try_end_4b} :catchall_49

    :try_start_4b
    throw v4
    :try_end_4c
    .catch Ljava/lang/NoSuchMethodException; {:try_start_4b .. :try_end_4c} :catch_4c

    .line 464
    .end local v2    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    :catch_4c
    move-exception v2

    move-object v3, v2

    .line 465
    .local v3, "e":Ljava/lang/NoSuchMethodException;
    sget-object v4, Lmiui/util/ReflectionUtils;->constructorCache:Ljava/util/HashMap;

    monitor-enter v4

    .line 466
    :try_start_51
    sget-object v2, Lmiui/util/ReflectionUtils;->constructorCache:Ljava/util/HashMap;

    const/4 v5, 0x0

    invoke-virtual {v2, v1, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 467
    monitor-exit v4
    :try_end_58
    .catchall {:try_start_51 .. :try_end_58} :catchall_59

    .line 468
    throw v3

    .line 467
    :catchall_59
    move-exception v2

    :try_start_5a
    monitor-exit v4
    :try_end_5b
    .catchall {:try_start_5a .. :try_end_5b} :catchall_59

    throw v2

    .line 455
    .end local v3    # "e":Ljava/lang/NoSuchMethodException;
    :catchall_5c
    move-exception v3

    :try_start_5d
    monitor-exit v2
    :try_end_5e
    .catchall {:try_start_5d .. :try_end_5e} :catchall_5c

    throw v3
.end method

.method public static findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;
    .registers 8
    .param p1, "fieldName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/reflect/Field;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchFieldException;
        }
    .end annotation

    .line 96
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 97
    .local v0, "sb":Ljava/lang/StringBuilder;
    const/16 v1, 0x23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 98
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 101
    .local v1, "fullFieldName":Ljava/lang/String;
    sget-object v2, Lmiui/util/ReflectionUtils;->fieldCache:Ljava/util/HashMap;

    monitor-enter v2

    .line 102
    :try_start_18
    sget-object v3, Lmiui/util/ReflectionUtils;->fieldCache:Ljava/util/HashMap;

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_32

    .line 103
    sget-object v3, Lmiui/util/ReflectionUtils;->fieldCache:Ljava/util/HashMap;

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/reflect/Field;

    .line 104
    .local v3, "field":Ljava/lang/reflect/Field;
    if-eqz v3, :cond_2c

    .line 106
    monitor-exit v2

    return-object v3

    .line 105
    :cond_2c
    new-instance v4, Ljava/lang/NoSuchFieldException;

    invoke-direct {v4, v1}, Ljava/lang/NoSuchFieldException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 108
    .end local v3    # "field":Ljava/lang/reflect/Field;
    :cond_32
    monitor-exit v2
    :try_end_33
    .catchall {:try_start_18 .. :try_end_33} :catchall_58

    .line 111
    :try_start_33
    invoke-static {p0, p1}, Lmiui/util/ReflectionUtils;->findFieldRecursiveImpl(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    .line 112
    .local v2, "field":Ljava/lang/reflect/Field;
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 113
    sget-object v3, Lmiui/util/ReflectionUtils;->fieldCache:Ljava/util/HashMap;

    monitor-enter v3
    :try_end_3e
    .catch Ljava/lang/NoSuchFieldException; {:try_start_33 .. :try_end_3e} :catch_48

    .line 114
    :try_start_3e
    sget-object v4, Lmiui/util/ReflectionUtils;->fieldCache:Ljava/util/HashMap;

    invoke-virtual {v4, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    monitor-exit v3

    .line 116
    return-object v2

    .line 115
    :catchall_45
    move-exception v4

    monitor-exit v3
    :try_end_47
    .catchall {:try_start_3e .. :try_end_47} :catchall_45

    :try_start_47
    throw v4
    :try_end_48
    .catch Ljava/lang/NoSuchFieldException; {:try_start_47 .. :try_end_48} :catch_48

    .line 117
    .end local v2    # "field":Ljava/lang/reflect/Field;
    :catch_48
    move-exception v2

    move-object v3, v2

    .line 118
    .local v3, "e":Ljava/lang/NoSuchFieldException;
    sget-object v4, Lmiui/util/ReflectionUtils;->fieldCache:Ljava/util/HashMap;

    monitor-enter v4

    .line 119
    :try_start_4d
    sget-object v2, Lmiui/util/ReflectionUtils;->fieldCache:Ljava/util/HashMap;

    const/4 v5, 0x0

    invoke-virtual {v2, v1, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    monitor-exit v4
    :try_end_54
    .catchall {:try_start_4d .. :try_end_54} :catchall_55

    .line 121
    throw v3

    .line 120
    :catchall_55
    move-exception v2

    :try_start_56
    monitor-exit v4
    :try_end_57
    .catchall {:try_start_56 .. :try_end_57} :catchall_55

    throw v2

    .line 108
    .end local v3    # "e":Ljava/lang/NoSuchFieldException;
    :catchall_58
    move-exception v3

    :try_start_59
    monitor-exit v2
    :try_end_5a
    .catchall {:try_start_59 .. :try_end_5a} :catchall_58

    throw v3
.end method

.method private static findFieldRecursiveImpl(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;
    .registers 4
    .param p1, "fieldName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/reflect/Field;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchFieldException;
        }
    .end annotation

    .line 143
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    invoke-virtual {p0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0
    :try_end_4
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_4} :catch_5

    return-object v0

    .line 144
    :catch_5
    move-exception v0

    .line 146
    .local v0, "e":Ljava/lang/NoSuchFieldException;
    :goto_6
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object p0

    .line 147
    if-eqz p0, :cond_1c

    const-class v1, Ljava/lang/Object;

    invoke-virtual {p0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1b

    .line 151
    :try_start_14
    invoke-virtual {p0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1
    :try_end_18
    .catch Ljava/lang/NoSuchFieldException; {:try_start_14 .. :try_end_18} :catch_19

    return-object v1

    .line 152
    :catch_19
    move-exception v1

    .line 153
    goto :goto_6

    .line 148
    :cond_1b
    nop

    .line 155
    :cond_1c
    throw v0
.end method

.method public static varargs findMethodBestMatch(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .registers 12
    .param p1, "methodName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .line 290
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "parameterTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 291
    .local v0, "sb":Ljava/lang/StringBuilder;
    const/16 v1, 0x23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 292
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 293
    invoke-static {p2}, Lmiui/util/ReflectionUtils;->getParametersString([Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 294
    const-string v1, "#bestmatch"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 295
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 297
    .local v1, "fullMethodName":Ljava/lang/String;
    sget-object v2, Lmiui/util/ReflectionUtils;->methodCache:Ljava/util/HashMap;

    monitor-enter v2

    .line 298
    :try_start_24
    sget-object v3, Lmiui/util/ReflectionUtils;->methodCache:Ljava/util/HashMap;

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3e

    .line 299
    sget-object v3, Lmiui/util/ReflectionUtils;->methodCache:Ljava/util/HashMap;

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/reflect/Method;

    .line 300
    .local v3, "method":Ljava/lang/reflect/Method;
    if-eqz v3, :cond_38

    .line 302
    monitor-exit v2

    return-object v3

    .line 301
    :cond_38
    new-instance v4, Ljava/lang/NoSuchMethodException;

    invoke-direct {v4, v1}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 304
    .end local v3    # "method":Ljava/lang/reflect/Method;
    :cond_3e
    monitor-exit v2
    :try_end_3f
    .catchall {:try_start_24 .. :try_end_3f} :catchall_ad

    .line 307
    :try_start_3f
    invoke-static {p0, p1, p2}, Lmiui/util/ReflectionUtils;->findMethodExact(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 308
    .local v2, "method":Ljava/lang/reflect/Method;
    sget-object v3, Lmiui/util/ReflectionUtils;->methodCache:Ljava/util/HashMap;

    monitor-enter v3
    :try_end_46
    .catch Ljava/lang/NoSuchMethodException; {:try_start_3f .. :try_end_46} :catch_50

    .line 309
    :try_start_46
    sget-object v4, Lmiui/util/ReflectionUtils;->methodCache:Ljava/util/HashMap;

    invoke-virtual {v4, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 310
    monitor-exit v3

    .line 311
    return-object v2

    .line 310
    :catchall_4d
    move-exception v4

    monitor-exit v3
    :try_end_4f
    .catchall {:try_start_46 .. :try_end_4f} :catchall_4d

    :try_start_4f
    throw v4
    :try_end_50
    .catch Ljava/lang/NoSuchMethodException; {:try_start_4f .. :try_end_50} :catch_50

    .line 312
    .end local v2    # "method":Ljava/lang/reflect/Method;
    :catch_50
    move-exception v2

    .line 315
    const/4 v2, 0x0

    .line 316
    .local v2, "bestMatch":Ljava/lang/reflect/Method;
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;

    move-result-object v3

    .line 317
    .local v3, "methods":[Ljava/lang/reflect/Method;
    array-length v4, v3

    const/4 v5, 0x0

    move-object v6, v2

    .end local v2    # "bestMatch":Ljava/lang/reflect/Method;
    .local v6, "bestMatch":Ljava/lang/reflect/Method;
    :goto_59
    const/4 v2, 0x1

    if-ge v5, v4, :cond_87

    aget-object v7, v3, v5

    .line 319
    .local v7, "method":Ljava/lang/reflect/Method;
    invoke-virtual {v7}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_84

    .line 320
    invoke-virtual {v7}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v8

    invoke-static {p2, v8, v2}, Lorg/apache/miui/commons/lang3/ClassUtils;->isAssignable([Ljava/lang/Class;[Ljava/lang/Class;Z)Z

    move-result v2

    if-eqz v2, :cond_84

    .line 322
    if-eqz v6, :cond_82

    .line 323
    invoke-virtual {v7}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v2

    .line 324
    invoke-virtual {v6}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v8

    .line 322
    invoke-static {v2, v8, p2}, Lorg/apache/miui/commons/lang3/reflect/MemberUtils;->compareParameterTypes([Ljava/lang/Class;[Ljava/lang/Class;[Ljava/lang/Class;)I

    move-result v2

    if-gez v2, :cond_84

    .line 326
    :cond_82
    move-object v2, v7

    .line 317
    .end local v6    # "bestMatch":Ljava/lang/reflect/Method;
    .end local v7    # "method":Ljava/lang/reflect/Method;
    .restart local v2    # "bestMatch":Ljava/lang/reflect/Method;
    move-object v6, v2

    .end local v2    # "bestMatch":Ljava/lang/reflect/Method;
    .restart local v6    # "bestMatch":Ljava/lang/reflect/Method;
    :cond_84
    add-int/lit8 v5, v5, 0x1

    goto :goto_59

    .line 331
    :cond_87
    if-eqz v6, :cond_99

    .line 332
    invoke-virtual {v6, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 333
    sget-object v2, Lmiui/util/ReflectionUtils;->methodCache:Ljava/util/HashMap;

    monitor-enter v2

    .line 334
    :try_start_8f
    sget-object v4, Lmiui/util/ReflectionUtils;->methodCache:Ljava/util/HashMap;

    invoke-virtual {v4, v1, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 335
    monitor-exit v2

    .line 336
    return-object v6

    .line 335
    :catchall_96
    move-exception v4

    monitor-exit v2
    :try_end_98
    .catchall {:try_start_8f .. :try_end_98} :catchall_96

    throw v4

    .line 338
    :cond_99
    new-instance v2, Ljava/lang/NoSuchMethodException;

    invoke-direct {v2, v1}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    move-object v4, v2

    .line 339
    .local v4, "e":Ljava/lang/NoSuchMethodException;
    sget-object v5, Lmiui/util/ReflectionUtils;->methodCache:Ljava/util/HashMap;

    monitor-enter v5

    .line 340
    :try_start_a2
    sget-object v2, Lmiui/util/ReflectionUtils;->methodCache:Ljava/util/HashMap;

    const/4 v7, 0x0

    invoke-virtual {v2, v1, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 341
    monitor-exit v5
    :try_end_a9
    .catchall {:try_start_a2 .. :try_end_a9} :catchall_aa

    .line 342
    throw v4

    .line 341
    :catchall_aa
    move-exception v2

    :try_start_ab
    monitor-exit v5
    :try_end_ac
    .catchall {:try_start_ab .. :try_end_ac} :catchall_aa

    throw v2

    .line 304
    .end local v3    # "methods":[Ljava/lang/reflect/Method;
    .end local v4    # "e":Ljava/lang/NoSuchMethodException;
    .end local v6    # "bestMatch":Ljava/lang/reflect/Method;
    :catchall_ad
    move-exception v3

    :try_start_ae
    monitor-exit v2
    :try_end_af
    .catchall {:try_start_ae .. :try_end_af} :catchall_ad

    throw v3
.end method

.method public static varargs findMethodBestMatch(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/reflect/Method;
    .registers 4
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .line 375
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p2}, Lmiui/util/ReflectionUtils;->getParameterTypes([Ljava/lang/Object;)[Ljava/lang/Class;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lmiui/util/ReflectionUtils;->findMethodBestMatch(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    return-object v0
.end method

.method public static varargs findMethodExact(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .registers 9
    .param p1, "methodName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .line 231
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "parameterTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 232
    .local v0, "sb":Ljava/lang/StringBuilder;
    const/16 v1, 0x23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 233
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 234
    invoke-static {p2}, Lmiui/util/ReflectionUtils;->getParametersString([Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 235
    const-string v1, "#exact"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 236
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 238
    .local v1, "fullMethodName":Ljava/lang/String;
    sget-object v2, Lmiui/util/ReflectionUtils;->methodCache:Ljava/util/HashMap;

    monitor-enter v2

    .line 239
    :try_start_24
    sget-object v3, Lmiui/util/ReflectionUtils;->methodCache:Ljava/util/HashMap;

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3e

    .line 240
    sget-object v3, Lmiui/util/ReflectionUtils;->methodCache:Ljava/util/HashMap;

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/reflect/Method;

    .line 241
    .local v3, "method":Ljava/lang/reflect/Method;
    if-eqz v3, :cond_38

    .line 243
    monitor-exit v2

    return-object v3

    .line 242
    :cond_38
    new-instance v4, Ljava/lang/NoSuchMethodException;

    invoke-direct {v4, v1}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 245
    .end local v3    # "method":Ljava/lang/reflect/Method;
    :cond_3e
    monitor-exit v2
    :try_end_3f
    .catchall {:try_start_24 .. :try_end_3f} :catchall_64

    .line 248
    :try_start_3f
    invoke-virtual {p0, p1, p2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 249
    .local v2, "method":Ljava/lang/reflect/Method;
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 250
    sget-object v3, Lmiui/util/ReflectionUtils;->methodCache:Ljava/util/HashMap;

    monitor-enter v3
    :try_end_4a
    .catch Ljava/lang/NoSuchMethodException; {:try_start_3f .. :try_end_4a} :catch_54

    .line 251
    :try_start_4a
    sget-object v4, Lmiui/util/ReflectionUtils;->methodCache:Ljava/util/HashMap;

    invoke-virtual {v4, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 252
    monitor-exit v3

    .line 253
    return-object v2

    .line 252
    :catchall_51
    move-exception v4

    monitor-exit v3
    :try_end_53
    .catchall {:try_start_4a .. :try_end_53} :catchall_51

    :try_start_53
    throw v4
    :try_end_54
    .catch Ljava/lang/NoSuchMethodException; {:try_start_53 .. :try_end_54} :catch_54

    .line 254
    .end local v2    # "method":Ljava/lang/reflect/Method;
    :catch_54
    move-exception v2

    move-object v3, v2

    .line 255
    .local v3, "e":Ljava/lang/NoSuchMethodException;
    sget-object v4, Lmiui/util/ReflectionUtils;->methodCache:Ljava/util/HashMap;

    monitor-enter v4

    .line 256
    :try_start_59
    sget-object v2, Lmiui/util/ReflectionUtils;->methodCache:Ljava/util/HashMap;

    const/4 v5, 0x0

    invoke-virtual {v2, v1, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 257
    monitor-exit v4
    :try_end_60
    .catchall {:try_start_59 .. :try_end_60} :catchall_61

    .line 258
    throw v3

    .line 257
    :catchall_61
    move-exception v2

    :try_start_62
    monitor-exit v4
    :try_end_63
    .catchall {:try_start_62 .. :try_end_63} :catchall_61

    throw v2

    .line 245
    .end local v3    # "e":Ljava/lang/NoSuchMethodException;
    :catchall_64
    move-exception v3

    :try_start_65
    monitor-exit v2
    :try_end_66
    .catchall {:try_start_65 .. :try_end_66} :catchall_64

    throw v3
.end method

.method public static varargs findMethodExact(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/reflect/Method;
    .registers 9
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "parameterTypes"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;,
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .line 173
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    .line 174
    .local v0, "parameterClasses":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v1, p2

    add-int/lit8 v1, v1, -0x1

    .local v1, "i":I
    :goto_4
    if-ltz v1, :cond_3f

    .line 175
    aget-object v2, p2, v1

    .line 176
    .local v2, "type":Ljava/lang/Object;
    if-eqz v2, :cond_37

    .line 179
    if-nez v0, :cond_10

    .line 180
    add-int/lit8 v3, v1, 0x1

    new-array v0, v3, [Ljava/lang/Class;

    .line 182
    :cond_10
    instance-of v3, v2, Ljava/lang/Class;

    if-eqz v3, :cond_1a

    .line 183
    move-object v3, v2

    check-cast v3, Ljava/lang/Class;

    aput-object v3, v0, v1

    goto :goto_2b

    .line 184
    :cond_1a
    instance-of v3, v2, Ljava/lang/String;

    if-eqz v3, :cond_2e

    .line 185
    move-object v3, v2

    check-cast v3, Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v4

    invoke-static {v3, v4}, Lmiui/util/ReflectionUtils;->findClass(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v3

    aput-object v3, v0, v1

    .line 174
    .end local v2    # "type":Ljava/lang/Object;
    :goto_2b
    add-int/lit8 v1, v1, -0x1

    goto :goto_4

    .line 187
    .restart local v2    # "type":Ljava/lang/Object;
    :cond_2e
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const/4 v4, 0x0

    const-string v5, "parameter type must either be specified as Class or String"

    invoke-direct {v3, v5, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 177
    :cond_37
    new-instance v3, Ljava/lang/NullPointerException;

    const-string v4, "parameter type must not be null"

    invoke-direct {v3, v4}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 192
    .end local v1    # "i":I
    .end local v2    # "type":Ljava/lang/Object;
    :cond_3f
    if-nez v0, :cond_44

    .line 193
    const/4 v1, 0x0

    new-array v0, v1, [Ljava/lang/Class;

    .line 195
    :cond_44
    invoke-static {p0, p1, v0}, Lmiui/util/ReflectionUtils;->findMethodExact(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    return-object v1
.end method

.method public static varargs getClassesAsArray([Ljava/lang/Class;)[Ljava/lang/Class;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Class<",
            "*>;)[",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 414
    .local p0, "clazzes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    return-object p0
.end method

.method public static getObjectField(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 5
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "fieldName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchFieldException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 627
    .local p2, "fieldClazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0, p1}, Lmiui/util/ReflectionUtils;->findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 628
    .local v0, "value":Ljava/lang/Object;
    invoke-static {v0, p2}, Lmiui/util/ReflectionUtils;->checkFieldValue(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public static varargs getParameterTypes([Ljava/lang/Object;)[Ljava/lang/Class;
    .registers 4
    .param p0, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Object;",
            ")[",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 401
    array-length v0, p0

    new-array v0, v0, [Ljava/lang/Class;

    .line 402
    .local v0, "clazzes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_4
    array-length v2, p0

    if-ge v1, v2, :cond_18

    .line 403
    aget-object v2, p0, v1

    if-eqz v2, :cond_12

    aget-object v2, p0, v1

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    goto :goto_13

    :cond_12
    const/4 v2, 0x0

    :goto_13
    aput-object v2, v0, v1

    .line 402
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 405
    .end local v1    # "i":I
    :cond_18
    return-object v0
.end method

.method private static varargs getParametersString([Ljava/lang/Class;)Ljava/lang/String;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 418
    .local p0, "clazzes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 419
    .local v0, "sb":Ljava/lang/StringBuilder;
    const/4 v1, 0x1

    .line 420
    .local v1, "first":Z
    array-length v2, p0

    const/4 v3, 0x0

    :goto_a
    if-ge v3, v2, :cond_29

    aget-object v4, p0, v3

    .line 421
    .local v4, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v1, :cond_12

    .line 422
    const/4 v1, 0x0

    goto :goto_17

    .line 424
    :cond_12
    const-string v5, ","

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 426
    :goto_17
    if-eqz v4, :cond_21

    .line 427
    invoke-virtual {v4}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_26

    .line 429
    :cond_21
    const-string v5, "null"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 420
    .end local v4    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_26
    add-int/lit8 v3, v3, 0x1

    goto :goto_a

    .line 431
    :cond_29
    const-string v2, ")"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 432
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static getStaticObjectField(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 7
    .param p1, "fieldName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchFieldException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 734
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "fieldClazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-static {p0, p1}, Lmiui/util/ReflectionUtils;->findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 736
    .local v0, "field":Ljava/lang/reflect/Field;
    const/4 v1, 0x0

    :try_start_5
    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 737
    .local v1, "value":Ljava/lang/Object;
    invoke-static {v1, p2}, Lmiui/util/ReflectionUtils;->checkFieldValue(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2
    :try_end_d
    .catch Ljava/lang/NullPointerException; {:try_start_5 .. :try_end_d} :catch_e

    return-object v2

    .line 738
    .end local v1    # "value":Ljava/lang/Object;
    :catch_e
    move-exception v1

    .line 739
    .local v1, "ex":Ljava/lang/NullPointerException;
    const-string v2, "ReflectionUtils"

    const-string v3, ""

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 743
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-direct {v2, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public static getSurroundingThis(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 3
    .param p0, "obj"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchFieldException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 664
    .local p1, "surroundingClazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const-string v0, "this$0"

    invoke-static {p0, v0, p1}, Lmiui/util/ReflectionUtils;->getObjectField(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static varargs newInstance(Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/InstantiationException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .line 913
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p0, p1}, Lmiui/util/ReflectionUtils;->findConstructorBestMatch(Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static setObjectField(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchFieldException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 596
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0, p1}, Lmiui/util/ReflectionUtils;->findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p0, p2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 597
    return-void
.end method

.method public static setStaticObjectField(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 7
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchFieldException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 696
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p0, p1}, Lmiui/util/ReflectionUtils;->findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 698
    .local v0, "field":Ljava/lang/reflect/Field;
    const/4 v1, 0x0

    :try_start_5
    invoke-virtual {v0, v1, p2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_8
    .catch Ljava/lang/NullPointerException; {:try_start_5 .. :try_end_8} :catch_a

    .line 705
    nop

    .line 706
    return-void

    .line 699
    :catch_a
    move-exception v1

    .line 703
    .local v1, "ex":Ljava/lang/NullPointerException;
    const-string v2, "ReflectionUtils"

    const-string v3, ""

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 704
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-direct {v2, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public static varargs tryCallMethod(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;[Ljava/lang/Object;)Lmiui/util/ObjectReference;
    .registers 8
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "methodName"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "TT;>;[",
            "Ljava/lang/Object;",
            ")",
            "Lmiui/util/ObjectReference<",
            "TT;>;"
        }
    .end annotation

    .line 818
    .local p2, "returnValueClazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const/4 v0, 0x0

    :try_start_1
    new-instance v1, Lmiui/util/ObjectReference;

    invoke-static {p0, p1, p2, p3}, Lmiui/util/ReflectionUtils;->callMethod(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-direct {v1, v2}, Lmiui/util/ObjectReference;-><init>(Ljava/lang/Object;)V
    :try_end_a
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_a} :catch_26
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_a} :catch_1d
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_a} :catch_14
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_a} :catch_b

    return-object v1

    .line 828
    :catch_b
    move-exception v1

    .line 829
    .local v1, "ex":Ljava/lang/reflect/InvocationTargetException;
    const-string v2, "ReflectionUtils"

    const-string v3, ""

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 830
    return-object v0

    .line 825
    .end local v1    # "ex":Ljava/lang/reflect/InvocationTargetException;
    :catch_14
    move-exception v1

    .line 826
    .local v1, "ex":Ljava/lang/IllegalArgumentException;
    const-string v2, "ReflectionUtils"

    const-string v3, ""

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 827
    return-object v0

    .line 822
    .end local v1    # "ex":Ljava/lang/IllegalArgumentException;
    :catch_1d
    move-exception v1

    .line 823
    .local v1, "ex":Ljava/lang/IllegalAccessException;
    const-string v2, "ReflectionUtils"

    const-string v3, ""

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 824
    return-object v0

    .line 819
    .end local v1    # "ex":Ljava/lang/IllegalAccessException;
    :catch_26
    move-exception v1

    .line 820
    .local v1, "ex":Ljava/lang/NoSuchMethodException;
    const-string v2, "ReflectionUtils"

    const-string v3, ""

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 821
    return-object v0
.end method

.method public static varargs tryCallStaticMethod(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Class;[Ljava/lang/Object;)Lmiui/util/ObjectReference;
    .registers 8
    .param p1, "methodName"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "TT;>;[",
            "Ljava/lang/Object;",
            ")",
            "Lmiui/util/ObjectReference<",
            "TT;>;"
        }
    .end annotation

    .line 871
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "returnValueClazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const/4 v0, 0x0

    :try_start_1
    new-instance v1, Lmiui/util/ObjectReference;

    invoke-static {p0, p1, p2, p3}, Lmiui/util/ReflectionUtils;->callStaticMethod(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-direct {v1, v2}, Lmiui/util/ObjectReference;-><init>(Ljava/lang/Object;)V
    :try_end_a
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_a} :catch_26
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_a} :catch_1d
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_a} :catch_14
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_a} :catch_b

    return-object v1

    .line 881
    :catch_b
    move-exception v1

    .line 882
    .local v1, "ex":Ljava/lang/reflect/InvocationTargetException;
    const-string v2, "ReflectionUtils"

    const-string v3, ""

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 883
    return-object v0

    .line 878
    .end local v1    # "ex":Ljava/lang/reflect/InvocationTargetException;
    :catch_14
    move-exception v1

    .line 879
    .local v1, "ex":Ljava/lang/IllegalArgumentException;
    const-string v2, "ReflectionUtils"

    const-string v3, ""

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 880
    return-object v0

    .line 875
    .end local v1    # "ex":Ljava/lang/IllegalArgumentException;
    :catch_1d
    move-exception v1

    .line 876
    .local v1, "ex":Ljava/lang/IllegalAccessException;
    const-string v2, "ReflectionUtils"

    const-string v3, ""

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 877
    return-object v0

    .line 872
    .end local v1    # "ex":Ljava/lang/IllegalAccessException;
    :catch_26
    move-exception v1

    .line 873
    .local v1, "ex":Ljava/lang/NoSuchMethodException;
    const-string v2, "ReflectionUtils"

    const-string v3, ""

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 874
    return-object v0
.end method

.method public static tryFindClass(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;
    .registers 5
    .param p0, "className"    # Ljava/lang/String;
    .param p1, "classLoader"    # Ljava/lang/ClassLoader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/ClassLoader;",
            ")",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 82
    :try_start_0
    invoke-static {p0, p1}, Lmiui/util/ReflectionUtils;->findClass(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v0
    :try_end_4
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_4} :catch_5

    return-object v0

    .line 83
    :catch_5
    move-exception v0

    .line 84
    .local v0, "ex":Ljava/lang/ClassNotFoundException;
    const-string v1, "ReflectionUtils"

    const-string v2, ""

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 85
    const/4 v1, 0x0

    return-object v1
.end method

.method public static varargs tryFindConstructorBestMatch(Ljava/lang/Class;[Ljava/lang/Class;)Ljava/lang/reflect/Constructor;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;[",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/reflect/Constructor<",
            "*>;"
        }
    .end annotation

    .line 557
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p1, "parameterTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :try_start_0
    invoke-static {p0, p1}, Lmiui/util/ReflectionUtils;->findConstructorBestMatch(Ljava/lang/Class;[Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0
    :try_end_4
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_4} :catch_5

    return-object v0

    .line 558
    :catch_5
    move-exception v0

    .line 559
    .local v0, "ex":Ljava/lang/NoSuchMethodException;
    const-string v1, "ReflectionUtils"

    const-string v2, ""

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 560
    const/4 v1, 0x0

    return-object v1
.end method

.method public static varargs tryFindConstructorBestMatch(Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/reflect/Constructor;
    .registers 5
    .param p1, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/reflect/Constructor<",
            "*>;"
        }
    .end annotation

    .line 582
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    invoke-static {p0, p1}, Lmiui/util/ReflectionUtils;->findConstructorBestMatch(Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/reflect/Constructor;

    move-result-object v0
    :try_end_4
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_4} :catch_5

    return-object v0

    .line 583
    :catch_5
    move-exception v0

    .line 584
    .local v0, "ex":Ljava/lang/NoSuchMethodException;
    const-string v1, "ReflectionUtils"

    const-string v2, ""

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 585
    const/4 v1, 0x0

    return-object v1
.end method

.method public static varargs tryFindConstructorExact(Ljava/lang/Class;[Ljava/lang/Class;)Ljava/lang/reflect/Constructor;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;[",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/reflect/Constructor<",
            "*>;"
        }
    .end annotation

    .line 480
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p1, "parameterTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :try_start_0
    invoke-static {p0, p1}, Lmiui/util/ReflectionUtils;->findConstructorExact(Ljava/lang/Class;[Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0
    :try_end_4
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_4} :catch_5

    return-object v0

    .line 481
    :catch_5
    move-exception v0

    .line 482
    .local v0, "ex":Ljava/lang/NoSuchMethodException;
    const-string v1, "ReflectionUtils"

    const-string v2, ""

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 483
    const/4 v1, 0x0

    return-object v1
.end method

.method public static tryFindField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;
    .registers 5
    .param p1, "fieldName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/reflect/Field;"
        }
    .end annotation

    .line 133
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    invoke-static {p0, p1}, Lmiui/util/ReflectionUtils;->findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0
    :try_end_4
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_4} :catch_5

    return-object v0

    .line 134
    :catch_5
    move-exception v0

    .line 135
    .local v0, "ex":Ljava/lang/NoSuchFieldException;
    const-string v1, "ReflectionUtils"

    const-string v2, ""

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 136
    const/4 v1, 0x0

    return-object v1
.end method

.method public static varargs tryFindMethodBestMatch(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .registers 6
    .param p1, "methodName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .line 358
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "parameterTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :try_start_0
    invoke-static {p0, p1, p2}, Lmiui/util/ReflectionUtils;->findMethodBestMatch(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0
    :try_end_4
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_4} :catch_5

    return-object v0

    .line 359
    :catch_5
    move-exception v0

    .line 360
    .local v0, "ex":Ljava/lang/NoSuchMethodException;
    const-string v1, "ReflectionUtils"

    const-string v2, ""

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 361
    const/4 v1, 0x0

    return-object v1
.end method

.method public static varargs tryFindMethodBestMatch(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/reflect/Method;
    .registers 6
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .line 388
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    invoke-static {p0, p1, p2}, Lmiui/util/ReflectionUtils;->findMethodBestMatch(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/reflect/Method;

    move-result-object v0
    :try_end_4
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_4} :catch_5

    return-object v0

    .line 389
    :catch_5
    move-exception v0

    .line 390
    .local v0, "ex":Ljava/lang/NoSuchMethodException;
    const-string v1, "ReflectionUtils"

    const-string v2, ""

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 391
    const/4 v1, 0x0

    return-object v1
.end method

.method public static varargs tryFindMethodExact(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .registers 6
    .param p1, "methodName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .line 271
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "parameterTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :try_start_0
    invoke-static {p0, p1, p2}, Lmiui/util/ReflectionUtils;->findMethodExact(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0
    :try_end_4
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_4} :catch_5

    return-object v0

    .line 272
    :catch_5
    move-exception v0

    .line 273
    .local v0, "ex":Ljava/lang/NoSuchMethodException;
    const-string v1, "ReflectionUtils"

    const-string v2, ""

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 274
    const/4 v1, 0x0

    return-object v1
.end method

.method public static varargs tryFindMethodExact(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/reflect/Method;
    .registers 7
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "parameterTypes"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .line 212
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    :try_start_1
    invoke-static {p0, p1, p2}, Lmiui/util/ReflectionUtils;->findMethodExact(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/reflect/Method;

    move-result-object v1
    :try_end_5
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_5} :catch_f
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_5} :catch_6

    return-object v1

    .line 216
    :catch_6
    move-exception v1

    .line 217
    .local v1, "ex":Ljava/lang/NoSuchMethodException;
    const-string v2, "ReflectionUtils"

    const-string v3, ""

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 218
    return-object v0

    .line 213
    .end local v1    # "ex":Ljava/lang/NoSuchMethodException;
    :catch_f
    move-exception v1

    .line 214
    .local v1, "ex":Ljava/lang/ClassNotFoundException;
    const-string v2, "ReflectionUtils"

    const-string v3, ""

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 215
    return-object v0
.end method

.method public static tryGetObjectField(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;)Lmiui/util/ObjectReference;
    .registers 7
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "fieldName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "TT;>;)",
            "Lmiui/util/ObjectReference<",
            "TT;>;"
        }
    .end annotation

    .line 643
    .local p2, "fieldClazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const/4 v0, 0x0

    :try_start_1
    new-instance v1, Lmiui/util/ObjectReference;

    invoke-static {p0, p1, p2}, Lmiui/util/ReflectionUtils;->getObjectField(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    invoke-direct {v1, v2}, Lmiui/util/ObjectReference;-><init>(Ljava/lang/Object;)V
    :try_end_a
    .catch Ljava/lang/NoSuchFieldException; {:try_start_1 .. :try_end_a} :catch_1d
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_a} :catch_14
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_a} :catch_b

    return-object v1

    .line 650
    :catch_b
    move-exception v1

    .line 651
    .local v1, "ex":Ljava/lang/IllegalArgumentException;
    const-string v2, "ReflectionUtils"

    const-string v3, ""

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 652
    return-object v0

    .line 647
    .end local v1    # "ex":Ljava/lang/IllegalArgumentException;
    :catch_14
    move-exception v1

    .line 648
    .local v1, "ex":Ljava/lang/IllegalAccessException;
    const-string v2, "ReflectionUtils"

    const-string v3, ""

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 649
    return-object v0

    .line 644
    .end local v1    # "ex":Ljava/lang/IllegalAccessException;
    :catch_1d
    move-exception v1

    .line 645
    .local v1, "ex":Ljava/lang/NoSuchFieldException;
    const-string v2, "ReflectionUtils"

    const-string v3, ""

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 646
    return-object v0
.end method

.method public static tryGetStaticObjectField(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Class;)Lmiui/util/ObjectReference;
    .registers 7
    .param p1, "fieldName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "TT;>;)",
            "Lmiui/util/ObjectReference<",
            "TT;>;"
        }
    .end annotation

    .line 758
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "fieldClazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const/4 v0, 0x0

    :try_start_1
    new-instance v1, Lmiui/util/ObjectReference;

    invoke-static {p0, p1, p2}, Lmiui/util/ReflectionUtils;->getStaticObjectField(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    invoke-direct {v1, v2}, Lmiui/util/ObjectReference;-><init>(Ljava/lang/Object;)V
    :try_end_a
    .catch Ljava/lang/NoSuchFieldException; {:try_start_1 .. :try_end_a} :catch_1d
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_a} :catch_14
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_a} :catch_b

    return-object v1

    .line 765
    :catch_b
    move-exception v1

    .line 766
    .local v1, "ex":Ljava/lang/IllegalArgumentException;
    const-string v2, "ReflectionUtils"

    const-string v3, ""

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 767
    return-object v0

    .line 762
    .end local v1    # "ex":Ljava/lang/IllegalArgumentException;
    :catch_14
    move-exception v1

    .line 763
    .local v1, "ex":Ljava/lang/IllegalAccessException;
    const-string v2, "ReflectionUtils"

    const-string v3, ""

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 764
    return-object v0

    .line 759
    .end local v1    # "ex":Ljava/lang/IllegalAccessException;
    :catch_1d
    move-exception v1

    .line 760
    .local v1, "ex":Ljava/lang/NoSuchFieldException;
    const-string v2, "ReflectionUtils"

    const-string v3, ""

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 761
    return-object v0
.end method

.method public static tryGetSurroundingThis(Ljava/lang/Object;Ljava/lang/Class;)Lmiui/util/ObjectReference;
    .registers 6
    .param p0, "obj"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class<",
            "TT;>;)",
            "Lmiui/util/ObjectReference<",
            "TT;>;"
        }
    .end annotation

    .line 677
    .local p1, "surroundingClazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const/4 v0, 0x0

    :try_start_1
    new-instance v1, Lmiui/util/ObjectReference;

    invoke-static {p0, p1}, Lmiui/util/ReflectionUtils;->getSurroundingThis(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    invoke-direct {v1, v2}, Lmiui/util/ObjectReference;-><init>(Ljava/lang/Object;)V
    :try_end_a
    .catch Ljava/lang/NoSuchFieldException; {:try_start_1 .. :try_end_a} :catch_1d
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_a} :catch_14
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_a} :catch_b

    return-object v1

    .line 684
    :catch_b
    move-exception v1

    .line 685
    .local v1, "ex":Ljava/lang/IllegalArgumentException;
    const-string v2, "ReflectionUtils"

    const-string v3, ""

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 686
    return-object v0

    .line 681
    .end local v1    # "ex":Ljava/lang/IllegalArgumentException;
    :catch_14
    move-exception v1

    .line 682
    .local v1, "ex":Ljava/lang/IllegalAccessException;
    const-string v2, "ReflectionUtils"

    const-string v3, ""

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 683
    return-object v0

    .line 678
    .end local v1    # "ex":Ljava/lang/IllegalAccessException;
    :catch_1d
    move-exception v1

    .line 679
    .local v1, "ex":Ljava/lang/NoSuchFieldException;
    const-string v2, "ReflectionUtils"

    const-string v3, ""

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 680
    return-object v0
.end method

.method public static varargs tryNewInstance(Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 923
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    :try_start_1
    invoke-static {p0, p1}, Lmiui/util/ReflectionUtils;->newInstance(Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1
    :try_end_5
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_5} :catch_2a
    .catch Ljava/lang/InstantiationException; {:try_start_1 .. :try_end_5} :catch_21
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_5} :catch_18
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_5} :catch_f
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_5} :catch_6

    return-object v1

    .line 936
    :catch_6
    move-exception v1

    .line 937
    .local v1, "ex":Ljava/lang/reflect/InvocationTargetException;
    const-string v2, "ReflectionUtils"

    const-string v3, ""

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 938
    return-object v0

    .line 933
    .end local v1    # "ex":Ljava/lang/reflect/InvocationTargetException;
    :catch_f
    move-exception v1

    .line 934
    .local v1, "ex":Ljava/lang/IllegalArgumentException;
    const-string v2, "ReflectionUtils"

    const-string v3, ""

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 935
    return-object v0

    .line 930
    .end local v1    # "ex":Ljava/lang/IllegalArgumentException;
    :catch_18
    move-exception v1

    .line 931
    .local v1, "ex":Ljava/lang/IllegalAccessException;
    const-string v2, "ReflectionUtils"

    const-string v3, ""

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 932
    return-object v0

    .line 927
    .end local v1    # "ex":Ljava/lang/IllegalAccessException;
    :catch_21
    move-exception v1

    .line 928
    .local v1, "ex":Ljava/lang/InstantiationException;
    const-string v2, "ReflectionUtils"

    const-string v3, ""

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 929
    return-object v0

    .line 924
    .end local v1    # "ex":Ljava/lang/InstantiationException;
    :catch_2a
    move-exception v1

    .line 925
    .local v1, "ex":Ljava/lang/NoSuchMethodException;
    const-string v2, "ReflectionUtils"

    const-string v3, ""

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 926
    return-object v0
.end method

.method public static trySetObjectField(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 6
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .line 607
    :try_start_0
    invoke-static {p0, p1, p2}, Lmiui/util/ReflectionUtils;->setObjectField(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_3
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_3} :catch_16
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_3} :catch_d
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_3} :catch_4

    .line 614
    :goto_3
    goto :goto_1f

    .line 612
    :catch_4
    move-exception v0

    .line 613
    .local v0, "ex":Ljava/lang/IllegalArgumentException;
    const-string v1, "ReflectionUtils"

    const-string v2, ""

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .end local v0    # "ex":Ljava/lang/IllegalArgumentException;
    goto :goto_1f

    .line 610
    :catch_d
    move-exception v0

    .line 611
    .local v0, "ex":Ljava/lang/IllegalAccessException;
    const-string v1, "ReflectionUtils"

    const-string v2, ""

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .end local v0    # "ex":Ljava/lang/IllegalAccessException;
    goto :goto_3

    .line 608
    :catch_16
    move-exception v0

    .line 609
    .local v0, "ex":Ljava/lang/NoSuchFieldException;
    const-string v1, "ReflectionUtils"

    const-string v2, ""

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .end local v0    # "ex":Ljava/lang/NoSuchFieldException;
    goto :goto_3

    .line 615
    :goto_1f
    return-void
.end method

.method public static trySetStaticObjectField(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 6
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .line 716
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    invoke-static {p0, p1, p2}, Lmiui/util/ReflectionUtils;->setStaticObjectField(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_3
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_3} :catch_16
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_3} :catch_d
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_3} :catch_4

    .line 723
    :goto_3
    goto :goto_1f

    .line 721
    :catch_4
    move-exception v0

    .line 722
    .local v0, "ex":Ljava/lang/IllegalArgumentException;
    const-string v1, "ReflectionUtils"

    const-string v2, ""

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .end local v0    # "ex":Ljava/lang/IllegalArgumentException;
    goto :goto_1f

    .line 719
    :catch_d
    move-exception v0

    .line 720
    .local v0, "ex":Ljava/lang/IllegalAccessException;
    const-string v1, "ReflectionUtils"

    const-string v2, ""

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .end local v0    # "ex":Ljava/lang/IllegalAccessException;
    goto :goto_3

    .line 717
    :catch_16
    move-exception v0

    .line 718
    .local v0, "ex":Ljava/lang/NoSuchFieldException;
    const-string v1, "ReflectionUtils"

    const-string v2, ""

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .end local v0    # "ex":Ljava/lang/NoSuchFieldException;
    goto :goto_3

    .line 724
    :goto_1f
    return-void
.end method
