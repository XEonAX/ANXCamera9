.class public Lcom/miui/internal/os/Native;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 17
    const-string v0, "miuinative"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 18
    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    return-void
.end method

.method public static native addPropertyChangeCallbackNative(Ljava/lang/Class;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)V"
        }
    .end annotation
.end method

.method public static native chmod(Ljava/lang/String;II)Z
.end method

.method public static native chown(Ljava/lang/String;III)Z
.end method

.method public static native getBooleanFieldValue(Lmiui/reflect/Field;Ljava/lang/Object;)Z
.end method

.method public static native getBooleanPropertyNative(Ljava/lang/String;Z)Z
.end method

.method public static native getByteFieldValue(Lmiui/reflect/Field;Ljava/lang/Object;)B
.end method

.method public static native getCharFieldValue(Lmiui/reflect/Field;Ljava/lang/Object;)C
.end method

.method public static native getConstructor(Ljava/lang/Class;Ljava/lang/String;)Lmiui/reflect/Constructor;
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
.end method

.method private static native getConstructor(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;Ljava/lang/reflect/Constructor;)Lmiui/reflect/Constructor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Constructor<",
            "*>;)",
            "Lmiui/reflect/Constructor;"
        }
    .end annotation
.end method

.method public static native getConstructor(Ljava/lang/String;Ljava/lang/String;)Lmiui/reflect/Constructor;
.end method

.method public static getConstructor(Ljava/lang/reflect/Constructor;)Lmiui/reflect/Constructor;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Constructor<",
            "*>;)",
            "Lmiui/reflect/Constructor;"
        }
    .end annotation

    .line 76
    invoke-virtual {p0}, Ljava/lang/reflect/Constructor;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v0

    .line 77
    invoke-virtual {p0}, Ljava/lang/reflect/Constructor;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    .line 78
    invoke-virtual {p0}, Ljava/lang/reflect/Constructor;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v2

    sget-object v3, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    invoke-static {v2, v3}, Lmiui/reflect/ReflectUtils;->getSignature([Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v2

    .line 76
    invoke-static {v0, v1, v2, p0}, Lcom/miui/internal/os/Native;->getConstructor(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;Ljava/lang/reflect/Constructor;)Lmiui/reflect/Constructor;

    move-result-object p0

    return-object p0
.end method

.method public static native getDoubleFieldValue(Lmiui/reflect/Field;Ljava/lang/Object;)D
.end method

.method public static native getField(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)Lmiui/reflect/Field;
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
.end method

.method private static native getField(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/reflect/Field;)Lmiui/reflect/Field;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z",
            "Ljava/lang/reflect/Field;",
            ")",
            "Lmiui/reflect/Field;"
        }
    .end annotation
.end method

.method public static native getField(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lmiui/reflect/Field;
.end method

.method public static getField(Ljava/lang/reflect/Field;)Lmiui/reflect/Field;
    .registers 7

    .line 99
    invoke-virtual {p0}, Ljava/lang/reflect/Field;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v0

    .line 100
    invoke-virtual {p0}, Ljava/lang/reflect/Field;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v2

    .line 101
    invoke-virtual {p0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v3

    invoke-static {v3}, Lmiui/reflect/ReflectUtils;->getSignature(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v3

    .line 102
    invoke-virtual {p0}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v4

    and-int/lit8 v4, v4, 0x8

    if-eqz v4, :cond_22

    const/4 v4, 0x1

    goto :goto_23

    :cond_22
    const/4 v4, 0x0

    .line 99
    :goto_23
    move-object v5, p0

    invoke-static/range {v0 .. v5}, Lcom/miui/internal/os/Native;->getField(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/reflect/Field;)Lmiui/reflect/Field;

    move-result-object p0

    return-object p0
.end method

.method public static native getFloatFieldValue(Lmiui/reflect/Field;Ljava/lang/Object;)F
.end method

.method public static native getIntFieldValue(Lmiui/reflect/Field;Ljava/lang/Object;)I
.end method

.method public static native getIntPropertyNative(Ljava/lang/String;I)I
.end method

.method public static native getLongFieldValue(Lmiui/reflect/Field;Ljava/lang/Object;)J
.end method

.method public static native getLongPropertyNative(Ljava/lang/String;J)J
.end method

.method public static native getMethod(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)Lmiui/reflect/Method;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lmiui/reflect/Method;"
        }
    .end annotation
.end method

.method private static native getMethod(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/reflect/Method;)Lmiui/reflect/Method;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z",
            "Ljava/lang/reflect/Method;",
            ")",
            "Lmiui/reflect/Method;"
        }
    .end annotation
.end method

.method public static native getMethod(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lmiui/reflect/Method;
.end method

.method public static getMethod(Ljava/lang/reflect/Method;)Lmiui/reflect/Method;
    .registers 7

    .line 34
    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v0

    .line 35
    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v2

    .line 36
    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v4

    invoke-static {v3, v4}, Lmiui/reflect/ReflectUtils;->getSignature([Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v3

    .line 37
    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v4

    and-int/lit8 v4, v4, 0x8

    if-eqz v4, :cond_26

    const/4 v4, 0x1

    goto :goto_27

    :cond_26
    const/4 v4, 0x0

    .line 34
    :goto_27
    move-object v5, p0

    invoke-static/range {v0 .. v5}, Lcom/miui/internal/os/Native;->getMethod(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/reflect/Method;)Lmiui/reflect/Method;

    move-result-object p0

    return-object p0
.end method

.method public static native getObjectFieldValue(Lmiui/reflect/Field;Ljava/lang/Object;)Ljava/lang/Object;
.end method

.method public static native getPropertyNative(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public static native getReflectConstructor(Lmiui/reflect/Constructor;)Ljava/lang/reflect/Constructor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lmiui/reflect/Constructor;",
            ")",
            "Ljava/lang/reflect/Constructor<",
            "*>;"
        }
    .end annotation
.end method

.method public static native getReflectField(Lmiui/reflect/Field;)Ljava/lang/reflect/Field;
.end method

.method public static native getReflectMethod(Lmiui/reflect/Method;)Ljava/lang/reflect/Method;
.end method

.method public static native getShortFieldValue(Lmiui/reflect/Field;Ljava/lang/Object;)S
.end method

.method public static native invoke(Lmiui/reflect/Method;Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lmiui/reflect/Method;",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Object;",
            "[",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation
.end method

.method public static native invokeBoolean(Lmiui/reflect/Method;Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lmiui/reflect/Method;",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Object;",
            "[",
            "Ljava/lang/Object;",
            ")Z"
        }
    .end annotation
.end method

.method public static native invokeByte(Lmiui/reflect/Method;Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lmiui/reflect/Method;",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Object;",
            "[",
            "Ljava/lang/Object;",
            ")B"
        }
    .end annotation
.end method

.method public static native invokeChar(Lmiui/reflect/Method;Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)C
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lmiui/reflect/Method;",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Object;",
            "[",
            "Ljava/lang/Object;",
            ")C"
        }
    .end annotation
.end method

.method public static native invokeDouble(Lmiui/reflect/Method;Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)D
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lmiui/reflect/Method;",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Object;",
            "[",
            "Ljava/lang/Object;",
            ")D"
        }
    .end annotation
.end method

.method public static native invokeFloat(Lmiui/reflect/Method;Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lmiui/reflect/Method;",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Object;",
            "[",
            "Ljava/lang/Object;",
            ")F"
        }
    .end annotation
.end method

.method public static native invokeInt(Lmiui/reflect/Method;Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lmiui/reflect/Method;",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Object;",
            "[",
            "Ljava/lang/Object;",
            ")I"
        }
    .end annotation
.end method

.method public static native invokeLong(Lmiui/reflect/Method;Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lmiui/reflect/Method;",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Object;",
            "[",
            "Ljava/lang/Object;",
            ")J"
        }
    .end annotation
.end method

.method public static native invokeObject(Lmiui/reflect/Method;Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lmiui/reflect/Method;",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Object;",
            "[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation
.end method

.method public static native invokeShort(Lmiui/reflect/Method;Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)S
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lmiui/reflect/Method;",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Object;",
            "[",
            "Ljava/lang/Object;",
            ")S"
        }
    .end annotation
.end method

.method public static native newInstance(Lmiui/reflect/Constructor;[Ljava/lang/Object;)Ljava/lang/Object;
.end method

.method public static native rm(Ljava/lang/String;I)Z
.end method

.method public static native setFieldValue(Lmiui/reflect/Field;Ljava/lang/Object;B)V
.end method

.method public static native setFieldValue(Lmiui/reflect/Field;Ljava/lang/Object;C)V
.end method

.method public static native setFieldValue(Lmiui/reflect/Field;Ljava/lang/Object;D)V
.end method

.method public static native setFieldValue(Lmiui/reflect/Field;Ljava/lang/Object;F)V
.end method

.method public static native setFieldValue(Lmiui/reflect/Field;Ljava/lang/Object;I)V
.end method

.method public static native setFieldValue(Lmiui/reflect/Field;Ljava/lang/Object;J)V
.end method

.method public static native setFieldValue(Lmiui/reflect/Field;Ljava/lang/Object;Ljava/lang/Object;)V
.end method

.method public static native setFieldValue(Lmiui/reflect/Field;Ljava/lang/Object;S)V
.end method

.method public static native setFieldValue(Lmiui/reflect/Field;Ljava/lang/Object;Z)V
.end method

.method public static native setPropertyNative(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public static native umask(I)I
.end method
