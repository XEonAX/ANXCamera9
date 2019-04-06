package com.arcsoft.avatar.d;

import com.arcsoft.avatar.AvatarConfig.c;

/* compiled from: AvatarConfigUtils */
public class e {
    public static int a(int i, com.arcsoft.avatar.AvatarConfig.e eVar) {
        switch (i) {
            case 1:
                return eVar.aq;
            case 2:
                return eVar.ar;
            case 3:
                return eVar.at;
            case 4:
                return eVar.av;
            case 5:
                return eVar.ax;
            case 6:
                return eVar.az;
            case 7:
                return eVar.aB;
            case 8:
                return eVar.aC;
            case 9:
                return eVar.aD;
            case 10:
                return eVar.aE;
            case 11:
                return eVar.aG;
            case 12:
                return eVar.aI;
            case 13:
                return eVar.aJ;
            case 14:
                return eVar.aL;
            case 15:
                return eVar.aM;
            case 16:
                return eVar.aO;
            case 17:
                return eVar.aP;
            case 18:
                return eVar.aQ;
            case 19:
                return eVar.aS;
            case 20:
                return eVar.aU;
            case 21:
                return eVar.aW;
            case 22:
                return eVar.aY;
            case 23:
                return eVar.ba;
            case 24:
                return eVar.bc;
            default:
                return -1;
        }
    }

    public static void a(int i, float f, com.arcsoft.avatar.AvatarConfig.e eVar) {
        switch (i) {
            case 2:
                eVar.as = f;
                return;
            case 3:
                eVar.au = f;
                return;
            case 4:
                eVar.aw = f;
                return;
            case 5:
                eVar.ay = f;
                return;
            case 6:
                eVar.aA = f;
                return;
            case 10:
                eVar.aF = f;
                return;
            case 11:
                eVar.aH = f;
                return;
            case 13:
                eVar.aK = f;
                return;
            case 15:
                eVar.aN = f;
                return;
            case 18:
                eVar.aR = f;
                return;
            case 19:
                eVar.aT = f;
                return;
            case 20:
                eVar.aV = f;
                return;
            case 21:
                eVar.aX = f;
                return;
            case 22:
                eVar.aZ = f;
                return;
            case 23:
                eVar.bb = f;
                return;
            case 24:
                eVar.bd = f;
                return;
            default:
                return;
        }
    }

    public static void a(int i, int i2, com.arcsoft.avatar.AvatarConfig.e eVar) {
        switch (i) {
            case 1:
                eVar.aq = i2;
                return;
            case 2:
                eVar.ar = i2;
                return;
            case 3:
                eVar.at = i2;
                return;
            case 4:
                eVar.av = i2;
                return;
            case 5:
                eVar.ax = i2;
                return;
            case 6:
                eVar.az = i2;
                return;
            case 7:
                eVar.aB = i2;
                return;
            case 8:
                eVar.aC = i2;
                return;
            case 9:
                eVar.aD = i2;
                return;
            case 10:
                eVar.aE = i2;
                return;
            case 11:
                eVar.aG = i2;
                return;
            case 12:
                eVar.aI = i2;
                return;
            case 13:
                eVar.aJ = i2;
                return;
            case 14:
                eVar.aL = i2;
                return;
            case 15:
                eVar.aM = i2;
                return;
            case 16:
                eVar.aO = i2;
                return;
            case 17:
                eVar.aP = i2;
                return;
            case 18:
                eVar.aQ = i2;
                return;
            case 19:
                eVar.aS = i2;
                return;
            case 20:
                eVar.aU = i2;
                return;
            case 21:
                eVar.aW = i2;
                return;
            case 22:
                eVar.aY = i2;
                return;
            case 23:
                eVar.ba = i2;
                return;
            case 24:
                eVar.bc = i2;
                return;
            default:
                return;
        }
    }

    public static float b(int i, com.arcsoft.avatar.AvatarConfig.e eVar) {
        switch (i) {
            case 2:
                return eVar.as;
            case 3:
                return eVar.au;
            case 4:
                return eVar.aw;
            case 5:
                return eVar.ay;
            case 6:
                return eVar.aA;
            case 10:
                return eVar.aF;
            case 11:
                return eVar.aH;
            case 13:
                return eVar.aK;
            case 15:
                return eVar.aN;
            case 18:
                return eVar.aR;
            case 19:
                return eVar.aT;
            case 20:
                return eVar.aV;
            case 21:
                return eVar.aX;
            case 22:
                return eVar.aZ;
            case 23:
                return eVar.bb;
            case 24:
                return eVar.bd;
            default:
                return -1.0f;
        }
    }

    public static boolean b(c cVar) {
        return (cVar.ah == 19 || cVar.ah == 21 || cVar.ah == 22 || cVar.ah == 20 || cVar.ah == 10 || cVar.ah == 11) ? false : cVar.ak;
    }

    public static int k(int i) {
        if (i == 1) {
            return 2;
        }
        if (i == 12) {
            return 13;
        }
        if (i == 14) {
            return 15;
        }
        if (i == 24) {
            return 18;
        }
        switch (i) {
            case 19:
                return 3;
            case 20:
                return 4;
            case 21:
                return 5;
            default:
                return 0;
        }
    }

    public static boolean l(int i) {
        return i == 2 || i == 3 || i == 4 || i == 5 || i == 6 || i == 13 || i == 15 || i == 18 || i == 10 || i == 11;
    }
}
