package com.facebook.rebound;

import com.facebook.rebound.ChoreographerCompat.FrameCallback;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

public class AnimationQueue {
    private final Queue<Double> mAnimationQueue = new LinkedList();
    private final List<Callback> mCallbacks = new ArrayList();
    private final ChoreographerCompat mChoreographer = ChoreographerCompat.getInstance();
    private final FrameCallback mChoreographerCallback = new FrameCallback() {
        public void doFrame(long j) {
            AnimationQueue.this.onFrame(j);
        }
    };
    private final Queue<Double> mPendingQueue = new LinkedList();
    private boolean mRunning;
    private final ArrayList<Double> mTempValues = new ArrayList();

    public interface Callback {
        void onFrame(Double d);
    }

    public void addValue(Double d) {
        this.mPendingQueue.add(d);
        runIfIdle();
    }

    public void addAllValues(Collection<Double> collection) {
        this.mPendingQueue.addAll(collection);
        runIfIdle();
    }

    public void clearValues() {
        this.mPendingQueue.clear();
    }

    public void addCallback(Callback callback) {
        this.mCallbacks.add(callback);
    }

    public void removeCallback(Callback callback) {
        this.mCallbacks.remove(callback);
    }

    public void clearCallbacks() {
        this.mCallbacks.clear();
    }

    private void runIfIdle() {
        if (!this.mRunning) {
            this.mRunning = true;
            this.mChoreographer.postFrameCallback(this.mChoreographerCallback);
        }
    }

    private void onFrame(long j) {
        int i;
        Double d = (Double) this.mPendingQueue.poll();
        if (d != null) {
            this.mAnimationQueue.offer(d);
            i = 0;
        } else {
            i = Math.max(this.mCallbacks.size() - this.mAnimationQueue.size(), 0);
        }
        this.mTempValues.addAll(this.mAnimationQueue);
        int size = this.mTempValues.size();
        while (true) {
            size--;
            if (size <= -1) {
                break;
            }
            Double d2 = (Double) this.mTempValues.get(size);
            int size2 = ((this.mTempValues.size() - 1) - size) + i;
            if (this.mCallbacks.size() > size2) {
                ((Callback) this.mCallbacks.get(size2)).onFrame(d2);
            }
        }
        this.mTempValues.clear();
        while (this.mAnimationQueue.size() + i >= this.mCallbacks.size()) {
            this.mAnimationQueue.poll();
        }
        if (this.mAnimationQueue.isEmpty() && this.mPendingQueue.isEmpty()) {
            this.mRunning = false;
        } else {
            this.mChoreographer.postFrameCallback(this.mChoreographerCallback);
        }
    }
}
