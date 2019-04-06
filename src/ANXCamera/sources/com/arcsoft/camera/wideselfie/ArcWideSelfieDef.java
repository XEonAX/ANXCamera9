package com.arcsoft.camera.wideselfie;

public class ArcWideSelfieDef {

    public static final class Command {
        public static final int AWS_COMMAND_SELECT = 0;
        public static final int AWS_COMMAND_STITCH = 1;
        public static final int AWS_COMMAND_STOP = 2;
    }

    public static final class Direction {
        public static final int AWS_DIRECTION_LEFT2RIGHT = 0;
        public static final int AWS_DIRECTION_RIGHT2LEFT = 1;
        public static final int AWS_DIRECTION_UNKNOW = -1;
    }

    public static class MAsvlOffScreen {
        public static final int ASVL_PAF_GRAY = 1793;
        public static final int ASVL_PAF_I420 = 1537;
        public static final int ASVL_PAF_I422H = 1539;
        public static final int ASVL_PAF_I422V = 1538;
        public static final int ASVL_PAF_I444 = 1540;
        public static final int ASVL_PAF_LPI422H = 2051;
        public static final int ASVL_PAF_LPI422H2 = 2052;
        public static final int ASVL_PAF_MONO_I420 = 2562;
        public static final int ASVL_PAF_MONO_UYVY = 2561;
        public static final int ASVL_PAF_NEG_I420 = 2306;
        public static final int ASVL_PAF_NEG_UYVY = 2305;
        public static final int ASVL_PAF_NOTSET = 0;
        public static final int ASVL_PAF_NV12 = 2049;
        public static final int ASVL_PAF_NV21 = 2050;
        public static final int ASVL_PAF_P8_YUYV = 2819;
        public static final int ASVL_PAF_RAW_RGGB_10B = 3329;
        public static final int ASVL_PAF_RGB16_B4G4R4 = 259;
        public static final int ASVL_PAF_RGB16_B5G5R5 = 258;
        public static final int ASVL_PAF_RGB16_B5G5R5T = 260;
        public static final int ASVL_PAF_RGB16_B5G6R5 = 257;
        public static final int ASVL_PAF_RGB16_R4G4B4 = 263;
        public static final int ASVL_PAF_RGB16_R5G5B5 = 262;
        public static final int ASVL_PAF_RGB16_R5G6B5 = 261;
        public static final int ASVL_PAF_RGB24_B6G6R6 = 514;
        public static final int ASVL_PAF_RGB24_B6G6R6T = 515;
        public static final int ASVL_PAF_RGB24_B8G8R8 = 513;
        public static final int ASVL_PAF_RGB24_R6G6B6 = 517;
        public static final int ASVL_PAF_RGB24_R8G8B8 = 516;
        public static final int ASVL_PAF_RGB32_A8R8G8B8 = 772;
        public static final int ASVL_PAF_RGB32_B8G8R8 = 769;
        public static final int ASVL_PAF_RGB32_B8G8R8A8 = 770;
        public static final int ASVL_PAF_RGB32_R8G8B8 = 771;
        public static final int ASVL_PAF_RGB32_R8G8B8A8 = 773;
        public static final int ASVL_PAF_SP16UNIT = 3073;
        public static final int ASVL_PAF_UVY = 1027;
        public static final int ASVL_PAF_UYVY = 1283;
        public static final int ASVL_PAF_UYVY2 = 1287;
        public static final int ASVL_PAF_VUY = 1028;
        public static final int ASVL_PAF_VYUY = 1284;
        public static final int ASVL_PAF_VYUY2 = 1288;
        public static final int ASVL_PAF_YUV = 1025;
        public static final int ASVL_PAF_YUYV = 1281;
        public static final int ASVL_PAF_YUYV2 = 1285;
        public static final int ASVL_PAF_YV12 = 1541;
        public static final int ASVL_PAF_YV16H = 1543;
        public static final int ASVL_PAF_YV16V = 1542;
        public static final int ASVL_PAF_YV24 = 1544;
        public static final int ASVL_PAF_YVU = 1026;
        public static final int ASVL_PAF_YVYU = 1282;
        public static final int ASVL_PAF_YVYU2 = 1286;
        public static final int ASVL_PAF_YYUV = 1289;
    }

    public static final class Mode {
        public static final int AWS_MODE_CAPTURE = 4096;
        public static final int AWS_MODE_TWO_DERECTION = 64;
    }

    public static final class ResultCode {
        public static final int AWS_ERR_ABNORMAL_OFFSET = 28675;
        public static final int AWS_ERR_BLURRED_IMAGE = 28677;
        public static final int AWS_ERR_DIRECTION = 28673;
        public static final int AWS_ERR_MOVE_TOO_FAST = 28676;
        public static final int AWS_ERR_PARALLAX_OVERFLOW = 28678;
        public static final int AWS_ERR_UNABLE_CALCULATE = 28679;
        public static final int AWS_MERR_BASE = 28672;
        public static final int AWS_MWARN_BASE = 32768;
        public static final int AWS_WARN_DEVICE_MOVE_FRONT_BACK = 32800;
        public static final int AWS_WARN_DEVICE_ROTATE = 32784;
        public static final int AWS_WARN_FACE_CLOSE_TO_BODER = 32896;
        public static final int AWS_WARN_FACE_TOO_CLOSE = 32832;
        public static final int AWS_WARN_MOVE_SLOPE_TO_DOWN = 32770;
        public static final int AWS_WARN_MOVE_SLOPE_TO_UP = 32769;
        public static final int MERR_BAD_STATE = 5;
        public static final int MERR_BASIC_BASE = 1;
        public static final int MERR_BUFFER_OVERFLOW = 9;
        public static final int MERR_BUFFER_UNDERFLOW = 10;
        public static final int MERR_COMPONENT_NOT_EXIST = 12;
        public static final int MERR_EXPIRED = 7;
        public static final int MERR_GLOBAL_DATA_NOT_EXIST = 13;
        public static final int MERR_INVALID_PARAM = 2;
        public static final int MERR_NONE = 0;
        public static final int MERR_NO_DISKSPACE = 11;
        public static final int MERR_NO_MEMORY = 4;
        public static final int MERR_UNKNOWN = 1;
        public static final int MERR_UNSUPPORTED = 3;
        public static final int MERR_USER_CANCEL = 6;
        public static final int MERR_USER_PAUSE = 8;
        public static final int MOK = 0;
    }

    public static final class ViewAngle {
        public static final int AWS_VIEW_ANGLE_DIAG = 2;
        public static final int AWS_VIEW_ANGLE_HORIZ = 0;
        public static final int AWS_VIEW_ANGLE_VERT = 1;
    }
}
