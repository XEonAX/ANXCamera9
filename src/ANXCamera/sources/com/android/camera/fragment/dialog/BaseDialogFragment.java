package com.android.camera.fragment.dialog;

import android.content.DialogInterface;
import android.content.DialogInterface.OnKeyListener;
import android.support.v4.app.DialogFragment;
import android.view.GestureDetector;
import android.view.GestureDetector.SimpleOnGestureListener;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import com.android.camera.protocol.ModeProtocol.HandleBackTrace;

public class BaseDialogFragment extends DialogFragment implements OnKeyListener, HandleBackTrace {
    private GestureDetector gesture;

    private class MyOnGestureListener extends SimpleOnGestureListener {
        private MyOnGestureListener() {
        }

        /* synthetic */ MyOnGestureListener(BaseDialogFragment baseDialogFragment, AnonymousClass1 anonymousClass1) {
            this();
        }

        public boolean onScroll(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2) {
            BaseDialogFragment.this.onBackEvent(5);
            return super.onScroll(motionEvent, motionEvent2, f, f2);
        }

        public boolean onSingleTapUp(MotionEvent motionEvent) {
            BaseDialogFragment.this.onBackEvent(5);
            return super.onSingleTapUp(motionEvent);
        }

        public boolean onDown(MotionEvent motionEvent) {
            return true;
        }
    }

    public boolean onKey(DialogInterface dialogInterface, int i, KeyEvent keyEvent) {
        return false;
    }

    public boolean onBackEvent(int i) {
        return false;
    }

    public boolean canProvide() {
        return false;
    }

    protected void initViewOnTouchListener(View view) {
        this.gesture = new GestureDetector(getActivity(), new MyOnGestureListener(this, null));
        view.setOnTouchListener(new OnTouchListener() {
            public boolean onTouch(View view, MotionEvent motionEvent) {
                return BaseDialogFragment.this.gesture.onTouchEvent(motionEvent);
            }
        });
    }
}
