.class public Lmiui/reflect/Constructor;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private mPtr:J


# direct methods
.method private constructor <init>()V
    .registers 3

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lmiui/reflect/Constructor;->mPtr:J

    .line 21
    return-void
.end method

.method public static of(Ljava/lang/Class;Ljava/lang/String;)Lmiui/reflect/Constructor;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            ")",
            "Lmiui/reflect/Constructor;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/reflect/NoSuchMethodException;
        }
    .end annotation

    .line 31
    invoke-static {p0, p1}, Lcom/miui/internal/os/Native;->getConstructor(Ljava/lang/Class;Ljava/lang/String;)Lmiui/reflect/Constructor;

    move-result-object p0

    return-object p0
.end method

.method public static varargs of(Ljava/lang/Class;[Ljava/lang/Class;)Lmiui/reflect/Constructor;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;[",
            "Ljava/lang/Class<",
            "*>;)",
            "Lmiui/reflect/Constructor;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/reflect/NoSuchMethodException;
        }
    .end annotation

    .line 42
    sget-object v0, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    invoke-static {p1, v0}, Lmiui/reflect/ReflectUtils;->getSignature([Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/miui/internal/os/Native;->getConstructor(Ljava/lang/Class;Ljava/lang/String;)Lmiui/reflect/Constructor;

    move-result-object p0

    return-object p0
.end method

.method public static of(Ljava/lang/String;Ljava/lang/String;)Lmiui/reflect/Constructor;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/reflect/NoSuchMethodException;,
            Lmiui/reflect/NoSuchClassException;
        }
    .end annotation

    .line 54
    invoke-static {p0, p1}, Lcom/miui/internal/os/Native;->getConstructor(Ljava/lang/String;Ljava/lang/String;)Lmiui/reflect/Constructor;

    move-result-object p0

    return-object p0
.end method

.method public static of(Ljava/lang/reflect/Constructor;)Lmiui/reflect/Constructor;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Constructor<",
            "*>;)",
            "Lmiui/reflect/Constructor;"
        }
    .end annotation

    .line 63
    invoke-static {p0}, Lcom/miui/internal/os/Native;->getConstructor(Ljava/lang/reflect/Constructor;)Lmiui/reflect/Constructor;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public varargs newInstance([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/reflect/IllegalArgumentException;
        }
    .end annotation

    .line 81
    invoke-static {p0, p1}, Lcom/miui/internal/os/Native;->newInstance(Lmiui/reflect/Constructor;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public toRefelect()Ljava/lang/reflect/Constructor;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/reflect/Constructor<",
            "*>;"
        }
    .end annotation

    .line 71
    invoke-static {p0}, Lcom/miui/internal/os/Native;->getReflectConstructor(Lmiui/reflect/Constructor;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    return-object v0
.end method
