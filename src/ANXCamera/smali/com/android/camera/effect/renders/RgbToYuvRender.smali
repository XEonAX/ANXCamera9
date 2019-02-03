.class public Lcom/android/camera/effect/renders/RgbToYuvRender;
.super Lcom/android/camera/effect/renders/PixelEffectRender;
.source "RgbToYuvRender.java"


# static fields
.field private static final FRAGMENT_SHADER_NV12:Ljava/lang/String; = "precision highp float; \nuniform sampler2D sTexture; \nuniform vec2 uSize; \nvarying vec2 vTexCoord; \nuniform float uAlpha; \nfloat getY(float x, float y) { \n    vec3 pix = texture2D(sTexture, vec2(x, y)).rgb; \n    return 0.299 * pix.r + 0.587 * pix.g + 0.114 * pix.b; \n} \nfloat getU(float x, float y) { \n    vec3 pix = texture2D(sTexture, vec2(x, y)).rgb; \n    return clamp(-0.16874 * pix.r - 0.33126 * pix.g + 0.5 * pix.b + 0.5, 0.0, 1.0); \n} \nfloat getV(float x, float y) { \n    vec3 pix = texture2D(sTexture, vec2(x, y)).rgb; \n    return clamp(0.5 * pix.r - 0.41869 * pix.g - 0.08131 * pix.b + 0.5, 0.0, 1.0); \n} \nvoid main() { \n    float x, y; \n    if (vTexCoord.y < 0.5) { \n        if (vTexCoord.x < 0.25) { \n            x = vTexCoord.x * 4.0; \n            y = vTexCoord.y * 2.0; \n        } else if (vTexCoord.x < 0.5) { \n            x = vTexCoord.x * 4.0 - 1.0; \n            y = vTexCoord.y * 2.0 + 1.0 / uSize.y; \n        } \n        vec4 yyyy; \n        yyyy.x = getY(x + 0.0 / uSize.x, y); \n        yyyy.y = getY(x + 1.0 / uSize.x, y); \n        yyyy.z = getY(x + 2.0 / uSize.x, y); \n        yyyy.w = getY(x + 3.0 / uSize.x, y); \n        gl_FragColor = yyyy; \n    } else if (vTexCoord.y < 0.75 + 0.6 / uSize.y) { \n        if (vTexCoord.x < 0.25) { \n            x = vTexCoord.x * 4.0; \n            y = vTexCoord.y * 4.0 - 2.0; \n        } else if (vTexCoord.x < 0.5) { \n            x = vTexCoord.x * 4.0 - 1.0; \n            y = vTexCoord.y * 4.0 - 2.0 + 2.0 / uSize.y; \n        } \n        vec4 vuvu; \n        vuvu.x = getV(x + 0.0 / uSize.x, y); \n        vuvu.y = getU(x + 0.0 / uSize.x, y); \n        vuvu.z = getV(x + 2.0 / uSize.x, y); \n        vuvu.w = getU(x + 2.0 / uSize.x, y); \n        gl_FragColor = vuvu; \n    } \n}"


# instance fields
.field protected mUniformSizeH:I


# direct methods
.method public constructor <init>(Lcom/android/gallery3d/ui/GLCanvas;I)V
    .locals 0

    .line 13
    invoke-direct {p0, p1, p2}, Lcom/android/camera/effect/renders/PixelEffectRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;I)V

    .line 14
    return-void
.end method


# virtual methods
.method public draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)Z
    .locals 6

    .line 34
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 35
    invoke-super {p0, p1}, Lcom/android/camera/effect/renders/PixelEffectRender;->draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)Z

    move-result p1

    .line 36
    const-string v2, "RgbToYuvRender"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "drawTime="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v0

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    return p1
.end method

.method public getFragShaderString()Ljava/lang/String;
    .locals 1

    .line 18
    const-string v0, "precision highp float; \nuniform sampler2D sTexture; \nuniform vec2 uSize; \nvarying vec2 vTexCoord; \nuniform float uAlpha; \nfloat getY(float x, float y) { \n    vec3 pix = texture2D(sTexture, vec2(x, y)).rgb; \n    return 0.299 * pix.r + 0.587 * pix.g + 0.114 * pix.b; \n} \nfloat getU(float x, float y) { \n    vec3 pix = texture2D(sTexture, vec2(x, y)).rgb; \n    return clamp(-0.16874 * pix.r - 0.33126 * pix.g + 0.5 * pix.b + 0.5, 0.0, 1.0); \n} \nfloat getV(float x, float y) { \n    vec3 pix = texture2D(sTexture, vec2(x, y)).rgb; \n    return clamp(0.5 * pix.r - 0.41869 * pix.g - 0.08131 * pix.b + 0.5, 0.0, 1.0); \n} \nvoid main() { \n    float x, y; \n    if (vTexCoord.y < 0.5) { \n        if (vTexCoord.x < 0.25) { \n            x = vTexCoord.x * 4.0; \n            y = vTexCoord.y * 2.0; \n        } else if (vTexCoord.x < 0.5) { \n            x = vTexCoord.x * 4.0 - 1.0; \n            y = vTexCoord.y * 2.0 + 1.0 / uSize.y; \n        } \n        vec4 yyyy; \n        yyyy.x = getY(x + 0.0 / uSize.x, y); \n        yyyy.y = getY(x + 1.0 / uSize.x, y); \n        yyyy.z = getY(x + 2.0 / uSize.x, y); \n        yyyy.w = getY(x + 3.0 / uSize.x, y); \n        gl_FragColor = yyyy; \n    } else if (vTexCoord.y < 0.75 + 0.6 / uSize.y) { \n        if (vTexCoord.x < 0.25) { \n            x = vTexCoord.x * 4.0; \n            y = vTexCoord.y * 4.0 - 2.0; \n        } else if (vTexCoord.x < 0.5) { \n            x = vTexCoord.x * 4.0 - 1.0; \n            y = vTexCoord.y * 4.0 - 2.0 + 2.0 / uSize.y; \n        } \n        vec4 vuvu; \n        vuvu.x = getV(x + 0.0 / uSize.x, y); \n        vuvu.y = getU(x + 0.0 / uSize.x, y); \n        vuvu.z = getV(x + 2.0 / uSize.x, y); \n        vuvu.w = getU(x + 2.0 / uSize.x, y); \n        gl_FragColor = vuvu; \n    } \n}"

    return-object v0
.end method

.method protected initShader()V
    .locals 2

    .line 23
    invoke-super {p0}, Lcom/android/camera/effect/renders/PixelEffectRender;->initShader()V

    .line 24
    iget v0, p0, Lcom/android/camera/effect/renders/RgbToYuvRender;->mProgram:I

    const-string v1, "uSize"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/camera/effect/renders/RgbToYuvRender;->mUniformSizeH:I

    .line 25
    return-void
.end method

.method protected initShaderValue(Z)V
    .locals 2

    .line 29
    invoke-super {p0, p1}, Lcom/android/camera/effect/renders/PixelEffectRender;->initShaderValue(Z)V

    .line 30
    iget p1, p0, Lcom/android/camera/effect/renders/RgbToYuvRender;->mUniformSizeH:I

    iget v0, p0, Lcom/android/camera/effect/renders/RgbToYuvRender;->mViewportWidth:I

    int-to-float v0, v0

    iget v1, p0, Lcom/android/camera/effect/renders/RgbToYuvRender;->mViewportHeight:I

    int-to-float v1, v1

    invoke-static {p1, v0, v1}, Landroid/opengl/GLES20;->glUniform2f(IFF)V

    .line 31
    return-void
.end method
