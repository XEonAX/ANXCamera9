package com.android.camera.constant;

import android.provider.MiuiSettings.XSpace;
import com.android.camera.R;

public class ShareConstant {
    public static final String[] DEFAULT_SHARE_LIST = new String[]{"com.ss.android.ugc.aweme.share.SystemShareActivity", "com.ss.android.ugc.aweme.splash.SplashActivity", XSpace.KEY_WEIXIN_SEND_TO_FRIEND, XSpace.KEY_XSPACE_QQ_SEND_TO_FRIEND, "com.qzonex.module.maxvideo.activity.QzonePublishVideoActivity", XSpace.KEY_WEIBO_SEND};
    public static final int[] DEFAULT_SHARE_LIST_ICON = new int[]{R.drawable.ic_live_share_tik, R.drawable.ic_live_share_tik, R.drawable.ic_live_share_wechat, R.drawable.ic_live_share_qq, R.drawable.ic_live_share_qzone, R.drawable.ic_live_share_weibo};
    public static final int[] DEFAULT_SHARE_LIST_NAME = new int[]{R.string.live_share_tik, R.string.live_share_tik, R.string.live_share_wechat, R.string.live_share_qq, R.string.live_share_qzone, R.string.live_share_weibo};
}
