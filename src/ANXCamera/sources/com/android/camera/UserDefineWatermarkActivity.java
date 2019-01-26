package com.android.camera;

import android.app.ActionBar;
import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.support.annotation.Nullable;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.text.method.ReplacementTransformationMethod;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.EditText;
import android.widget.TextView;
import com.aeonax.camera.R;
import com.android.camera.sensitive.SensitiveFilter;

public class UserDefineWatermarkActivity extends Activity implements TextWatcher {
    private static final int MSG_BG_FILTER_WORDS = 1;
    private static final int MSG_MT_UI = 2;
    private static final int PROP_NAME_MAX = 12;
    private static final String TAG = "UserDefineWatermarkActivity";
    protected BackgroundHandler mBackgroundHandler;
    private EditText mEtUserDefineWords;
    private boolean mFlagBeyondLimit;
    private String mTextLast;
    private HandlerThread mThreadBg;
    protected UiHandler mUiHandler;
    private String mUserDefineWords;

    private final class AllCapTransformationMethod extends ReplacementTransformationMethod {
        private AllCapTransformationMethod() {
        }

        /* synthetic */ AllCapTransformationMethod(UserDefineWatermarkActivity userDefineWatermarkActivity, AnonymousClass1 anonymousClass1) {
            this();
        }

        protected char[] getOriginal() {
            return new char[]{'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
        }

        protected char[] getReplacement() {
            return new char[]{'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};
        }
    }

    private final class BackgroundHandler extends Handler {
        BackgroundHandler(Looper looper) {
            super(looper);
        }

        public void handleMessage(Message message) {
            UserDefineWatermarkActivity.this.doInBackground(message);
        }
    }

    private final class UiHandler extends Handler {
        UiHandler(Looper looper) {
            super(looper);
        }

        public void handleMessage(Message message) {
            UserDefineWatermarkActivity.this.doInMainThread(message);
        }
    }

    protected void onCreate(@Nullable Bundle bundle) {
        super.onCreate(bundle);
        setContentView(R.layout.fragment_userdefine_watermark);
        this.mEtUserDefineWords = (EditText) findViewById(R.id.et_user_define_words);
        this.mEtUserDefineWords.addTextChangedListener(this);
        this.mEtUserDefineWords.setTransformationMethod(new AllCapTransformationMethod(this, null));
        Object customWatermark = CameraSettings.getCustomWatermark();
        if (!TextUtils.isEmpty(customWatermark)) {
            this.mEtUserDefineWords.setText(customWatermark);
            this.mEtUserDefineWords.setSelection(customWatermark.length());
        }
        this.mThreadBg = new HandlerThread(TAG, 10);
        this.mThreadBg.start();
        this.mBackgroundHandler = new BackgroundHandler(this.mThreadBg.getLooper());
        this.mUiHandler = new UiHandler(Looper.getMainLooper());
    }

    protected void onStart() {
        super.onStart();
        initTitle();
    }

    private void initTitle() {
        ActionBar actionBar = getActionBar();
        if (actionBar != null) {
            actionBar.setDisplayOptions(16, 16);
            actionBar.setCustomView(miui.R.layout.edit_mode_title);
            View customView = actionBar.getCustomView();
            ((TextView) customView.findViewById(16908310)).setText(getTitle());
            TextView textView = (TextView) customView.findViewById(16908313);
            textView.setBackgroundResource(miui.R.drawable.action_mode_title_button_cancel_light);
            textView.setText(null);
            textView.setContentDescription(getText(17039360));
            textView.setOnClickListener(new OnClickListener() {
                public void onClick(View view) {
                    UserDefineWatermarkActivity.this.onCancel();
                }
            });
            TextView textView2 = (TextView) customView.findViewById(16908314);
            textView2.setBackgroundResource(miui.R.drawable.action_mode_title_button_confirm_light);
            textView2.setText(null);
            textView2.setContentDescription(getText(17039370));
            textView2.setOnClickListener(new OnClickListener() {
                public void onClick(View view) {
                    UserDefineWatermarkActivity.this.onSave();
                }
            });
            setTitle(getResources().getString(R.string.custom_watermark_words));
        }
    }

    private void onCancel() {
        finish();
    }

    private void onSave() {
        if (checkContentlength()) {
            this.mBackgroundHandler.sendEmptyMessage(1);
        }
    }

    protected void onPause() {
        super.onPause();
    }

    protected void onDestroy() {
        super.onDestroy();
        if (this.mBackgroundHandler != null) {
            this.mBackgroundHandler.removeCallbacksAndMessages(null);
        }
        if (this.mUiHandler != null) {
            this.mUiHandler.removeCallbacksAndMessages(null);
        }
        if (this.mThreadBg != null) {
            this.mThreadBg.quit();
        }
    }

    private String checkContentlegal(CharSequence charSequence) {
        return SensitiveFilter.getInstance().getSensitiveWord((String) charSequence);
    }

    public void beforeTextChanged(CharSequence charSequence, int i, int i2, int i3) {
        if (!this.mFlagBeyondLimit) {
            this.mTextLast = charSequence.toString();
        }
        this.mFlagBeyondLimit = false;
    }

    public void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
        checkContentlength();
    }

    private boolean checkContentlength() {
        this.mUserDefineWords = this.mEtUserDefineWords.getText().toString();
        if (getTextLength(this.mUserDefineWords) <= 12.0d) {
            return true;
        }
        this.mFlagBeyondLimit = true;
        this.mEtUserDefineWords.setText(this.mTextLast);
        this.mEtUserDefineWords.setSelection(this.mTextLast.length());
        ToastUtils.showToast((Context) this, (int) R.string.custom_watermark_too_many_words);
        return false;
    }

    private String getCustomWords() {
        if (this.mEtUserDefineWords == null) {
            return getResources().getString(R.string.dualcamera_watermark_default);
        }
        Object trim = this.mEtUserDefineWords.getText().toString().trim();
        if (TextUtils.isEmpty(trim)) {
            return getResources().getString(R.string.dualcamera_watermark_default);
        }
        return trim.toUpperCase();
    }

    public void afterTextChanged(Editable editable) {
    }

    private void doInBackground(Message message) {
        if (message.what == 1) {
            String checkContentlegal = checkContentlegal(this.mUserDefineWords);
            Message obtain = Message.obtain();
            obtain.what = 2;
            Bundle bundle = new Bundle();
            bundle.putString("LEGAL_WORD", checkContentlegal);
            obtain.setData(bundle);
            this.mUiHandler.sendMessage(obtain);
        }
    }

    private void doInMainThread(Message message) {
        if (message.what == 2) {
            if (TextUtils.isEmpty(message.getData().getString("LEGAL_WORD"))) {
                String customWords = getCustomWords();
                if (!customWords.equals(CameraSettings.getCustomWatermark())) {
                    CameraSettings.setCustomWatermark(customWords);
                    Util.generateCustomWatermark2File();
                }
                ToastUtils.showToast((Context) this, (int) R.string.custom_watermark_words_save_success);
                finish();
                return;
            }
            ToastUtils.showToast((Context) this, getString(R.string.custom_watermark_contains_senstive_words, new Object[]{message.getData().getString("LEGAL_WORD")}));
        }
    }

    public double getTextLength(CharSequence charSequence) {
        StringBuilder stringBuilder = new StringBuilder(32);
        int length = charSequence.length();
        int i = -1;
        double d = 0.0d;
        int i2 = 0;
        while (i2 < length) {
            String valueOf = String.valueOf(charSequence.charAt(i2));
            int i3 = valueOf.matches("[^\\x00-\\xff]") ? 0 : 1;
            if (i < 0) {
                stringBuilder.append(valueOf);
            } else if (i3 == i) {
                stringBuilder.append(valueOf);
            } else if (i3 != i) {
                d += i == 0 ? (double) stringBuilder.length() : ((double) stringBuilder.length()) / 1.25d;
                stringBuilder.delete(0, stringBuilder.length());
                stringBuilder.append(valueOf);
            }
            if (i2 == length - 1) {
                d += i == 0 ? (double) stringBuilder.length() : ((double) stringBuilder.length()) / 1.25d;
                stringBuilder.delete(0, stringBuilder.length());
                stringBuilder.append(valueOf);
            }
            i2++;
            i = i3;
        }
        return d;
    }
}
