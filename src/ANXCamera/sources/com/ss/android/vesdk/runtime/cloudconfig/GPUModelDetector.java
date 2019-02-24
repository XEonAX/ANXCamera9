package com.ss.android.vesdk.runtime.cloudconfig;

import android.support.annotation.Keep;
import android.util.Log;
import com.ss.android.ttve.nativePort.TEGPUInfoReader;
import java.util.regex.Pattern;

public class GPUModelDetector {
    private static final String TAG = "GPUModelDetector";
    private static final GPUModelDetector instance = new GPUModelDetector();
    private boolean isSurpportAdvancedEffect;
    private boolean isSurpportHighResolutionRecord;
    private ENvGpuModel mGPUModel;
    private int mGPUModelNumber;
    private ENvGpuSubModel mGPUSubModel;

    @Keep
    public enum ENvGpuModel {
        Unknown,
        Adreno,
        Mali,
        PowerVR,
        Intel,
        NVIDIA,
        Vivante,
        VideoCore
    }

    @Keep
    public enum ENvGpuSubModel {
        Unknown,
        Adreno,
        Mali,
        Mali_MP,
        Mali_T,
        PowerVR_SGX,
        PowerVR_SGX_MP,
        PowerVR_SGX_MP2,
        PowerVR_Rogue_Han,
        PowerVR_Rogue_Hood,
        PowerVR_Rogue_Marlowe,
        PowerVR_Rogue_G,
        Intel_HD_Graphics,
        NVIDIA_Tegra,
        NVIDIA_Tegra_X1,
        NVIDIA_AP,
        Vivante_GC,
        VideoCore_IV_HW
    }

    public class GPUModelInfo {
        private ENvGpuModel mGPUModel;
        private int mGPUModelNumber;
        private ENvGpuSubModel mGPUSubModel;

        public GPUModelInfo(ENvGpuModel eNvGpuModel, ENvGpuSubModel eNvGpuSubModel, int i) {
            this.mGPUModel = eNvGpuModel;
            this.mGPUSubModel = eNvGpuSubModel;
            this.mGPUModelNumber = i;
        }

        public ENvGpuModel getGPUModel() {
            return this.mGPUModel;
        }

        public ENvGpuSubModel getGPUSubModel() {
            return this.mGPUSubModel;
        }

        public int getGPUModelNumber() {
            return this.mGPUModelNumber;
        }
    }

    private GPUModelDetector() {
    }

    public static GPUModelDetector getInstance() {
        return instance;
    }

    public boolean isSurpportAdvancedEffect() {
        return this.isSurpportAdvancedEffect;
    }

    public boolean isSurpportHighResolutionRecord() {
        return this.isSurpportHighResolutionRecord;
    }

    public void detectGPUSurpportAdvancedEffect() {
        new Thread() {
            public void run() {
                String nativeGetGPURenderer = TEGPUInfoReader.nativeGetGPURenderer();
                String str = GPUModelDetector.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("gpurender is");
                stringBuilder.append(nativeGetGPURenderer);
                Log.i(str, stringBuilder.toString());
                boolean z = false;
                if (nativeGetGPURenderer != null) {
                    GPUModelInfo access$000 = GPUModelDetector.this.getGPUModel(nativeGetGPURenderer);
                    ENvGpuModel gPUModel = access$000.getGPUModel();
                    ENvGpuSubModel gPUSubModel = access$000.getGPUSubModel();
                    int gPUModelNumber = access$000.getGPUModelNumber();
                    if (gPUModel != ENvGpuModel.Vivante) {
                    }
                }
                z = true;
                GPUModelDetector.this.isSurpportAdvancedEffect = z;
                nativeGetGPURenderer = GPUModelDetector.TAG;
                StringBuilder stringBuilder2 = new StringBuilder();
                stringBuilder2.append("isSurpportAdvancedEffect:");
                stringBuilder2.append(GPUModelDetector.this.isSurpportAdvancedEffect);
                Log.i(nativeGetGPURenderer, stringBuilder2.toString());
            }
        }.start();
    }

    public void detectGPUSurpportHighResolutionRecord() {
        new Thread() {
            public void run() {
                String nativeGetGPURenderer = TEGPUInfoReader.nativeGetGPURenderer();
                String str = GPUModelDetector.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("gpurender is");
                stringBuilder.append(nativeGetGPURenderer);
                Log.i(str, stringBuilder.toString());
                boolean z = false;
                if (nativeGetGPURenderer != null) {
                    GPUModelInfo access$000 = GPUModelDetector.this.getGPUModel(nativeGetGPURenderer);
                    ENvGpuModel gPUModel = access$000.getGPUModel();
                    ENvGpuSubModel gPUSubModel = access$000.getGPUSubModel();
                    int gPUModelNumber = access$000.getGPUModelNumber();
                    if (gPUModel != ENvGpuModel.Vivante) {
                    }
                }
                z = true;
                GPUModelDetector.this.isSurpportHighResolutionRecord = z;
                nativeGetGPURenderer = GPUModelDetector.TAG;
                StringBuilder stringBuilder2 = new StringBuilder();
                stringBuilder2.append("isSurpportHighResolutionSupport:");
                stringBuilder2.append(GPUModelDetector.this.isSurpportHighResolutionRecord);
                Log.i(nativeGetGPURenderer, stringBuilder2.toString());
            }
        }.start();
    }

    public GPUModelInfo getGPUModel() {
        return getGPUModel(TEGPUInfoReader.nativeGetGPURenderer());
    }

    public String getGLVersion() {
        return TEGPUInfoReader.nativeGetGLVersion();
    }

    private GPUModelInfo getGPUModel(String str) {
        if (str != null && str.trim().length() > 0) {
            this.mGPUModel = ENvGpuModel.Unknown;
            this.mGPUSubModel = ENvGpuSubModel.Unknown;
            this.mGPUModelNumber = 0;
            String[] split = str.split("[-\\s+]");
            if (split.length >= 1) {
                String trim = split[0].trim();
                if (trim.equalsIgnoreCase("Adreno")) {
                    this.mGPUModel = ENvGpuModel.Adreno;
                    DetectAdrenoGpu(split);
                } else if (trim.equalsIgnoreCase("Mali")) {
                    this.mGPUModel = ENvGpuModel.Mali;
                    DetectMaliGpu(split);
                } else if (trim.equalsIgnoreCase("PowerVR")) {
                    this.mGPUModel = ENvGpuModel.PowerVR;
                    DetectPowerVRGpu(split);
                } else if (trim.equalsIgnoreCase("Intel") || trim.equalsIgnoreCase("Intel(R)")) {
                    this.mGPUModel = ENvGpuModel.Intel;
                    DetectIntelGpu(split);
                } else if (trim.equalsIgnoreCase("NVIDIA")) {
                    this.mGPUModel = ENvGpuModel.Intel;
                    DetectNVIDIAGpu(split);
                } else if (trim.equalsIgnoreCase("Vivante")) {
                    this.mGPUModel = ENvGpuModel.Vivante;
                    DetectVivanteGpu(split);
                } else if (trim.equalsIgnoreCase("GC1000")) {
                    this.mGPUModel = ENvGpuModel.Vivante;
                    DetectVivanteGCGpu(split);
                } else if (trim.equalsIgnoreCase("VideoCore")) {
                    this.mGPUModel = ENvGpuModel.VideoCore;
                    DetectVideoCoreGpu(split);
                }
            }
        }
        return new GPUModelInfo(this.mGPUModel, this.mGPUSubModel, this.mGPUModelNumber);
    }

    private void DetectAdrenoGpu(String[] strArr) {
        int length = strArr.length;
        if (length >= 2) {
            if (strArr[1].equalsIgnoreCase("(TM)")) {
                if (length == 3 && isNumeric(strArr[2])) {
                    this.mGPUSubModel = ENvGpuSubModel.Adreno;
                    this.mGPUModelNumber = parseInt(strArr[2]);
                }
            } else if (isNumeric(strArr[1])) {
                this.mGPUSubModel = ENvGpuSubModel.Adreno;
                this.mGPUModelNumber = parseInt(strArr[1]);
            }
        }
    }

    private void DetectMaliGpu(String[] strArr) {
        int length = strArr.length;
        if (length >= 2) {
            if (isNumeric(strArr[1])) {
                if (length == 2) {
                    this.mGPUSubModel = ENvGpuSubModel.Mali;
                } else if (length == 3 && strArr[2].equalsIgnoreCase("MP")) {
                    this.mGPUSubModel = ENvGpuSubModel.Mali_MP;
                }
                this.mGPUModelNumber = parseInt(strArr[1]);
            } else if (length == 2 && strArr[1] != null && strArr[1].trim().length() > 0 && strArr[1].charAt(0) == 'T') {
                String substring = strArr[1].substring(1);
                if (isNumeric(substring)) {
                    this.mGPUSubModel = ENvGpuSubModel.Mali_T;
                    this.mGPUModelNumber = parseInt(substring);
                }
            }
        }
    }

    private void DetectPowerVRGpu(String[] strArr) {
        int length = strArr.length;
        if (length >= 2) {
            String substring;
            if (strArr[1].equalsIgnoreCase("SGX")) {
                if (length == 3) {
                    if (strArr[2].substring(strArr[2].length() - 2).equalsIgnoreCase("MP")) {
                        substring = strArr[2].substring(0, strArr[2].length() - 2);
                        if (isNumeric(substring)) {
                            this.mGPUSubModel = ENvGpuSubModel.PowerVR_SGX_MP;
                            this.mGPUModelNumber = parseInt(substring);
                        }
                    } else if (strArr[2].substring(strArr[2].length() - 3).equalsIgnoreCase("MP2")) {
                        substring = strArr[2].substring(0, strArr[2].length() - 3);
                        if (isNumeric(substring)) {
                            this.mGPUSubModel = ENvGpuSubModel.PowerVR_SGX_MP2;
                            this.mGPUModelNumber = parseInt(substring);
                        }
                    } else if (isNumeric(strArr[2])) {
                        this.mGPUSubModel = ENvGpuSubModel.PowerVR_SGX;
                        this.mGPUModelNumber = parseInt(strArr[2]);
                    }
                }
            } else if (!strArr[1].equalsIgnoreCase("Rogue") || length != 3) {
            } else {
                if (strArr[2].equalsIgnoreCase("Han")) {
                    this.mGPUSubModel = ENvGpuSubModel.PowerVR_Rogue_Han;
                } else if (strArr[2].equalsIgnoreCase("Hood")) {
                    this.mGPUSubModel = ENvGpuSubModel.PowerVR_Rogue_Hood;
                } else if (strArr[2].equalsIgnoreCase("Marlowe")) {
                    this.mGPUSubModel = ENvGpuSubModel.PowerVR_Rogue_Marlowe;
                } else if (strArr[2].startsWith("G")) {
                    substring = strArr[2].substring(1);
                    if (isNumeric(substring)) {
                        this.mGPUSubModel = ENvGpuSubModel.PowerVR_Rogue_G;
                        this.mGPUModelNumber = parseInt(substring);
                    }
                }
            }
        }
    }

    private void DetectIntelGpu(String[] strArr) {
        int length = strArr.length;
        if (length >= 3 && strArr[1].equalsIgnoreCase("HD") && strArr[2].equalsIgnoreCase("Graphics")) {
            this.mGPUSubModel = ENvGpuSubModel.Intel_HD_Graphics;
            if (length == 4 && isNumeric(strArr[3])) {
                this.mGPUModelNumber = parseInt(strArr[3]);
            }
        }
    }

    private void DetectNVIDIAGpu(String[] strArr) {
        int length = strArr.length;
        if (length >= 2) {
            if (strArr[1].equalsIgnoreCase("Tegra")) {
                if (length < 3 || !strArr[2].equalsIgnoreCase("X1")) {
                    this.mGPUSubModel = ENvGpuSubModel.NVIDIA_Tegra;
                } else {
                    this.mGPUSubModel = ENvGpuSubModel.NVIDIA_Tegra_X1;
                }
            } else if (strArr[1].equalsIgnoreCase("AP")) {
                this.mGPUSubModel = ENvGpuSubModel.NVIDIA_AP;
            }
        }
    }

    private void DetectVivanteGCGpu(String[] strArr) {
        if (strArr.length >= 2) {
            this.mGPUSubModel = ENvGpuSubModel.Vivante_GC;
            this.mGPUModelNumber = parseInt(stripNonDigitCharFromString(strArr[0]));
        }
    }

    private void DetectVivanteGpu(String[] strArr) {
        if (strArr.length >= 2 && !strArr[1].equalsIgnoreCase("GC")) {
            this.mGPUSubModel = ENvGpuSubModel.Vivante_GC;
            this.mGPUModelNumber = parseInt(stripNonDigitCharFromString(strArr[1]));
        }
    }

    private void DetectVideoCoreGpu(String[] strArr) {
        if (strArr.length >= 3 && strArr[1].equalsIgnoreCase("IV") && strArr[2].equalsIgnoreCase("HW")) {
            this.mGPUSubModel = ENvGpuSubModel.VideoCore_IV_HW;
        }
    }

    private boolean isNumeric(String str) {
        if (Pattern.compile("-?[0-9]+.?[0-9]+").matcher(str).matches() || Pattern.compile("[0-9]+").matcher(str).matches()) {
            return true;
        }
        return false;
    }

    private String stripNonDigitCharFromString(String str) {
        StringBuilder stringBuilder = new StringBuilder();
        for (int i = 0; i < str.length(); i++) {
            String valueOf = String.valueOf(str.charAt(i));
            if (isNumeric(valueOf)) {
                stringBuilder.append(valueOf);
            }
        }
        return stringBuilder.toString();
    }

    private int parseInt(String str) {
        try {
            return Integer.parseInt(str);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            return 0;
        }
    }
}
