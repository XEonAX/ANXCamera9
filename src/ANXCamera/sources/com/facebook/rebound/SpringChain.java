package com.facebook.rebound;

import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

public class SpringChain implements SpringListener {
    private static final int DEFAULT_ATTACHMENT_FRICTION = 10;
    private static final int DEFAULT_ATTACHMENT_TENSION = 70;
    private static final int DEFAULT_MAIN_FRICTION = 6;
    private static final int DEFAULT_MAIN_TENSION = 40;
    private static int id = 0;
    private static final SpringConfigRegistry registry = SpringConfigRegistry.getInstance();
    private final SpringConfig mAttachmentSpringConfig;
    private int mControlSpringIndex;
    private final CopyOnWriteArrayList<SpringListener> mListeners;
    private final SpringConfig mMainSpringConfig;
    private final SpringSystem mSpringSystem;
    private final CopyOnWriteArrayList<Spring> mSprings;

    public static SpringChain create() {
        return new SpringChain();
    }

    public static SpringChain create(int i, int i2, int i3, int i4) {
        return new SpringChain(i, i2, i3, i4);
    }

    private SpringChain() {
        this(40, 6, 70, 10);
    }

    private SpringChain(int i, int i2, int i3, int i4) {
        this.mSpringSystem = SpringSystem.create();
        this.mListeners = new CopyOnWriteArrayList();
        this.mSprings = new CopyOnWriteArrayList();
        this.mControlSpringIndex = -1;
        this.mMainSpringConfig = SpringConfig.fromOrigamiTensionAndFriction((double) i, (double) i2);
        this.mAttachmentSpringConfig = SpringConfig.fromOrigamiTensionAndFriction((double) i3, (double) i4);
        SpringConfigRegistry springConfigRegistry = registry;
        SpringConfig springConfig = this.mMainSpringConfig;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("main spring ");
        i4 = id;
        id = i4 + 1;
        stringBuilder.append(i4);
        springConfigRegistry.addSpringConfig(springConfig, stringBuilder.toString());
        springConfigRegistry = registry;
        springConfig = this.mAttachmentSpringConfig;
        stringBuilder = new StringBuilder();
        stringBuilder.append("attachment spring ");
        i4 = id;
        id = i4 + 1;
        stringBuilder.append(i4);
        springConfigRegistry.addSpringConfig(springConfig, stringBuilder.toString());
    }

    public SpringConfig getMainSpringConfig() {
        return this.mMainSpringConfig;
    }

    public SpringConfig getAttachmentSpringConfig() {
        return this.mAttachmentSpringConfig;
    }

    public SpringChain addSpring(SpringListener springListener) {
        this.mSprings.add(this.mSpringSystem.createSpring().addListener(this).setSpringConfig(this.mAttachmentSpringConfig));
        this.mListeners.add(springListener);
        return this;
    }

    public SpringChain setControlSpringIndex(int i) {
        this.mControlSpringIndex = i;
        if (((Spring) this.mSprings.get(this.mControlSpringIndex)) == null) {
            return null;
        }
        for (Spring springConfig : this.mSpringSystem.getAllSprings()) {
            springConfig.setSpringConfig(this.mAttachmentSpringConfig);
        }
        getControlSpring().setSpringConfig(this.mMainSpringConfig);
        return this;
    }

    public Spring getControlSpring() {
        return (Spring) this.mSprings.get(this.mControlSpringIndex);
    }

    public List<Spring> getAllSprings() {
        return this.mSprings;
    }

    public void onSpringUpdate(Spring spring) {
        int i;
        int indexOf = this.mSprings.indexOf(spring);
        SpringListener springListener = (SpringListener) this.mListeners.get(indexOf);
        if (indexOf == this.mControlSpringIndex) {
            i = indexOf - 1;
            indexOf++;
        } else if (indexOf < this.mControlSpringIndex) {
            i = indexOf - 1;
            indexOf = -1;
        } else if (indexOf > this.mControlSpringIndex) {
            indexOf++;
            i = -1;
        } else {
            indexOf = -1;
            i = indexOf;
        }
        if (indexOf > -1 && indexOf < this.mSprings.size()) {
            ((Spring) this.mSprings.get(indexOf)).setEndValue(spring.getCurrentValue());
        }
        if (i > -1 && i < this.mSprings.size()) {
            ((Spring) this.mSprings.get(i)).setEndValue(spring.getCurrentValue());
        }
        springListener.onSpringUpdate(spring);
    }

    public void onSpringAtRest(Spring spring) {
        ((SpringListener) this.mListeners.get(this.mSprings.indexOf(spring))).onSpringAtRest(spring);
    }

    public void onSpringActivate(Spring spring) {
        ((SpringListener) this.mListeners.get(this.mSprings.indexOf(spring))).onSpringActivate(spring);
    }

    public void onSpringEndStateChange(Spring spring) {
        ((SpringListener) this.mListeners.get(this.mSprings.indexOf(spring))).onSpringEndStateChange(spring);
    }
}
