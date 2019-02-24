.class public Lcom/bef/effectsdk/ModelsList;
.super Ljava/lang/Object;
.source "ModelsList.java"


# static fields
.field public static final list:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 24

    .line 7
    const-string v0, "model/jointmodel/tt_joints_v2.0.model"

    const-string v1, "model/platemodel/tt_plate_v1.0.model"

    const-string v2, "model/petfacemodel/tt_petface_v2.4.model"

    const-string v3, "model/catmodel/tt_catface_v2.0.model"

    const-string v4, "model/facefitting/tt_facefitting_v2.0.model"

    const-string v5, "model/skysegmodel/tt_skyseg_v4.0.model"

    const-string v6, "model/skeleton_model/tt_skeleton_v2.0.model"

    const-string v7, "model/skeleton_model/tt_skeleton_template_v1.0.config"

    const-string v8, "model/actionmodel/action_detection_v3.0.model"

    const-string v9, "model/actionmodel/douyin_pose_estimated_params_v2.model"

    const-string v10, "model/hairparser/tt_hair_v5.0.model"

    const-string v11, "model/ttfacemodel/tt_face_extra_v7.0.model"

    const-string v12, "model/ttfacemodel/tt_face_v5.0.model"

    const-string v13, "model/handmodel/tt_hand_gesture_v5.0.model"

    const-string v14, "model/handmodel/tt_hand_box_reg_v6.0.model"

    const-string v15, "model/handmodel/tt_hand_det_v6.0.model"

    const-string v16, "model/handmodel/tt_hand_kp_v4.0.model"

    const-string v17, "model/mattingmodel/tt_matting_v6.0.model"

    const-string v18, "model/mattingmodel/tt_matting_metal_v1.0.model"

    const-string v19, "model/slammodel/phoneParam.txt"

    const-string v20, "model/colorcard/lookup.png"

    const-string v21, "model/face3dmodel/tt_face3dmm_v1.0.model"

    const-string v22, "model/ttfaceattrmodel/tt_face_beauty_v2.0.model"

    const-string v23, "model/ttfaceattrmodel/tt_face_attribute_v3.1.model"

    filled-new-array/range {v0 .. v23}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/bef/effectsdk/ModelsList;->list:Ljava/util/List;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
