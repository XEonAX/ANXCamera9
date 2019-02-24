.class Landroid/support/v4/widget/CircleImageView$OvalShadow;
.super Landroid/graphics/drawable/shapes/OvalShape;
.source "CircleImageView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/widget/CircleImageView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "OvalShadow"
.end annotation


# instance fields
.field private mCircleDiameter:I

.field private mRadialGradient:Landroid/graphics/RadialGradient;

.field private mShadowPaint:Landroid/graphics/Paint;

.field final synthetic this$0:Landroid/support/v4/widget/CircleImageView;


# direct methods
.method public constructor <init>(Landroid/support/v4/widget/CircleImageView;II)V
    .registers 12
    .param p2, "shadowRadius"    # I
    .param p3, "circleDiameter"    # I

    .line 132
    iput-object p1, p0, Landroid/support/v4/widget/CircleImageView$OvalShadow;->this$0:Landroid/support/v4/widget/CircleImageView;

    .line 133
    invoke-direct {p0}, Landroid/graphics/drawable/shapes/OvalShape;-><init>()V

    .line 134
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Landroid/support/v4/widget/CircleImageView$OvalShadow;->mShadowPaint:Landroid/graphics/Paint;

    .line 135
    # setter for: Landroid/support/v4/widget/CircleImageView;->mShadowRadius:I
    invoke-static {p1, p2}, Landroid/support/v4/widget/CircleImageView;->access$002(Landroid/support/v4/widget/CircleImageView;I)I

    .line 136
    iput p3, p0, Landroid/support/v4/widget/CircleImageView$OvalShadow;->mCircleDiameter:I

    .line 137
    new-instance v0, Landroid/graphics/RadialGradient;

    iget v1, p0, Landroid/support/v4/widget/CircleImageView$OvalShadow;->mCircleDiameter:I

    const/4 v2, 0x2

    div-int/2addr v1, v2

    int-to-float v3, v1

    iget v1, p0, Landroid/support/v4/widget/CircleImageView$OvalShadow;->mCircleDiameter:I

    div-int/2addr v1, v2

    int-to-float v4, v1

    # getter for: Landroid/support/v4/widget/CircleImageView;->mShadowRadius:I
    invoke-static {p1}, Landroid/support/v4/widget/CircleImageView;->access$000(Landroid/support/v4/widget/CircleImageView;)I

    move-result p1

    int-to-float p1, p1

    new-array v5, v2, [I

    fill-array-data v5, :array_3a

    sget-object v7, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    const/4 v6, 0x0

    move-object v1, v0

    move v2, v3

    move v3, v4

    move v4, p1

    invoke-direct/range {v1 .. v7}, Landroid/graphics/RadialGradient;-><init>(FFF[I[FLandroid/graphics/Shader$TileMode;)V

    iput-object v0, p0, Landroid/support/v4/widget/CircleImageView$OvalShadow;->mRadialGradient:Landroid/graphics/RadialGradient;

    .line 141
    iget-object p1, p0, Landroid/support/v4/widget/CircleImageView$OvalShadow;->mShadowPaint:Landroid/graphics/Paint;

    iget-object v0, p0, Landroid/support/v4/widget/CircleImageView$OvalShadow;->mRadialGradient:Landroid/graphics/RadialGradient;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 142
    return-void

    :array_3a
    .array-data 4
        0x3d000000    # 0.03125f
        0x0
    .end array-data
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;Landroid/graphics/Paint;)V
    .registers 9
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "paint"    # Landroid/graphics/Paint;

    .line 146
    iget-object v0, p0, Landroid/support/v4/widget/CircleImageView$OvalShadow;->this$0:Landroid/support/v4/widget/CircleImageView;

    invoke-virtual {v0}, Landroid/support/v4/widget/CircleImageView;->getWidth()I

    move-result v0

    .line 147
    .local v0, "viewWidth":I
    iget-object v1, p0, Landroid/support/v4/widget/CircleImageView$OvalShadow;->this$0:Landroid/support/v4/widget/CircleImageView;

    invoke-virtual {v1}, Landroid/support/v4/widget/CircleImageView;->getHeight()I

    move-result v1

    .line 148
    .local v1, "viewHeight":I
    div-int/lit8 v2, v0, 0x2

    int-to-float v2, v2

    div-int/lit8 v3, v1, 0x2

    int-to-float v3, v3

    iget v4, p0, Landroid/support/v4/widget/CircleImageView$OvalShadow;->mCircleDiameter:I

    div-int/lit8 v4, v4, 0x2

    iget-object v5, p0, Landroid/support/v4/widget/CircleImageView$OvalShadow;->this$0:Landroid/support/v4/widget/CircleImageView;

    # getter for: Landroid/support/v4/widget/CircleImageView;->mShadowRadius:I
    invoke-static {v5}, Landroid/support/v4/widget/CircleImageView;->access$000(Landroid/support/v4/widget/CircleImageView;)I

    move-result v5

    add-int/2addr v4, v5

    int-to-float v4, v4

    iget-object v5, p0, Landroid/support/v4/widget/CircleImageView$OvalShadow;->mShadowPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 150
    div-int/lit8 v2, v0, 0x2

    int-to-float v2, v2

    div-int/lit8 v3, v1, 0x2

    int-to-float v3, v3

    iget v4, p0, Landroid/support/v4/widget/CircleImageView$OvalShadow;->mCircleDiameter:I

    div-int/lit8 v4, v4, 0x2

    int-to-float v4, v4

    invoke-virtual {p1, v2, v3, v4, p2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 151
    return-void
.end method
