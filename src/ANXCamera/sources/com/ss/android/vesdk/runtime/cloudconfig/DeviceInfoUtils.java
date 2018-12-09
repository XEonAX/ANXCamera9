package com.ss.android.vesdk.runtime.cloudconfig;

import android.content.Context;
import android.graphics.Point;
import android.hardware.Sensor;
import android.hardware.SensorManager;
import android.os.Build.VERSION;
import android.os.Environment;
import android.os.StatFs;
import android.support.v4.media.session.PlaybackStateCompat;
import android.support.v4.util.ArraySet;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.Display;
import android.view.WindowManager;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileFilter;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.lang.reflect.InvocationTargetException;
import java.util.Set;
import java.util.regex.Pattern;

public class DeviceInfoUtils {
    private static final String CPU_FILE = "/proc/cpuinfo";
    private static final String HARDWARE_PATTERN = "Hardware";
    private static final String TAG = "DeviceInfoUtils";
    private static String sCpuHardware = null;

    public static String readCpuHardware() {
        Throwable th;
        if (!TextUtils.isEmpty(sCpuHardware)) {
            return sCpuHardware;
        }
        Reader fileReader;
        Reader bufferedReader;
        try {
            fileReader = new FileReader(CPU_FILE);
            try {
                bufferedReader = new BufferedReader(fileReader);
                try {
                    String readLine = bufferedReader.readLine();
                    while (readLine != null) {
                        if (readLine.startsWith(HARDWARE_PATTERN) && readLine.contains(":")) {
                            Object substring = readLine.substring(readLine.indexOf(":") + 1);
                            if (!TextUtils.isEmpty(substring)) {
                                sCpuHardware = substring.trim();
                                break;
                            }
                        }
                        readLine = bufferedReader.readLine();
                    }
                    readLine = sCpuHardware;
                    closeQuietly(bufferedReader);
                    closeQuietly(fileReader);
                    return readLine;
                } catch (IOException e) {
                    closeQuietly(bufferedReader);
                    closeQuietly(fileReader);
                    return null;
                } catch (Throwable th2) {
                    th = th2;
                    closeQuietly(bufferedReader);
                    closeQuietly(fileReader);
                    throw th;
                }
            } catch (IOException e2) {
                bufferedReader = null;
                closeQuietly(bufferedReader);
                closeQuietly(fileReader);
                return null;
            } catch (Throwable th3) {
                Throwable th4 = th3;
                bufferedReader = null;
                th = th4;
                closeQuietly(bufferedReader);
                closeQuietly(fileReader);
                throw th;
            }
        } catch (IOException e3) {
            fileReader = null;
            bufferedReader = fileReader;
            closeQuietly(bufferedReader);
            closeQuietly(fileReader);
            return null;
        } catch (Throwable th5) {
            bufferedReader = null;
            th = th5;
            fileReader = bufferedReader;
            closeQuietly(bufferedReader);
            closeQuietly(fileReader);
            throw th;
        }
    }

    public static String getMaxCpuFreq() {
        String str = "";
        try {
            InputStream inputStream = new ProcessBuilder(new String[]{"/system/bin/cat", "/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq"}).start().getInputStream();
            byte[] bArr = new byte[24];
            while (inputStream.read(bArr) != -1) {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append(str);
                stringBuilder.append(new String(bArr));
                str = stringBuilder.toString();
            }
            inputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
            str = "N/A";
        }
        return str.trim();
    }

    public static int getNumOfCores() {
        try {
            return new File("/sys/devices/system/cpu/").listFiles(new FileFilter() {
                public boolean accept(File file) {
                    return Pattern.matches("cpu[0-9]", file.getName());
                }
            }).length;
        } catch (Exception e) {
            e.printStackTrace();
            return 1;
        }
    }

    public static long getTotalMemory() {
        long j = 0;
        try {
            BufferedReader bufferedReader = new BufferedReader(new FileReader("/proc/meminfo"), 8192);
            String readLine = bufferedReader.readLine();
            String[] split = readLine.split("\\s+");
            for (String str : split) {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append(str);
                stringBuilder.append("/t");
                Log.i(readLine, stringBuilder.toString());
            }
            j = (long) Integer.valueOf(split[1]).intValue();
            bufferedReader.close();
        } catch (IOException e) {
        }
        return j / PlaybackStateCompat.ACTION_PLAY_FROM_MEDIA_ID;
    }

    public static long getInternalStorage() {
        StatFs statFs = new StatFs(Environment.getDataDirectory().getAbsolutePath());
        if (VERSION.SDK_INT >= 18) {
            return (statFs.getBlockCountLong() * statFs.getBlockSizeLong()) / 1048576;
        }
        return (((long) statFs.getBlockCount()) * ((long) statFs.getBlockSize())) / 1048576;
    }

    public static long getExternalStorage(Context context) {
        String absolutePath;
        try {
            absolutePath = Environment.getExternalStorageDirectory().getAbsolutePath();
        } catch (Exception e) {
            absolutePath = "/sdcard";
        }
        try {
            StatFs statFs = new StatFs(absolutePath);
            if (VERSION.SDK_INT >= 18) {
                return (statFs.getBlockCountLong() * statFs.getBlockSizeLong()) / 1048576;
            }
            return (((long) statFs.getBlockCount()) * ((long) statFs.getBlockSize())) / 1048576;
        } catch (Exception e2) {
            return -1;
        }
    }

    private static void closeQuietly(Reader reader) {
        if (reader != null) {
            try {
                reader.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public static int getScreenWidth(Context context) {
        if (context == null) {
            return 0;
        }
        WindowManager windowManager = (WindowManager) context.getSystemService("window");
        DisplayMetrics displayMetrics = new DisplayMetrics();
        windowManager.getDefaultDisplay().getMetrics(displayMetrics);
        return displayMetrics.widthPixels;
    }

    public static int getScreenHeight(Context context) {
        if (context == null) {
            return 0;
        }
        WindowManager windowManager = (WindowManager) context.getSystemService("window");
        DisplayMetrics displayMetrics = new DisplayMetrics();
        windowManager.getDefaultDisplay().getMetrics(displayMetrics);
        return displayMetrics.heightPixels;
    }

    public static int getRealScreenHeight(Context context) {
        int i = 0;
        if (context == null) {
            return 0;
        }
        Display defaultDisplay = ((WindowManager) context.getSystemService("window")).getDefaultDisplay();
        if (VERSION.SDK_INT >= 17) {
            Point point = new Point();
            defaultDisplay.getRealSize(point);
            i = point.y;
        } else {
            try {
                i = ((Integer) Display.class.getMethod("getRawHeight", new Class[0]).invoke(defaultDisplay, new Object[0])).intValue();
            } catch (IllegalArgumentException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e2) {
                e2.printStackTrace();
            } catch (InvocationTargetException e3) {
                e3.printStackTrace();
            } catch (NoSuchMethodException e4) {
                e4.printStackTrace();
            }
        }
        return i;
    }

    public static String getSimOperator(Context context) {
        try {
            return ((TelephonyManager) context.getSystemService("phone")).getSimOperator();
        } catch (Exception e) {
            Log.w(TAG, "No permission");
            return "";
        }
    }

    public static Set<Sensor> getSensorUsability(Context context) {
        ArraySet arraySet = new ArraySet();
        SensorManager sensorManager = (SensorManager) context.getSystemService("sensor");
        if (sensorManager == null) {
            return arraySet;
        }
        for (int defaultSensor : new int[]{1, 13, 9, 4, 5, 10, 2, 3, 6, 8, 12, 11, 7, 15}) {
            Sensor defaultSensor2 = sensorManager.getDefaultSensor(defaultSensor);
            if (defaultSensor2 != null) {
                arraySet.add(defaultSensor2);
            }
        }
        return arraySet;
    }
}
