package bytedance.framwork.core.sdkmonitor;

public class HttpResponseException extends Exception {
    public String message;
    public int statusCode;

    public HttpResponseException(int i, String str) {
        this.statusCode = i;
        this.message = str;
    }

    public int getStatusCode() {
        return this.statusCode;
    }

    public String getMsg() {
        return this.message;
    }
}
