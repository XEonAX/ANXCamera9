.class public interface abstract Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;
.super Ljava/lang/Object;
.source "IJsonConverter.java"


# virtual methods
.method public abstract convertJsonToObj(Ljava/io/InputStream;Ljava/lang/Class;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/io/InputStream;",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation
.end method

.method public abstract convertObjToJson(Ljava/lang/Object;)Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)",
            "Ljava/lang/String;"
        }
    .end annotation
.end method
