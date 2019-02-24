package org.jcodec.common;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

public class Tuple {

    public interface Mapper<T, U> {
        U map(T t);
    }

    public static class _1<T0> {
        public final T0 v0;

        public _1(T0 t0) {
            this.v0 = t0;
        }
    }

    public static class _2<T0, T1> {
        public final T0 v0;
        public final T1 v1;

        public _2(T0 t0, T1 t1) {
            this.v0 = t0;
            this.v1 = t1;
        }
    }

    public static class _3<T0, T1, T2> {
        public final T0 v0;
        public final T1 v1;
        public final T2 v2;

        public _3(T0 t0, T1 t1, T2 t2) {
            this.v0 = t0;
            this.v1 = t1;
            this.v2 = t2;
        }
    }

    public static class _4<T0, T1, T2, T3> {
        public final T0 v0;
        public final T1 v1;
        public final T2 v2;
        public final T3 v3;

        public _4(T0 t0, T1 t1, T2 t2, T3 t3) {
            this.v0 = t0;
            this.v1 = t1;
            this.v2 = t2;
            this.v3 = t3;
        }
    }

    public static <T0> _1<T0> single(T0 t0) {
        return new _1(t0);
    }

    public static <T0, T1> _2<T0, T1> pair(T0 t0, T1 t1) {
        return new _2(t0, t1);
    }

    public static <T0, T1, T2> _3<T0, T1, T2> triple(T0 t0, T1 t1, T2 t2) {
        return new _3(t0, t1, t2);
    }

    public static <T0, T1, T2, T3> _4<T0, T1, T2, T3> quad(T0 t0, T1 t1, T2 t2, T3 t3) {
        return new _4(t0, t1, t2, t3);
    }

    public static <T0, T1> Map<T0, T1> asMap(Iterable<_2<T0, T1>> iterable) {
        Map hashMap = new HashMap();
        for (_2 _2 : iterable) {
            hashMap.put(_2.v0, _2.v1);
        }
        return hashMap;
    }

    public static <T0, T1> Map<T0, T1> arrayAsMap(_2<T0, T1>[] _2Arr) {
        Map hashMap = new HashMap();
        for (_2 _2 : _2Arr) {
            hashMap.put(_2.v0, _2.v1);
        }
        return hashMap;
    }

    public static <T0, T1> List<_2<T0, T1>> asList(Map<T0, T1> map) {
        List linkedList = new LinkedList();
        for (Entry entry : map.entrySet()) {
            linkedList.add(pair(entry.getKey(), entry.getValue()));
        }
        return linkedList;
    }

    public static <T0> List<T0> _1_project0(List<_1<T0>> list) {
        List<T0> linkedList = new LinkedList();
        for (_1 _1 : list) {
            linkedList.add(_1.v0);
        }
        return linkedList;
    }

    public static <T0, T1> List<T0> _2_project0(List<_2<T0, T1>> list) {
        List<T0> linkedList = new LinkedList();
        for (_2 _2 : list) {
            linkedList.add(_2.v0);
        }
        return linkedList;
    }

    public static <T0, T1> List<T1> _2_project1(List<_2<T0, T1>> list) {
        List<T1> linkedList = new LinkedList();
        for (_2 _2 : list) {
            linkedList.add(_2.v1);
        }
        return linkedList;
    }

    public static <T0, T1, T2, T3> List<T0> _3_project0(List<_3<T0, T1, T2>> list) {
        List<T0> linkedList = new LinkedList();
        for (_3 _3 : list) {
            linkedList.add(_3.v0);
        }
        return linkedList;
    }

    public static <T0, T1, T2, T3> List<T1> _3_project1(List<_3<T0, T1, T2>> list) {
        List<T1> linkedList = new LinkedList();
        for (_3 _3 : list) {
            linkedList.add(_3.v1);
        }
        return linkedList;
    }

    public static <T0, T1, T2, T3> List<T2> _3_project2(List<_3<T0, T1, T2>> list) {
        List<T2> linkedList = new LinkedList();
        for (_3 _3 : list) {
            linkedList.add(_3.v2);
        }
        return linkedList;
    }

    public static <T0, T1, T2, T3> List<T0> _4_project0(List<_4<T0, T1, T2, T3>> list) {
        List<T0> linkedList = new LinkedList();
        for (_4 _4 : list) {
            linkedList.add(_4.v0);
        }
        return linkedList;
    }

    public static <T0, T1, T2, T3> List<T1> _4_project1(List<_4<T0, T1, T2, T3>> list) {
        List<T1> linkedList = new LinkedList();
        for (_4 _4 : list) {
            linkedList.add(_4.v1);
        }
        return linkedList;
    }

    public static <T0, T1, T2, T3> List<T2> _4_project2(List<_4<T0, T1, T2, T3>> list) {
        List<T2> linkedList = new LinkedList();
        for (_4 _4 : list) {
            linkedList.add(_4.v2);
        }
        return linkedList;
    }

    public static <T0, T1, T2, T3> List<T3> _4_project3(List<_4<T0, T1, T2, T3>> list) {
        List<T3> linkedList = new LinkedList();
        for (_4 _4 : list) {
            linkedList.add(_4.v3);
        }
        return linkedList;
    }

    public static <T0, U> List<_1<U>> _1map0(List<_1<T0>> list, Mapper<T0, U> mapper) {
        List linkedList = new LinkedList();
        for (_1 _1 : list) {
            linkedList.add(single(mapper.map(_1.v0)));
        }
        return linkedList;
    }

    public static <T0, T1, U> List<_2<U, T1>> _2map0(List<_2<T0, T1>> list, Mapper<T0, U> mapper) {
        List linkedList = new LinkedList();
        for (_2 _2 : list) {
            linkedList.add(pair(mapper.map(_2.v0), _2.v1));
        }
        return linkedList;
    }

    public static <T0, T1, U> List<_2<T0, U>> _2map1(List<_2<T0, T1>> list, Mapper<T1, U> mapper) {
        List linkedList = new LinkedList();
        for (_2 _2 : list) {
            linkedList.add(pair(_2.v0, mapper.map(_2.v1)));
        }
        return linkedList;
    }

    public static <T0, T1, T2, U> List<_3<U, T1, T2>> _3map0(List<_3<T0, T1, T2>> list, Mapper<T0, U> mapper) {
        List linkedList = new LinkedList();
        for (_3 _3 : list) {
            linkedList.add(triple(mapper.map(_3.v0), _3.v1, _3.v2));
        }
        return linkedList;
    }

    public static <T0, T1, T2, U> List<_3<T0, U, T2>> _3map1(List<_3<T0, T1, T2>> list, Mapper<T1, U> mapper) {
        List linkedList = new LinkedList();
        for (_3 _3 : list) {
            linkedList.add(triple(_3.v0, mapper.map(_3.v1), _3.v2));
        }
        return linkedList;
    }

    public static <T0, T1, T2, U> List<_3<T0, T1, U>> _3map3(List<_3<T0, T1, T2>> list, Mapper<T2, U> mapper) {
        List linkedList = new LinkedList();
        for (_3 _3 : list) {
            linkedList.add(triple(_3.v0, _3.v1, mapper.map(_3.v2)));
        }
        return linkedList;
    }

    public static <T0, T1, T2, T3, U> List<_4<U, T1, T2, T3>> _4map0(List<_4<T0, T1, T2, T3>> list, Mapper<T0, U> mapper) {
        List linkedList = new LinkedList();
        for (_4 _4 : list) {
            linkedList.add(quad(mapper.map(_4.v0), _4.v1, _4.v2, _4.v3));
        }
        return linkedList;
    }

    public static <T0, T1, T2, T3, U> List<_4<T0, U, T2, T3>> _4map1(List<_4<T0, T1, T2, T3>> list, Mapper<T1, U> mapper) {
        List linkedList = new LinkedList();
        for (_4 _4 : list) {
            linkedList.add(quad(_4.v0, mapper.map(_4.v1), _4.v2, _4.v3));
        }
        return linkedList;
    }

    public static <T0, T1, T2, T3, U> List<_4<T0, T1, U, T3>> _4map3(List<_4<T0, T1, T2, T3>> list, Mapper<T2, U> mapper) {
        List linkedList = new LinkedList();
        for (_4 _4 : list) {
            linkedList.add(quad(_4.v0, _4.v1, mapper.map(_4.v2), _4.v3));
        }
        return linkedList;
    }

    public static <T0, T1, T2, T3, U> List<_4<T0, T1, T2, U>> _4map4(List<_4<T0, T1, T2, T3>> list, Mapper<T3, U> mapper) {
        List linkedList = new LinkedList();
        for (_4 _4 : list) {
            linkedList.add(quad(_4.v0, _4.v1, _4.v2, mapper.map(_4.v3)));
        }
        return linkedList;
    }
}
