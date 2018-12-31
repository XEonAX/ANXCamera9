package com.android.camera.fragment.music;

import com.android.camera.network.resource.LiveResource;

public class LiveMusicInfo extends LiveResource {
    public int downloadState = 0;
    public String mAuthor;
    public String mDuration;
    public String mPlayUrl;
    public String mThumbnailUrl;
    public String mTitle;
}
