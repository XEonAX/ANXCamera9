package com.android.camera.data.data.runing;

import com.aeonax.camera.R;
import com.android.camera.constant.CameraScene;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import java.util.ArrayList;
import java.util.List;

public class ComponentRunningSceneValue extends ComponentData {
    public ComponentRunningSceneValue(DataItemRunning dataItemRunning) {
        super(dataItemRunning);
    }

    public int getDisplayTitleString() {
        return R.string.pref_camera_scenemode_title;
    }

    public String getKey(int i) {
        return "pref_camera_scenemode_key";
    }

    public String getDefaultValue(int i) {
        return "0";
    }

    public List<ComponentDataItem> getItems() {
        if (this.mItems == null) {
            this.mItems = initItems();
        }
        return this.mItems;
    }

    private List<ComponentDataItem> initItems() {
        List<ComponentDataItem> arrayList = new ArrayList();
        arrayList.add(new ComponentDataItem(R.drawable.ic_scene_mode_auto_normal, R.drawable.ic_scene_mode_auto_normal, R.string.pref_camera_scenemode_entry_auto, "0"));
        arrayList.add(new ComponentDataItem(R.drawable.ic_scene_mode_portrait_normal, R.drawable.ic_scene_mode_portrait_normal, R.string.pref_camera_scenemode_entry_portrait, "3"));
        arrayList.add(new ComponentDataItem(R.drawable.ic_scene_mode_landscape_normal, R.drawable.ic_scene_mode_landscape_normal, R.string.pref_camera_scenemode_entry_landscape, "4"));
        arrayList.add(new ComponentDataItem(R.drawable.ic_scene_mode_sports_normal, R.drawable.ic_scene_mode_sports_normal, R.string.pref_camera_scenemode_entry_sports, CameraScene.SPORTS));
        arrayList.add(new ComponentDataItem(R.drawable.ic_scene_mode_night_normal, R.drawable.ic_scene_mode_night_normal, R.string.pref_camera_scenemode_entry_night, "5"));
        arrayList.add(new ComponentDataItem(R.drawable.ic_scene_mode_night_portrait_normal, R.drawable.ic_scene_mode_night_portrait_normal, R.string.pref_camera_scenemode_entry_night_portrait, "6"));
        arrayList.add(new ComponentDataItem(R.drawable.ic_scene_mode_beach_normal, R.drawable.ic_scene_mode_beach_normal, R.string.pref_camera_scenemode_entry_beach, CameraScene.BEACH));
        arrayList.add(new ComponentDataItem(R.drawable.ic_scene_mode_snow_normal, R.drawable.ic_scene_mode_snow_normal, R.string.pref_camera_scenemode_entry_snow, CameraScene.SNOW));
        arrayList.add(new ComponentDataItem(R.drawable.ic_scene_mode_sunset_normal, R.drawable.ic_scene_mode_sunset_normal, R.string.pref_camera_scenemode_entry_sunset, CameraScene.SUNSET));
        arrayList.add(new ComponentDataItem(R.drawable.ic_scene_mode_fireworks_normal, R.drawable.ic_scene_mode_fireworks_normal, R.string.pref_camera_scenemode_entry_fireworks, CameraScene.FIREWORKS));
        return arrayList;
    }
}
