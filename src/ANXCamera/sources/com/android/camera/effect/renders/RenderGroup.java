package com.android.camera.effect.renders;

import android.opengl.GLES20;
import android.util.SparseArray;
import com.android.camera.effect.EffectController.EffectRectAttribute;
import com.android.camera.effect.FilterInfo;
import com.android.camera.effect.FrameBuffer;
import com.android.camera.effect.draw_mode.DrawAttribute;
import com.android.camera.effect.renders.Render.FrameBufferCallback;
import com.android.camera.log.Log;
import com.android.gallery3d.ui.GLCanvas;
import java.util.ArrayList;
import java.util.Iterator;

public class RenderGroup extends Render {
    private static final String TAG = RenderGroup.class.getSimpleName();
    protected int mParentFrameBufferIdOld;
    private ArrayList<Render> mPartRenders = new ArrayList();
    private ArrayList<Render> mRenders = new ArrayList();
    private SparseArray<Render> mRendersMap = new SparseArray();

    public RenderGroup(GLCanvas gLCanvas) {
        super(gLCanvas);
    }

    public RenderGroup(GLCanvas gLCanvas, int i) {
        super(gLCanvas, i);
    }

    private void initOrientation(Render render) {
        if (render != null) {
            render.setOrientation(this.mOrientation);
            render.setJpegOrientation(this.mJpegOrientation);
            render.setShootRotation(this.mShootRotation);
        }
    }

    public void addRender(Render render) {
        if (recordRender(render)) {
            this.mRenders.add(render);
            setSize(render);
            initOrientation(render);
        }
    }

    public void removeRender(int i) {
        if (this.mRendersMap.indexOfKey(i) >= 0) {
            Render render = getRender(i);
            this.mRenders.remove(render);
            this.mRendersMap.delete(i);
            if (render != null) {
                render.destroy();
            }
        }
    }

    public ArrayList<Render> getRenders() {
        return this.mRenders;
    }

    private void setSize(Render render) {
        if (render != null) {
            if (!(this.mPreviewWidth == 0 && this.mPreviewHeight == 0)) {
                render.setPreviewSize(this.mPreviewWidth, this.mPreviewHeight);
            }
            if (this.mViewportWidth != 0 || this.mViewportHeight != 0) {
                render.setViewportSize(this.mViewportWidth, this.mViewportHeight);
            }
        }
    }

    private boolean recordRender(Render render) {
        int id = render == null ? FilterInfo.FILTER_ID_NONE : render.getId();
        if (this.mRendersMap.indexOfKey(id) < 0) {
            this.mRendersMap.put(id, render);
            return true;
        }
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("already added render with id ");
        stringBuilder.append(Integer.toHexString(id));
        Log.e(str, stringBuilder.toString(), new RuntimeException());
        return false;
    }

    public Render getRender(int i) {
        if (i < 0) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("invalid render id ");
            stringBuilder.append(Integer.toHexString(i));
            Log.e(str, stringBuilder.toString(), new RuntimeException());
        }
        return (Render) this.mRendersMap.get(i);
    }

    public Render getRenderByIndex(int i) {
        if (i >= 0 && i <= this.mRenders.size() - 1) {
            return (Render) this.mRenders.get(i);
        }
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("invalid render index: ");
        stringBuilder.append(i);
        stringBuilder.append(" size: ");
        stringBuilder.append(this.mRenders.size());
        Log.e(str, stringBuilder.toString());
        return null;
    }

    protected int getRenderSize() {
        return this.mRenders.size();
    }

    protected void clearRenders() {
        this.mRenders.clear();
        this.mRendersMap.clear();
    }

    public boolean draw(DrawAttribute drawAttribute) {
        Iterator it = this.mRenders.iterator();
        while (it.hasNext()) {
            Render render = (Render) it.next();
            if (render != null && render.draw(drawAttribute)) {
                return true;
            }
        }
        return false;
    }

    public void destroy() {
        Iterator it = this.mRenders.iterator();
        while (it.hasNext()) {
            Render render = (Render) it.next();
            if (render != null) {
                render.destroy();
            }
        }
        clearRenders();
    }

    public void beginBindFrameBuffer(int i, int i2, int i3) {
        GLES20.glBindFramebuffer(36160, i);
        this.mGLCanvas.getState().pushState();
        this.mGLCanvas.getState().identityAllM();
        this.mOldViewportWidth = this.mViewportWidth;
        this.mOldViewportHeight = this.mViewportHeight;
        this.mParentFrameBufferIdOld = this.mParentFrameBufferId;
        setParentFrameBufferId(i);
        setViewportSize(i2, i3);
    }

    public void beginBindFrameBuffer(FrameBuffer frameBuffer) {
        GLES20.glBindFramebuffer(36160, frameBuffer.getId());
        GLES20.glFramebufferTexture2D(36160, 36064, 3553, frameBuffer.getTexture().getId(), 0);
        this.mGLCanvas.getState().pushState();
        this.mGLCanvas.getState().identityAllM();
        this.mOldViewportWidth = this.mViewportWidth;
        this.mOldViewportHeight = this.mViewportHeight;
        this.mParentFrameBufferIdOld = this.mParentFrameBufferId;
        setParentFrameBufferId(frameBuffer.getId());
        setViewportSize(frameBuffer.getWidth(), frameBuffer.getHeight());
    }

    public void endBindFrameBuffer() {
        this.mGLCanvas.getState().popState();
        GLES20.glBindFramebuffer(36160, this.mParentFrameBufferIdOld);
        setViewportSize(this.mOldViewportWidth, this.mOldViewportHeight);
        setParentFrameBufferId(this.mParentFrameBufferIdOld);
    }

    public void setViewportSize(int i, int i2) {
        super.setViewportSize(i, i2);
        if (!this.mRenders.isEmpty()) {
            Iterator it = this.mRenders.iterator();
            while (it.hasNext()) {
                Render render = (Render) it.next();
                if (render != null) {
                    render.setViewportSize(i, i2);
                }
            }
        }
    }

    public void setEffectRangeAttribute(EffectRectAttribute effectRectAttribute) {
        super.setEffectRangeAttribute(effectRectAttribute);
        if (!this.mRenders.isEmpty()) {
            Iterator it = this.mRenders.iterator();
            while (it.hasNext()) {
                Render render = (Render) it.next();
                if (render != null) {
                    render.setEffectRangeAttribute(effectRectAttribute);
                }
            }
        }
    }

    public void setPreviewSize(int i, int i2) {
        super.setPreviewSize(i, i2);
        if (!this.mRenders.isEmpty()) {
            Iterator it = this.mRenders.iterator();
            while (it.hasNext()) {
                Render render = (Render) it.next();
                if (render != null) {
                    render.setPreviewSize(i, i2);
                }
            }
        }
    }

    public void deleteBuffer() {
        super.deleteBuffer();
        if (!this.mRenders.isEmpty()) {
            Iterator it = this.mRenders.iterator();
            while (it.hasNext()) {
                Render render = (Render) it.next();
                if (render != null) {
                    render.deleteBuffer();
                }
            }
        }
    }

    public void setOrientation(int i) {
        if (this.mOrientation != i) {
            super.setOrientation(i);
            if (!this.mRenders.isEmpty()) {
                Iterator it = this.mRenders.iterator();
                while (it.hasNext()) {
                    Render render = (Render) it.next();
                    if (render != null) {
                        render.setOrientation(i);
                    }
                }
            }
        }
    }

    public void setJpegOrientation(int i) {
        if (this.mJpegOrientation != i) {
            super.setJpegOrientation(i);
            if (!this.mRenders.isEmpty()) {
                Iterator it = this.mRenders.iterator();
                while (it.hasNext()) {
                    Render render = (Render) it.next();
                    if (render != null) {
                        render.setJpegOrientation(i);
                    }
                }
            }
        }
    }

    public void setMirror(boolean z) {
        super.setMirror(z);
        if (!this.mRenders.isEmpty()) {
            Iterator it = this.mRenders.iterator();
            while (it.hasNext()) {
                Render render = (Render) it.next();
                if (render != null) {
                    render.setMirror(z);
                }
            }
        }
    }

    public void setShootRotation(float f) {
        super.setShootRotation(f);
        if (!this.mRenders.isEmpty()) {
            Iterator it = this.mRenders.iterator();
            while (it.hasNext()) {
                Render render = (Render) it.next();
                if (render != null) {
                    render.setShootRotation(f);
                }
            }
        }
    }

    public void setSnapshotSize(int i, int i2) {
        super.setSnapshotSize(i, i2);
        if (!this.mRenders.isEmpty()) {
            Iterator it = this.mRenders.iterator();
            while (it.hasNext()) {
                Render render = (Render) it.next();
                if (render != null) {
                    render.setSnapshotSize(i, i2);
                }
            }
        }
    }

    protected void setParentFrameBufferId(int i) {
        super.setParentFrameBufferId(i);
        if (!this.mRenders.isEmpty()) {
            Iterator it = this.mRenders.iterator();
            while (it.hasNext()) {
                Render render = (Render) it.next();
                if (render != null) {
                    render.setParentFrameBufferId(i);
                }
            }
        }
    }

    public void setFrameBufferCallback(FrameBufferCallback frameBufferCallback, int i) {
        Iterator it = this.mRenders.iterator();
        while (it.hasNext()) {
            Render render = (Render) it.next();
            if (render != null) {
                render.setFrameBufferCallback(frameBufferCallback, i);
            }
        }
    }

    public void setSticker(String str) {
        Iterator it = this.mRenders.iterator();
        while (it.hasNext()) {
            Render render = (Render) it.next();
            if (render != null) {
                render.setSticker(str);
            }
        }
    }

    public void setPreviousFrameBufferInfo(int i, int i2, int i3) {
        Iterator it = this.mRenders.iterator();
        while (it.hasNext()) {
            Render render = (Render) it.next();
            if (render != null) {
                render.setPreviousFrameBufferInfo(i, i2, i3);
            }
        }
    }

    public boolean isNeedInit(int i) {
        boolean z = true;
        if (i <= -1) {
            return true;
        }
        if (this.mRendersMap.indexOfKey(i) >= 0) {
            z = false;
        }
        return z;
    }

    public void addPartRender(Render render) {
        this.mPartRenders.add(render);
    }

    public void clearPartRenders() {
        this.mPartRenders.clear();
    }

    public Render getPartRender(int i) {
        if (i < 0 || i >= this.mPartRenders.size()) {
            return null;
        }
        return (Render) this.mPartRenders.get(i);
    }

    public boolean isPartComplete(int i) {
        return this.mPartRenders.size() == i;
    }
}
