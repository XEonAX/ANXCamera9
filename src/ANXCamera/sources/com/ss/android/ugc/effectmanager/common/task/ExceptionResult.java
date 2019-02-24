package com.ss.android.ugc.effectmanager.common.task;

import android.accounts.NetworkErrorException;
import com.ss.android.ugc.effectmanager.common.ErrorConstants;
import com.ss.android.ugc.effectmanager.common.exception.MD5Exception;
import com.ss.android.ugc.effectmanager.common.exception.StatusCodeException;
import com.ss.android.ugc.effectmanager.common.exception.UnzipException;
import com.ss.android.ugc.effectmanager.common.exception.UrlNotExistException;
import com.ss.android.ugc.effectmanager.common.model.NetException;
import java.io.IOException;
import org.json.JSONException;

public class ExceptionResult {
    private int errorCode;
    private Exception exception;
    private String msg;
    private String remoteIp;
    private String requestUrl;
    private String selectedHost;

    public String getMsg() {
        return this.msg;
    }

    public void setMsg(String str) {
        this.msg = str;
    }

    public Exception getException() {
        return this.exception;
    }

    public void setException(Exception exception) {
        this.exception = exception;
    }

    public int getErrorCode() {
        return this.errorCode;
    }

    public void setErrorCode(int i) {
        this.errorCode = i;
    }

    public ExceptionResult(int i, Exception exception) {
        this.errorCode = -1;
        this.errorCode = i;
        this.msg = ErrorConstants.APIErrorHandle(i);
        this.exception = exception;
    }

    public ExceptionResult(int i) {
        this.errorCode = -1;
        this.errorCode = i;
        this.msg = ErrorConstants.APIErrorHandle(i);
        this.exception = null;
    }

    public void setTrackParams(String str, String str2, String str3) {
        this.requestUrl = str;
        this.selectedHost = str2;
        this.remoteIp = str3;
    }

    public ExceptionResult(Exception exception) {
        this(exception, null, null, null);
    }

    public ExceptionResult(Exception exception, String str, String str2, String str3) {
        this.errorCode = -1;
        this.requestUrl = str;
        this.selectedHost = str2;
        this.remoteIp = str3;
        this.exception = exception;
        if (exception instanceof NetException) {
            this.errorCode = ((NetException) exception).getStatus_code().intValue();
            this.msg = exception.getMessage();
        } else if (exception instanceof StatusCodeException) {
            this.errorCode = ((StatusCodeException) exception).getStatusCode();
            this.msg = exception.getMessage();
        } else if (exception instanceof JSONException) {
            this.errorCode = ErrorConstants.CODE_JSON_CONVERT_ERROR;
            this.msg = exception.getMessage();
        } else if (exception instanceof NetworkErrorException) {
            this.errorCode = ErrorConstants.CODE_DOWNLOAD_ERROR;
            this.msg = exception.getMessage();
        } else if (exception instanceof UrlNotExistException) {
            this.errorCode = ErrorConstants.CODE_URL_NOT_EXIST;
            this.msg = exception.getMessage();
        } else if (exception instanceof UnzipException) {
            this.errorCode = ErrorConstants.CODE_UNZIP_FAIL;
            this.msg = exception.getMessage();
        } else if (exception instanceof MD5Exception) {
            this.errorCode = ErrorConstants.CODE_MD5_ERROR;
            this.msg = exception.getMessage();
        } else if (exception instanceof IOException) {
            this.errorCode = ErrorConstants.CODE_IO_FAIL;
            this.msg = exception.getMessage();
        } else if (exception != null) {
            if (ErrorConstants.EXCEPTION_NO_NETWORK.equals(exception.getMessage())) {
                this.errorCode = ErrorConstants.CODE_NO_NETWORK;
            } else {
                this.errorCode = ErrorConstants.CODE_SDK_ERROR;
            }
            this.msg = exception.getMessage();
        } else {
            this.errorCode = 1;
            this.msg = ErrorConstants.APIErrorHandle(this.errorCode);
        }
    }

    public String toString() {
        StringBuilder stringBuilder;
        if (this.exception != null) {
            stringBuilder = new StringBuilder();
            stringBuilder.append("ExceptionResult{errorCode=");
            stringBuilder.append(this.errorCode);
            stringBuilder.append(", msg='");
            stringBuilder.append(this.msg);
            stringBuilder.append('\'');
            stringBuilder.append(", requestUrl='");
            stringBuilder.append(this.requestUrl);
            stringBuilder.append('\'');
            stringBuilder.append(", selectedHost='");
            stringBuilder.append(this.selectedHost);
            stringBuilder.append('\'');
            stringBuilder.append(", remoteIp='");
            stringBuilder.append(this.remoteIp);
            stringBuilder.append('\'');
            stringBuilder.append(", exception=");
            stringBuilder.append(this.exception.getMessage());
            stringBuilder.append('}');
            return stringBuilder.toString();
        }
        stringBuilder = new StringBuilder();
        stringBuilder.append("ExceptionResult{errorCode=");
        stringBuilder.append(this.errorCode);
        stringBuilder.append(", msg='");
        stringBuilder.append(this.msg);
        stringBuilder.append(", requestUrl='");
        stringBuilder.append(this.requestUrl);
        stringBuilder.append('\'');
        stringBuilder.append(", selectedHost='");
        stringBuilder.append(this.selectedHost);
        stringBuilder.append('\'');
        stringBuilder.append(", remoteIp='");
        stringBuilder.append(this.remoteIp);
        stringBuilder.append('\'');
        stringBuilder.append('}');
        return stringBuilder.toString();
    }
}
