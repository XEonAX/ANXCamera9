package com.android.camera.fragment.music;

import android.content.Context;
import android.media.MediaMetadataRetriever;
import com.android.camera.log.Log;
import com.android.camera.module.impl.component.FileUtils;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class MusicUtils {
    public static List<LiveMusicInfo> getMusicListFromLocalFolder(String str, Context context) {
        List<LiveMusicInfo> arrayList = new ArrayList();
        MediaMetadataRetriever mediaMetadataRetriever = new MediaMetadataRetriever();
        File file = new File(str);
        if (file.listFiles() != null) {
            for (File file2 : file.listFiles()) {
                if (file2.isFile()) {
                    String name = file2.getName();
                    if (name.contains(".mp3")) {
                        StringBuilder stringBuilder;
                        LiveMusicInfo liveMusicInfo = new LiveMusicInfo();
                        mediaMetadataRetriever.setDataSource(file2.getAbsolutePath());
                        String extractMetadata = mediaMetadataRetriever.extractMetadata(7);
                        if (extractMetadata == null) {
                            extractMetadata = name.substring(0, name.length() - 4);
                        }
                        liveMusicInfo.mTitle = extractMetadata;
                        name = mediaMetadataRetriever.extractMetadata(1);
                        if (name == null) {
                            stringBuilder = new StringBuilder();
                            stringBuilder.append(FileUtils.MUSIC_LOCAL);
                            stringBuilder.append(extractMetadata);
                            stringBuilder.append(".png");
                            name = stringBuilder.toString();
                        }
                        liveMusicInfo.mThumbnailUrl = name;
                        name = mediaMetadataRetriever.extractMetadata(2);
                        if (name == null) {
                            name = "小米小视频";
                        }
                        liveMusicInfo.mAuthor = name;
                        name = mediaMetadataRetriever.extractMetadata(9);
                        liveMusicInfo.mDuration = name.substring(0, name.length() - 3);
                        liveMusicInfo.mPlayUrl = file2.getAbsolutePath();
                        arrayList.add(liveMusicInfo);
                        stringBuilder = new StringBuilder();
                        stringBuilder.append(liveMusicInfo.mAuthor);
                        stringBuilder.append(", ");
                        stringBuilder.append(liveMusicInfo.mTitle);
                        stringBuilder.append(", ");
                        stringBuilder.append(liveMusicInfo.mPlayUrl);
                        stringBuilder.append(",");
                        stringBuilder.append(liveMusicInfo.mThumbnailUrl);
                        stringBuilder.append(",");
                        stringBuilder.append(liveMusicInfo.mDuration);
                        Log.d("LiveMusicInfo", stringBuilder.toString());
                    }
                }
            }
        }
        mediaMetadataRetriever.release();
        return arrayList;
    }
}
