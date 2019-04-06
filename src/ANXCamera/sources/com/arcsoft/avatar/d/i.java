package com.arcsoft.avatar.d;

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
import android.media.MediaMetadataRetriever;
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

/* compiled from: MediaUtil */
public class i {
    public static final Uri EXTERNAL_CONTENT_URI = Files.getContentUri("external");
    public static final int ID_COLUMN_INDEX = 0;
    public static final int TYPE_VIDEO = 3;
    public static final int URI_COLUMN_INDEX = 4;
    private static final String a;
    public static final String eT = b(a);
    public static final int eU = 1;
    public static final int eV = 1;
    public static final int eW = 2;
    public static final int eX = 3;
    public static final int eY = 5;
    public static final int eZ = 6;
    public static final int fa = 7;
    public static final int fb = 8;
    public static final int fc = 9;
    public static final int fd = 10;
    public static final int fe = 11;
    public static final int ff = 12;
    public static final int fg = 13;
    public static final int fh = 14;
    private static i fi = null;
    private static final String[] fn = new String[]{"max(_id) as newId", "_data", "_size", "datetaken", a.e, "bucket_id", "mime_type", "date_modified", "media_type", "resolution", "tags", "width", "height", "orientation", "duration"};
    private final String e = "image/jpeg";
    private final String ep = "video/mp4";
    private final String f = "image/gif";
    private Context fj = null;
    private ContentResolver fk = null;
    private final String[] fl = new String[]{"_id", "bucket_id", "bucket_display_name", "_data", "_display_name", "width", "height", "_size", "mime_type", "datetaken", "date_modified", "date_added", "latitude", "longitude", "duration", "resolution"};
    private final String[] fm = new String[]{"_id", "bucket_id", "bucket_display_name", "_data", "_display_name", "width", "height", "_size", "mime_type", "datetaken", "date_modified", "date_added", "latitude", "longitude", "orientation"};
    private final String g = "video/3gpp";

    /* compiled from: MediaUtil */
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

    /* compiled from: MediaUtil */
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
        stringBuilder.append("/DCIM/Avatar/Result");
        a = stringBuilder.toString();
    }

    private i(Context context) {
        this.fj = context;
        this.fk = this.fj.getContentResolver();
    }

    public static Cursor a(ContentResolver contentResolver) {
        String[] strArr = new String[]{String.valueOf(1), String.valueOf(3), eT};
        return contentResolver.query(EXTERNAL_CONTENT_URI, fn, "(media_type=? or media_type=?) and bucket_id=? ", strArr, "_id DESC");
    }

    private static Uri a(Cursor cursor) {
        return ContentUris.withAppendedId(Uri.parse(cursor.getString(4)), cursor.getLong(0));
    }

    private b a(Cursor cursor, boolean z) {
        if (cursor == null || cursor.getCount() <= 0) {
            return null;
        }
        b bVar = new b();
        bVar.a = z;
        if (z) {
            bVar.bE = cursor.getLong(c.b(this.fl, "_id"));
            bVar.fu = ContentUris.withAppendedId(Video.Media.EXTERNAL_CONTENT_URI, bVar.bE);
            bVar.fv = (long) cursor.getInt(c.b(this.fl, "bucket_id"));
            bVar.e = cursor.getString(c.b(this.fl, "bucket_display_name"));
            bVar.f = cursor.getString(c.b(this.fl, "_data"));
            bVar.g = cursor.getString(c.b(this.fl, "_display_name"));
            bVar.cI = cursor.getInt(c.b(this.fl, "width"));
            bVar.i = cursor.getInt(c.b(this.fl, "height"));
            bVar.eB = cursor.getLong(c.b(this.fl, "_size"));
            bVar.fp = cursor.getString(c.b(this.fl, "mime_type"));
            bVar.fq = cursor.getString(c.b(this.fl, "datetaken"));
            bVar.cM = cursor.getString(c.b(this.fl, "date_modified"));
            bVar.cN = cursor.getString(c.b(this.fl, "date_added"));
            bVar.fw = cursor.getDouble(c.b(this.fl, "latitude"));
            bVar.fx = cursor.getDouble(c.b(this.fl, "longitude"));
            bVar.fy = cursor.getLong(c.b(this.fl, "duration"));
            bVar.s = cursor.getString(c.b(this.fl, "resolution"));
        } else {
            bVar.bE = cursor.getLong(c.b(this.fm, "_id"));
            bVar.fu = ContentUris.withAppendedId(Media.EXTERNAL_CONTENT_URI, bVar.bE);
            bVar.fv = (long) cursor.getInt(c.b(this.fm, "bucket_id"));
            bVar.e = cursor.getString(c.b(this.fm, "bucket_display_name"));
            bVar.f = cursor.getString(c.b(this.fm, "_data"));
            bVar.g = cursor.getString(c.b(this.fm, "_display_name"));
            bVar.cI = cursor.getInt(c.b(this.fm, "width"));
            bVar.i = cursor.getInt(c.b(this.fm, "height"));
            bVar.eB = cursor.getLong(c.b(this.fm, "_size"));
            bVar.fp = cursor.getString(c.b(this.fm, "mime_type"));
            bVar.fq = cursor.getString(c.b(this.fm, "datetaken"));
            bVar.cM = cursor.getString(c.b(this.fm, "date_modified"));
            bVar.cN = cursor.getString(c.b(this.fm, "date_added"));
            bVar.fw = cursor.getDouble(c.b(this.fm, "latitude"));
            bVar.fx = cursor.getDouble(c.b(this.fm, "longitude"));
            bVar.bU = cursor.getInt(c.b(this.fm, "orientation"));
        }
        return bVar;
    }

    public static i a(Context context) {
        if (fi == null) {
            synchronized (i.class) {
                if (fi == null) {
                    fi = new i(context);
                }
            }
        }
        return fi;
    }

    private String a(String str) {
        str = str.substring(str.lastIndexOf(46));
        return (Storage.JPEG_SUFFIX.equalsIgnoreCase(str) || ".jpeg".equalsIgnoreCase(str)) ? "image/jpeg" : ".gif".equalsIgnoreCase(str) ? "image/gif" : (".3gp".equalsIgnoreCase(str) || ".3gpp".equalsIgnoreCase(str)) ? "video/3gpp" : ".mp4".equalsIgnoreCase(str) ? "video/mp4" : "";
    }

    private static String b(String str) {
        return String.valueOf(str.substring(0, str.lastIndexOf("/")).toLowerCase().hashCode());
    }

    private String c(String str) {
        if (str == null || str.isEmpty()) {
            return null;
        }
        int lastIndexOf = str.lastIndexOf(46);
        return (lastIndexOf < 0 || lastIndexOf >= str.length() - 1) ? null : str.substring(lastIndexOf + 1);
    }

    private boolean d(String str) {
        boolean z = false;
        if (str == null) {
            return false;
        }
        if (new File(str).exists()) {
            z = true;
        }
        return z;
    }

    private long p(String str) {
        if (!d(str)) {
            return -1;
        }
        try {
            MediaMetadataRetriever mediaMetadataRetriever = new MediaMetadataRetriever();
            mediaMetadataRetriever.setDataSource(str);
            str = mediaMetadataRetriever.extractMetadata(9);
            mediaMetadataRetriever.release();
            return Long.parseLong(str);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    public String T() {
        String str;
        Cursor a = a(this.fk);
        if (a == null || a.getCount() <= 0) {
            str = null;
        } else {
            a.moveToFirst();
            str = a.getString(1);
        }
        if (a != null) {
            a.close();
        }
        return str;
    }

    public Uri U() {
        Uri uri;
        Cursor a = a(this.fk);
        if (a == null || a.getCount() <= 0) {
            uri = null;
        } else {
            a.moveToFirst();
            uri = a(a);
        }
        if (a != null) {
            a.close();
        }
        return uri;
    }

    public Bitmap a(String str, float f) {
        if (str == null) {
            str = T();
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

    public Bitmap a(String str, Options options) {
        b l = l(str);
        if (l == null) {
            int i = 20;
            while (i > 0) {
                try {
                    Thread.sleep(100);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                b l2 = l(str);
                if (l2 != null) {
                    l = l2;
                } else {
                    i--;
                }
            }
            return null;
        }
        return l.a ? Thumbnails.getThumbnail(this.fk, l.bE, 3, options) : Images.Thumbnails.getThumbnail(this.fk, l.bE, 3, options);
    }

    public Uri a(String str, int i, int i2) {
        return a(str, i, i2, null, 0);
    }

    public Uri a(String str, int i, int i2, int i3) {
        return a(str, i, i2, null, i3);
    }

    public Uri a(String str, int i, int i2, Location location) {
        return a(str, i, i2, location, 0);
    }

    public Uri a(String str, int i, int i2, Location location, int i3) {
        Uri insert;
        String str2;
        boolean o = o(str);
        String a = a(str);
        File file = new File(str);
        String name = file.getName();
        String substring = name.substring(0, name.lastIndexOf("."));
        ContentValues contentValues = new ContentValues();
        if (o) {
            contentValues.put("_data", file.getPath());
            contentValues.put("_display_name", name);
            contentValues.put("title", substring);
            contentValues.put("width", Integer.valueOf(i));
            contentValues.put("height", Integer.valueOf(i2));
            contentValues.put("_size", Long.valueOf(file.length()));
            contentValues.put("mime_type", a);
            contentValues.put("datetaken", Long.valueOf(System.currentTimeMillis()));
            if (location != null) {
                contentValues.put("latitude", Double.valueOf(location.getLatitude()));
                contentValues.put("longitude", Double.valueOf(location.getLongitude()));
            }
            contentValues.put("duration", Long.valueOf(p(str)));
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(i);
            stringBuilder.append("x");
            stringBuilder.append(i2);
            contentValues.put("resolution", stringBuilder.toString());
            insert = this.fk.insert(Video.Media.EXTERNAL_CONTENT_URI, contentValues);
            str2 = "android.hardware.action.NEW_VIDEO";
        } else {
            contentValues.put("_data", file.getPath());
            contentValues.put("_display_name", name);
            contentValues.put("title", substring);
            contentValues.put("width", Integer.valueOf(i));
            contentValues.put("height", Integer.valueOf(i2));
            contentValues.put("_size", Long.valueOf(file.length()));
            contentValues.put("mime_type", a);
            contentValues.put("datetaken", Long.valueOf(System.currentTimeMillis()));
            if (location != null) {
                contentValues.put("latitude", Double.valueOf(location.getLatitude()));
                contentValues.put("longitude", Double.valueOf(location.getLongitude()));
            }
            contentValues.put("orientation", Integer.valueOf(i3));
            insert = this.fk.insert(Media.EXTERNAL_CONTENT_URI, contentValues);
            str2 = "android.hardware.action.NEW_PICTURE";
        }
        if (VERSION.SDK_INT >= 14) {
            this.fj.sendBroadcast(new Intent(str2, insert));
        }
        return insert;
    }

    public List<b> a(String str, boolean z) {
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
            query = this.fk.query(Video.Media.EXTERNAL_CONTENT_URI, this.fl, "bucket_display_name=?", strArr, "_id ASC");
        } else {
            String[] strArr2 = new String[]{str};
            query = this.fk.query(Media.EXTERNAL_CONTENT_URI, this.fm, "bucket_display_name=?", strArr2, "_id ASC");
        }
        List<b> list = null;
        if (query != null && query.getCount() > 0) {
            list = new ArrayList();
            query.moveToFirst();
            while (!query.isAfterLast()) {
                list.add(a(query, z));
                query.moveToNext();
            }
        }
        if (query != null) {
            query.close();
        }
        return list;
    }

    public boolean g(String str, String str2) {
        b l = l(str);
        if (l == null) {
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
            stringBuilder.append(c(str));
            str = stringBuilder.toString();
        }
        ContentValues contentValues = new ContentValues();
        if (l.a) {
            contentValues.put("_display_name", str);
            contentValues.put("title", str2);
        } else {
            contentValues.put("_display_name", str);
            contentValues.put("title", str2);
        }
        return this.fk.update(l.fu, contentValues, null, null) > 0;
    }

    public b l(String str) {
        b bVar = null;
        if (str == null) {
            return null;
        }
        Cursor query;
        boolean o = o(str);
        if (o) {
            String[] strArr = new String[]{str};
            query = this.fk.query(Video.Media.EXTERNAL_CONTENT_URI, this.fl, "_data=?", strArr, "_id DESC");
        } else {
            String[] strArr2 = new String[]{str};
            query = this.fk.query(Media.EXTERNAL_CONTENT_URI, this.fm, "_data=?", strArr2, "_id DESC");
        }
        if (query != null && query.getCount() > 0) {
            query.moveToFirst();
            bVar = a(query, o);
        }
        if (query != null) {
            query.close();
        }
        return bVar;
    }

    public boolean m(String str) {
        b l = l(str);
        return l != null && this.fk.delete(l.fu, null, null) > 0;
    }

    public int n(String str) {
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

    public boolean o(String str) {
        if (str == null) {
            return false;
        }
        str = str.substring(str.lastIndexOf(46));
        return ".3gp".equals(str) || ".mp4".equals(str);
    }
}
