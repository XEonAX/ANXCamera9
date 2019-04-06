package com.arcsoft.avatar.b;

import android.content.UriMatcher;
import android.net.Uri;

/* compiled from: AvatarProfile */
public class b {
    public static final String AUTHORITY = "com.arcsoft.content.provider.avatar.content.provider";
    public static final String CONFIG_PATH = "config_path";
    public static final String TABLE_NAME = "avatar_db";
    public static final String THUMBNAIL = "thumbnail";
    public static final String _ID = "_id";
    protected static final String a = "content://com.arcsoft.content.provider.avatar.content.provider/";
    public static final String dp = "_arc_avatar.db";
    public static final int dq = 2;
    public static final Uri dt = Uri.parse("content://com.arcsoft.content.provider.avatar.content.provider/avatar_db");
    public static final String du = "CREATE TABLE avatar_db (_id integer primary key autoincrement,thumbnail BLOB,config_path TEXT);";
    public static final String dv = "DROP TABLE IF EXISTS avatar_db";
    public static final int dw = 1;
    public static final UriMatcher dx = new UriMatcher(-1);

    static {
        dx.addURI(AUTHORITY, TABLE_NAME, 1);
    }
}
