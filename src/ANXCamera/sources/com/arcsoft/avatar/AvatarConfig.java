package com.arcsoft.avatar;

import android.graphics.Bitmap;
import java.io.Serializable;
import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

public interface AvatarConfig {

    public static class ASAvatarProfileResult implements Serializable {
        public int gender;
        public int status;
    }

    @Documented
    @Target({ElementType.FIELD, ElementType.METHOD, ElementType.PARAMETER})
    @Retention(RetentionPolicy.SOURCE)
    public @interface a {
        public static final int C = 6;
        public static final int F = 7;
        public static final int H = 8;
        public static final int I = 9;
        public static final int J = 10;
        public static final int K = 11;
        public static final int L = 12;
        public static final int NONE = 0;
        public static final int Q = 13;
        public static final int S = 14;
        public static final int T = 15;
        public static final int U = 16;
        public static final int V = 17;
        public static final int W = 18;
        public static final int X = 19;
        public static final int Z = 20;
        public static final int aa = 21;
        public static final int ab = 22;
        public static final int ac = 23;
        public static final int ad = 24;
        public static final int h = 1;
        public static final int k = 2;
        public static final int q = 3;
        public static final int r = 4;
        public static final int v = 5;
    }

    @Documented
    @Target({ElementType.FIELD, ElementType.METHOD, ElementType.PARAMETER})
    @Retention(RetentionPolicy.SOURCE)
    public @interface b {
        public static final int UNKNOWN = 0;
        public static final int ae = 1;
        public static final int af = 2;
    }

    public static class c {
        public int ag;
        public int ah;
        public String ai;
        public boolean aj;
        public boolean ak;
        public float al;
        public int am;
        public Bitmap an;
        public int gender;
        public boolean isDefault;
        public String name;

        public String toString() {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("configID = ");
            stringBuilder.append(this.ag);
            stringBuilder.append(" configType = ");
            stringBuilder.append(this.ah);
            stringBuilder.append(" gender = ");
            stringBuilder.append(this.gender);
            stringBuilder.append(" name = ");
            stringBuilder.append(this.name);
            stringBuilder.append(" configThumbPath = ");
            stringBuilder.append(this.ai);
            stringBuilder.append(" isDefault = ");
            stringBuilder.append(this.isDefault);
            stringBuilder.append(" isValid = ");
            stringBuilder.append(this.aj);
            stringBuilder.append(" isSupportContinuous = ");
            stringBuilder.append(this.ak);
            stringBuilder.append(" continuousValue = ");
            stringBuilder.append(this.al);
            stringBuilder.append(" colorValue = ");
            stringBuilder.append(this.am);
            stringBuilder.append("thum = ");
            stringBuilder.append(this.an);
            stringBuilder.append("\n");
            return stringBuilder.toString();
        }
    }

    public static class d {
        public int ah;
        public String ao;
        public boolean ap = true;

        public String toString() {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("configTypeDesc = ");
            stringBuilder.append(this.ao);
            stringBuilder.append(" configType = ");
            stringBuilder.append(this.ah);
            stringBuilder.append(" refreshThum = ");
            stringBuilder.append(this.ap);
            return stringBuilder.toString();
        }
    }

    public static class e implements Cloneable {
        public float aA;
        public int aB;
        public int aC;
        public int aD;
        public int aE;
        public float aF;
        public int aG;
        public float aH;
        public int aI;
        public int aJ;
        public float aK;
        public int aL;
        public int aM;
        public float aN;
        public int aO;
        public int aP;
        public int aQ;
        public float aR;
        public int aS;
        public float aT;
        public int aU;
        public float aV;
        public int aW;
        public float aX;
        public int aY;
        public float aZ;
        public int aq;
        public int ar;
        public float as;
        public int at;
        public float au;
        public int av;
        public float aw;
        public int ax;
        public float ay;
        public int az;
        public int ba;
        public float bb;
        public int bc;
        public float bd;
        public int gender;

        public Object clone() {
            try {
                return (e) super.clone();
            } catch (CloneNotSupportedException e) {
                e.printStackTrace();
                return null;
            }
        }

        public String toString() {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("gender = ");
            stringBuilder.append(this.gender);
            stringBuilder.append(" hairStyleID = ");
            stringBuilder.append(this.aq);
            stringBuilder.append(" hairColorID = ");
            stringBuilder.append(this.ar);
            stringBuilder.append(" hairColorValue = ");
            stringBuilder.append(this.as);
            stringBuilder.append(" faceColorID = ");
            stringBuilder.append(this.at);
            stringBuilder.append(" faceColorValue = ");
            stringBuilder.append(this.au);
            stringBuilder.append(" eyeColorID = ");
            stringBuilder.append(this.av);
            stringBuilder.append(" eyeColorValue = ");
            stringBuilder.append(this.aw);
            stringBuilder.append(" lipColorID = ");
            stringBuilder.append(this.ax);
            stringBuilder.append(" lipColorValue = ");
            stringBuilder.append(this.ay);
            stringBuilder.append(" hairHighlightColorID = ");
            stringBuilder.append(this.az);
            stringBuilder.append(" hairHighlightColorValue = ");
            stringBuilder.append(this.aA);
            stringBuilder.append(" frecklesID = ");
            stringBuilder.append(this.aB);
            stringBuilder.append(" nevusID = ");
            stringBuilder.append(this.aC);
            stringBuilder.append(" eyewearStyleID = ");
            stringBuilder.append(this.aD);
            stringBuilder.append(" eyewearFrameID = ");
            stringBuilder.append(this.aE);
            stringBuilder.append(" eyewearFrameValue = ");
            stringBuilder.append(this.aF);
            stringBuilder.append(" eyewearLensesID = ");
            stringBuilder.append(this.aG);
            stringBuilder.append(" eyewearLensesValue = ");
            stringBuilder.append(this.aH);
            stringBuilder.append(" headwearStyleID = ");
            stringBuilder.append(this.aI);
            stringBuilder.append(" headwearColorID = ");
            stringBuilder.append(this.aJ);
            stringBuilder.append(" headwearColorValue = ");
            stringBuilder.append(this.aK);
            stringBuilder.append(" beardStyleID = ");
            stringBuilder.append(this.aL);
            stringBuilder.append(" beardColorID = ");
            stringBuilder.append(this.aM);
            stringBuilder.append(" beardColorValue = ");
            stringBuilder.append(this.aN);
            stringBuilder.append(" earringStyleID = ");
            stringBuilder.append(this.aO);
            stringBuilder.append(" eyelashStyleID = ");
            stringBuilder.append(this.aP);
            stringBuilder.append(" eyebrowColorID = ");
            stringBuilder.append(this.aQ);
            stringBuilder.append(" eyebrowColorValue = ");
            stringBuilder.append(this.aR);
            stringBuilder.append(" faceShapeID = ");
            stringBuilder.append(this.aS);
            stringBuilder.append(" faceShapeValue = ");
            stringBuilder.append(this.aT);
            stringBuilder.append(" eyeShapeID = ");
            stringBuilder.append(this.aU);
            stringBuilder.append(" eyeShapeValue = ");
            stringBuilder.append(this.aV);
            stringBuilder.append(" mouthShapeID = ");
            stringBuilder.append(this.aW);
            stringBuilder.append(" mouthShapeValue = ");
            stringBuilder.append(this.aX);
            stringBuilder.append(" noseShapeID = ");
            stringBuilder.append(this.aY);
            stringBuilder.append(" noseShapeValue = ");
            stringBuilder.append(this.aZ);
            stringBuilder.append(" earShapeID = ");
            stringBuilder.append(this.ba);
            stringBuilder.append(" earShapeValue = ");
            stringBuilder.append(this.bb);
            stringBuilder.append(" eyebrowShapeID = ");
            stringBuilder.append(this.bc);
            stringBuilder.append(" eyebrowShapeValue = ");
            stringBuilder.append(this.bd);
            stringBuilder.append("\n");
            return stringBuilder.toString();
        }
    }

    public interface f {
        public static final int STATUS_NORMAL = 6;
        public static final int be = 0;
        public static final int bf = 1;
        public static final int bg = 2;
        public static final int bh = 3;
        public static final int bi = 4;
        public static final int bj = 5;
    }

    public static class g {
        private static final int a = 154;
        private static final int b = 63;
        public int bk;
        public int bl;
        public i[] bm = new i[154];
        public float[] bn;
        public j bo;
        public float[] bp;
        public float[] bq;
        public float[] br;
        public float[] bs;
        public float[] bt;
        public float bu;
        public int faceCount;
        public boolean isMirror;
        public int orientation;
        public int result;
    }

    public interface h {
        public static final int STATUS_UNKNOWN = 0;
        public static final int bA = 32;
        public static final int bB = 64;
        public static final int bC = 128;
        public static final int bv = 1;
        public static final int bw = 2;
        public static final int bx = 4;
        public static final int by = 8;
        public static final int bz = 16;
    }

    public static class i {
        public float x;
        public float y;
    }

    public static class j {
        public int bottom;
        public int left;
        public int right;
        public int top;
    }

    public interface k {
        void a(int i, int i2, int i3, String str, String str2, int i4, boolean z, boolean z2, boolean z3, float f);
    }

    public interface l {
        void a(String str, int i);
    }

    public interface m {
        void onUpdateProgress(int i);
    }
}
