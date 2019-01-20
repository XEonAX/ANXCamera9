package com.aeonax;

import android.app.Activity;
import java.util.ArrayList;

public class PermissionsAsker {
    public static void Ask(Activity activity) {
        if (activity != null) {
            ArrayList<String> permissons = new ArrayList();
            if (activity.checkSelfPermission("android.permission.CAMERA") != 0) {
                permissons.add("android.permission.CAMERA");
            }
            if (activity.checkSelfPermission("android.permission.ACCESS_FINE_LOCATION") != 0) {
                permissons.add("android.permission.ACCESS_FINE_LOCATION");
            }
            if (activity.checkSelfPermission("android.permission.ACCESS_COARSE_LOCATION") != 0) {
                permissons.add("android.permission.ACCESS_COARSE_LOCATION");
            }
            if (activity.checkSelfPermission("android.permission.RECORD_AUDIO") != 0) {
                permissons.add("android.permission.RECORD_AUDIO");
            }
            if (activity.checkSelfPermission("android.permission.READ_PHONE_STATE") != 0) {
                permissons.add("android.permission.READ_PHONE_STATE");
            }
            if (activity.checkSelfPermission("android.permission.READ_EXTERNAL_STORAGE") != 0) {
                permissons.add("android.permission.READ_EXTERNAL_STORAGE");
            }
            if (activity.checkSelfPermission("android.permission.WRITE_EXTERNAL_STORAGE") != 0) {
                permissons.add("android.permission.WRITE_EXTERNAL_STORAGE");
            }
            if (activity.checkSelfPermission("android.permission.INTERACT_ACROSS_USERS") != 0) {
                permissons.add("android.permission.INTERACT_ACROSS_USERS");
            }
            if (activity.checkSelfPermission("android.permission.WRITE_MEDIA_STORAGE") != 0) {
                permissons.add("android.permission.WRITE_MEDIA_STORAGE");
            }
            if (activity.checkSelfPermission("android.permission.WRITE_SECURE_SETTINGS") != 0) {
                permissons.add("android.permission.WRITE_SECURE_SETTINGS");
            }
            if (activity.checkSelfPermission("android.permission.PACKAGE_USAGE_STATS") != 0) {
                permissons.add("android.permission.PACKAGE_USAGE_STATS");
            }
            if (permissons.size() > 0) {
                activity.requestPermissions((String[]) permissons.toArray(new String[permissons.size()]), 1);
            }
        }
    }
}
