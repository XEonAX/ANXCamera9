.class public interface abstract annotation Lcom/xiaomi/engine/ErrorType;
.super Ljava/lang/Object;
.source "ErrorType.java"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation runtime Ljava/lang/annotation/Retention;
    value = .enum Ljava/lang/annotation/RetentionPolicy;->SOURCE:Ljava/lang/annotation/RetentionPolicy;
.end annotation


# static fields
.field public static final MI_RTN_EXEC_FAILED:I = 0x9

.field public static final MI_RTN_FAIL_THREAD:I = 0x3

.field public static final MI_RTN_FAIL_WORKTASK:I = 0xf

.field public static final MI_RTN_INVALID_FUC_CALL:I = 0xe

.field public static final MI_RTN_INVALID_PARAM:I = 0x1

.field public static final MI_RTN_MAP_FAILED:I = 0x5

.field public static final MI_RTN_NORMAL:I = 0x0

.field public static final MI_RTN_NO_EVENT:I = 0xa

.field public static final MI_RTN_NO_FOUND:I = 0x2

.field public static final MI_RTN_NO_MEM:I = 0x4

.field public static final MI_RTN_NO_SERVICE:I = 0x10

.field public static final MI_RTN_NO_TASK:I = 0xc

.field public static final MI_RTN_OPEN_FAILED:I = 0xd

.field public static final MI_RTN_SET_PARAM_FAILED:I = 0xb

.field public static final MI_RTN_UNINITIALIZED:I = 0x7

.field public static final MI_RTN_UNMAP_FAILED:I = 0x6

.field public static final MI_RTN_UPDATE_FAILED:I = 0x8
