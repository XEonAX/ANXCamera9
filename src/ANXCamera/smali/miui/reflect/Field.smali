.class public Lmiui/reflect/Field;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final BOOLEAN_SIGNATURE_PRIMITIVE:Ljava/lang/String; = "Z"

.field public static final BYTE_SIGNATURE_PRIMITIVE:Ljava/lang/String; = "B"

.field public static final CHAR_SIGNATURE_PRIMITIVE:Ljava/lang/String; = "C"

.field public static final DOUBLE_SIGNATURE_PRIMITIVE:Ljava/lang/String; = "D"

.field public static final FLOAT_SIGNATURE_PRIMITIVE:Ljava/lang/String; = "F"

.field public static final INT_SIGNATURE_PRIMITIVE:Ljava/lang/String; = "I"

.field public static final LONG_SIGNATURE_PRIMITIVE:Ljava/lang/String; = "J"

.field public static final SHORT_SIGNATURE_PRIMITIVE:Ljava/lang/String; = "S"

.field public static final VOID_SIGNATURE_PRIMITIVE:Ljava/lang/String; = "V"


# instance fields
.field private mPtr:J


# direct methods
.method private constructor <init>()V
    .registers 3

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lmiui/reflect/Field;->mPtr:J

    .line 48
    return-void
.end method

.method public static of(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Class;)Lmiui/reflect/Field;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "*>;)",
            "Lmiui/reflect/Field;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/reflect/NoSuchFieldException;
        }
    .end annotation

    .line 71
    invoke-static {p2}, Lmiui/reflect/ReflectUtils;->getSignature(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p1, p2}, Lcom/miui/internal/os/Native;->getField(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)Lmiui/reflect/Field;

    move-result-object p0

    return-object p0
.end method

.method public static of(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)Lmiui/reflect/Field;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lmiui/reflect/Field;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/reflect/NoSuchFieldException;
        }
    .end annotation

    .line 59
    invoke-static {p0, p1, p2}, Lcom/miui/internal/os/Native;->getField(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)Lmiui/reflect/Field;

    move-result-object p0

    return-object p0
.end method

.method public static of(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lmiui/reflect/Field;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/reflect/NoSuchFieldException;,
            Lmiui/reflect/NoSuchClassException;
        }
    .end annotation

    .line 84
    invoke-static {p0, p1, p2}, Lcom/miui/internal/os/Native;->getField(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lmiui/reflect/Field;

    move-result-object p0

    return-object p0
.end method

.method public static of(Ljava/lang/reflect/Field;)Lmiui/reflect/Field;
    .registers 1

    .line 93
    invoke-static {p0}, Lcom/miui/internal/os/Native;->getField(Ljava/lang/reflect/Field;)Lmiui/reflect/Field;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/reflect/IllegalArgumentException;
        }
    .end annotation

    .line 518
    invoke-static {p0, p1}, Lcom/miui/internal/os/Native;->getObjectFieldValue(Lmiui/reflect/Field;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getBoolean(Ljava/lang/Object;)Z
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/reflect/IllegalArgumentException;
        }
    .end annotation

    .line 347
    invoke-static {p0, p1}, Lcom/miui/internal/os/Native;->getBooleanFieldValue(Lmiui/reflect/Field;Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public getByte(Ljava/lang/Object;)B
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/reflect/IllegalArgumentException;
        }
    .end annotation

    .line 368
    invoke-static {p0, p1}, Lcom/miui/internal/os/Native;->getByteFieldValue(Lmiui/reflect/Field;Ljava/lang/Object;)B

    move-result p1

    return p1
.end method

.method public getChar(Ljava/lang/Object;)C
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/reflect/IllegalArgumentException;
        }
    .end annotation

    .line 389
    invoke-static {p0, p1}, Lcom/miui/internal/os/Native;->getCharFieldValue(Lmiui/reflect/Field;Ljava/lang/Object;)C

    move-result p1

    return p1
.end method

.method public getDouble(Ljava/lang/Object;)D
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/reflect/IllegalArgumentException;
        }
    .end annotation

    .line 494
    invoke-static {p0, p1}, Lcom/miui/internal/os/Native;->getDoubleFieldValue(Lmiui/reflect/Field;Ljava/lang/Object;)D

    move-result-wide v0

    return-wide v0
.end method

.method public getFloat(Ljava/lang/Object;)F
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/reflect/IllegalArgumentException;
        }
    .end annotation

    .line 473
    invoke-static {p0, p1}, Lcom/miui/internal/os/Native;->getFloatFieldValue(Lmiui/reflect/Field;Ljava/lang/Object;)F

    move-result p1

    return p1
.end method

.method public getInt(Ljava/lang/Object;)I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/reflect/IllegalArgumentException;
        }
    .end annotation

    .line 431
    invoke-static {p0, p1}, Lcom/miui/internal/os/Native;->getIntFieldValue(Lmiui/reflect/Field;Ljava/lang/Object;)I

    move-result p1

    return p1
.end method

.method public getLong(Ljava/lang/Object;)J
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/reflect/IllegalArgumentException;
        }
    .end annotation

    .line 452
    invoke-static {p0, p1}, Lcom/miui/internal/os/Native;->getLongFieldValue(Lmiui/reflect/Field;Ljava/lang/Object;)J

    move-result-wide v0

    return-wide v0
.end method

.method public getShort(Ljava/lang/Object;)S
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/reflect/IllegalArgumentException;
        }
    .end annotation

    .line 410
    invoke-static {p0, p1}, Lcom/miui/internal/os/Native;->getShortFieldValue(Lmiui/reflect/Field;Ljava/lang/Object;)S

    move-result p1

    return p1
.end method

.method public set(Ljava/lang/Object;B)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/reflect/IllegalArgumentException;
        }
    .end annotation

    .line 151
    invoke-static {p0, p1, p2}, Lcom/miui/internal/os/Native;->setFieldValue(Lmiui/reflect/Field;Ljava/lang/Object;B)V

    .line 152
    return-void
.end method

.method public set(Ljava/lang/Object;C)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/reflect/IllegalArgumentException;
        }
    .end annotation

    .line 176
    invoke-static {p0, p1, p2}, Lcom/miui/internal/os/Native;->setFieldValue(Lmiui/reflect/Field;Ljava/lang/Object;C)V

    .line 177
    return-void
.end method

.method public set(Ljava/lang/Object;D)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/reflect/IllegalArgumentException;
        }
    .end annotation

    .line 301
    invoke-static {p0, p1, p2, p3}, Lcom/miui/internal/os/Native;->setFieldValue(Lmiui/reflect/Field;Ljava/lang/Object;D)V

    .line 302
    return-void
.end method

.method public set(Ljava/lang/Object;F)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/reflect/IllegalArgumentException;
        }
    .end annotation

    .line 276
    invoke-static {p0, p1, p2}, Lcom/miui/internal/os/Native;->setFieldValue(Lmiui/reflect/Field;Ljava/lang/Object;F)V

    .line 277
    return-void
.end method

.method public set(Ljava/lang/Object;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/reflect/IllegalArgumentException;
        }
    .end annotation

    .line 226
    invoke-static {p0, p1, p2}, Lcom/miui/internal/os/Native;->setFieldValue(Lmiui/reflect/Field;Ljava/lang/Object;I)V

    .line 227
    return-void
.end method

.method public set(Ljava/lang/Object;J)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/reflect/IllegalArgumentException;
        }
    .end annotation

    .line 251
    invoke-static {p0, p1, p2, p3}, Lcom/miui/internal/os/Native;->setFieldValue(Lmiui/reflect/Field;Ljava/lang/Object;J)V

    .line 252
    return-void
.end method

.method public set(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/reflect/IllegalArgumentException;
        }
    .end annotation

    .line 326
    invoke-static {p0, p1, p2}, Lcom/miui/internal/os/Native;->setFieldValue(Lmiui/reflect/Field;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 327
    return-void
.end method

.method public set(Ljava/lang/Object;S)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/reflect/IllegalArgumentException;
        }
    .end annotation

    .line 201
    invoke-static {p0, p1, p2}, Lcom/miui/internal/os/Native;->setFieldValue(Lmiui/reflect/Field;Ljava/lang/Object;S)V

    .line 202
    return-void
.end method

.method public set(Ljava/lang/Object;Z)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/reflect/IllegalArgumentException;
        }
    .end annotation

    .line 126
    invoke-static {p0, p1, p2}, Lcom/miui/internal/os/Native;->setFieldValue(Lmiui/reflect/Field;Ljava/lang/Object;Z)V

    .line 127
    return-void
.end method

.method public toReflect()Ljava/lang/reflect/Field;
    .registers 2

    .line 101
    invoke-static {p0}, Lcom/miui/internal/os/Native;->getReflectField(Lmiui/reflect/Field;)Ljava/lang/reflect/Field;

    move-result-object v0

    return-object v0
.end method
