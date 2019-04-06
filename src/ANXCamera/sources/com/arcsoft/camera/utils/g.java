package com.arcsoft.camera.utils;

import android.content.ContentResolver;
import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.location.Location;
import android.media.ExifInterface;
import android.net.Uri;
import android.os.Build.VERSION;
import android.os.Environment;
import android.provider.MediaStore.Files;
import android.provider.MediaStore.Images;
import android.provider.MediaStore.Images.Media;
import android.provider.MediaStore.Video;
import android.provider.MediaStore.Video.Thumbnails;
import com.android.camera.storage.Storage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* compiled from: MediaManager */
public class g {
    public static final String a = e(dy);
    public static final int bT = 11;
    public static final int bU = 12;
    public static final int bV = 13;
    public static final int c = 1;
    public static final int cH = 2;
    public static final int cI = 3;
    public static final int cL = 7;
    public static final int cY = 10;
    public static final int d = 3;
    public static final int dS = 6;
    private static String dy = null;
    public static final int e = 0;
    public static final int f = 1;
    public static final Uri fu = Files.getContentUri("external");
    private static g gl = null;
    private static final String[] gt = new String[]{"max(_id) as newId", "_data", "_size", "datetaken", a.e, "bucket_id", "mime_type", "date_modified", "media_type", "resolution", "tags", "width", "height", "orientation", "duration"};
    public static final int i = 4;
    public static final int j = 5;
    public static final int m = 8;
    public static final int n = 9;
    public static final int s = 14;
    private final String eE = "video/3gpp";
    private Context gm = null;
    private ContentResolver gn = null;
    private final String go = "image/jpeg";
    private final String gp = "image/gif";
    private final String gq = "video/mp4";
    private final String[] gr = new String[]{"_id", "bucket_id", "bucket_display_name", "_data", "_display_name", "width", "height", "_size", "mime_type", "datetaken", "date_modified", "date_added", "latitude", "longitude", "duration", "resolution"};
    private final String[] gs = new String[]{"_id", "bucket_id", "bucket_display_name", "_data", "_display_name", "width", "height", "_size", "mime_type", "datetaken", "date_modified", "date_added", "latitude", "longitude", "orientation"};

    /* compiled from: MediaManager */
    private static final class a {
        public static final String a = "_id";
        public static final String b = "_data";
        public static final String c = "_size";
        public static final String cJ = "longitude";
        public static final String cM = "duration";
        public static final String cN = "resolution";
        public static final String d = "datetaken";
        public static final String e;
        public static final String ep = "date_modified";
        public static final String f = "bucket_id";
        public static final String fo = "latitude";
        public static final String fp = "orientation";
        public static final String fq = "media_type";
        public static final String fr = "tags";
        public static final String fs = "height";
        public static final String ft = "title";
        public static final String g = "mime_type";
        public static final String p = "width";
        public static final String s = "_display_name";

        static {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("case media_type when 1 then \"");
            stringBuilder.append(Media.EXTERNAL_CONTENT_URI);
            stringBuilder.append("\" else \"");
            stringBuilder.append(Video.Media.EXTERNAL_CONTENT_URI);
            stringBuilder.append("\" end");
            e = stringBuilder.toString();
        }

        private a() {
        }
    }

    /* compiled from: MediaManager */
    public static class b {
        private boolean a;
        private long bE;
        private int bU;
        private int cI;
        private String cM;
        private String cN;
        private String e;
        private long eB;
        private String f;
        private String fp;
        private String fq;
        private Uri fu;
        private long fv;
        private double fw;
        private double fx;
        private long fy;
        private String g;
        private int i;
        private String s;
    }

    static {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(Environment.getExternalStorageDirectory().toString());
        stringBuilder.append("/DCIM/WideSelfie/");
        dy = stringBuilder.toString();
    }

    private g(Context context) {
        this.gm = context;
        this.gn = this.gm.getContentResolver();
    }

    private static Uri a(Cursor cursor) {
        return ContentUris.withAppendedId(Uri.parse(cursor.getString(4)), cursor.getLong(0));
    }

    public static Cursor b(ContentResolver contentResolver) {
        String[] strArr = new String[]{String.valueOf(1), String.valueOf(3), a};
        return contentResolver.query(fu, gt, "(media_type=? or media_type=?) and bucket_id=? ", strArr, "_id DESC");
    }

    private b b(Cursor cursor, boolean z) {
        if (cursor == null || cursor.getCount() <= 0) {
            return null;
        }
        b bVar = new b();
        bVar.a = z;
        if (z) {
            bVar.bE = cursor.getLong(e.e(this.gr, "_id"));
            bVar.fu = ContentUris.withAppendedId(Video.Media.EXTERNAL_CONTENT_URI, bVar.bE);
            bVar.fv = (long) cursor.getInt(e.e(this.gr, "bucket_id"));
            bVar.e = cursor.getString(e.e(this.gr, "bucket_display_name"));
            bVar.f = cursor.getString(e.e(this.gr, "_data"));
            bVar.g = cursor.getString(e.e(this.gr, "_display_name"));
            bVar.cI = cursor.getInt(e.e(this.gr, "width"));
            bVar.i = cursor.getInt(e.e(this.gr, "height"));
            bVar.eB = cursor.getLong(e.e(this.gr, "_size"));
            bVar.fp = cursor.getString(e.e(this.gr, "mime_type"));
            bVar.fq = cursor.getString(e.e(this.gr, "datetaken"));
            bVar.cM = cursor.getString(e.e(this.gr, "date_modified"));
            bVar.cN = cursor.getString(e.e(this.gr, "date_added"));
            bVar.fw = cursor.getDouble(e.e(this.gr, "latitude"));
            bVar.fx = cursor.getDouble(e.e(this.gr, "longitude"));
            bVar.fy = cursor.getLong(e.e(this.gr, "duration"));
            bVar.s = cursor.getString(e.e(this.gr, "resolution"));
        } else {
            bVar.bE = cursor.getLong(e.e(this.gs, "_id"));
            bVar.fu = ContentUris.withAppendedId(Media.EXTERNAL_CONTENT_URI, bVar.bE);
            bVar.fv = (long) cursor.getInt(e.e(this.gs, "bucket_id"));
            bVar.e = cursor.getString(e.e(this.gs, "bucket_display_name"));
            bVar.f = cursor.getString(e.e(this.gs, "_data"));
            bVar.g = cursor.getString(e.e(this.gs, "_display_name"));
            bVar.cI = cursor.getInt(e.e(this.gs, "width"));
            bVar.i = cursor.getInt(e.e(this.gs, "height"));
            bVar.eB = cursor.getLong(e.e(this.gs, "_size"));
            bVar.fp = cursor.getString(e.e(this.gs, "mime_type"));
            bVar.fq = cursor.getString(e.e(this.gs, "datetaken"));
            bVar.cM = cursor.getString(e.e(this.gs, "date_modified"));
            bVar.cN = cursor.getString(e.e(this.gs, "date_added"));
            bVar.fw = cursor.getDouble(e.e(this.gs, "latitude"));
            bVar.fx = cursor.getDouble(e.e(this.gs, "longitude"));
            bVar.bU = cursor.getInt(e.e(this.gs, "orientation"));
        }
        return bVar;
    }

    public static g b(Context context) {
        if (gl == null) {
            synchronized (g.class) {
                if (gl == null) {
                    gl = new g(context);
                }
            }
        }
        return gl;
    }

    private static String e(String str) {
        return String.valueOf(str.substring(0, str.lastIndexOf("/")).toLowerCase().hashCode());
    }

    private String s(String str) {
        str = str.substring(str.lastIndexOf(46));
        return (Storage.JPEG_SUFFIX.equalsIgnoreCase(str) || ".jpeg".equalsIgnoreCase(str)) ? "image/jpeg" : ".gif".equalsIgnoreCase(str) ? "image/gif" : (".3gp".equalsIgnoreCase(str) || ".3gpp".equalsIgnoreCase(str)) ? "video/3gpp" : ".mp4".equalsIgnoreCase(str) ? "video/mp4" : "";
    }

    public Uri V() {
        Uri uri;
        Cursor b = b(this.gn);
        if (b == null || b.getCount() <= 0) {
            uri = null;
        } else {
            b.moveToFirst();
            uri = a(b);
        }
        if (b != null) {
            b.close();
        }
        return uri;
    }

    public String a() {
        String str;
        Cursor b = b(this.gn);
        if (b == null || b.getCount() <= 0) {
            str = null;
        } else {
            b.moveToFirst();
            str = b.getString(1);
        }
        if (b != null) {
            b.close();
        }
        return str;
    }

    public Bitmap b(String str, float f) {
        if (str == null) {
            str = a();
        }
        if (str == null) {
            return null;
        }
        Options options = new Options();
        options.inJustDecodeBounds = false;
        int i = (int) (((float) options.outHeight) / f);
        if (i <= 0) {
            i = 1;
        }
        options.inSampleSize = i;
        return BitmapFactory.decodeFile(str, options);
    }

    public Bitmap b(String str, Options options) {
        b t = t(str);
        if (t == null) {
            int i = 20;
            while (i > 0) {
                try {
                    Thread.sleep(100);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                b t2 = t(str);
                if (t2 != null) {
                    t = t2;
                } else {
                    i--;
                }
            }
            return null;
        }
        return t.a ? Thumbnails.getThumbnail(this.gn, t.bE, 3, options) : Images.Thumbnails.getThumbnail(this.gn, t.bE, 3, options);
    }

    public Uri b(String str, int i, int i2) {
        return b(str, i, i2, null, 0);
    }

    public Uri b(String str, int i, int i2, int i3) {
        return b(str, i, i2, null, i3);
    }

    public Uri b(String str, int i, int i2, Location location) {
        return b(str, i, i2, location, 0);
    }

    public Uri b(String str, int i, int i2, Location location, int i3) {
        a.o(str);
        String s = s(str);
        File file = new File(str);
        str = file.getName();
        String substring = str.substring(0, str.lastIndexOf("."));
        ContentValues contentValues = new ContentValues();
        contentValues.put("_data", file.getPath());
        contentValues.put("_display_name", str);
        contentValues.put("title", substring);
        contentValues.put("width", Integer.valueOf(i));
        contentValues.put("height", Integer.valueOf(i2));
        contentValues.put("_size", Long.valueOf(file.length()));
        contentValues.put("mime_type", s);
        contentValues.put("datetaken", Long.valueOf(System.currentTimeMillis()));
        if (location != null) {
            contentValues.put("latitude", Double.valueOf(location.getLatitude()));
            contentValues.put("longitude", Double.valueOf(location.getLongitude()));
        }
        contentValues.put("orientation", Integer.valueOf(i3));
        Uri insert = this.gn.insert(Media.EXTERNAL_CONTENT_URI, contentValues);
        String str2 = "android.hardware.action.NEW_PICTURE";
        if (VERSION.SDK_INT >= 14) {
            this.gm.sendBroadcast(new Intent(str2, insert));
        }
        return insert;
    }

    public List<b> b(String str, boolean z) {
        if (str == null) {
            return Collections.emptyList();
        }
        Cursor query;
        if (str.endsWith(File.separator)) {
            str = str.substring(0, str.length() - 1);
        }
        int lastIndexOf = str.lastIndexOf(File.separator);
        if (-1 != lastIndexOf) {
            str = str.substring(lastIndexOf + 1);
        }
        if (z) {
            String[] strArr = new String[]{str};
            query = this.gn.query(Video.Media.EXTERNAL_CONTENT_URI, this.gr, "bucket_display_name=?", strArr, "_id ASC");
        } else {
            String[] strArr2 = new String[]{str};
            query = this.gn.query(Media.EXTERNAL_CONTENT_URI, this.gs, "bucket_display_name=?", strArr2, "_id ASC");
        }
        List<b> list = null;
        if (query != null && query.getCount() > 0) {
            list = new ArrayList();
            query.moveToFirst();
            while (!query.isAfterLast()) {
                list.add(b(query, z));
                query.moveToNext();
            }
        }
        if (query != null) {
            query.close();
        }
        return list;
    }

    public boolean b(String str) {
        b t = t(str);
        return t != null && this.gn.delete(t.fu, null, null) > 0;
    }

    public boolean m(String str, String str2) {
        b t = t(str);
        if (t == null) {
            return false;
        }
        int lastIndexOf = str2.lastIndexOf(File.separator);
        if (-1 != lastIndexOf) {
            str2 = str2.substring(lastIndexOf + 1);
        }
        lastIndexOf = str2.lastIndexOf(".");
        if (-1 != lastIndexOf) {
            String str3 = str2;
            str2 = str2.substring(0, lastIndexOf);
            str = str3;
        } else {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(str2);
            stringBuilder.append(".");
            stringBuilder.append(a.getExtension(str));
            str = stringBuilder.toString();
        }
        ContentValues contentValues = new ContentValues();
        if (t.a) {
            contentValues.put("_display_name", str);
            contentValues.put("title", str2);
        } else {
            contentValues.put("_display_name", str);
            contentValues.put("title", str2);
        }
        return this.gn.update(t.fu, contentValues, null, null) > 0;
    }

    public b t(String str) {
        b bVar = null;
        if (str == null) {
            return null;
        }
        Cursor query;
        boolean o = a.o(str);
        if (o) {
            String[] strArr = new String[]{str};
            query = this.gn.query(Video.Media.EXTERNAL_CONTENT_URI, this.gr, "_data=?", strArr, "_id DESC");
        } else {
            String[] strArr2 = new String[]{str};
            query = this.gn.query(Media.EXTERNAL_CONTENT_URI, this.gs, "_data=?", strArr2, "_id DESC");
        }
        if (query != null && query.getCount() > 0) {
            query.moveToFirst();
            bVar = b(query, o);
        }
        if (query != null) {
            query.close();
        }
        return bVar;
    }

    public int u(String str) {
        int i = 0;
        try {
            int attributeInt = new ExifInterface(str).getAttributeInt("Orientation", 1);
            if (attributeInt == 3) {
                i = 180;
            } else if (attributeInt == 6) {
                i = 90;
            } else if (attributeInt == 8) {
                i = 270;
            }
            return i;
        } catch (IOException e) {
            e.printStackTrace();
            return 0;
        }
    }
}
