package com.android.camera.panorama;

import android.content.Context;
import android.util.JsonReader;
import com.android.camera.log.Log;
import java.io.IOException;

public class PanoramaSetting {
    private static final boolean DEBUG = false;
    public static final String KEY_AOVX = "aovx";
    public static final String KEY_AOVY = "aovy";
    public static final String KEY_AOV_GAIN = "aov_gain";
    public static final String KEY_CALCSEAM_PIXNUM = "calcseam_pixnum";
    public static final String KEY_DISTORTION_K1 = "distortion_k1";
    public static final String KEY_DISTORTION_K2 = "distortion_k2";
    public static final String KEY_DISTORTION_K3 = "distortion_k3";
    public static final String KEY_DISTORTION_K4 = "distortion_k4";
    public static final String KEY_DRAW_THRESHOLD = "draw_threshold";
    public static final String KEY_ROTATION_RATIO = "rotation_ratio";
    public static final String KEY_SEAMSEARCH_RATIO = "seamsearch_ratio";
    public static final String KEY_SHRINK_RATIO = "shrink_ratio";
    public static final String KEY_USE_DEFORM = "use_deform";
    public static final String KEY_USE_LUMINANCE_CORRECTION = "use_luminance_correction";
    public static final String KEY_ZROTATION_COEFF = "zrotation_coeff";
    private static final String TAG = "PanoramaSetting";
    private double aov_gain = 1.0d;
    private double aovx = 70.4000015258789d;
    private double aovy = 55.70000076293945d;
    private int calcseam_pixnum = 32400;
    private double distortion_k1 = 0.0d;
    private double distortion_k2 = 0.0d;
    private double distortion_k3 = 0.0d;
    private double distortion_k4 = 0.0d;
    private double draw_threshold = 0.5d;
    private int motion_detection_mode = 0;
    private int projection_mode = 0;
    private double rotation_ratio = 1.0d;
    private double seamsearch_ratio = 1.0d;
    private float shrink_ratio = 7.5f;
    private boolean use_deform = false;
    private boolean use_luminance_correction = true;
    private double zrotation_coeff = 0.95d;

    public PanoramaSetting(Context context) {
        Log.d(TAG, toString());
    }

    private void parseSetting(JsonReader jsonReader) throws IOException {
        jsonReader.beginObject();
        while (jsonReader.hasNext()) {
            String nextName = jsonReader.nextName();
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("read key ");
            stringBuilder.append(nextName);
            Log.d(str, stringBuilder.toString());
            Object obj = -1;
            try {
                switch (nextName.hashCode()) {
                    case -1913048451:
                        if (nextName.equals(KEY_USE_DEFORM)) {
                            obj = 4;
                            break;
                        }
                        break;
                    case -1861106499:
                        if (nextName.equals(KEY_USE_LUMINANCE_CORRECTION)) {
                            obj = 5;
                            break;
                        }
                        break;
                    case -1476979982:
                        if (nextName.equals(KEY_ZROTATION_COEFF)) {
                            obj = 7;
                            break;
                        }
                        break;
                    case -701256694:
                        if (nextName.equals(KEY_ROTATION_RATIO)) {
                            obj = 14;
                            break;
                        }
                        break;
                    case -591575248:
                        if (nextName.equals(KEY_DRAW_THRESHOLD)) {
                            obj = 8;
                            break;
                        }
                        break;
                    case -234320299:
                        if (nextName.equals(KEY_SHRINK_RATIO)) {
                            obj = 2;
                            break;
                        }
                        break;
                    case 3000176:
                        if (nextName.equals(KEY_AOVX)) {
                            obj = null;
                            break;
                        }
                        break;
                    case 3000177:
                        if (nextName.equals(KEY_AOVY)) {
                            obj = 1;
                            break;
                        }
                        break;
                    case 15721843:
                        if (nextName.equals(KEY_CALCSEAM_PIXNUM)) {
                            obj = 3;
                            break;
                        }
                        break;
                    case 107805618:
                        if (nextName.equals(KEY_SEAMSEARCH_RATIO)) {
                            obj = 6;
                            break;
                        }
                        break;
                    case 451710806:
                        if (nextName.equals(KEY_AOV_GAIN)) {
                            obj = 9;
                            break;
                        }
                        break;
                    case 617635848:
                        if (nextName.equals(KEY_DISTORTION_K1)) {
                            obj = 10;
                            break;
                        }
                        break;
                    case 617635849:
                        if (nextName.equals(KEY_DISTORTION_K2)) {
                            obj = 11;
                            break;
                        }
                        break;
                    case 617635850:
                        if (nextName.equals(KEY_DISTORTION_K3)) {
                            obj = 12;
                            break;
                        }
                        break;
                    case 617635851:
                        if (nextName.equals(KEY_DISTORTION_K4)) {
                            obj = 13;
                            break;
                        }
                        break;
                }
                switch (obj) {
                    case null:
                        this.aovx = jsonReader.nextDouble();
                        break;
                    case 1:
                        this.aovy = jsonReader.nextDouble();
                        break;
                    case 2:
                        this.shrink_ratio = (float) jsonReader.nextDouble();
                        break;
                    case 3:
                        this.calcseam_pixnum = jsonReader.nextInt();
                        break;
                    case 4:
                        this.use_deform = jsonReader.nextBoolean();
                        break;
                    case 5:
                        this.use_luminance_correction = jsonReader.nextBoolean();
                        break;
                    case 6:
                        this.seamsearch_ratio = jsonReader.nextDouble();
                        break;
                    case 7:
                        this.zrotation_coeff = jsonReader.nextDouble();
                        break;
                    case 8:
                        this.draw_threshold = jsonReader.nextDouble();
                        break;
                    case 9:
                        this.aov_gain = jsonReader.nextDouble();
                        break;
                    case 10:
                        this.distortion_k1 = jsonReader.nextDouble();
                        break;
                    case 11:
                        this.distortion_k2 = jsonReader.nextDouble();
                        break;
                    case 12:
                        this.distortion_k3 = jsonReader.nextDouble();
                        break;
                    case 13:
                        this.distortion_k4 = jsonReader.nextDouble();
                        break;
                    case 14:
                        this.rotation_ratio = jsonReader.nextDouble();
                        break;
                    default:
                        jsonReader.skipValue();
                        break;
                }
            } catch (Exception e) {
                str = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("parse error, name = ");
                stringBuilder.append(nextName);
                Log.d(str, stringBuilder.toString());
            }
        }
        jsonReader.endObject();
    }

    public double getAovx() {
        return this.aovx;
    }

    public double getAovy() {
        return this.aovy;
    }

    public float getShrink_ratio() {
        return this.shrink_ratio;
    }

    public int getCalcseam_pixnum() {
        return this.calcseam_pixnum;
    }

    public boolean isUse_deform() {
        return this.use_deform;
    }

    public boolean isUse_luminance_correction() {
        return this.use_luminance_correction;
    }

    public double getSeamsearch_ratio() {
        return this.seamsearch_ratio;
    }

    public double getZrotation_coeff() {
        return this.zrotation_coeff;
    }

    public double getDraw_threshold() {
        return this.draw_threshold;
    }

    public double getAov_gain() {
        return this.aov_gain;
    }

    public double getDistortion_k1() {
        return this.distortion_k1;
    }

    public double getDistortion_k2() {
        return this.distortion_k2;
    }

    public double getDistortion_k3() {
        return this.distortion_k3;
    }

    public double getDistortion_k4() {
        return this.distortion_k4;
    }

    public double getRotation_ratio() {
        return this.rotation_ratio;
    }

    public int getProjection_mode() {
        return this.projection_mode;
    }

    public int getMotion_detection_mode() {
        return this.motion_detection_mode;
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("PanoramaSetting{aovx=");
        stringBuilder.append(this.aovx);
        stringBuilder.append(", aovy=");
        stringBuilder.append(this.aovy);
        stringBuilder.append(", shrink_ratio=");
        stringBuilder.append(this.shrink_ratio);
        stringBuilder.append(", calcseam_pixnum=");
        stringBuilder.append(this.calcseam_pixnum);
        stringBuilder.append(", use_deform=");
        stringBuilder.append(this.use_deform);
        stringBuilder.append(", use_luminance_correction=");
        stringBuilder.append(this.use_luminance_correction);
        stringBuilder.append(", seamsearch_ratio=");
        stringBuilder.append(this.seamsearch_ratio);
        stringBuilder.append(", zrotation_coeff=");
        stringBuilder.append(this.zrotation_coeff);
        stringBuilder.append(", draw_threshold=");
        stringBuilder.append(this.draw_threshold);
        stringBuilder.append(", aov_gain=");
        stringBuilder.append(this.aov_gain);
        stringBuilder.append(", distortion_k1=");
        stringBuilder.append(this.distortion_k1);
        stringBuilder.append(", distortion_k2=");
        stringBuilder.append(this.distortion_k2);
        stringBuilder.append(", distortion_k3=");
        stringBuilder.append(this.distortion_k3);
        stringBuilder.append(", distortion_k4=");
        stringBuilder.append(this.distortion_k4);
        stringBuilder.append(", rotation_ratio=");
        stringBuilder.append(this.rotation_ratio);
        stringBuilder.append('}');
        return stringBuilder.toString();
    }
}
