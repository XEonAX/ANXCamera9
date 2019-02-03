.class public Lmiui/os/SystemProperties;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final Ej:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROP_NAME_MAX:I = 0x1f

.field public static final PROP_VALUE_MAX:I = 0x5b


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 25
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lmiui/os/SystemProperties;->Ej:Ljava/util/ArrayList;

    return-void
.end method

.method protected constructor <init>()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InstantiationException;
        }
    .end annotation

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    new-instance v0, Ljava/lang/InstantiationException;

    const-string v1, "Cannot instantiate utility class"

    invoke-direct {v0, v1}, Ljava/lang/InstantiationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static addChangeCallback(Ljava/lang/Runnable;)V
    .registers 3

    .line 157
    sget-object v0, Lmiui/os/SystemProperties;->Ej:Ljava/util/ArrayList;

    monitor-enter v0

    .line 158
    :try_start_3
    sget-object v1, Lmiui/os/SystemProperties;->Ej:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-nez v1, :cond_10

    .line 159
    const-class v1, Lmiui/os/SystemProperties;

    invoke-static {v1}, Lcom/miui/internal/os/Native;->addPropertyChangeCallbackNative(Ljava/lang/Class;)V

    .line 161
    :cond_10
    sget-object v1, Lmiui/os/SystemProperties;->Ej:Ljava/util/ArrayList;

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 162
    monitor-exit v0

    .line 163
    return-void

    .line 162
    :catchall_17
    move-exception p0

    monitor-exit v0
    :try_end_19
    .catchall {:try_start_3 .. :try_end_19} :catchall_17

    throw p0
.end method

.method protected static callChangeCallbacks()V
    .registers 4

    .line 172
    sget-object v0, Lmiui/os/SystemProperties;->Ej:Ljava/util/ArrayList;

    monitor-enter v0

    .line 173
    :try_start_3
    sget-object v1, Lmiui/os/SystemProperties;->Ej:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-nez v1, :cond_d

    .line 174
    monitor-exit v0

    return-void

    .line 176
    :cond_d
    new-instance v1, Ljava/util/ArrayList;

    sget-object v2, Lmiui/os/SystemProperties;->Ej:Ljava/util/ArrayList;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 177
    const/4 v2, 0x0

    :goto_15
    sget-object v3, Lmiui/os/SystemProperties;->Ej:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_29

    .line 178
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Runnable;

    invoke-interface {v3}, Ljava/lang/Runnable;->run()V

    .line 177
    add-int/lit8 v2, v2, 0x1

    goto :goto_15

    .line 180
    :cond_29
    monitor-exit v0

    .line 181
    return-void

    .line 180
    :catchall_2b
    move-exception v1

    monitor-exit v0
    :try_end_2d
    .catchall {:try_start_3 .. :try_end_2d} :catchall_2b

    throw v1
.end method

.method public static get(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 41
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x1f

    if-gt v0, v1, :cond_d

    .line 44
    invoke-static {p0}, Lcom/miui/internal/os/Native;->getPropertyNative(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 42
    :cond_d
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "key.length > 31"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 53
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x1f

    if-gt v0, v1, :cond_17

    .line 56
    invoke-static {p0}, Lcom/miui/internal/os/Native;->getPropertyNative(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 57
    if-eqz p0, :cond_14

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_16

    .line 58
    :cond_14
    nop

    .line 60
    move-object p0, p1

    :cond_16
    return-object p0

    .line 54
    :cond_17
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "key.length > 31"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static getBoolean(Ljava/lang/String;Z)Z
    .registers 4

    .line 107
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x1f

    if-gt v0, v1, :cond_d

    .line 110
    invoke-static {p0, p1}, Lcom/miui/internal/os/Native;->getBooleanPropertyNative(Ljava/lang/String;Z)Z

    move-result p0

    return p0

    .line 108
    :cond_d
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "key.length > 31"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static getInt(Ljava/lang/String;I)I
    .registers 4

    .line 72
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x1f

    if-gt v0, v1, :cond_d

    .line 75
    invoke-static {p0, p1}, Lcom/miui/internal/os/Native;->getIntPropertyNative(Ljava/lang/String;I)I

    move-result p0

    return p0

    .line 73
    :cond_d
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "key.length > 31"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static getLong(Ljava/lang/String;J)J
    .registers 5

    .line 87
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x1f

    if-gt v0, v1, :cond_d

    .line 90
    invoke-static {p0, p1, p2}, Lcom/miui/internal/os/Native;->getLongPropertyNative(Ljava/lang/String;J)J

    move-result-wide p0

    return-wide p0

    .line 88
    :cond_d
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "key.length > 31"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static removeChangeCallback(Ljava/lang/Runnable;)V
    .registers 3

    .line 166
    sget-object v0, Lmiui/os/SystemProperties;->Ej:Ljava/util/ArrayList;

    monitor-enter v0

    .line 167
    :try_start_3
    sget-object v1, Lmiui/os/SystemProperties;->Ej:Ljava/util/ArrayList;

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 168
    monitor-exit v0

    .line 169
    return-void

    .line 168
    :catchall_a
    move-exception p0

    monitor-exit v0
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw p0
.end method

.method public static set(Ljava/lang/String;I)V
    .registers 2

    .line 135
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lmiui/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 136
    return-void
.end method

.method public static set(Ljava/lang/String;J)V
    .registers 3

    .line 144
    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lmiui/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 145
    return-void
.end method

.method public static set(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    .line 119
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x1f

    if-gt v0, v1, :cond_1f

    .line 122
    if-eqz p1, :cond_1b

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x5b

    if-gt v0, v1, :cond_13

    goto :goto_1b

    .line 123
    :cond_13
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "val.length > 91"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 126
    :cond_1b
    :goto_1b
    invoke-static {p0, p1}, Lcom/miui/internal/os/Native;->setPropertyNative(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    return-void

    .line 120
    :cond_1f
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "key.length > 31"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static set(Ljava/lang/String;Z)V
    .registers 2

    .line 153
    invoke-static {p1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lmiui/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 154
    return-void
.end method
