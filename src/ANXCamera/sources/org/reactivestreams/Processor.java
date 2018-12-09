package org.reactivestreams;

public interface Processor<T, R> extends Publisher<R>, Subscriber<T> {
}
