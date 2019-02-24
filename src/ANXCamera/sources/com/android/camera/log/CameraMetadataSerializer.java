package com.android.camera.log;

import android.hardware.camera2.CameraMetadata;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureRequest.Key;
import android.hardware.camera2.CaptureResult;
import android.hardware.camera2.params.LensShadingMap;
import android.util.Pair;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.lang.reflect.Array;
import java.util.List;
import miui.reflect.Field;

public final class CameraMetadataSerializer {
    private static final String TAG = CameraMetadataSerializer.class.getSimpleName();

    private interface Writable {
        void write(Writer writer) throws IOException;
    }

    private CameraMetadataSerializer() {
    }

    public static void serialize(String str, CameraMetadata<?> cameraMetadata, File file) {
        try {
            Writer fileWriter = new FileWriter(file, true);
            if (cameraMetadata instanceof CaptureRequest) {
                dumpMetadata(str, (CaptureRequest) cameraMetadata, fileWriter);
            } else if (cameraMetadata instanceof CaptureResult) {
                dumpMetadata(str, (CaptureResult) cameraMetadata, fileWriter);
            } else {
                fileWriter.close();
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Cannot generate debug data from type ");
                stringBuilder.append(cameraMetadata.getClass().getName());
                throw new IllegalArgumentException(stringBuilder.toString());
            }
            fileWriter.close();
        } catch (Throwable e) {
            Log.e(TAG, "Could not write capture data to file.", e);
        }
    }

    private static void dumpMetadata(final String str, final CaptureRequest captureRequest, Writer writer) {
        dumpMetadata(new Writable() {
            public void write(Writer writer) throws IOException {
                List<Key> keys = captureRequest.getKeys();
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append(str);
                stringBuilder.append(10);
                writer.write(stringBuilder.toString());
                for (Key key : keys) {
                    writer.write(String.format("    %s\n", new Object[]{key.getName()}));
                    writer.write(String.format("        %s\n", new Object[]{CameraMetadataSerializer.metadataValueToString(captureRequest.get(key))}));
                }
            }
        }, new BufferedWriter(writer));
    }

    private static void dumpMetadata(final String str, final CaptureResult captureResult, Writer writer) {
        dumpMetadata(new Writable() {
            public void write(Writer writer) throws IOException {
                List<CaptureResult.Key> keys = captureResult.getKeys();
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append(String.format(str, new Object[0]));
                stringBuilder.append(10);
                writer.write(stringBuilder.toString());
                for (CaptureResult.Key key : keys) {
                    writer.write(String.format("    %s\n", new Object[]{key.getName()}));
                    writer.write(String.format("        %s\n", new Object[]{CameraMetadataSerializer.metadataValueToString(captureResult.get(key))}));
                }
            }
        }, new BufferedWriter(writer));
    }

    private static String metadataValueToString(Object obj) {
        if (obj == null) {
            return "<null>";
        }
        if (obj.getClass().isArray()) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("[");
            int length = Array.getLength(obj);
            for (int i = 0; i < length; i++) {
                stringBuilder.append(metadataValueToString(Array.get(obj, i)));
                if (i != length - 1) {
                    stringBuilder.append(", ");
                }
            }
            stringBuilder.append(']');
            return stringBuilder.toString();
        } else if (obj instanceof LensShadingMap) {
            return toString((LensShadingMap) obj);
        } else {
            if (obj instanceof Pair) {
                return toString((Pair) obj);
            }
            return obj.toString();
        }
    }

    private static void dumpMetadata(Writable writable, Writer writer) {
        try {
            writable.write(writer);
            if (writer != null) {
                try {
                    writer.close();
                } catch (Throwable e) {
                    Log.e(TAG, "dumpMetadata - Failed to close writer.", e);
                }
            }
        } catch (Throwable e2) {
            Log.e(TAG, "dumpMetadata - Failed to dump metadata", e2);
            if (writer != null) {
                writer.close();
            }
        } catch (Throwable th) {
            if (writer != null) {
                try {
                    writer.close();
                } catch (Throwable e3) {
                    Log.e(TAG, "dumpMetadata - Failed to close writer.", e3);
                }
            }
        }
    }

    private static String toString(LensShadingMap lensShadingMap) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("LensShadingMap{");
        String[] strArr = new String[]{"R", "G_even", "G_odd", Field.BYTE_SIGNATURE_PRIMITIVE};
        int rowCount = lensShadingMap.getRowCount();
        int columnCount = lensShadingMap.getColumnCount();
        for (int i = 0; i < 4; i++) {
            stringBuilder.append(strArr[i]);
            stringBuilder.append(":(");
            for (int i2 = 0; i2 < rowCount; i2++) {
                stringBuilder.append("[");
                for (int i3 = 0; i3 < columnCount; i3++) {
                    stringBuilder.append(lensShadingMap.getGainFactor(i, i3, i2));
                    if (i3 < columnCount - 1) {
                        stringBuilder.append(", ");
                    }
                }
                stringBuilder.append("]");
                if (i2 < rowCount - 1) {
                    stringBuilder.append(", ");
                }
            }
            stringBuilder.append(")");
            if (i < 3) {
                stringBuilder.append(", ");
            }
        }
        stringBuilder.append("}");
        return stringBuilder.toString();
    }

    private static String toString(Pair<?, ?> pair) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Pair: ");
        stringBuilder.append(metadataValueToString(pair.first));
        stringBuilder.append(" / ");
        stringBuilder.append(metadataValueToString(pair.second));
        return stringBuilder.toString();
    }
}
