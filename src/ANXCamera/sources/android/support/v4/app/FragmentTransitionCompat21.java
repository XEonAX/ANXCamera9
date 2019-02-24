package android.support.v4.app;

import android.graphics.Rect;
import android.transition.Transition;
import android.transition.Transition.EpicenterCallback;
import android.transition.TransitionManager;
import android.transition.TransitionSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnPreDrawListener;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

class FragmentTransitionCompat21 {

    public interface ViewRetriever {
        View getView();
    }

    public static class EpicenterView {
        public View epicenter;
    }

    FragmentTransitionCompat21() {
    }

    public static String getTransitionName(View view) {
        return view.getTransitionName();
    }

    public static Object cloneTransition(Object transition) {
        if (transition != null) {
            return ((Transition) transition).clone();
        }
        return transition;
    }

    public static Object captureExitingViews(Object exitTransition, View root, ArrayList<View> viewList, Map<String, View> namedViews, View nonExistentView) {
        if (exitTransition == null) {
            return exitTransition;
        }
        captureTransitioningViews(viewList, root);
        if (namedViews != null) {
            viewList.removeAll(namedViews.values());
        }
        if (viewList.isEmpty()) {
            return null;
        }
        viewList.add(nonExistentView);
        addTargets((Transition) exitTransition, viewList);
        return exitTransition;
    }

    public static void excludeTarget(Object transitionObject, View view, boolean exclude) {
        ((Transition) transitionObject).excludeTarget(view, exclude);
    }

    public static void beginDelayedTransition(ViewGroup sceneRoot, Object transitionObject) {
        TransitionManager.beginDelayedTransition(sceneRoot, (Transition) transitionObject);
    }

    public static void setEpicenter(Object transitionObject, View view) {
        Transition transition = (Transition) transitionObject;
        final Rect epicenter = getBoundsOnScreen(view);
        transition.setEpicenterCallback(new EpicenterCallback() {
            public Rect onGetEpicenter(Transition transition) {
                return epicenter;
            }
        });
    }

    public static Object wrapSharedElementTransition(Object transitionObj) {
        if (transitionObj == null) {
            return null;
        }
        Transition transition = (Transition) transitionObj;
        if (transition == null) {
            return null;
        }
        TransitionSet transitionSet = new TransitionSet();
        transitionSet.addTransition(transition);
        return transitionSet;
    }

    public static void addTransitionTargets(Object enterTransitionObject, Object sharedElementTransitionObject, View container, ViewRetriever inFragment, View nonExistentView, EpicenterView epicenterView, Map<String, String> nameOverrides, ArrayList<View> enteringViews, Map<String, View> namedViews, Map<String, View> renamedViews, ArrayList<View> sharedElementTargets) {
        Object obj = sharedElementTransitionObject;
        View view = nonExistentView;
        Map<String, View> map;
        ArrayList<View> arrayList;
        if (enterTransitionObject == null && obj == null) {
            EpicenterView epicenterView2 = epicenterView;
            map = namedViews;
            arrayList = sharedElementTargets;
            return;
        }
        Transition enterTransition = (Transition) enterTransitionObject;
        if (enterTransition != null) {
            enterTransition.addTarget(view);
        }
        if (obj != null) {
            setSharedElementTargets(obj, view, namedViews, sharedElementTargets);
        } else {
            map = namedViews;
            arrayList = sharedElementTargets;
        }
        if (inFragment != null) {
            ViewTreeObserver viewTreeObserver = container.getViewTreeObserver();
            final View view2 = container;
            final Transition transition = enterTransition;
            final View view3 = view;
            final ViewRetriever viewRetriever = inFragment;
            final Map<String, String> map2 = nameOverrides;
            final Map<String, View> map3 = renamedViews;
            AnonymousClass2 anonymousClass2 = r2;
            final ArrayList<View> arrayList2 = enteringViews;
            AnonymousClass2 anonymousClass22 = new OnPreDrawListener() {
                public boolean onPreDraw() {
                    view2.getViewTreeObserver().removeOnPreDrawListener(this);
                    if (transition != null) {
                        transition.removeTarget(view3);
                    }
                    View fragmentView = viewRetriever.getView();
                    if (fragmentView != null) {
                        if (!map2.isEmpty()) {
                            FragmentTransitionCompat21.findNamedViews(map3, fragmentView);
                            map3.keySet().retainAll(map2.values());
                            for (Entry<String, String> entry : map2.entrySet()) {
                                View view = (View) map3.get((String) entry.getValue());
                                if (view != null) {
                                    view.setTransitionName((String) entry.getKey());
                                }
                            }
                        }
                        if (transition != null) {
                            FragmentTransitionCompat21.captureTransitioningViews(arrayList2, fragmentView);
                            arrayList2.removeAll(map3.values());
                            arrayList2.add(view3);
                            FragmentTransitionCompat21.addTargets(transition, arrayList2);
                        }
                    }
                    return true;
                }
            };
            viewTreeObserver.addOnPreDrawListener(anonymousClass2);
        }
        setSharedElementEpicenter(enterTransition, epicenterView);
    }

    public static Object mergeTransitions(Object enterTransitionObject, Object exitTransitionObject, Object sharedElementTransitionObject, boolean allowOverlap) {
        boolean overlap = true;
        Transition enterTransition = (Transition) enterTransitionObject;
        Transition exitTransition = (Transition) exitTransitionObject;
        Transition sharedElementTransition = (Transition) sharedElementTransitionObject;
        if (!(enterTransition == null || exitTransition == null)) {
            overlap = allowOverlap;
        }
        Transition transition;
        if (overlap) {
            transition = new TransitionSet();
            if (enterTransition != null) {
                transition.addTransition(enterTransition);
            }
            if (exitTransition != null) {
                transition.addTransition(exitTransition);
            }
            if (sharedElementTransition == null) {
                return transition;
            }
            transition.addTransition(sharedElementTransition);
            return transition;
        }
        transition = null;
        if (exitTransition != null && enterTransition != null) {
            transition = new TransitionSet().addTransition(exitTransition).addTransition(enterTransition).setOrdering(1);
        } else if (exitTransition != null) {
            transition = exitTransition;
        } else if (enterTransition != null) {
            transition = enterTransition;
        }
        if (sharedElementTransition == null) {
            return transition;
        }
        Transition transition2 = new TransitionSet();
        if (transition != null) {
            transition2.addTransition(transition);
        }
        transition2.addTransition(sharedElementTransition);
        return transition2;
    }

    public static void setSharedElementTargets(Object transitionObj, View nonExistentView, Map<String, View> namedViews, ArrayList<View> sharedElementTargets) {
        TransitionSet transition = (TransitionSet) transitionObj;
        sharedElementTargets.clear();
        sharedElementTargets.addAll(namedViews.values());
        List<View> views = transition.getTargets();
        views.clear();
        int count = sharedElementTargets.size();
        for (int i = 0; i < count; i++) {
            bfsAddViewChildren(views, (View) sharedElementTargets.get(i));
        }
        sharedElementTargets.add(nonExistentView);
        addTargets(transition, sharedElementTargets);
    }

    private static void bfsAddViewChildren(List<View> views, View startView) {
        int startIndex = views.size();
        if (!containedBeforeIndex(views, startView, startIndex)) {
            views.add(startView);
            for (int index = startIndex; index < views.size(); index++) {
                View view = (View) views.get(index);
                if (view instanceof ViewGroup) {
                    ViewGroup viewGroup = (ViewGroup) view;
                    int childCount = viewGroup.getChildCount();
                    for (int childIndex = 0; childIndex < childCount; childIndex++) {
                        View child = viewGroup.getChildAt(childIndex);
                        if (!containedBeforeIndex(views, child, startIndex)) {
                            views.add(child);
                        }
                    }
                }
            }
        }
    }

    private static boolean containedBeforeIndex(List<View> views, View view, int maxIndex) {
        for (int i = 0; i < maxIndex; i++) {
            if (views.get(i) == view) {
                return true;
            }
        }
        return false;
    }

    private static void setSharedElementEpicenter(Transition transition, final EpicenterView epicenterView) {
        if (transition != null) {
            transition.setEpicenterCallback(new EpicenterCallback() {
                private Rect mEpicenter;

                public Rect onGetEpicenter(Transition transition) {
                    if (this.mEpicenter == null && epicenterView.epicenter != null) {
                        this.mEpicenter = FragmentTransitionCompat21.getBoundsOnScreen(epicenterView.epicenter);
                    }
                    return this.mEpicenter;
                }
            });
        }
    }

    private static Rect getBoundsOnScreen(View view) {
        Rect epicenter = new Rect();
        int[] loc = new int[2];
        view.getLocationOnScreen(loc);
        epicenter.set(loc[0], loc[1], loc[0] + view.getWidth(), loc[1] + view.getHeight());
        return epicenter;
    }

    private static void captureTransitioningViews(ArrayList<View> transitioningViews, View view) {
        if (view.getVisibility() != 0) {
            return;
        }
        if (view instanceof ViewGroup) {
            ViewGroup viewGroup = (ViewGroup) view;
            if (viewGroup.isTransitionGroup()) {
                transitioningViews.add(viewGroup);
                return;
            }
            int count = viewGroup.getChildCount();
            for (int i = 0; i < count; i++) {
                captureTransitioningViews(transitioningViews, viewGroup.getChildAt(i));
            }
            return;
        }
        transitioningViews.add(view);
    }

    public static void findNamedViews(Map<String, View> namedViews, View view) {
        if (view.getVisibility() == 0) {
            String transitionName = view.getTransitionName();
            if (transitionName != null) {
                namedViews.put(transitionName, view);
            }
            if (view instanceof ViewGroup) {
                ViewGroup viewGroup = (ViewGroup) view;
                int count = viewGroup.getChildCount();
                for (int i = 0; i < count; i++) {
                    findNamedViews(namedViews, viewGroup.getChildAt(i));
                }
            }
        }
    }

    public static void cleanupTransitions(View sceneRoot, View nonExistentView, Object enterTransitionObject, ArrayList<View> enteringViews, Object exitTransitionObject, ArrayList<View> exitingViews, Object sharedElementTransitionObject, ArrayList<View> sharedElementTargets, Object overallTransitionObject, ArrayList<View> hiddenViews, Map<String, View> renamedViews) {
        Transition enterTransition = (Transition) enterTransitionObject;
        Transition exitTransition = (Transition) exitTransitionObject;
        Transition sharedElementTransition = (Transition) sharedElementTransitionObject;
        Transition overallTransition = (Transition) overallTransitionObject;
        if (overallTransition != null) {
            final View view = sceneRoot;
            final Transition transition = enterTransition;
            final ArrayList<View> arrayList = enteringViews;
            final Transition transition2 = exitTransition;
            final ArrayList<View> arrayList2 = exitingViews;
            final Transition transition3 = sharedElementTransition;
            final ArrayList<View> arrayList3 = sharedElementTargets;
            final Map<String, View> map = renamedViews;
            final ArrayList<View> arrayList4 = hiddenViews;
            AnonymousClass4 anonymousClass4 = r1;
            final Transition transition4 = overallTransition;
            ViewTreeObserver viewTreeObserver = sceneRoot.getViewTreeObserver();
            final View view2 = nonExistentView;
            AnonymousClass4 anonymousClass42 = new OnPreDrawListener() {
                public boolean onPreDraw() {
                    view.getViewTreeObserver().removeOnPreDrawListener(this);
                    if (transition != null) {
                        FragmentTransitionCompat21.removeTargets(transition, arrayList);
                    }
                    if (transition2 != null) {
                        FragmentTransitionCompat21.removeTargets(transition2, arrayList2);
                    }
                    if (transition3 != null) {
                        FragmentTransitionCompat21.removeTargets(transition3, arrayList3);
                    }
                    for (Entry<String, View> entry : map.entrySet()) {
                        ((View) entry.getValue()).setTransitionName((String) entry.getKey());
                    }
                    int numViews = arrayList4.size();
                    for (int i = 0; i < numViews; i++) {
                        transition4.excludeTarget((View) arrayList4.get(i), false);
                    }
                    transition4.excludeTarget(view2, false);
                    return true;
                }
            };
            viewTreeObserver.addOnPreDrawListener(anonymousClass4);
            return;
        }
    }

    public static void removeTargets(Object transitionObject, ArrayList<View> views) {
        Transition transition = (Transition) transitionObject;
        int numTransitions;
        if (transition instanceof TransitionSet) {
            TransitionSet set = (TransitionSet) transition;
            numTransitions = set.getTransitionCount();
            for (int i = 0; i < numTransitions; i++) {
                removeTargets(set.getTransitionAt(i), views);
            }
        } else if (!hasSimpleTarget(transition)) {
            List<View> targets = transition.getTargets();
            if (targets != null && targets.size() == views.size() && targets.containsAll(views)) {
                for (numTransitions = views.size() - 1; numTransitions >= 0; numTransitions--) {
                    transition.removeTarget((View) views.get(numTransitions));
                }
            }
        }
    }

    public static void addTargets(Object transitionObject, ArrayList<View> views) {
        Transition transition = (Transition) transitionObject;
        int i = 0;
        int numTransitions;
        if (transition instanceof TransitionSet) {
            TransitionSet set = (TransitionSet) transition;
            numTransitions = set.getTransitionCount();
            while (i < numTransitions) {
                addTargets(set.getTransitionAt(i), views);
                i++;
            }
        } else if (!hasSimpleTarget(transition) && isNullOrEmpty(transition.getTargets())) {
            numTransitions = views.size();
            while (i < numTransitions) {
                transition.addTarget((View) views.get(i));
                i++;
            }
        }
    }

    private static boolean hasSimpleTarget(Transition transition) {
        return (isNullOrEmpty(transition.getTargetIds()) && isNullOrEmpty(transition.getTargetNames()) && isNullOrEmpty(transition.getTargetTypes())) ? false : true;
    }

    private static boolean isNullOrEmpty(List list) {
        return list == null || list.isEmpty();
    }
}
