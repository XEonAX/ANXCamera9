package com.android.camera.fragment.beauty;

import android.util.SparseArray;
import com.android.camera.fragment.beauty.BeautyParameters.Type;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.BottomMenuProtocol;
import com.android.camera.protocol.ModeProtocol.MiBeautyProtocol;
import com.android.camera.protocol.ModeProtocol.OnFaceBeautyChangedProtocol;
import com.miui.filtersdk.beauty.BeautyParameterType;
import java.util.List;

public class BeautyHelper {
    public static void onBeautyChanged() {
        OnFaceBeautyChangedProtocol onFaceBeautyChangedProtocol = (OnFaceBeautyChangedProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(199);
        if (onFaceBeautyChangedProtocol != null) {
            onFaceBeautyChangedProtocol.onBeautyChanged();
        }
    }

    public static void setProgress(int i) {
        MiBeautyProtocol miBeautyProtocol = (MiBeautyProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(194);
        if (miBeautyProtocol != null) {
            miBeautyProtocol.setProgress(i);
        }
    }

    public static void setType(Type type) {
        MiBeautyProtocol miBeautyProtocol = (MiBeautyProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(194);
        if (miBeautyProtocol != null) {
            miBeautyProtocol.setType(type);
        }
    }

    public static void resetBeauty() {
        MiBeautyProtocol miBeautyProtocol = (MiBeautyProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(194);
        if (miBeautyProtocol != null) {
            miBeautyProtocol.resetBeauty();
        }
    }

    public static void setType(BeautyParameterType beautyParameterType) {
        MiBeautyProtocol miBeautyProtocol = (MiBeautyProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(194);
        if (miBeautyProtocol != null) {
            miBeautyProtocol.setType(beautyParameterType);
        }
    }

    public static void setCurrentBeautyParameterType(CameraBeautyParameterType cameraBeautyParameterType) {
        MiBeautyProtocol miBeautyProtocol = (MiBeautyProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(194);
        if (miBeautyProtocol != null) {
            miBeautyProtocol.setCurrentBeautyParameterType(cameraBeautyParameterType);
        }
    }

    public static List<Type> getBeautyItems() {
        MiBeautyProtocol miBeautyProtocol = (MiBeautyProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(194);
        if (miBeautyProtocol != null) {
            return miBeautyProtocol.getBeautyItems();
        }
        return null;
    }

    public static int getProgress() {
        MiBeautyProtocol miBeautyProtocol = (MiBeautyProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(194);
        if (miBeautyProtocol != null) {
            return miBeautyProtocol.getProgress();
        }
        return 0;
    }

    public static CameraBeautyParameterType getCurrentBeautyParameterType() {
        MiBeautyProtocol miBeautyProtocol = (MiBeautyProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(194);
        if (miBeautyProtocol != null) {
            return miBeautyProtocol.getCurrentBeautyParameterType();
        }
        return null;
    }

    public static SparseArray<MenuItem> getMenuData() {
        BottomMenuProtocol bottomMenuProtocol = (BottomMenuProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(197);
        if (bottomMenuProtocol != null) {
            return bottomMenuProtocol.getMenuData();
        }
        return null;
    }

    public static int getBeautyType() {
        MiBeautyProtocol miBeautyProtocol = (MiBeautyProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(194);
        if (miBeautyProtocol != null) {
            return miBeautyProtocol.getBeautyType();
        }
        return 1;
    }
}
