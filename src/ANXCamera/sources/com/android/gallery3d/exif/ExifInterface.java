package com.android.gallery3d.exif;

import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.BitmapFactory;
import android.graphics.Point;
import android.util.Log;
import android.util.SparseIntArray;
import com.sensetime.stmobile.STMobileHumanActionNative;
import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.Closeable;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.channels.FileChannel.MapMode;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.TimeZone;

public class ExifInterface {
    private static final String DATETIME_FORMAT_STR = "yyyy:MM:dd kk:mm:ss";
    public static final ByteOrder DEFAULT_BYTE_ORDER = ByteOrder.BIG_ENDIAN;
    public static final int DEFINITION_NULL = 0;
    private static final String GPS_DATE_FORMAT_STR = "yyyy:MM:dd";
    public static final int IFD_NULL = -1;
    private static final String NULL_ARGUMENT_STRING = "Argument is null";
    protected static final String TAG = ExifInterface.class.getSimpleName();
    public static final int TAG_AI_TYPE = defineTag(2, (short) -30571);
    public static final int TAG_ALGORITHM_COMMENT = defineTag(2, (short) -30583);
    public static final int TAG_APERTURE_VALUE = defineTag(2, (short) -28158);
    public static final int TAG_ARTIST = defineTag(0, (short) 315);
    public static final int TAG_BITS_PER_SAMPLE = defineTag(0, (short) 258);
    public static final int TAG_BRIGHTNESS_VALUE = defineTag(2, (short) -28157);
    public static final int TAG_CFA_PATTERN = defineTag(2, (short) -23806);
    public static final int TAG_COLOR_SPACE = defineTag(2, (short) -24575);
    public static final int TAG_COMPONENTS_CONFIGURATION = defineTag(2, (short) -28415);
    public static final int TAG_COMPRESSED_BITS_PER_PIXEL = defineTag(2, (short) -28414);
    public static final int TAG_COMPRESSION = defineTag(0, (short) 259);
    public static final int TAG_CONTRAST = defineTag(2, (short) -23544);
    public static final int TAG_COPYRIGHT = defineTag(0, (short) -32104);
    public static final int TAG_CUSTOM_RENDERED = defineTag(2, (short) -23551);
    public static final int TAG_DATE_TIME = defineTag(0, (short) 306);
    public static final int TAG_DATE_TIME_DIGITIZED = defineTag(2, (short) -28668);
    public static final int TAG_DATE_TIME_ORIGINAL = defineTag(2, (short) -28669);
    public static final int TAG_DEPTH_MAP_BLUR_LEVEL = defineTag(2, (short) -30575);
    public static final int TAG_DEPTH_MAP_DULCAMERA_WATER_MARK = defineTag(2, (short) -30574);
    public static final int TAG_DEPTH_MAP_FOCUS_POINT = defineTag(2, (short) -30576);
    public static final int TAG_DEPTH_MAP_TIME_WATER_MARK = defineTag(2, (short) -30573);
    public static final int TAG_DEVICE_SETTING_DESCRIPTION = defineTag(2, (short) -23541);
    public static final int TAG_DIGITAL_ZOOM_RATIO = defineTag(2, (short) -23548);
    public static final int TAG_EXIF_IFD = defineTag(0, (short) -30871);
    public static final int TAG_EXIF_VERSION = defineTag(2, (short) -28672);
    public static final int TAG_EXPOSURE_BIAS_VALUE = defineTag(2, (short) -28156);
    public static final int TAG_EXPOSURE_INDEX = defineTag(2, (short) -24043);
    public static final int TAG_EXPOSURE_MODE = defineTag(2, (short) -23550);
    public static final int TAG_EXPOSURE_PROGRAM = defineTag(2, (short) -30686);
    public static final int TAG_EXPOSURE_TIME = defineTag(2, (short) -32102);
    public static final int TAG_FILE_SOURCE = defineTag(2, (short) -23808);
    public static final int TAG_FLASH = defineTag(2, (short) -28151);
    public static final int TAG_FLASHPIX_VERSION = defineTag(2, (short) -24576);
    public static final int TAG_FLASH_ENERGY = defineTag(2, (short) -24053);
    public static final int TAG_FOCAL_LENGTH = defineTag(2, (short) -28150);
    public static final int TAG_FOCAL_LENGTH_IN_35_MM_FILE = defineTag(2, (short) -23547);
    public static final int TAG_FOCAL_PLANE_RESOLUTION_UNIT = defineTag(2, (short) -24048);
    public static final int TAG_FOCAL_PLANE_X_RESOLUTION = defineTag(2, (short) -24050);
    public static final int TAG_FOCAL_PLANE_Y_RESOLUTION = defineTag(2, (short) -24049);
    public static final int TAG_FRONT_MIRROR = defineTag(2, (short) -30570);
    public static final int TAG_F_NUMBER = defineTag(2, (short) -32099);
    public static final int TAG_GAIN_CONTROL = defineTag(2, (short) -23545);
    public static final int TAG_GPS_ALTITUDE = defineTag(4, (short) 6);
    public static final int TAG_GPS_ALTITUDE_REF = defineTag(4, (short) 5);
    public static final int TAG_GPS_AREA_INFORMATION = defineTag(4, (short) 28);
    public static final int TAG_GPS_DATE_STAMP = defineTag(4, (short) 29);
    public static final int TAG_GPS_DEST_BEARING = defineTag(4, (short) 24);
    public static final int TAG_GPS_DEST_BEARING_REF = defineTag(4, (short) 23);
    public static final int TAG_GPS_DEST_DISTANCE = defineTag(4, (short) 26);
    public static final int TAG_GPS_DEST_DISTANCE_REF = defineTag(4, (short) 25);
    public static final int TAG_GPS_DEST_LATITUDE = defineTag(4, (short) 20);
    public static final int TAG_GPS_DEST_LATITUDE_REF = defineTag(4, (short) 19);
    public static final int TAG_GPS_DEST_LONGITUDE = defineTag(4, (short) 22);
    public static final int TAG_GPS_DEST_LONGITUDE_REF = defineTag(4, (short) 21);
    public static final int TAG_GPS_DIFFERENTIAL = defineTag(4, (short) 30);
    public static final int TAG_GPS_DOP = defineTag(4, (short) 11);
    public static final int TAG_GPS_IFD = defineTag(0, (short) -30683);
    public static final int TAG_GPS_IMG_DIRECTION = defineTag(4, (short) 17);
    public static final int TAG_GPS_IMG_DIRECTION_REF = defineTag(4, (short) 16);
    public static final int TAG_GPS_LATITUDE = defineTag(4, (short) 2);
    public static final int TAG_GPS_LATITUDE_REF = defineTag(4, (short) 1);
    public static final int TAG_GPS_LONGITUDE = defineTag(4, (short) 4);
    public static final int TAG_GPS_LONGITUDE_REF = defineTag(4, (short) 3);
    public static final int TAG_GPS_MAP_DATUM = defineTag(4, (short) 18);
    public static final int TAG_GPS_MEASURE_MODE = defineTag(4, (short) 10);
    public static final int TAG_GPS_PROCESSING_METHOD = defineTag(4, (short) 27);
    public static final int TAG_GPS_SATTELLITES = defineTag(4, (short) 8);
    public static final int TAG_GPS_SPEED = defineTag(4, (short) 13);
    public static final int TAG_GPS_SPEED_REF = defineTag(4, (short) 12);
    public static final int TAG_GPS_STATUS = defineTag(4, (short) 9);
    public static final int TAG_GPS_TIME_STAMP = defineTag(4, (short) 7);
    public static final int TAG_GPS_TRACK = defineTag(4, (short) 15);
    public static final int TAG_GPS_TRACK_REF = defineTag(4, (short) 14);
    public static final int TAG_GPS_VERSION_ID = defineTag(4, (short) 0);
    public static final int TAG_IMAGE_DESCRIPTION = defineTag(0, (short) 270);
    public static final int TAG_IMAGE_LENGTH = defineTag(0, (short) 257);
    public static final int TAG_IMAGE_UNIQUE_ID = defineTag(2, (short) -23520);
    public static final int TAG_IMAGE_WIDTH = defineTag(0, (short) 256);
    public static final int TAG_INTEROPERABILITY_IFD = defineTag(2, (short) -24571);
    public static final int TAG_INTEROPERABILITY_INDEX = defineTag(3, (short) 1);
    public static final int TAG_ISO_SPEED_RATINGS = defineTag(2, (short) -30681);
    public static final int TAG_JPEG_INTERCHANGE_FORMAT = defineTag(1, (short) 513);
    public static final int TAG_JPEG_INTERCHANGE_FORMAT_LENGTH = defineTag(1, (short) 514);
    public static final int TAG_LIGHT_SOURCE = defineTag(2, (short) -28152);
    public static final int TAG_LIVESHOT = defineTag(2, (short) -30569);
    public static final int TAG_MAKE = defineTag(0, (short) 271);
    public static final int TAG_MAKER_NOTE = defineTag(2, (short) -28036);
    public static final int TAG_MAX_APERTURE_VALUE = defineTag(2, (short) -28155);
    public static final int TAG_METERING_MODE = defineTag(2, (short) -28153);
    public static final int TAG_MODEL = defineTag(0, (short) 272);
    public static final int TAG_NULL = -1;
    public static final int TAG_OECF = defineTag(2, (short) -30680);
    public static final int TAG_ORIENTATION = defineTag(0, (short) 274);
    public static final int TAG_PARALLEL_PROCESS_COMMENT = defineTag(2, (short) -30584);
    public static final int TAG_PHOTOMETRIC_INTERPRETATION = defineTag(0, (short) 262);
    public static final int TAG_PIXEL_X_DIMENSION = defineTag(2, (short) -24574);
    public static final int TAG_PIXEL_Y_DIMENSION = defineTag(2, (short) -24573);
    public static final int TAG_PLANAR_CONFIGURATION = defineTag(0, (short) 284);
    public static final int TAG_PORTRAIT_LIGHTING_PATTERN = defineTag(2, (short) -30572);
    public static final int TAG_PRIMARY_CHROMATICITIES = defineTag(0, (short) 319);
    public static final int TAG_REFERENCE_BLACK_WHITE = defineTag(0, (short) 532);
    public static final int TAG_RELATED_SOUND_FILE = defineTag(2, (short) -24572);
    public static final int TAG_RESOLUTION_UNIT = defineTag(0, (short) 296);
    public static final int TAG_ROWS_PER_STRIP = defineTag(0, (short) 278);
    public static final int TAG_SAMPLES_PER_PIXEL = defineTag(0, (short) 277);
    public static final int TAG_SATURATION = defineTag(2, (short) -23543);
    public static final int TAG_SCENE_CAPTURE_TYPE = defineTag(2, (short) -23546);
    public static final int TAG_SCENE_TYPE = defineTag(2, (short) -23807);
    public static final int TAG_SENSING_METHOD = defineTag(2, (short) -24041);
    public static final int TAG_SHARPNESS = defineTag(2, (short) -23542);
    public static final int TAG_SHUTTER_SPEED_VALUE = defineTag(2, (short) -28159);
    public static final int TAG_SOFTWARE = defineTag(0, (short) 305);
    public static final int TAG_SPATIAL_FREQUENCY_RESPONSE = defineTag(2, (short) -24052);
    public static final int TAG_SPECTRAL_SENSITIVITY = defineTag(2, (short) -30684);
    public static final int TAG_STRIP_BYTE_COUNTS = defineTag(0, (short) 279);
    public static final int TAG_STRIP_OFFSETS = defineTag(0, (short) 273);
    public static final int TAG_SUBJECT_AREA = defineTag(2, (short) -28140);
    public static final int TAG_SUBJECT_DISTANCE = defineTag(2, (short) -28154);
    public static final int TAG_SUBJECT_DISTANCE_RANGE = defineTag(2, (short) -23540);
    public static final int TAG_SUBJECT_LOCATION = defineTag(2, (short) -24044);
    public static final int TAG_SUB_SEC_TIME = defineTag(2, (short) -28016);
    public static final int TAG_SUB_SEC_TIME_DIGITIZED = defineTag(2, (short) -28014);
    public static final int TAG_SUB_SEC_TIME_ORIGINAL = defineTag(2, (short) -28015);
    public static final int TAG_TRANSFER_FUNCTION = defineTag(0, (short) 301);
    public static final int TAG_USER_COMMENT = defineTag(2, (short) -28026);
    public static final int TAG_WHITE_BALANCE = defineTag(2, (short) -23549);
    public static final int TAG_WHITE_POINT = defineTag(0, (short) 318);
    public static final int TAG_XIAOMI_COMMENT = defineTag(2, (short) -26215);
    public static final int TAG_X_RESOLUTION = defineTag(0, (short) 282);
    public static final int TAG_Y_CB_CR_COEFFICIENTS = defineTag(0, (short) 529);
    public static final int TAG_Y_CB_CR_POSITIONING = defineTag(0, (short) 531);
    public static final int TAG_Y_CB_CR_SUB_SAMPLING = defineTag(0, (short) 530);
    public static final int TAG_Y_RESOLUTION = defineTag(0, (short) 283);
    protected static HashSet<Short> sBannedDefines = new HashSet(sOffsetTags);
    private static HashSet<Short> sOffsetTags = new HashSet();
    private ExifData mData = new ExifData(DEFAULT_BYTE_ORDER);
    private final DateFormat mDateTimeStampFormat = new SimpleDateFormat(DATETIME_FORMAT_STR);
    private final DateFormat mGPSDateStampFormat = new SimpleDateFormat(GPS_DATE_FORMAT_STR);
    private final Calendar mGPSTimeStampCalendar = Calendar.getInstance(TimeZone.getTimeZone("UTC"));
    private SparseIntArray mTagInfo = null;

    public interface ColorSpace {
        public static final short SRGB = (short) 1;
        public static final short UNCALIBRATED = (short) -1;
    }

    public interface ComponentsConfiguration {
        public static final short B = (short) 6;
        public static final short CB = (short) 2;
        public static final short CR = (short) 3;
        public static final short G = (short) 5;
        public static final short NOT_EXIST = (short) 0;
        public static final short R = (short) 4;
        public static final short Y = (short) 1;
    }

    public interface Compression {
        public static final short JPEG = (short) 6;
        public static final short UNCOMPRESSION = (short) 1;
    }

    public interface Contrast {
        public static final short HARD = (short) 2;
        public static final short NORMAL = (short) 0;
        public static final short SOFT = (short) 1;
    }

    public interface ExifOrientationFlag {
        public static final short BOTTOM_LEFT = (short) 3;
        public static final short BOTTOM_RIGHT = (short) 4;
        public static final short LEFT_BOTTOM = (short) 7;
        public static final short LEFT_TOP = (short) 5;
        public static final short RIGHT_BOTTOM = (short) 8;
        public static final short RIGHT_TOP = (short) 6;
        public static final short TOP_LEFT = (short) 1;
        public static final short TOP_RIGHT = (short) 2;
    }

    public interface ExposureMode {
        public static final short AUTO_BRACKET = (short) 2;
        public static final short AUTO_EXPOSURE = (short) 0;
        public static final short MANUAL_EXPOSURE = (short) 1;
    }

    public interface ExposureProgram {
        public static final short ACTION_PROGRAM = (short) 6;
        public static final short APERTURE_PRIORITY = (short) 3;
        public static final short CREATIVE_PROGRAM = (short) 5;
        public static final short LANDSCAPE_MODE = (short) 8;
        public static final short MANUAL = (short) 1;
        public static final short NORMAL_PROGRAM = (short) 2;
        public static final short NOT_DEFINED = (short) 0;
        public static final short PROTRAIT_MODE = (short) 7;
        public static final short SHUTTER_PRIORITY = (short) 4;
    }

    public interface FileSource {
        public static final short DSC = (short) 3;
    }

    public interface Flash {
        public static final short DID_NOT_FIRED = (short) 0;
        public static final short FIRED = (short) 1;
        public static final short FUNCTION_NO_FUNCTION = (short) 32;
        public static final short FUNCTION_PRESENT = (short) 0;
        public static final short MODE_AUTO_MODE = (short) 24;
        public static final short MODE_COMPULSORY_FLASH_FIRING = (short) 8;
        public static final short MODE_COMPULSORY_FLASH_SUPPRESSION = (short) 16;
        public static final short MODE_UNKNOWN = (short) 0;
        public static final short RED_EYE_REDUCTION_NO_OR_UNKNOWN = (short) 0;
        public static final short RED_EYE_REDUCTION_SUPPORT = (short) 64;
        public static final short RETURN_NO_STROBE_RETURN_DETECTION_FUNCTION = (short) 0;
        public static final short RETURN_STROBE_RETURN_LIGHT_DETECTED = (short) 6;
        public static final short RETURN_STROBE_RETURN_LIGHT_NOT_DETECTED = (short) 4;
    }

    public interface GainControl {
        public static final short HIGH_DOWN = (short) 4;
        public static final short HIGH_UP = (short) 2;
        public static final short LOW_DOWN = (short) 3;
        public static final short LOW_UP = (short) 1;
        public static final short NONE = (short) 0;
    }

    public interface GpsAltitudeRef {
        public static final short SEA_LEVEL = (short) 0;
        public static final short SEA_LEVEL_NEGATIVE = (short) 1;
    }

    public interface GpsDifferential {
        public static final short DIFFERENTIAL_CORRECTION_APPLIED = (short) 1;
        public static final short WITHOUT_DIFFERENTIAL_CORRECTION = (short) 0;
    }

    public interface GpsLatitudeRef {
        public static final String NORTH = "N";
        public static final String SOUTH = "S";
    }

    public interface GpsLongitudeRef {
        public static final String EAST = "E";
        public static final String WEST = "W";
    }

    public interface GpsMeasureMode {
        public static final String MODE_2_DIMENSIONAL = "2";
        public static final String MODE_3_DIMENSIONAL = "3";
    }

    public interface GpsSpeedRef {
        public static final String KILOMETERS = "K";
        public static final String KNOTS = "N";
        public static final String MILES = "M";
    }

    public interface GpsStatus {
        public static final String INTEROPERABILITY = "V";
        public static final String IN_PROGRESS = "A";
    }

    public interface GpsTrackRef {
        public static final String MAGNETIC_DIRECTION = "M";
        public static final String TRUE_DIRECTION = "T";
    }

    public interface LightSource {
        public static final short CLOUDY_WEATHER = (short) 10;
        public static final short COOL_WHITE_FLUORESCENT = (short) 14;
        public static final short D50 = (short) 23;
        public static final short D55 = (short) 20;
        public static final short D65 = (short) 21;
        public static final short D75 = (short) 22;
        public static final short DAYLIGHT = (short) 1;
        public static final short DAYLIGHT_FLUORESCENT = (short) 12;
        public static final short DAY_WHITE_FLUORESCENT = (short) 13;
        public static final short FINE_WEATHER = (short) 9;
        public static final short FLASH = (short) 4;
        public static final short FLUORESCENT = (short) 2;
        public static final short ISO_STUDIO_TUNGSTEN = (short) 24;
        public static final short OTHER = (short) 255;
        public static final short SHADE = (short) 11;
        public static final short STANDARD_LIGHT_A = (short) 17;
        public static final short STANDARD_LIGHT_B = (short) 18;
        public static final short STANDARD_LIGHT_C = (short) 19;
        public static final short TUNGSTEN = (short) 3;
        public static final short UNKNOWN = (short) 0;
        public static final short WHITE_FLUORESCENT = (short) 15;
    }

    public interface MeteringMode {
        public static final short AVERAGE = (short) 1;
        public static final short CENTER_WEIGHTED_AVERAGE = (short) 2;
        public static final short MULTISPOT = (short) 4;
        public static final short OTHER = (short) 255;
        public static final short PARTAIL = (short) 6;
        public static final short PATTERN = (short) 5;
        public static final short SPOT = (short) 3;
        public static final short UNKNOWN = (short) 0;
    }

    public interface PhotometricInterpretation {
        public static final short RGB = (short) 2;
        public static final short YCBCR = (short) 6;
    }

    public interface PlanarConfiguration {
        public static final short CHUNKY = (short) 1;
        public static final short PLANAR = (short) 2;
    }

    public interface ResolutionUnit {
        public static final short CENTIMETERS = (short) 3;
        public static final short INCHES = (short) 2;
    }

    public interface Saturation {
        public static final short HIGH = (short) 2;
        public static final short LOW = (short) 1;
        public static final short NORMAL = (short) 0;
    }

    public interface SceneCapture {
        public static final short LANDSCAPE = (short) 1;
        public static final short NIGHT_SCENE = (short) 3;
        public static final short PROTRAIT = (short) 2;
        public static final short STANDARD = (short) 0;
    }

    public interface SceneType {
        public static final short DIRECT_PHOTOGRAPHED = (short) 1;
    }

    public interface SensingMethod {
        public static final short COLOR_SEQUENTIAL_AREA = (short) 5;
        public static final short COLOR_SEQUENTIAL_LINEAR = (short) 8;
        public static final short NOT_DEFINED = (short) 1;
        public static final short ONE_CHIP_COLOR = (short) 2;
        public static final short THREE_CHIP_COLOR = (short) 4;
        public static final short TRILINEAR = (short) 7;
        public static final short TWO_CHIP_COLOR = (short) 3;
    }

    public interface Sharpness {
        public static final short HARD = (short) 2;
        public static final short NORMAL = (short) 0;
        public static final short SOFT = (short) 1;
    }

    public interface SubjectDistance {
        public static final short CLOSE_VIEW = (short) 2;
        public static final short DISTANT_VIEW = (short) 3;
        public static final short MACRO = (short) 1;
        public static final short UNKNOWN = (short) 0;
    }

    public interface WhiteBalance {
        public static final short AUTO = (short) 0;
        public static final short MANUAL = (short) 1;
    }

    public interface YCbCrPositioning {
        public static final short CENTERED = (short) 1;
        public static final short CO_SITED = (short) 2;
    }

    static {
        sOffsetTags.add(Short.valueOf(getTrueTagKey(TAG_GPS_IFD)));
        sOffsetTags.add(Short.valueOf(getTrueTagKey(TAG_EXIF_IFD)));
        sOffsetTags.add(Short.valueOf(getTrueTagKey(TAG_JPEG_INTERCHANGE_FORMAT)));
        sOffsetTags.add(Short.valueOf(getTrueTagKey(TAG_INTEROPERABILITY_IFD)));
        sOffsetTags.add(Short.valueOf(getTrueTagKey(TAG_STRIP_OFFSETS)));
        sBannedDefines.add(Short.valueOf(getTrueTagKey(-1)));
        sBannedDefines.add(Short.valueOf(getTrueTagKey(TAG_JPEG_INTERCHANGE_FORMAT_LENGTH)));
        sBannedDefines.add(Short.valueOf(getTrueTagKey(TAG_STRIP_BYTE_COUNTS)));
    }

    public static int defineTag(int i, short s) {
        return (i << 16) | (s & 65535);
    }

    public static short getTrueTagKey(int i) {
        return (short) i;
    }

    public static int getTrueIfd(int i) {
        return i >>> 16;
    }

    public ExifInterface() {
        this.mGPSDateStampFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
    }

    public void readExif(byte[] bArr) throws IOException {
        readExif(new ByteArrayInputStream(bArr));
    }

    public void readExif(InputStream inputStream) throws IOException {
        if (inputStream != null) {
            try {
                this.mData = new ExifReader(this).read(inputStream);
                return;
            } catch (ExifInvalidFormatException e) {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Invalid exif format : ");
                stringBuilder.append(e);
                throw new IOException(stringBuilder.toString());
            }
        }
        throw new IllegalArgumentException(NULL_ARGUMENT_STRING);
    }

    public void readExif(String str) throws FileNotFoundException, IOException {
        IOException e;
        if (str != null) {
            Closeable closeable = null;
            try {
                InputStream bufferedInputStream = new BufferedInputStream(new FileInputStream(str));
                try {
                    readExif(bufferedInputStream);
                    bufferedInputStream.close();
                    return;
                } catch (IOException e2) {
                    e = e2;
                    closeable = bufferedInputStream;
                    closeSilently(closeable);
                    throw e;
                }
            } catch (IOException e3) {
                e = e3;
                closeSilently(closeable);
                throw e;
            }
        }
        throw new IllegalArgumentException(NULL_ARGUMENT_STRING);
    }

    public void setExif(Collection<ExifTag> collection) {
        clearExif();
        setTags(collection);
    }

    public void clearExif() {
        this.mData = new ExifData(DEFAULT_BYTE_ORDER);
    }

    public void writeExif(byte[] bArr, OutputStream outputStream) throws IOException {
        if (bArr == null || outputStream == null) {
            throw new IllegalArgumentException(NULL_ARGUMENT_STRING);
        }
        outputStream = getExifWriterStream(outputStream);
        outputStream.write(bArr, 0, bArr.length);
        outputStream.flush();
    }

    public void writeExif(Bitmap bitmap, OutputStream outputStream) throws IOException {
        if (bitmap == null || outputStream == null) {
            throw new IllegalArgumentException(NULL_ARGUMENT_STRING);
        }
        outputStream = getExifWriterStream(outputStream);
        bitmap.compress(CompressFormat.JPEG, 90, outputStream);
        outputStream.flush();
    }

    public void writeExif(InputStream inputStream, OutputStream outputStream) throws IOException {
        if (inputStream == null || outputStream == null) {
            throw new IllegalArgumentException(NULL_ARGUMENT_STRING);
        }
        outputStream = getExifWriterStream(outputStream);
        doExifStreamIO(inputStream, outputStream);
        outputStream.flush();
    }

    public void writeExif(byte[] bArr, String str) throws FileNotFoundException, IOException {
        IOException e;
        if (bArr == null || str == null) {
            throw new IllegalArgumentException(NULL_ARGUMENT_STRING);
        }
        Closeable exifWriterStream;
        try {
            exifWriterStream = getExifWriterStream(str);
            try {
                exifWriterStream.write(bArr, 0, bArr.length);
                exifWriterStream.flush();
                exifWriterStream.close();
            } catch (IOException e2) {
                e = e2;
                closeSilently(exifWriterStream);
                throw e;
            }
        } catch (IOException e3) {
            e = e3;
            exifWriterStream = null;
            closeSilently(exifWriterStream);
            throw e;
        }
    }

    public void writeExif(Bitmap bitmap, String str) throws FileNotFoundException, IOException {
        IOException e;
        if (bitmap == null || str == null) {
            throw new IllegalArgumentException(NULL_ARGUMENT_STRING);
        }
        Closeable exifWriterStream;
        try {
            exifWriterStream = getExifWriterStream(str);
            try {
                bitmap.compress(CompressFormat.JPEG, 90, exifWriterStream);
                exifWriterStream.flush();
                exifWriterStream.close();
            } catch (IOException e2) {
                e = e2;
                closeSilently(exifWriterStream);
                throw e;
            }
        } catch (IOException e3) {
            e = e3;
            exifWriterStream = null;
            closeSilently(exifWriterStream);
            throw e;
        }
    }

    public void writeExif(InputStream inputStream, String str) throws FileNotFoundException, IOException {
        IOException e;
        if (inputStream == null || str == null) {
            throw new IllegalArgumentException(NULL_ARGUMENT_STRING);
        }
        Closeable exifWriterStream;
        try {
            exifWriterStream = getExifWriterStream(str);
            try {
                doExifStreamIO(inputStream, exifWriterStream);
                exifWriterStream.flush();
                exifWriterStream.close();
            } catch (IOException e2) {
                e = e2;
                closeSilently(exifWriterStream);
                throw e;
            }
        } catch (IOException e3) {
            e = e3;
            exifWriterStream = null;
            closeSilently(exifWriterStream);
            throw e;
        }
    }

    public void writeExif(String str, String str2) throws FileNotFoundException, IOException {
        IOException e;
        if (str == null || str2 == null) {
            throw new IllegalArgumentException(NULL_ARGUMENT_STRING);
        }
        Closeable closeable = null;
        try {
            InputStream fileInputStream = new FileInputStream(str);
            try {
                writeExif(fileInputStream, str2);
                fileInputStream.close();
            } catch (IOException e2) {
                e = e2;
                closeable = fileInputStream;
                closeSilently(closeable);
                throw e;
            }
        } catch (IOException e3) {
            e = e3;
            closeSilently(closeable);
            throw e;
        }
    }

    public OutputStream getExifWriterStream(OutputStream outputStream) {
        if (outputStream != null) {
            OutputStream exifOutputStream = new ExifOutputStream(outputStream, this);
            exifOutputStream.setExifData(this.mData);
            return exifOutputStream;
        }
        throw new IllegalArgumentException(NULL_ARGUMENT_STRING);
    }

    public OutputStream getExifWriterStream(String str) throws FileNotFoundException {
        if (str != null) {
            try {
                return getExifWriterStream(new FileOutputStream(str));
            } catch (FileNotFoundException e) {
                closeSilently(null);
                throw e;
            }
        }
        throw new IllegalArgumentException(NULL_ARGUMENT_STRING);
    }

    /* JADX WARNING: Removed duplicated region for block: B:25:0x0060 A:{Splitter: B:1:0x0003, ExcHandler: all (th java.lang.Throwable)} */
    /* JADX WARNING: Failed to process nested try/catch */
    /* JADX WARNING: Missing block: B:25:0x0060, code:
            r11 = th;
     */
    /* JADX WARNING: Missing block: B:26:0x0062, code:
            r12 = e;
     */
    /* JADX WARNING: Missing block: B:27:0x0063, code:
            r11 = null;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean rewriteExif(String str, Collection<ExifTag> collection) throws FileNotFoundException, IOException {
        InputStream bufferedInputStream;
        IOException e;
        Closeable closeable = null;
        RandomAccessFile randomAccessFile;
        try {
            File file = new File(str);
            bufferedInputStream = new BufferedInputStream(new FileInputStream(file));
            try {
                long offsetToExifEndFromSOF = (long) ExifParser.parse(bufferedInputStream, this).getOffsetToExifEndFromSOF();
                bufferedInputStream.close();
                randomAccessFile = new RandomAccessFile(file, "rw");
                if (randomAccessFile.length() >= offsetToExifEndFromSOF) {
                    boolean rewriteExif = rewriteExif(randomAccessFile.getChannel().map(MapMode.READ_WRITE, 0, offsetToExifEndFromSOF), (Collection) collection);
                    closeSilently(null);
                    randomAccessFile.close();
                    return rewriteExif;
                }
                throw new IOException("Filesize changed during operation");
            } catch (Throwable e2) {
                throw new IOException("Invalid exif format : ", e2);
            } catch (IOException e3) {
                e = e3;
            }
        } catch (IOException e4) {
            e = e4;
            closeable = randomAccessFile;
            bufferedInputStream = null;
        } catch (Throwable th) {
        }
        try {
            closeSilently(closeable);
            throw e;
        } catch (Throwable e22) {
            closeable = bufferedInputStream;
            Throwable th2 = e22;
            closeSilently(closeable);
            throw th2;
        }
    }

    public boolean rewriteExif(ByteBuffer byteBuffer, Collection<ExifTag> collection) throws IOException {
        try {
            ExifModifier exifModifier = new ExifModifier(byteBuffer, this);
            for (ExifTag modifyTag : collection) {
                exifModifier.modifyTag(modifyTag);
            }
            return exifModifier.commit();
        } catch (ExifInvalidFormatException e) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Invalid exif format : ");
            stringBuilder.append(e);
            throw new IOException(stringBuilder.toString());
        }
    }

    public void forceRewriteExif(String str, Collection<ExifTag> collection) throws FileNotFoundException, IOException {
        IOException e;
        Throwable th;
        if (!rewriteExif(str, (Collection) collection)) {
            ExifData exifData = this.mData;
            this.mData = new ExifData(DEFAULT_BYTE_ORDER);
            Closeable closeable = null;
            try {
                FileInputStream fileInputStream = new FileInputStream(str);
                try {
                    OutputStream byteArrayOutputStream = new ByteArrayOutputStream();
                    doExifStreamIO(fileInputStream, byteArrayOutputStream);
                    byte[] toByteArray = byteArrayOutputStream.toByteArray();
                    readExif(toByteArray);
                    setTags(collection);
                    writeExif(toByteArray, str);
                    fileInputStream.close();
                    this.mData = exifData;
                } catch (IOException e2) {
                    e = e2;
                    closeable = fileInputStream;
                    try {
                        closeSilently(closeable);
                        throw e;
                    } catch (Throwable th2) {
                        th = th2;
                        fileInputStream = closeable;
                        fileInputStream.close();
                        this.mData = exifData;
                        throw th;
                    }
                } catch (Throwable th3) {
                    th = th3;
                    fileInputStream.close();
                    this.mData = exifData;
                    throw th;
                }
            } catch (IOException e3) {
                e = e3;
                closeSilently(closeable);
                throw e;
            }
        }
    }

    public void forceRewriteExif(String str) throws FileNotFoundException, IOException {
        forceRewriteExif(str, getAllTags());
    }

    public List<ExifTag> getAllTags() {
        return this.mData.getAllTags();
    }

    public List<ExifTag> getTagsForTagId(short s) {
        return this.mData.getAllTagsForTagId(s);
    }

    public List<ExifTag> getTagsForIfdId(int i) {
        return this.mData.getAllTagsForIfd(i);
    }

    public ExifTag getTag(int i, int i2) {
        if (ExifTag.isValidIfd(i2)) {
            return this.mData.getTag(getTrueTagKey(i), i2);
        }
        return null;
    }

    public ExifTag getTag(int i) {
        return getTag(i, getDefinedTagDefaultIfd(i));
    }

    public Object getTagValue(int i, int i2) {
        ExifTag tag = getTag(i, i2);
        return tag == null ? null : tag.getValue();
    }

    public Object getTagValue(int i) {
        return getTagValue(i, getDefinedTagDefaultIfd(i));
    }

    public String getTagStringValue(int i, int i2) {
        ExifTag tag = getTag(i, i2);
        if (tag == null) {
            return null;
        }
        return tag.getValueAsString();
    }

    public String getTagStringValue(int i) {
        return getTagStringValue(i, getDefinedTagDefaultIfd(i));
    }

    public Long getTagLongValue(int i, int i2) {
        long[] tagLongValues = getTagLongValues(i, i2);
        if (tagLongValues == null || tagLongValues.length <= 0) {
            return null;
        }
        return Long.valueOf(tagLongValues[0]);
    }

    public Long getTagLongValue(int i) {
        return getTagLongValue(i, getDefinedTagDefaultIfd(i));
    }

    public Integer getTagIntValue(int i, int i2) {
        int[] tagIntValues = getTagIntValues(i, i2);
        if (tagIntValues == null || tagIntValues.length <= 0) {
            return null;
        }
        return Integer.valueOf(tagIntValues[0]);
    }

    public Integer getTagIntValue(int i) {
        return getTagIntValue(i, getDefinedTagDefaultIfd(i));
    }

    public Byte getTagByteValue(int i, int i2) {
        byte[] tagByteValues = getTagByteValues(i, i2);
        if (tagByteValues == null || tagByteValues.length <= 0) {
            return null;
        }
        return Byte.valueOf(tagByteValues[0]);
    }

    public Byte getTagByteValue(int i) {
        return getTagByteValue(i, getDefinedTagDefaultIfd(i));
    }

    public Rational getTagRationalValue(int i, int i2) {
        Rational[] tagRationalValues = getTagRationalValues(i, i2);
        if (tagRationalValues == null || tagRationalValues.length == 0) {
            return null;
        }
        return new Rational(tagRationalValues[0]);
    }

    public Rational getTagRationalValue(int i) {
        return getTagRationalValue(i, getDefinedTagDefaultIfd(i));
    }

    public long[] getTagLongValues(int i, int i2) {
        ExifTag tag = getTag(i, i2);
        if (tag == null) {
            return null;
        }
        return tag.getValueAsLongs();
    }

    public long[] getTagLongValues(int i) {
        return getTagLongValues(i, getDefinedTagDefaultIfd(i));
    }

    public int[] getTagIntValues(int i, int i2) {
        ExifTag tag = getTag(i, i2);
        if (tag == null) {
            return null;
        }
        return tag.getValueAsInts();
    }

    public int[] getTagIntValues(int i) {
        return getTagIntValues(i, getDefinedTagDefaultIfd(i));
    }

    public byte[] getTagByteValues(int i, int i2) {
        ExifTag tag = getTag(i, i2);
        if (tag == null) {
            return null;
        }
        return tag.getValueAsBytes();
    }

    public byte[] getTagByteValues(int i) {
        return getTagByteValues(i, getDefinedTagDefaultIfd(i));
    }

    public Rational[] getTagRationalValues(int i, int i2) {
        ExifTag tag = getTag(i, i2);
        if (tag == null) {
            return null;
        }
        return tag.getValueAsRationals();
    }

    public Rational[] getTagRationalValues(int i) {
        return getTagRationalValues(i, getDefinedTagDefaultIfd(i));
    }

    public boolean isTagCountDefined(int i) {
        i = getTagInfo().get(i);
        boolean z = false;
        if (i == 0) {
            return false;
        }
        if (getComponentCountFromInfo(i) != 0) {
            z = true;
        }
        return z;
    }

    public int getDefinedTagCount(int i) {
        i = getTagInfo().get(i);
        if (i == 0) {
            return 0;
        }
        return getComponentCountFromInfo(i);
    }

    public int getActualTagCount(int i, int i2) {
        ExifTag tag = getTag(i, i2);
        if (tag == null) {
            return 0;
        }
        return tag.getComponentCount();
    }

    public int getDefinedTagDefaultIfd(int i) {
        if (getTagInfo().get(i) == 0) {
            return -1;
        }
        return getTrueIfd(i);
    }

    public short getDefinedTagType(int i) {
        i = getTagInfo().get(i);
        if (i == 0) {
            return (short) -1;
        }
        return getTypeFromInfo(i);
    }

    protected static boolean isOffsetTag(short s) {
        return sOffsetTags.contains(Short.valueOf(s));
    }

    public ExifTag buildTag(int i, int i2, Object obj) {
        int i3 = getTagInfo().get(i);
        if (i3 == 0 || obj == null) {
            return null;
        }
        short typeFromInfo = getTypeFromInfo(i3);
        int componentCountFromInfo = getComponentCountFromInfo(i3);
        boolean z = componentCountFromInfo != 0;
        if (!isIfdAllowed(i3, i2)) {
            return null;
        }
        ExifTag exifTag = new ExifTag(getTrueTagKey(i), typeFromInfo, componentCountFromInfo, i2, z);
        if (exifTag.setValue(obj)) {
            return exifTag;
        }
        return null;
    }

    public ExifTag buildTag(int i, Object obj) {
        return buildTag(i, getTrueIfd(i), obj);
    }

    protected ExifTag buildUninitializedTag(int i) {
        int i2 = getTagInfo().get(i);
        if (i2 == 0) {
            return null;
        }
        short typeFromInfo = getTypeFromInfo(i2);
        int componentCountFromInfo = getComponentCountFromInfo(i2);
        return new ExifTag(getTrueTagKey(i), typeFromInfo, componentCountFromInfo, getTrueIfd(i), componentCountFromInfo != 0);
    }

    public boolean setTagValue(int i, int i2, Object obj) {
        ExifTag tag = getTag(i, i2);
        if (tag == null) {
            return false;
        }
        return tag.setValue(obj);
    }

    public boolean setTagValue(int i, Object obj) {
        return setTagValue(i, getDefinedTagDefaultIfd(i), obj);
    }

    public ExifTag setTag(ExifTag exifTag) {
        return this.mData.addTag(exifTag);
    }

    public void setTags(Collection<ExifTag> collection) {
        for (ExifTag tag : collection) {
            setTag(tag);
        }
    }

    public void deleteTag(int i, int i2) {
        this.mData.removeTag(getTrueTagKey(i), i2);
    }

    public void deleteTag(int i) {
        deleteTag(i, getDefinedTagDefaultIfd(i));
    }

    public int setTagDefinition(short s, int i, short s2, short s3, int[] iArr) {
        if (sBannedDefines.contains(Short.valueOf(s)) || !ExifTag.isValidType(s2) || !ExifTag.isValidIfd(i)) {
            return -1;
        }
        int defineTag = defineTag(i, s);
        if (defineTag == -1) {
            return -1;
        }
        int[] tagDefinitionsForTagId = getTagDefinitionsForTagId(s);
        SparseIntArray tagInfo = getTagInfo();
        int length = iArr.length;
        int i2 = 0;
        int i3 = 0;
        int i4 = i3;
        while (i3 < length) {
            int i5 = iArr[i3];
            if (i == i5) {
                i4 = 1;
            }
            if (!ExifTag.isValidIfd(i5)) {
                return -1;
            }
            i3++;
        }
        if (i4 == 0) {
            return -1;
        }
        i = getFlagsFromAllowedIfds(iArr);
        if (tagDefinitionsForTagId != null) {
            int length2 = tagDefinitionsForTagId.length;
            while (i2 < length2) {
                if ((getAllowedIfdFlagsFromInfo(tagInfo.get(tagDefinitionsForTagId[i2])) & i) != 0) {
                    return -1;
                }
                i2++;
            }
        }
        getTagInfo().put(defineTag, ((i << 24) | (s2 << 16)) | s3);
        return defineTag;
    }

    protected int getTagDefinition(short s, int i) {
        return getTagInfo().get(defineTag(i, s));
    }

    protected int[] getTagDefinitionsForTagId(short s) {
        int[] ifds = IfdData.getIfds();
        int[] iArr = new int[ifds.length];
        SparseIntArray tagInfo = getTagInfo();
        int length = ifds.length;
        int i = 0;
        int i2 = i;
        while (i < length) {
            int defineTag = defineTag(ifds[i], s);
            if (tagInfo.get(defineTag) != 0) {
                int i3 = i2 + 1;
                iArr[i2] = defineTag;
                i2 = i3;
            }
            i++;
        }
        if (i2 == 0) {
            return null;
        }
        return Arrays.copyOfRange(iArr, 0, i2);
    }

    protected int getTagDefinitionForTag(ExifTag exifTag) {
        return getTagDefinitionForTag(exifTag.getTagId(), exifTag.getDataType(), exifTag.getComponentCount(), exifTag.getIfd());
    }

    protected int getTagDefinitionForTag(short s, short s2, int i, int i2) {
        int[] tagDefinitionsForTagId = getTagDefinitionsForTagId(s);
        int i3 = -1;
        if (tagDefinitionsForTagId == null) {
            return -1;
        }
        SparseIntArray tagInfo = getTagInfo();
        for (int i4 : tagDefinitionsForTagId) {
            Object obj;
            int i5 = tagInfo.get(i4);
            short typeFromInfo = getTypeFromInfo(i5);
            int componentCountFromInfo = getComponentCountFromInfo(i5);
            for (int i6 : getAllowedIfdsFromInfo(i5)) {
                if (i6 == i2) {
                    obj = 1;
                    break;
                }
            }
            int i7 = i2;
            obj = null;
            if (obj == null) {
                short s3 = s2;
            } else if (s2 == typeFromInfo) {
                if (i == componentCountFromInfo || componentCountFromInfo == 0) {
                    i3 = i4;
                    break;
                }
            }
            int i8 = i;
        }
        return i3;
    }

    public void removeTagDefinition(int i) {
        getTagInfo().delete(i);
    }

    public void resetTagDefinitions() {
        this.mTagInfo = null;
    }

    public Bitmap getThumbnailBitmap() {
        if (this.mData.hasCompressedThumbnail()) {
            byte[] compressedThumbnail = this.mData.getCompressedThumbnail();
            return BitmapFactory.decodeByteArray(compressedThumbnail, 0, compressedThumbnail.length);
        }
        this.mData.hasUncompressedStrip();
        return null;
    }

    public byte[] getThumbnailBytes() {
        if (this.mData.hasCompressedThumbnail()) {
            return this.mData.getCompressedThumbnail();
        }
        this.mData.hasUncompressedStrip();
        return null;
    }

    public byte[] getThumbnail() {
        return this.mData.getCompressedThumbnail();
    }

    public boolean isThumbnailCompressed() {
        return this.mData.hasCompressedThumbnail();
    }

    public boolean hasThumbnail() {
        return this.mData.hasCompressedThumbnail();
    }

    public boolean setCompressedThumbnail(byte[] bArr) {
        this.mData.clearThumbnailAndStrips();
        this.mData.setCompressedThumbnail(bArr);
        return true;
    }

    public boolean setCompressedThumbnail(Bitmap bitmap) {
        OutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        if (bitmap.compress(CompressFormat.JPEG, 90, byteArrayOutputStream)) {
            return setCompressedThumbnail(byteArrayOutputStream.toByteArray());
        }
        return false;
    }

    public void removeCompressedThumbnail() {
        this.mData.setCompressedThumbnail(null);
    }

    public boolean addAlgorithmComment(String str) {
        String str2 = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("addAlgorithmComment: ");
        stringBuilder.append(str);
        Log.d(str2, stringBuilder.toString());
        return addExifTag(TAG_ALGORITHM_COMMENT, str);
    }

    public boolean addParallelProcessComment(String str, int i, int i2, int i3) {
        String str2 = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("algo exif: addParallel ");
        stringBuilder.append(str);
        Log.i(str2, stringBuilder.toString());
        return addExifTag(TAG_PARALLEL_PROCESS_COMMENT, str) && addExifTag(TAG_ORIENTATION, Short.valueOf(getExifOrientationValue(i))) && addExifTag(TAG_IMAGE_WIDTH, Integer.valueOf(i2)) && addExifTag(TAG_IMAGE_LENGTH, Integer.valueOf(i3));
    }

    public static byte[] removeParallelProcessComment(byte[] bArr) {
        Log.i(TAG, "algo exif: removeParallel");
        long currentTimeMillis = System.currentTimeMillis();
        OutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        try {
            ExifInterface exifInterface = new ExifInterface();
            exifInterface.readExif(bArr);
            exifInterface.removeParallelProcessComment();
            exifInterface.writeExif(bArr, byteArrayOutputStream);
            byte[] toByteArray = byteArrayOutputStream.toByteArray();
            byteArrayOutputStream.close();
            bArr = toByteArray;
        } catch (Throwable e) {
            Log.e(ExifInterface.class.getName(), e.getMessage(), e);
        }
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("removeParallelProcessComment cost=");
        stringBuilder.append(System.currentTimeMillis() - currentTimeMillis);
        Log.v(str, stringBuilder.toString());
        return bArr;
    }

    public void removeParallelProcessComment() {
        deleteTag(TAG_PARALLEL_PROCESS_COMMENT);
    }

    public boolean addDepthMapFocusPoint(Point point) {
        return addExifTag(TAG_DEPTH_MAP_FOCUS_POINT, point.toString());
    }

    public boolean addDepthMapBlurLevel(int i) {
        return addExifTag(TAG_DEPTH_MAP_BLUR_LEVEL, Integer.valueOf(i));
    }

    public boolean addDulCameraWaterMark(byte[] bArr) {
        return addExifTag(TAG_DEPTH_MAP_DULCAMERA_WATER_MARK, bArr);
    }

    public boolean addTimeWaterMark(byte[] bArr) {
        return addExifTag(TAG_DEPTH_MAP_TIME_WATER_MARK, bArr);
    }

    public boolean addPortraitLighting(int i) {
        return addExifTag(TAG_PORTRAIT_LIGHTING_PATTERN, Integer.valueOf(i));
    }

    public boolean addAiType(int i) {
        return addExifTag(TAG_AI_TYPE, Integer.valueOf(i));
    }

    public boolean addFrontMirror(int i) {
        return addExifTag(TAG_FRONT_MIRROR, Integer.valueOf(i));
    }

    public boolean addFileTypeLiveShot(boolean z) {
        return addExifTag(TAG_LIVESHOT, Byte.valueOf(z));
    }

    private boolean addExifTag(int i, Object obj) {
        ExifTag buildTag = buildTag(i, obj);
        if (buildTag == null) {
            return false;
        }
        setTag(buildTag);
        return true;
    }

    public String getUserComment() {
        return this.mData.getUserComment();
    }

    public String getXiaomiComment() {
        return this.mData.getXiaomiComment();
    }

    public static short getExifOrientationValue(int i) {
        i %= 360;
        if (i < 0) {
            i += 360;
        }
        if (i < 90) {
            return (short) 1;
        }
        if (i < 180) {
            return (short) 6;
        }
        if (i < 270) {
            return (short) 3;
        }
        return (short) 8;
    }

    public static int getRotation(short s) {
        if (s == (short) 1) {
            return 0;
        }
        if (s == (short) 3) {
            return 180;
        }
        if (s == (short) 6) {
            return 90;
        }
        if (s != (short) 8) {
            return 0;
        }
        return 270;
    }

    public static double convertLatOrLongToDouble(Rational[] rationalArr, String str) {
        try {
            double toDouble = (rationalArr[0].toDouble() + (rationalArr[1].toDouble() / 60.0d)) + (rationalArr[2].toDouble() / 3600.0d);
            if (str.equals(GpsLatitudeRef.SOUTH) || str.equals(GpsLongitudeRef.WEST)) {
                return -toDouble;
            }
            return toDouble;
        } catch (ArrayIndexOutOfBoundsException e) {
            throw new IllegalArgumentException();
        }
    }

    public double[] getLatLongAsDoubles() {
        Rational[] tagRationalValues = getTagRationalValues(TAG_GPS_LATITUDE);
        String tagStringValue = getTagStringValue(TAG_GPS_LATITUDE_REF);
        Rational[] tagRationalValues2 = getTagRationalValues(TAG_GPS_LONGITUDE);
        String tagStringValue2 = getTagStringValue(TAG_GPS_LONGITUDE_REF);
        if (tagRationalValues == null || tagRationalValues2 == null || tagStringValue == null || tagStringValue2 == null || tagRationalValues.length < 3 || tagRationalValues2.length < 3) {
            return null;
        }
        return new double[]{convertLatOrLongToDouble(tagRationalValues, tagStringValue), convertLatOrLongToDouble(tagRationalValues2, tagStringValue2)};
    }

    public boolean addDateTimeStampTag(int i, long j, TimeZone timeZone) {
        if (i != TAG_DATE_TIME && i != TAG_DATE_TIME_DIGITIZED && i != TAG_DATE_TIME_ORIGINAL) {
            return false;
        }
        this.mDateTimeStampFormat.setTimeZone(timeZone);
        ExifTag buildTag = buildTag(i, this.mDateTimeStampFormat.format(Long.valueOf(j)));
        if (buildTag == null) {
            return false;
        }
        setTag(buildTag);
        return true;
    }

    public boolean addXiaomiComment(String str) {
        ExifTag buildTag = buildTag(TAG_XIAOMI_COMMENT, str);
        if (buildTag == null) {
            return false;
        }
        setTag(buildTag);
        return true;
    }

    public boolean addGpsTags(double d, double d2) {
        Object obj;
        Object obj2;
        ExifTag buildTag = buildTag(TAG_GPS_LATITUDE, toExifLatLong(d));
        ExifTag buildTag2 = buildTag(TAG_GPS_LONGITUDE, toExifLatLong(d2));
        int i = TAG_GPS_LATITUDE_REF;
        if (d >= 0.0d) {
            obj = "N";
        } else {
            obj = GpsLatitudeRef.SOUTH;
        }
        ExifTag buildTag3 = buildTag(i, obj);
        int i2 = TAG_GPS_LONGITUDE_REF;
        if (d2 >= 0.0d) {
            obj2 = GpsLongitudeRef.EAST;
        } else {
            obj2 = GpsLongitudeRef.WEST;
        }
        ExifTag buildTag4 = buildTag(i2, obj2);
        if (buildTag == null || buildTag2 == null || buildTag3 == null || buildTag4 == null) {
            return false;
        }
        setTag(buildTag);
        setTag(buildTag2);
        setTag(buildTag3);
        setTag(buildTag4);
        return true;
    }

    public boolean addGpsDateTimeStampTag(long j) {
        ExifTag buildTag = buildTag(TAG_GPS_DATE_STAMP, this.mGPSDateStampFormat.format(Long.valueOf(j)));
        if (buildTag == null) {
            return false;
        }
        setTag(buildTag);
        this.mGPSTimeStampCalendar.setTimeInMillis(j);
        ExifTag buildTag2 = buildTag(TAG_GPS_TIME_STAMP, new Rational[]{new Rational((long) this.mGPSTimeStampCalendar.get(11), 1), new Rational((long) this.mGPSTimeStampCalendar.get(12), 1), new Rational((long) this.mGPSTimeStampCalendar.get(13), 1)});
        if (buildTag2 == null) {
            return false;
        }
        setTag(buildTag2);
        return true;
    }

    private static Rational[] toExifLatLong(double d) {
        d = Math.abs(d);
        d = (d - ((double) ((int) d))) * 60.0d;
        int i = (int) ((d - ((double) ((int) d))) * 6000.0d);
        return new Rational[]{new Rational((long) r0, 1), new Rational((long) r1, 1), new Rational((long) i, 100)};
    }

    private void doExifStreamIO(InputStream inputStream, OutputStream outputStream) throws IOException {
        byte[] bArr = new byte[1024];
        int read = inputStream.read(bArr, 0, 1024);
        while (read != -1) {
            outputStream.write(bArr, 0, read);
            read = inputStream.read(bArr, 0, 1024);
        }
    }

    protected static void closeSilently(Closeable closeable) {
        if (closeable != null) {
            try {
                closeable.close();
            } catch (Throwable th) {
            }
        }
    }

    protected SparseIntArray getTagInfo() {
        if (this.mTagInfo == null) {
            this.mTagInfo = new SparseIntArray();
            initTagInfo();
        }
        return this.mTagInfo;
    }

    private void initTagInfo() {
        int flagsFromAllowedIfds = getFlagsFromAllowedIfds(new int[]{0, 1}) << 24;
        int i = flagsFromAllowedIfds | STMobileHumanActionNative.ST_MOBILE_HAND_CONGRATULATE;
        int i2 = i | 0;
        this.mTagInfo.put(TAG_MAKE, i2);
        int i3 = flagsFromAllowedIfds | STMobileHumanActionNative.ST_MOBILE_HAND_FINGER_HEART;
        int i4 = i3 | 1;
        this.mTagInfo.put(TAG_IMAGE_WIDTH, i4);
        this.mTagInfo.put(TAG_IMAGE_LENGTH, i4);
        int i5 = flagsFromAllowedIfds | 196608;
        this.mTagInfo.put(TAG_BITS_PER_SAMPLE, i5 | 3);
        int i6 = i5 | 1;
        this.mTagInfo.put(TAG_COMPRESSION, i6);
        this.mTagInfo.put(TAG_PHOTOMETRIC_INTERPRETATION, i6);
        this.mTagInfo.put(TAG_ORIENTATION, i6);
        this.mTagInfo.put(TAG_SAMPLES_PER_PIXEL, i6);
        this.mTagInfo.put(TAG_PLANAR_CONFIGURATION, i6);
        this.mTagInfo.put(TAG_Y_CB_CR_SUB_SAMPLING, i5 | 2);
        this.mTagInfo.put(TAG_Y_CB_CR_POSITIONING, i6);
        flagsFromAllowedIfds |= 327680;
        int i7 = flagsFromAllowedIfds | 1;
        this.mTagInfo.put(TAG_X_RESOLUTION, i7);
        this.mTagInfo.put(TAG_Y_RESOLUTION, i7);
        this.mTagInfo.put(TAG_RESOLUTION_UNIT, i6);
        i3 |= 0;
        this.mTagInfo.put(TAG_STRIP_OFFSETS, i3);
        this.mTagInfo.put(TAG_ROWS_PER_STRIP, i4);
        this.mTagInfo.put(TAG_STRIP_BYTE_COUNTS, i3);
        this.mTagInfo.put(TAG_TRANSFER_FUNCTION, i5 | 768);
        this.mTagInfo.put(TAG_WHITE_POINT, flagsFromAllowedIfds | 2);
        i3 = flagsFromAllowedIfds | 6;
        this.mTagInfo.put(TAG_PRIMARY_CHROMATICITIES, i3);
        this.mTagInfo.put(TAG_Y_CB_CR_COEFFICIENTS, flagsFromAllowedIfds | 3);
        this.mTagInfo.put(TAG_REFERENCE_BLACK_WHITE, i3);
        this.mTagInfo.put(TAG_DATE_TIME, i | 20);
        this.mTagInfo.put(TAG_IMAGE_DESCRIPTION, i2);
        this.mTagInfo.put(TAG_MAKE, i2);
        this.mTagInfo.put(TAG_MODEL, i2);
        this.mTagInfo.put(TAG_SOFTWARE, i2);
        this.mTagInfo.put(TAG_ARTIST, i2);
        this.mTagInfo.put(TAG_COPYRIGHT, i2);
        this.mTagInfo.put(TAG_EXIF_IFD, i4);
        this.mTagInfo.put(TAG_GPS_IFD, i4);
        int flagsFromAllowedIfds2 = ((getFlagsFromAllowedIfds(new int[]{1}) << 24) | STMobileHumanActionNative.ST_MOBILE_HAND_FINGER_HEART) | 1;
        this.mTagInfo.put(TAG_JPEG_INTERCHANGE_FORMAT, flagsFromAllowedIfds2);
        this.mTagInfo.put(TAG_JPEG_INTERCHANGE_FORMAT_LENGTH, flagsFromAllowedIfds2);
        flagsFromAllowedIfds2 = getFlagsFromAllowedIfds(new int[]{2}) << 24;
        i3 = flagsFromAllowedIfds2 | 458752;
        i4 = i3 | 4;
        this.mTagInfo.put(TAG_EXIF_VERSION, i4);
        this.mTagInfo.put(TAG_FLASHPIX_VERSION, i4);
        i7 = flagsFromAllowedIfds2 | 196608;
        int i8 = i7 | 1;
        this.mTagInfo.put(TAG_COLOR_SPACE, i8);
        this.mTagInfo.put(TAG_COMPONENTS_CONFIGURATION, i4);
        i4 = (flagsFromAllowedIfds2 | 327680) | 1;
        this.mTagInfo.put(TAG_COMPRESSED_BITS_PER_PIXEL, i4);
        int i9 = (STMobileHumanActionNative.ST_MOBILE_HAND_FINGER_HEART | flagsFromAllowedIfds2) | 1;
        this.mTagInfo.put(TAG_PIXEL_X_DIMENSION, i9);
        this.mTagInfo.put(TAG_PIXEL_Y_DIMENSION, i9);
        i2 = i3 | 0;
        this.mTagInfo.put(TAG_MAKER_NOTE, i2);
        this.mTagInfo.put(TAG_USER_COMMENT, i2);
        int i10 = flagsFromAllowedIfds2 | STMobileHumanActionNative.ST_MOBILE_HAND_CONGRATULATE;
        this.mTagInfo.put(TAG_RELATED_SOUND_FILE, i10 | 13);
        int i11 = i10 | 20;
        this.mTagInfo.put(TAG_DATE_TIME_ORIGINAL, i11);
        this.mTagInfo.put(TAG_DATE_TIME_DIGITIZED, i11);
        i11 = i10 | 0;
        this.mTagInfo.put(TAG_SUB_SEC_TIME, i11);
        this.mTagInfo.put(TAG_SUB_SEC_TIME_ORIGINAL, i11);
        this.mTagInfo.put(TAG_SUB_SEC_TIME_DIGITIZED, i11);
        this.mTagInfo.put(TAG_IMAGE_UNIQUE_ID, i10 | 33);
        this.mTagInfo.put(TAG_EXPOSURE_TIME, i4);
        this.mTagInfo.put(TAG_F_NUMBER, i4);
        this.mTagInfo.put(TAG_EXPOSURE_PROGRAM, i8);
        this.mTagInfo.put(TAG_SPECTRAL_SENSITIVITY, i11);
        i5 = i7 | 0;
        this.mTagInfo.put(TAG_ISO_SPEED_RATINGS, i5);
        this.mTagInfo.put(TAG_OECF, i2);
        int i12 = (flagsFromAllowedIfds2 | 655360) | 1;
        this.mTagInfo.put(TAG_SHUTTER_SPEED_VALUE, i12);
        this.mTagInfo.put(TAG_APERTURE_VALUE, i4);
        this.mTagInfo.put(TAG_BRIGHTNESS_VALUE, i12);
        this.mTagInfo.put(TAG_EXPOSURE_BIAS_VALUE, i12);
        this.mTagInfo.put(TAG_MAX_APERTURE_VALUE, i4);
        this.mTagInfo.put(TAG_SUBJECT_DISTANCE, i4);
        this.mTagInfo.put(TAG_METERING_MODE, i8);
        this.mTagInfo.put(TAG_LIGHT_SOURCE, i8);
        this.mTagInfo.put(TAG_FLASH, i8);
        this.mTagInfo.put(TAG_FOCAL_LENGTH, i4);
        this.mTagInfo.put(TAG_SUBJECT_AREA, i5);
        this.mTagInfo.put(TAG_FLASH_ENERGY, i4);
        this.mTagInfo.put(TAG_SPATIAL_FREQUENCY_RESPONSE, i2);
        this.mTagInfo.put(TAG_FOCAL_PLANE_X_RESOLUTION, i4);
        this.mTagInfo.put(TAG_FOCAL_PLANE_Y_RESOLUTION, i4);
        this.mTagInfo.put(TAG_FOCAL_PLANE_RESOLUTION_UNIT, i8);
        this.mTagInfo.put(TAG_SUBJECT_LOCATION, 2 | i7);
        this.mTagInfo.put(TAG_EXPOSURE_INDEX, i4);
        this.mTagInfo.put(TAG_SENSING_METHOD, i8);
        i12 = i3 | 1;
        this.mTagInfo.put(TAG_FILE_SOURCE, i12);
        this.mTagInfo.put(TAG_SCENE_TYPE, i12);
        this.mTagInfo.put(TAG_CFA_PATTERN, i2);
        this.mTagInfo.put(TAG_CUSTOM_RENDERED, i8);
        this.mTagInfo.put(TAG_EXPOSURE_MODE, i8);
        this.mTagInfo.put(TAG_WHITE_BALANCE, i8);
        this.mTagInfo.put(TAG_DIGITAL_ZOOM_RATIO, i4);
        this.mTagInfo.put(TAG_FOCAL_LENGTH_IN_35_MM_FILE, i8);
        this.mTagInfo.put(TAG_SCENE_CAPTURE_TYPE, i8);
        this.mTagInfo.put(TAG_GAIN_CONTROL, i4);
        this.mTagInfo.put(TAG_CONTRAST, i8);
        this.mTagInfo.put(TAG_SATURATION, i8);
        this.mTagInfo.put(TAG_SHARPNESS, i8);
        this.mTagInfo.put(TAG_DEVICE_SETTING_DESCRIPTION, i2);
        this.mTagInfo.put(TAG_SUBJECT_DISTANCE_RANGE, i8);
        this.mTagInfo.put(TAG_INTEROPERABILITY_IFD, i9);
        this.mTagInfo.put(TAG_PARALLEL_PROCESS_COMMENT, i11);
        this.mTagInfo.put(TAG_ALGORITHM_COMMENT, i11);
        this.mTagInfo.put(TAG_DEPTH_MAP_BLUR_LEVEL, i8);
        this.mTagInfo.put(TAG_DEPTH_MAP_FOCUS_POINT, i11);
        flagsFromAllowedIfds2 |= 65536;
        i = flagsFromAllowedIfds2 | 0;
        this.mTagInfo.put(TAG_DEPTH_MAP_DULCAMERA_WATER_MARK, i);
        this.mTagInfo.put(TAG_DEPTH_MAP_TIME_WATER_MARK, i);
        this.mTagInfo.put(TAG_PORTRAIT_LIGHTING_PATTERN, i8);
        this.mTagInfo.put(TAG_AI_TYPE, i8);
        this.mTagInfo.put(TAG_FRONT_MIRROR, i8);
        this.mTagInfo.put(TAG_LIVESHOT, flagsFromAllowedIfds2 | 1);
        this.mTagInfo.put(TAG_XIAOMI_COMMENT, i11);
        int flagsFromAllowedIfds3 = getFlagsFromAllowedIfds(new int[]{4}) << 24;
        i12 = 65536 | flagsFromAllowedIfds3;
        this.mTagInfo.put(TAG_GPS_VERSION_ID, i12 | 4);
        i2 = flagsFromAllowedIfds3 | STMobileHumanActionNative.ST_MOBILE_HAND_CONGRATULATE;
        i = i2 | 2;
        this.mTagInfo.put(TAG_GPS_LATITUDE_REF, i);
        this.mTagInfo.put(TAG_GPS_LONGITUDE_REF, i);
        i9 = (flagsFromAllowedIfds3 | 655360) | 3;
        this.mTagInfo.put(TAG_GPS_LATITUDE, i9);
        this.mTagInfo.put(TAG_GPS_LONGITUDE, i9);
        this.mTagInfo.put(TAG_GPS_ALTITUDE_REF, i12 | 1);
        i12 = 327680 | flagsFromAllowedIfds3;
        i9 = i12 | 1;
        this.mTagInfo.put(TAG_GPS_ALTITUDE, i9);
        this.mTagInfo.put(TAG_GPS_TIME_STAMP, i12 | 3);
        i12 = i2 | 0;
        this.mTagInfo.put(TAG_GPS_SATTELLITES, i12);
        this.mTagInfo.put(TAG_GPS_STATUS, i);
        this.mTagInfo.put(TAG_GPS_MEASURE_MODE, i);
        this.mTagInfo.put(TAG_GPS_DOP, i9);
        this.mTagInfo.put(TAG_GPS_SPEED_REF, i);
        this.mTagInfo.put(TAG_GPS_SPEED, i9);
        this.mTagInfo.put(TAG_GPS_TRACK_REF, i);
        this.mTagInfo.put(TAG_GPS_TRACK, i9);
        this.mTagInfo.put(TAG_GPS_IMG_DIRECTION_REF, i);
        this.mTagInfo.put(TAG_GPS_IMG_DIRECTION, i9);
        this.mTagInfo.put(TAG_GPS_MAP_DATUM, i12);
        this.mTagInfo.put(TAG_GPS_DEST_LATITUDE_REF, i);
        this.mTagInfo.put(TAG_GPS_DEST_LATITUDE, i9);
        this.mTagInfo.put(TAG_GPS_DEST_BEARING_REF, i);
        this.mTagInfo.put(TAG_GPS_DEST_BEARING, i9);
        this.mTagInfo.put(TAG_GPS_DEST_DISTANCE_REF, i);
        this.mTagInfo.put(TAG_GPS_DEST_DISTANCE, i9);
        i12 = (458752 | flagsFromAllowedIfds3) | 0;
        this.mTagInfo.put(TAG_GPS_PROCESSING_METHOD, i12);
        this.mTagInfo.put(TAG_GPS_AREA_INFORMATION, i12);
        this.mTagInfo.put(TAG_GPS_DATE_STAMP, i2 | 11);
        this.mTagInfo.put(TAG_GPS_DIFFERENTIAL, (flagsFromAllowedIfds3 | 196608) | 11);
        this.mTagInfo.put(TAG_INTEROPERABILITY_INDEX, ((getFlagsFromAllowedIfds(new int[]{3}) << 24) | STMobileHumanActionNative.ST_MOBILE_HAND_CONGRATULATE) | 0);
    }

    protected static int getAllowedIfdFlagsFromInfo(int i) {
        return i >>> 24;
    }

    protected static int[] getAllowedIfdsFromInfo(int i) {
        int i2;
        i = getAllowedIfdFlagsFromInfo(i);
        int[] ifds = IfdData.getIfds();
        ArrayList arrayList = new ArrayList();
        int i3 = 0;
        for (i2 = 0; i2 < 5; i2++) {
            if (((i >> i2) & 1) == 1) {
                arrayList.add(Integer.valueOf(ifds[i2]));
            }
        }
        if (arrayList.size() <= 0) {
            return null;
        }
        int[] iArr = new int[arrayList.size()];
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            i2 = i3 + 1;
            iArr[i3] = ((Integer) it.next()).intValue();
            i3 = i2;
        }
        return iArr;
    }

    protected static boolean isIfdAllowed(int i, int i2) {
        int[] ifds = IfdData.getIfds();
        i = getAllowedIfdFlagsFromInfo(i);
        int i3 = 0;
        while (i3 < ifds.length) {
            if (i2 == ifds[i3] && ((i >> i3) & 1) == 1) {
                return true;
            }
            i3++;
        }
        return false;
    }

    protected static int getFlagsFromAllowedIfds(int[] iArr) {
        if (iArr == null || iArr.length == 0) {
            return 0;
        }
        int[] ifds = IfdData.getIfds();
        int i = 0;
        int i2 = i;
        while (i < 5) {
            for (int i3 : iArr) {
                if (ifds[i] == i3) {
                    i2 |= 1 << i;
                    break;
                }
            }
            i++;
        }
        return i2;
    }

    protected static short getTypeFromInfo(int i) {
        return (short) ((i >> 16) & 255);
    }

    protected static int getComponentCountFromInfo(int i) {
        return i & 65535;
    }

    public static byte[] addXiaomiComment(byte[] bArr, String str) {
        long currentTimeMillis = System.currentTimeMillis();
        OutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        try {
            ExifInterface exifInterface = new ExifInterface();
            exifInterface.readExif(bArr);
            exifInterface.addXiaomiComment(str);
            exifInterface.writeExif(bArr, byteArrayOutputStream);
            byte[] toByteArray = byteArrayOutputStream.toByteArray();
            byteArrayOutputStream.close();
            bArr = toByteArray;
        } catch (Throwable e) {
            Log.e(ExifInterface.class.getName(), e.getMessage(), e);
        }
        str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("addXiaomiComment cost=");
        stringBuilder.append(System.currentTimeMillis() - currentTimeMillis);
        Log.v(str, stringBuilder.toString());
        return bArr;
    }

    public static void writeToOutStream(ExifInterface exifInterface, Bitmap bitmap, FileOutputStream fileOutputStream) throws IOException {
        if (exifInterface != null) {
            exifInterface.writeExif(bitmap, (OutputStream) fileOutputStream);
            return;
        }
        bitmap.compress(CompressFormat.JPEG, 100, fileOutputStream);
        fileOutputStream.flush();
    }

    public static void writeToOutStream(ExifInterface exifInterface, byte[] bArr, FileOutputStream fileOutputStream) throws IOException {
        if (exifInterface != null) {
            exifInterface.writeExif(bArr, (OutputStream) fileOutputStream);
        } else {
            fileOutputStream.write(bArr);
        }
    }
}
