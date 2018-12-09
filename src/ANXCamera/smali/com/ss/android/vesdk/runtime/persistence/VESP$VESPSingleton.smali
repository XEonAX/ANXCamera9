.class final enum Lcom/ss/android/vesdk/runtime/persistence/VESP$VESPSingleton;
.super Ljava/lang/Enum;
.source "VESP.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/android/vesdk/runtime/persistence/VESP;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "VESPSingleton"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ss/android/vesdk/runtime/persistence/VESP$VESPSingleton;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ss/android/vesdk/runtime/persistence/VESP$VESPSingleton;

.field public static final enum INSTANCE:Lcom/ss/android/vesdk/runtime/persistence/VESP$VESPSingleton;


# instance fields
.field private mInstance:Lcom/ss/android/vesdk/runtime/persistence/VESP;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 18
    new-instance v0, Lcom/ss/android/vesdk/runtime/persistence/VESP$VESPSingleton;

    const-string v1, "INSTANCE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/ss/android/vesdk/runtime/persistence/VESP$VESPSingleton;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ss/android/vesdk/runtime/persistence/VESP$VESPSingleton;->INSTANCE:Lcom/ss/android/vesdk/runtime/persistence/VESP$VESPSingleton;

    .line 17
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/ss/android/vesdk/runtime/persistence/VESP$VESPSingleton;

    sget-object v1, Lcom/ss/android/vesdk/runtime/persistence/VESP$VESPSingleton;->INSTANCE:Lcom/ss/android/vesdk/runtime/persistence/VESP$VESPSingleton;

    aput-object v1, v0, v2

    sput-object v0, Lcom/ss/android/vesdk/runtime/persistence/VESP$VESPSingleton;->$VALUES:[Lcom/ss/android/vesdk/runtime/persistence/VESP$VESPSingleton;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 22
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 23
    new-instance p1, Lcom/ss/android/vesdk/runtime/persistence/VESP;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Lcom/ss/android/vesdk/runtime/persistence/VESP;-><init>(Lcom/ss/android/vesdk/runtime/persistence/VESP$1;)V

    iput-object p1, p0, Lcom/ss/android/vesdk/runtime/persistence/VESP$VESPSingleton;->mInstance:Lcom/ss/android/vesdk/runtime/persistence/VESP;

    .line 24
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/persistence/VESP$VESPSingleton;
    .locals 1

    .line 17
    const-class v0, Lcom/ss/android/vesdk/runtime/persistence/VESP$VESPSingleton;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/ss/android/vesdk/runtime/persistence/VESP$VESPSingleton;

    return-object p0
.end method

.method public static values()[Lcom/ss/android/vesdk/runtime/persistence/VESP$VESPSingleton;
    .locals 1

    .line 17
    sget-object v0, Lcom/ss/android/vesdk/runtime/persistence/VESP$VESPSingleton;->$VALUES:[Lcom/ss/android/vesdk/runtime/persistence/VESP$VESPSingleton;

    invoke-virtual {v0}, [Lcom/ss/android/vesdk/runtime/persistence/VESP$VESPSingleton;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/ss/android/vesdk/runtime/persistence/VESP$VESPSingleton;

    return-object v0
.end method


# virtual methods
.method public getInstance()Lcom/ss/android/vesdk/runtime/persistence/VESP;
    .locals 1

    .line 27
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/persistence/VESP$VESPSingleton;->mInstance:Lcom/ss/android/vesdk/runtime/persistence/VESP;

    return-object v0
.end method
