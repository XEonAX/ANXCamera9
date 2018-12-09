package com.android.camera.preferences;

import android.content.Context;
import android.util.AttributeSet;
import java.util.ArrayList;
import java.util.Iterator;

public class PreferenceGroup extends CameraPreference {
    private ArrayList<CameraPreference> list = new ArrayList();

    public PreferenceGroup(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public void addChild(CameraPreference cameraPreference) {
        this.list.add(cameraPreference);
    }

    public void removePreference(int i) {
        this.list.remove(i);
    }

    public CameraPreference get(int i) {
        return (CameraPreference) this.list.get(i);
    }

    public int size() {
        return this.list.size();
    }

    public ListPreference findPreference(String str) {
        Iterator it = this.list.iterator();
        while (it.hasNext()) {
            CameraPreference cameraPreference = (CameraPreference) it.next();
            ListPreference listPreference;
            if (cameraPreference instanceof ListPreference) {
                listPreference = (ListPreference) cameraPreference;
                if (listPreference.getKey().equals(str)) {
                    return listPreference;
                }
            } else if (cameraPreference instanceof PreferenceGroup) {
                listPreference = ((PreferenceGroup) cameraPreference).findPreference(str);
                if (listPreference != null) {
                    return listPreference;
                }
            } else {
                continue;
            }
        }
        return null;
    }
}
