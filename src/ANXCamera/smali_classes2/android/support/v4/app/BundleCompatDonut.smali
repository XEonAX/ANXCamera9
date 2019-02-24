.class Landroid/support/v4/app/BundleCompatDonut;
.super Ljava/lang/Object;
.source "BundleCompatDonut.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "BundleCompatDonut"

.field private static sGetIBinderMethod:Ljava/lang/reflect/Method;

.field private static sGetIBinderMethodFetched:Z

.field private static sPutIBinderMethod:Ljava/lang/reflect/Method;

.field private static sPutIBinderMethodFetched:Z


# direct methods
.method constructor <init>()V
    .registers 1

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getBinder(Landroid/os/Bundle;Ljava/lang/String;)Landroid/os/IBinder;
    .registers 8
    .param p0, "bundle"    # Landroid/os/Bundle;
    .param p1, "key"    # Ljava/lang/String;

    .line 39
    sget-boolean v0, Landroid/support/v4/app/BundleCompatDonut;->sGetIBinderMethodFetched:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_26

    .line 41
    :try_start_6
    const-class v0, Landroid/os/Bundle;

    const-string v3, "getIBinder"

    new-array v4, v2, [Ljava/lang/Class;

    const-class v5, Ljava/lang/String;

    aput-object v5, v4, v1

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Landroid/support/v4/app/BundleCompatDonut;->sGetIBinderMethod:Ljava/lang/reflect/Method;

    .line 42
    sget-object v0, Landroid/support/v4/app/BundleCompatDonut;->sGetIBinderMethod:Ljava/lang/reflect/Method;

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V
    :try_end_1b
    .catch Ljava/lang/NoSuchMethodException; {:try_start_6 .. :try_end_1b} :catch_1c

    .line 45
    goto :goto_24

    .line 43
    :catch_1c
    move-exception v0

    .line 44
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    const-string v3, "BundleCompatDonut"

    const-string v4, "Failed to retrieve getIBinder method"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 46
    .end local v0    # "e":Ljava/lang/NoSuchMethodException;
    :goto_24
    sput-boolean v2, Landroid/support/v4/app/BundleCompatDonut;->sGetIBinderMethodFetched:Z

    .line 49
    :cond_26
    sget-object v0, Landroid/support/v4/app/BundleCompatDonut;->sGetIBinderMethod:Ljava/lang/reflect/Method;

    const/4 v3, 0x0

    if-eqz v0, :cond_59

    .line 51
    :try_start_2b
    sget-object v0, Landroid/support/v4/app/BundleCompatDonut;->sGetIBinderMethod:Ljava/lang/reflect/Method;

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p1, v2, v1

    invoke-virtual {v0, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/IBinder;
    :try_end_37
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_2b .. :try_end_37} :catch_4e
    .catch Ljava/lang/IllegalAccessException; {:try_start_2b .. :try_end_37} :catch_43
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2b .. :try_end_37} :catch_38

    return-object v0

    .line 58
    :catch_38
    move-exception v0

    .line 59
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    const-string v1, "BundleCompatDonut"

    const-string v2, "Failed to invoke getIBinder via reflection"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 60
    sput-object v3, Landroid/support/v4/app/BundleCompatDonut;->sGetIBinderMethod:Ljava/lang/reflect/Method;

    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    goto :goto_59

    .line 55
    :catch_43
    move-exception v0

    .line 56
    .local v0, "e":Ljava/lang/IllegalAccessException;
    const-string v1, "BundleCompatDonut"

    const-string v2, "Failed to invoke getIBinder via reflection"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 57
    sput-object v3, Landroid/support/v4/app/BundleCompatDonut;->sGetIBinderMethod:Ljava/lang/reflect/Method;

    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    goto :goto_58

    .line 52
    :catch_4e
    move-exception v0

    .line 53
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    const-string v1, "BundleCompatDonut"

    const-string v2, "Failed to invoke getIBinder via reflection"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 54
    sput-object v3, Landroid/support/v4/app/BundleCompatDonut;->sGetIBinderMethod:Ljava/lang/reflect/Method;

    .line 61
    .end local v0    # "e":Ljava/lang/reflect/InvocationTargetException;
    :goto_58
    nop

    .line 63
    :cond_59
    :goto_59
    return-object v3
.end method

.method public static putBinder(Landroid/os/Bundle;Ljava/lang/String;Landroid/os/IBinder;)V
    .registers 10
    .param p0, "bundle"    # Landroid/os/Bundle;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "binder"    # Landroid/os/IBinder;

    .line 67
    sget-boolean v0, Landroid/support/v4/app/BundleCompatDonut;->sPutIBinderMethodFetched:Z

    const/4 v1, 0x0

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-nez v0, :cond_2b

    .line 69
    :try_start_7
    const-class v0, Landroid/os/Bundle;

    const-string v4, "putIBinder"

    new-array v5, v2, [Ljava/lang/Class;

    const-class v6, Ljava/lang/String;

    aput-object v6, v5, v1

    const-class v6, Landroid/os/IBinder;

    aput-object v6, v5, v3

    invoke-virtual {v0, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Landroid/support/v4/app/BundleCompatDonut;->sPutIBinderMethod:Ljava/lang/reflect/Method;

    .line 71
    sget-object v0, Landroid/support/v4/app/BundleCompatDonut;->sPutIBinderMethod:Ljava/lang/reflect/Method;

    invoke-virtual {v0, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V
    :try_end_20
    .catch Ljava/lang/NoSuchMethodException; {:try_start_7 .. :try_end_20} :catch_21

    .line 74
    goto :goto_29

    .line 72
    :catch_21
    move-exception v0

    .line 73
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    const-string v4, "BundleCompatDonut"

    const-string v5, "Failed to retrieve putIBinder method"

    invoke-static {v4, v5, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 75
    .end local v0    # "e":Ljava/lang/NoSuchMethodException;
    :goto_29
    sput-boolean v3, Landroid/support/v4/app/BundleCompatDonut;->sPutIBinderMethodFetched:Z

    .line 78
    :cond_2b
    sget-object v0, Landroid/support/v4/app/BundleCompatDonut;->sPutIBinderMethod:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_5d

    .line 80
    const/4 v0, 0x0

    :try_start_30
    sget-object v4, Landroid/support/v4/app/BundleCompatDonut;->sPutIBinderMethod:Ljava/lang/reflect/Method;

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p1, v2, v1

    aput-object p2, v2, v3

    invoke-virtual {v4, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3b
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_30 .. :try_end_3b} :catch_52
    .catch Ljava/lang/IllegalAccessException; {:try_start_30 .. :try_end_3b} :catch_47
    .catch Ljava/lang/IllegalArgumentException; {:try_start_30 .. :try_end_3b} :catch_3c

    goto :goto_5c

    .line 87
    :catch_3c
    move-exception v1

    .line 88
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    const-string v2, "BundleCompatDonut"

    const-string v3, "Failed to invoke putIBinder via reflection"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 89
    sput-object v0, Landroid/support/v4/app/BundleCompatDonut;->sPutIBinderMethod:Ljava/lang/reflect/Method;

    .end local v1    # "e":Ljava/lang/IllegalArgumentException;
    goto :goto_5d

    .line 84
    :catch_47
    move-exception v1

    .line 85
    .local v1, "e":Ljava/lang/IllegalAccessException;
    const-string v2, "BundleCompatDonut"

    const-string v3, "Failed to invoke putIBinder via reflection"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 86
    sput-object v0, Landroid/support/v4/app/BundleCompatDonut;->sPutIBinderMethod:Ljava/lang/reflect/Method;

    .end local v1    # "e":Ljava/lang/IllegalAccessException;
    goto :goto_5c

    .line 81
    :catch_52
    move-exception v1

    .line 82
    .local v1, "e":Ljava/lang/reflect/InvocationTargetException;
    const-string v2, "BundleCompatDonut"

    const-string v3, "Failed to invoke putIBinder via reflection"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 83
    sput-object v0, Landroid/support/v4/app/BundleCompatDonut;->sPutIBinderMethod:Ljava/lang/reflect/Method;

    .line 90
    .end local v1    # "e":Ljava/lang/reflect/InvocationTargetException;
    :goto_5c
    nop

    .line 92
    :cond_5d
    :goto_5d
    return-void
.end method
