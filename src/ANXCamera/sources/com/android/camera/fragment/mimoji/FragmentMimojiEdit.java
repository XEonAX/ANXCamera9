package com.android.camera.fragment.mimoji;

import android.annotation.SuppressLint;
import android.app.AlertDialog.Builder;
import android.content.Context;
import android.content.DialogInterface;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.os.Handler;
import android.os.Message;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewStub;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.GridView;
import android.widget.TextView;
import android.widget.Toast;
import com.android.camera.R;
import com.android.camera.ToastUtils;
import com.android.camera.fragment.BaseFragment;
import com.android.camera.log.Log;
import com.android.camera.module.impl.component.FileUtils;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.HandleBackTrace;
import com.android.camera.protocol.ModeProtocol.MimojiAvatarEngine;
import com.android.camera.protocol.ModeProtocol.MimojiEditor;
import com.android.camera.protocol.ModeProtocol.ModeCoordinator;
import com.android.camera.ui.MimojiEditGLSurfaceView;
import com.android.camera.ui.MimojiTypeHorizonScrollView;
import com.android.camera.ui.MimojiTypeSelectView;
import com.arcsoft.avatar.AvatarConfig.c;
import com.arcsoft.avatar.AvatarConfig.d;
import com.arcsoft.avatar.AvatarConfig.e;
import com.arcsoft.avatar.AvatarEngine;
import com.arcsoft.avatar.d.g;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

public class FragmentMimojiEdit extends BaseFragment implements OnClickListener, OnItemClickListener, HandleBackTrace, MimojiEditor {
    private static final int FRAGMENT_INFO = 65521;
    public static final String TAG = FragmentMimojiEdit.class.getSimpleName();
    private AvatarEngine mAvatar;
    private AvatarEngineManager mAvatarEngineManager;
    private TextView mBackTextView;
    private RecyclerView mColorRecyleView;
    private GridView mConfigThumbnailGridView;
    private TextView mConfirmTextView;
    private Context mContext;
    private TextView mEditTextView;
    @SuppressLint({"HandlerLeak"})
    private Handler mHandler = new Handler() {
        public void handleMessage(Message message) {
            if (message.what == 4) {
                Bitmap thumbnailBitmapFromData = FragmentMimoji.getThumbnailBitmapFromData((byte[]) message.obj, 60, 60);
                String format = new SimpleDateFormat("yyyyMMddHHmmssSSS", Locale.getDefault()).format(new Date());
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append(FileUtils.CUSTOM_DIR);
                stringBuilder.append("/");
                stringBuilder.append(format);
                stringBuilder.append("/");
                String stringBuilder2 = stringBuilder.toString();
                StringBuilder stringBuilder3 = new StringBuilder();
                stringBuilder3.append(stringBuilder2);
                stringBuilder3.append(format);
                stringBuilder3.append("config.dat");
                String stringBuilder4 = stringBuilder3.toString();
                StringBuilder stringBuilder5 = new StringBuilder();
                stringBuilder5.append(stringBuilder2);
                stringBuilder5.append(format);
                stringBuilder5.append("pic.jpg");
                FileUtils.saveBitmap(thumbnailBitmapFromData, stringBuilder5.toString());
                int g = FragmentMimojiEdit.this.mAvatar.g(stringBuilder4);
                format = FragmentMimojiEdit.TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("res = ");
                stringBuilder.append(g);
                stringBuilder.append("  save path : ");
                stringBuilder.append(stringBuilder4);
                Log.d(format, stringBuilder.toString());
                ToastUtils.showToast(FragmentMimojiEdit.this.getActivity(), FragmentMimojiEdit.this.getResources().getString(R.string.pref_camera_coloreffect_entry_vivid));
            }
        }
    };
    private View mMimojiConfigAdjustLayout;
    private MimojiEditGLSurfaceView mMimojiEditGLSurfaceView;
    private View mMimojiEditViewLayout;
    private ViewStub mMimojiEditViewStub;
    private MimojiThumbnailAdapter mMimojiThumbnailAdapter;
    private MimojiTypeHorizonScrollView mMimojiTypeHorizonScrollView;
    private MimojiTypeSelectView mMimojiTypeSelectView;
    private View mOperateSelectLayout;
    private TextView mReCaptureTextView;
    private TextView mSaveTextView;
    private TextView mTipsTextView;

    private void backToMimojiCreate() {
        this.mMimojiEditGLSurfaceView.setVisibility(8);
        this.mMimojiEditViewLayout.setVisibility(8);
        MimojiAvatarEngine mimojiAvatarEngine = (MimojiAvatarEngine) ModeCoordinatorImpl.getInstance().getAttachProtocol(217);
        if (mimojiAvatarEngine != null) {
            mimojiAvatarEngine.onBack(false);
            mimojiAvatarEngine.onMimojiCreate();
        }
    }

    private void initConfigList() {
        e eVar = new e();
        this.mAvatar.a(eVar);
        this.mAvatarEngineManager.setASAvatarConfigValue(eVar);
        this.mAvatarEngineManager.setConfigTypeList(this.mAvatar.a(this.mAvatarEngineManager.getASAvatarConfigValue().gender));
        onTypeConfigSelect(0);
        this.mMimojiTypeSelectView.init();
    }

    private void initMimojiEdit(View view) {
        this.mReCaptureTextView = (TextView) view.findViewById(R.id.live_music_close);
        this.mReCaptureTextView.setOnClickListener(this);
        this.mEditTextView = (TextView) view.findViewById(R.id.header_recyclerView);
        this.mEditTextView.setOnClickListener(this);
        this.mSaveTextView = (TextView) view.findViewById(R.id.alert_status_value);
        this.mSaveTextView.setOnClickListener(this);
        this.mBackTextView = (TextView) view.findViewById(R.id.alert_ai_scene_hint);
        this.mBackTextView.setOnClickListener(this);
        this.mConfirmTextView = (TextView) view.findViewById(R.id.alert_top_hint);
        this.mConfirmTextView.setOnClickListener(this);
        this.mMimojiEditGLSurfaceView = (MimojiEditGLSurfaceView) view.findViewById(R.id.alert_ai_detect_tip);
        this.mMimojiEditGLSurfaceView.setmHandler(this.mHandler);
        this.mOperateSelectLayout = view.findViewById(R.id.live_music_title_hint);
        this.mMimojiConfigAdjustLayout = view.findViewById(R.id.alert_ai_scene_select);
        this.mMimojiTypeSelectView = (MimojiTypeSelectView) view.findViewById(R.id.top_config_00);
        this.mConfigThumbnailGridView = (GridView) view.findViewById(R.id.top_config_02);
        this.mMimojiThumbnailAdapter = new MimojiThumbnailAdapter(getContext());
        this.mConfigThumbnailGridView.setAdapter(this.mMimojiThumbnailAdapter);
        this.mConfigThumbnailGridView.setOnItemClickListener(this);
        setupAvatar();
    }

    private void onSaveConfig() {
        c cVar = (c) this.mMimojiThumbnailAdapter.getItem(this.mMimojiThumbnailAdapter.getSelectItme());
        try {
            OutputStream byteArrayOutputStream = new ByteArrayOutputStream(cVar.an.getByteCount());
            cVar.an.compress(CompressFormat.PNG, 100, byteArrayOutputStream);
            byteArrayOutputStream.toByteArray();
            byteArrayOutputStream.close();
            String str = "";
            int g = this.mAvatar.g(str);
            String str2 = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("res = ");
            stringBuilder.append(g);
            stringBuilder.append("  save path : ");
            stringBuilder.append(str);
            g.d(str2, stringBuilder.toString());
            if (g != 0) {
                Toast.makeText(getContext(), "save failed!!", 0).show();
            }
        } catch (IOException e) {
        }
    }

    private void setupAvatar() {
        this.mAvatarEngineManager = AvatarEngineManager.getInstance();
        this.mAvatar = this.mAvatarEngineManager.queryAvatar();
        e eVar = new e();
        this.mAvatar.a(eVar);
        this.mAvatarEngineManager.setASAvatarConfigValue(eVar);
        this.mAvatarEngineManager.setASAvatarConfigValueTemp(eVar);
    }

    private void showRecaptureDialog() {
        getActivity().runOnUiThread(new Runnable() {
            public void run() {
                Builder builder = new Builder(FragmentMimojiEdit.this.getActivity());
                builder.setTitle(R.string.pref_camera_whitebalance_entry_incandescent);
                builder.setMessage(R.string.pref_camera_whitebalance_entry_daylight);
                builder.setCancelable(false);
                builder.setPositiveButton(R.string.hint_slow_motion, new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialogInterface, int i) {
                        FragmentMimojiEdit.this.backToMimojiCreate();
                    }
                });
                builder.setNegativeButton(R.string.hunt_dual_water_mark, new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialogInterface, int i) {
                    }
                });
                builder.show();
            }
        });
    }

    public int getFragmentInto() {
        return FRAGMENT_INFO;
    }

    protected int getLayoutResourceId() {
        return R.layout.fragment_live_music_pager;
    }

    protected void initView(View view) {
        this.mContext = getContext();
        this.mMimojiEditViewStub = (ViewStub) view.findViewById(R.id.live_preview_save);
    }

    public boolean onBackEvent(int i) {
        if (i == 1) {
            MimojiAvatarEngine mimojiAvatarEngine = (MimojiAvatarEngine) ModeCoordinatorImpl.getInstance().getAttachProtocol(217);
            if (mimojiAvatarEngine != null) {
                mimojiAvatarEngine.onBack(false);
            }
        }
        return false;
    }

    public void onClick(View view) {
        switch (view.getId()) {
            case R.id.header_recyclerView /*2131558422*/:
                this.mOperateSelectLayout.setVisibility(8);
                this.mMimojiConfigAdjustLayout.setVisibility(0);
                initConfigList();
                return;
            case R.id.alert_ai_scene_hint /*2131558562*/:
                backToMimojiCreate();
                return;
            case R.id.alert_top_hint /*2131558563*/:
            case R.id.alert_status_value /*2131558568*/:
                this.mMimojiEditGLSurfaceView.setmSaveConfigThum(true);
                return;
            case R.id.live_music_close /*2131558567*/:
                showRecaptureDialog();
                return;
            default:
                return;
        }
    }

    public void onDestroyView() {
        super.onDestroyView();
    }

    public void onDeviceRotationChange(int i) {
        if (this.mMimojiEditGLSurfaceView != null) {
            this.mMimojiEditGLSurfaceView.onDeviceRotationChange(i);
        }
    }

    public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("position = ");
        stringBuilder.append(i);
        stringBuilder.append(" Select index = ");
        stringBuilder.append(this.mMimojiThumbnailAdapter.getSelectItme());
        g.d("onItemClick", stringBuilder.toString());
        if (i != this.mMimojiThumbnailAdapter.getSelectItme()) {
            this.mAvatar.a((c) this.mMimojiThumbnailAdapter.getItem(i));
        }
    }

    public void onResume() {
        super.onResume();
    }

    public void onTypeConfigSelect(int i) {
        this.mAvatarEngineManager.setSelectTypeIndex(i);
        d configTypeForIndex = this.mAvatarEngineManager.getConfigTypeForIndex(i);
        ArrayList a = this.mAvatarEngineManager.queryAvatar().a(configTypeForIndex.ah, this.mAvatarEngineManager.getASAvatarConfigValue().gender);
        this.mAvatarEngineManager.setSelectType(configTypeForIndex.ah);
        this.mAvatarEngineManager.putConfigList(configTypeForIndex.ah, a);
        this.mMimojiEditGLSurfaceView.setNeedGetThumbnail(true);
    }

    protected void register(ModeCoordinator modeCoordinator) {
        super.register(modeCoordinator);
        registerBackStack(modeCoordinator, this);
        ModeCoordinatorImpl.getInstance().attachProtocol(224, this);
    }

    public void requestRender() {
        if (this.mMimojiEditGLSurfaceView != null) {
            this.mMimojiEditGLSurfaceView.requestRender();
        }
    }

    public void showTips() {
        if (this.mTipsTextView != null && this.mTipsTextView.getVisibility() != 0) {
            this.mTipsTextView.setVisibility(0);
            new Handler().postDelayed(new Runnable() {
                public void run() {
                    FragmentMimojiEdit.this.mTipsTextView.setVisibility(4);
                }
            }, 100);
        }
    }

    public void startMimojiEdit() {
        if (this.mMimojiEditViewLayout == null) {
            this.mMimojiEditViewLayout = this.mMimojiEditViewStub.inflate();
            initMimojiEdit(this.mMimojiEditViewLayout);
        }
        this.mMimojiEditViewLayout.setVisibility(0);
        this.mMimojiEditGLSurfaceView.setVisibility(0);
    }

    protected void unRegister(ModeCoordinator modeCoordinator) {
        super.unRegister(modeCoordinator);
        unRegisterBackStack(modeCoordinator, this);
        ModeCoordinatorImpl.getInstance().detachProtocol(224, this);
    }

    public void updateThumbnail() {
        final ArrayList selectConfigList = AvatarEngineManager.getInstance().getSelectConfigList();
        getActivity().runOnUiThread(new Runnable() {
            public void run() {
                FragmentMimojiEdit.this.mMimojiThumbnailAdapter.refreshData(selectConfigList);
            }
        });
    }
}
