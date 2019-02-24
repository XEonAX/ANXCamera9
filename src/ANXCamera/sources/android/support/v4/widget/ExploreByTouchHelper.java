package android.support.v4.widget;

import android.graphics.Rect;
import android.os.Bundle;
import android.support.v4.view.AccessibilityDelegateCompat;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewParentCompat;
import android.support.v4.view.accessibility.AccessibilityEventCompat;
import android.support.v4.view.accessibility.AccessibilityManagerCompat;
import android.support.v4.view.accessibility.AccessibilityNodeInfoCompat;
import android.support.v4.view.accessibility.AccessibilityNodeProviderCompat;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityManager;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public abstract class ExploreByTouchHelper extends AccessibilityDelegateCompat {
    private static final String DEFAULT_CLASS_NAME = View.class.getName();
    public static final int HOST_ID = -1;
    public static final int INVALID_ID = Integer.MIN_VALUE;
    private int mFocusedVirtualViewId = Integer.MIN_VALUE;
    private int mHoveredVirtualViewId = Integer.MIN_VALUE;
    private final AccessibilityManager mManager;
    private ExploreByTouchNodeProvider mNodeProvider;
    private final int[] mTempGlobalRect = new int[2];
    private final Rect mTempParentRect = new Rect();
    private final Rect mTempScreenRect = new Rect();
    private final Rect mTempVisibleRect = new Rect();
    private final View mView;

    private class ExploreByTouchNodeProvider extends AccessibilityNodeProviderCompat {
        private ExploreByTouchNodeProvider() {
        }

        public AccessibilityNodeInfoCompat createAccessibilityNodeInfo(int virtualViewId) {
            return ExploreByTouchHelper.this.createNode(virtualViewId);
        }

        public boolean performAction(int virtualViewId, int action, Bundle arguments) {
            return ExploreByTouchHelper.this.performAction(virtualViewId, action, arguments);
        }
    }

    protected abstract int getVirtualViewAt(float f, float f2);

    protected abstract void getVisibleVirtualViews(List<Integer> list);

    protected abstract boolean onPerformActionForVirtualView(int i, int i2, Bundle bundle);

    protected abstract void onPopulateEventForVirtualView(int i, AccessibilityEvent accessibilityEvent);

    protected abstract void onPopulateNodeForVirtualView(int i, AccessibilityNodeInfoCompat accessibilityNodeInfoCompat);

    public ExploreByTouchHelper(View forView) {
        if (forView != null) {
            this.mView = forView;
            this.mManager = (AccessibilityManager) forView.getContext().getSystemService("accessibility");
            return;
        }
        throw new IllegalArgumentException("View may not be null");
    }

    public AccessibilityNodeProviderCompat getAccessibilityNodeProvider(View host) {
        if (this.mNodeProvider == null) {
            this.mNodeProvider = new ExploreByTouchNodeProvider();
        }
        return this.mNodeProvider;
    }

    public boolean dispatchHoverEvent(MotionEvent event) {
        boolean z = false;
        if (!this.mManager.isEnabled() || !AccessibilityManagerCompat.isTouchExplorationEnabled(this.mManager)) {
            return false;
        }
        int action = event.getAction();
        if (action != 7) {
            switch (action) {
                case 9:
                    break;
                case 10:
                    if (this.mFocusedVirtualViewId == Integer.MIN_VALUE) {
                        return false;
                    }
                    updateHoveredVirtualView(Integer.MIN_VALUE);
                    return true;
                default:
                    return false;
            }
        }
        action = getVirtualViewAt(event.getX(), event.getY());
        updateHoveredVirtualView(action);
        if (action != Integer.MIN_VALUE) {
            z = true;
        }
        return z;
    }

    public boolean sendEventForVirtualView(int virtualViewId, int eventType) {
        if (virtualViewId == Integer.MIN_VALUE || !this.mManager.isEnabled()) {
            return false;
        }
        ViewParent parent = this.mView.getParent();
        if (parent == null) {
            return false;
        }
        return ViewParentCompat.requestSendAccessibilityEvent(parent, this.mView, createEvent(virtualViewId, eventType));
    }

    public void invalidateRoot() {
        invalidateVirtualView(-1);
    }

    public void invalidateVirtualView(int virtualViewId) {
        sendEventForVirtualView(virtualViewId, 2048);
    }

    public int getFocusedVirtualView() {
        return this.mFocusedVirtualViewId;
    }

    private void updateHoveredVirtualView(int virtualViewId) {
        if (this.mHoveredVirtualViewId != virtualViewId) {
            int previousVirtualViewId = this.mHoveredVirtualViewId;
            this.mHoveredVirtualViewId = virtualViewId;
            sendEventForVirtualView(virtualViewId, 128);
            sendEventForVirtualView(previousVirtualViewId, 256);
        }
    }

    private AccessibilityEvent createEvent(int virtualViewId, int eventType) {
        if (virtualViewId != -1) {
            return createEventForChild(virtualViewId, eventType);
        }
        return createEventForHost(eventType);
    }

    private AccessibilityEvent createEventForHost(int eventType) {
        AccessibilityEvent event = AccessibilityEvent.obtain(eventType);
        ViewCompat.onInitializeAccessibilityEvent(this.mView, event);
        return event;
    }

    private AccessibilityEvent createEventForChild(int virtualViewId, int eventType) {
        AccessibilityEvent event = AccessibilityEvent.obtain(eventType);
        event.setEnabled(true);
        event.setClassName(DEFAULT_CLASS_NAME);
        onPopulateEventForVirtualView(virtualViewId, event);
        if (event.getText().isEmpty() && event.getContentDescription() == null) {
            throw new RuntimeException("Callbacks must add text or a content description in populateEventForVirtualViewId()");
        }
        event.setPackageName(this.mView.getContext().getPackageName());
        AccessibilityEventCompat.asRecord(event).setSource(this.mView, virtualViewId);
        return event;
    }

    private AccessibilityNodeInfoCompat createNode(int virtualViewId) {
        if (virtualViewId != -1) {
            return createNodeForChild(virtualViewId);
        }
        return createNodeForHost();
    }

    private AccessibilityNodeInfoCompat createNodeForHost() {
        AccessibilityNodeInfoCompat node = AccessibilityNodeInfoCompat.obtain(this.mView);
        ViewCompat.onInitializeAccessibilityNodeInfo(this.mView, node);
        onPopulateNodeForHost(node);
        LinkedList<Integer> virtualViewIds = new LinkedList();
        getVisibleVirtualViews(virtualViewIds);
        Iterator i$ = virtualViewIds.iterator();
        while (i$.hasNext()) {
            node.addChild(this.mView, ((Integer) i$.next()).intValue());
        }
        return node;
    }

    private AccessibilityNodeInfoCompat createNodeForChild(int virtualViewId) {
        AccessibilityNodeInfoCompat node = AccessibilityNodeInfoCompat.obtain();
        node.setEnabled(true);
        node.setClassName(DEFAULT_CLASS_NAME);
        onPopulateNodeForVirtualView(virtualViewId, node);
        if (node.getText() == null && node.getContentDescription() == null) {
            throw new RuntimeException("Callbacks must add text or a content description in populateNodeForVirtualViewId()");
        }
        node.getBoundsInParent(this.mTempParentRect);
        if (this.mTempParentRect.isEmpty()) {
            throw new RuntimeException("Callbacks must set parent bounds in populateNodeForVirtualViewId()");
        }
        int actions = node.getActions();
        if ((actions & 64) != 0) {
            throw new RuntimeException("Callbacks must not add ACTION_ACCESSIBILITY_FOCUS in populateNodeForVirtualViewId()");
        } else if ((actions & 128) == 0) {
            node.setPackageName(this.mView.getContext().getPackageName());
            node.setSource(this.mView, virtualViewId);
            node.setParent(this.mView);
            if (this.mFocusedVirtualViewId == virtualViewId) {
                node.setAccessibilityFocused(true);
                node.addAction(128);
            } else {
                node.setAccessibilityFocused(false);
                node.addAction(64);
            }
            if (intersectVisibleToUser(this.mTempParentRect)) {
                node.setVisibleToUser(true);
                node.setBoundsInParent(this.mTempParentRect);
            }
            this.mView.getLocationOnScreen(this.mTempGlobalRect);
            int offsetX = this.mTempGlobalRect[0];
            int offsetY = this.mTempGlobalRect[1];
            this.mTempScreenRect.set(this.mTempParentRect);
            this.mTempScreenRect.offset(offsetX, offsetY);
            node.setBoundsInScreen(this.mTempScreenRect);
            return node;
        } else {
            throw new RuntimeException("Callbacks must not add ACTION_CLEAR_ACCESSIBILITY_FOCUS in populateNodeForVirtualViewId()");
        }
    }

    private boolean performAction(int virtualViewId, int action, Bundle arguments) {
        if (virtualViewId != -1) {
            return performActionForChild(virtualViewId, action, arguments);
        }
        return performActionForHost(action, arguments);
    }

    private boolean performActionForHost(int action, Bundle arguments) {
        return ViewCompat.performAccessibilityAction(this.mView, action, arguments);
    }

    private boolean performActionForChild(int virtualViewId, int action, Bundle arguments) {
        if (action == 64 || action == 128) {
            return manageFocusForChild(virtualViewId, action, arguments);
        }
        return onPerformActionForVirtualView(virtualViewId, action, arguments);
    }

    private boolean manageFocusForChild(int virtualViewId, int action, Bundle arguments) {
        if (action == 64) {
            return requestAccessibilityFocus(virtualViewId);
        }
        if (action != 128) {
            return false;
        }
        return clearAccessibilityFocus(virtualViewId);
    }

    /* JADX WARNING: Missing block: B:23:0x004b, code:
            return false;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private boolean intersectVisibleToUser(Rect localRect) {
        if (localRect == null || localRect.isEmpty() || this.mView.getWindowVisibility() != 0) {
            return false;
        }
        ViewParent viewParent = this.mView.getParent();
        while (viewParent instanceof View) {
            View view = (View) viewParent;
            if (ViewCompat.getAlpha(view) <= 0.0f || view.getVisibility() != 0) {
                return false;
            }
            viewParent = view.getParent();
        }
        if (viewParent != null && this.mView.getLocalVisibleRect(this.mTempVisibleRect)) {
            return localRect.intersect(this.mTempVisibleRect);
        }
        return false;
    }

    private boolean isAccessibilityFocused(int virtualViewId) {
        return this.mFocusedVirtualViewId == virtualViewId;
    }

    /* JADX WARNING: Missing block: B:12:0x0035, code:
            return false;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private boolean requestAccessibilityFocus(int virtualViewId) {
        if (!this.mManager.isEnabled() || !AccessibilityManagerCompat.isTouchExplorationEnabled(this.mManager) || isAccessibilityFocused(virtualViewId)) {
            return false;
        }
        if (this.mFocusedVirtualViewId != Integer.MIN_VALUE) {
            sendEventForVirtualView(this.mFocusedVirtualViewId, 65536);
        }
        this.mFocusedVirtualViewId = virtualViewId;
        this.mView.invalidate();
        sendEventForVirtualView(virtualViewId, 32768);
        return true;
    }

    private boolean clearAccessibilityFocus(int virtualViewId) {
        if (!isAccessibilityFocused(virtualViewId)) {
            return false;
        }
        this.mFocusedVirtualViewId = Integer.MIN_VALUE;
        this.mView.invalidate();
        sendEventForVirtualView(virtualViewId, 65536);
        return true;
    }

    public void onPopulateNodeForHost(AccessibilityNodeInfoCompat node) {
    }
}
